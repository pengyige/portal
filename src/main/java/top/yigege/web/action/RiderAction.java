package top.yigege.web.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ModelDriven;
import com.tencent.xinge.XingeApp;

import top.yigege.constants.Constants;
import top.yigege.domain.Rider;
import top.yigege.domain.TeleporterAdmin;
import top.yigege.enums.HttpCodeEnum;
import top.yigege.service.RiderService;
import top.yigege.util.MD5Util;
import top.yigege.util.ReturnDTOUtil;
import top.yigege.util.XingeUtil;
import top.yigege.vo.RiderQueryCondition;
import top.yigege.vo.TypeVO;

/**
 * 
 * @ClassName:  RiderAction   
 * @Description:骑手action
 * @author: yigege
 * @date:   2018年12月16日 下午12:23:46
 */
public class RiderAction extends BaseAction implements ModelDriven<Rider>,ServletRequestAware{
	
	/**骑手服务类*/
	private RiderService riderService;
	public RiderService getRiderService() {
		return riderService;
	}
	public void setRiderService(RiderService riderService) {
		this.riderService = riderService;
	}

	//采用属性封装传送点id参数
	private String teleporterId;
	public String getTeleporterId() {
		return teleporterId;
	}
	public void setTeleporterId(String teleporterId) {
		this.teleporterId = teleporterId;
	}

	private String userOrderId;
	public String getUserOrderId() {
		return userOrderId;
	}
	public void setUserOrderId(String userOrderId) {
		this.userOrderId = userOrderId;
	}

	//采用模型驱动封装骑手参数
	private Rider rider = new Rider();
	public Rider getRider() {
		return rider;
	}
	public void setRider(Rider rider) {
		this.rider = rider;
	}

	/**查询条件对象*/
	private RiderQueryCondition riderQueryCondition = new RiderQueryCondition();
	public RiderQueryCondition getRiderQueryCondition() {
		return riderQueryCondition;
	}

	public void setRiderQueryCondition(RiderQueryCondition riderQueryCondition) {
		this.riderQueryCondition = riderQueryCondition;
	}

	@Override
	public Rider getModel() {
		// TODO Auto-generated method stub
		return this.rider;
	}
	
	
	//采用IOC注入servletAPI
	private HttpServletRequest request;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	
	
	/**
	 * 骑手注册
	 */
	public String register() {
		this.rider.setUsername(rider.getTel());
		this.rider.setSex(1);
		this.rider.setRiderState(1);
		this.rider.setDeviceToken(rider.getDeviceToken());
		//1.校验手机号是否已注册
		if(riderService.telIsRegister(rider.getTel())) {
			this.getJsonData().put("state", -1);
			return "jsonData";
		}
		
		//2.注册用户业务处理
		int state = riderService.registerRider(rider);
		this.getJsonData().put("state", state);
		return "jsonData";
	}
	
	/**
	 * 骑手手机号登入
	 */
	public String loginByTel() {
		/*//1.校验手机号是否存在
		Rider resultRider = riderService.findRiderByTel(rider.getTel());
		
	
		//2.骑手手机号登入业务处理
		if(resultRider != null) {
			//设置相应的token
			long currentTime  = System.currentTimeMillis();
			String token = resultRider.getRiderId()+"_"+currentTime;
			//2.1更新骑手token
			int state = riderService.updateRiderToken(resultRider.getRiderId(), token);
			if(state == 0) {
				this.getJsonData().put("state", 0);
				return "jsonData";
			}
			resultRider.setToken(token);
			
			this.getJsonData().put("state", 1);
			this.getJsonData().put("rider",resultRider);
		}else {
			this.getJsonData().put("state", -1);
		}
		return "jsonData";*/
		return JSON_DATA;
	}
	
	

	


	
	/**
	 * 骑手注销登记
	 */
	public String logoutCheckin() {
		//1.判断管理员是否登入
		TeleporterAdmin teleporterAdmin = (TeleporterAdmin) request.getSession().getAttribute("teleporterAdmin");
		if(teleporterAdmin == null) {
			this.getJsonData().put("state", -1);
			return "jsonData";
		}
		
		//2.判断骑手是否已经登记
		Rider tempRider = riderService.findRiderById(this.rider.getRiderId());
		if(tempRider.getTeleporter() == null) {
			this.getJsonData().put("state", -2);
			return "jsonData";
		}
		
		//3.判断管理员是否有权限
		if(tempRider.getTeleporter() != null) {
			if(tempRider.getTeleporter().getTeleporterId() != teleporterAdmin.getTeleporter().getTeleporterId()) {
				this.getJsonData().put("state", -3);
				return "jsonData";
			}
		}
		
		//4.注销登记骑手业务处理
		int state = riderService.logoutCheckin(this.rider.getRiderId());
		this.getJsonData().put("state", state);
		return "jsonData";
	}

	/**
	 * 通过手机号查询骑手信息
	 */
	public String queryByTel() {
		//1.判断管理员是否登入
		TeleporterAdmin teleporterAdmin = (TeleporterAdmin) request.getSession().getAttribute("teleporterAdmin");
		if(teleporterAdmin == null) {
			this.getJsonData().put("state", -1);
			return "jsonData";
		}
		
		//2.通过手机号查找骑手
		try {
			Rider rider = riderService.findRiderByTel(this.rider.getTel());
			if(rider == null) {
				this.getJsonData().put("state", -2);
			}else {
				this.getJsonData().put("state", 1);
				this.getJsonData().put("result", rider);
			}
			
		}catch(Exception e) {
			this.getJsonData().put("state", 0);
			return "jsonData";
		}
		return "jsonData";
	}
	
	
	/**
	 * 骑手实名认证
	 */
	public String certification() {
		int resultState;
		//1.判断token是否有效
		resultState =riderService.validateToken(rider.getToken());
		if(resultState == -1) {
			this.getJsonData().put("state", -1);
			return "jsonData";
		}
		
		Rider tempRider = riderService.findRiderById(rider.getRiderId());
		String plusIDNumber =rider.getIDNumber().substring(0,6)+"********"+rider.getIDNumber().substring(14, 18);
		

		tempRider.setIDNumber(plusIDNumber);
		tempRider.setRealName(rider.getRealName());
		tempRider.setAddress(rider.getAddress());
		
		try {
			riderService.updateRiderService(tempRider);
			resultState = 1;
			this.getJsonData().put("state", resultState);
			this.getJsonData().put("rider",tempRider);
		}catch(Exception e) {
			this.getJsonData().put("state", 0);
			return "jsonData";
		}
		
		return "jsonData";
	}
	
	

	/**
	 * 跳转到骑手管理
	 * @return
	 */
	public String intoRiderManagerPage() {
		return "intoRiderManagerPage";
	}

	/**
	 * 跳转到骑手管理(传送点管理员)
	 * @return
	 */
	public String intoRiderManagerPageForTeleporterAdmin() {
		return "intoRiderManagerPageForTeleporterAdmin";
	}


	/**
	 * 分页查询所有骑手
	 * @return
	 */
	public String queryAllByPage() {
		logger.info("分页查询所有骑手");

		try {
			List<Rider> riders = riderService.pageListByCondition(page,rows,riderQueryCondition);

			Long count = riderService.getCountByCondition(riderQueryCondition);
			if(riders != null) {
				bootstrapTableDTO.setCode(HttpCodeEnum.OK.getCode());
				bootstrapTableDTO.setTotal(count.intValue());
				bootstrapTableDTO.setRows(riders);
			}else {
				bootstrapTableDTO.setCode(HttpCodeEnum.FAIL.getCode());
				bootstrapTableDTO.setMessage(HttpCodeEnum.INVALID_REQUEST.getMessage());
			}
		}catch (Exception e) {
			e.printStackTrace();
			bootstrapTableDTO.setCode(HttpCodeEnum.FAIL.getCode());
			bootstrapTableDTO.setMessage(e.getMessage());
		}


		return BOOTSTRAP_TABLE_JSON_DATA;
	}


	/**
	 * 查询骑手注册数量
	 * @return
	 */
	public String queryRecentRiderRegisterCount() {
		logger.info("查询最近一周骑手注册数量");

		try {
			TypeVO[] typeVOS =  riderService.queryRiderRegisterCountByTime();
			returnDTO = ReturnDTOUtil.success(typeVOS);
		}catch (Exception e) {
			e.printStackTrace();
			logger.info("查询骑手注册数量失败，失败原因:"+e.getMessage());
			returnDTO = ReturnDTOUtil.fail(e.getMessage());
		}

		return JSON_DATA;
	}


	/**
	 * 传送点移动更新
	 * @return
	 */
	public String riderMoveLocationUpdate() {
		String longitudeStr = request.getParameter("longitude");
		String latitudeStr = request.getParameter("latitude");
		String riderIdStr = request.getParameter("riderId");

		if (StringUtils.isBlank(longitudeStr)) {
			returnDTO = ReturnDTOUtil.paramError("经度不能为空");
			return JSON_DATA;
		}

		if (StringUtils.isBlank(latitudeStr)) {
			returnDTO = ReturnDTOUtil.paramError("纬度不能为空");
			return JSON_DATA;
		}

		if (StringUtils.isBlank(riderIdStr)) {
			returnDTO = ReturnDTOUtil.paramError("骑手ID不能为空");
			return  JSON_DATA;
		}


		riderService.changeLocation(longitudeStr,latitudeStr,riderIdStr);

		return JSON_DATA;
	}

	/**
	 * 查询当前传送点可派单骑手
	 * @return
	 */
	public String queryRiderForDispacher() {
		logger.info("查询当前传送点可派单骑手");

		try{
			TeleporterAdmin teleporterAdmin = (TeleporterAdmin) this.request.getSession().getAttribute(Constants.PortalSessionKey.USER_SESSION_KEY);
			List<Rider> riders = riderService.queryRiderByTeleporter(teleporterAdmin.getTeleporter());
			returnDTO = ReturnDTOUtil.success(riders);
		}catch (Exception e) {
			e.printStackTrace();
			logger.info("查询当前传送点可派单骑手,失败原因"+e.getMessage());
			returnDTO = ReturnDTOUtil.fail(e.getMessage());
		}
		return JSON_DATA;
	}

	/**
	 * 分页查询所有当前传送点下骑手
	 * @return
	 */
	public String queryAllByPageAndTeleporter() {
		logger.info("");

		try {
			TeleporterAdmin teleporterAdmin = (TeleporterAdmin) this.request.getSession().getAttribute(Constants.PortalSessionKey.USER_SESSION_KEY);
			riderQueryCondition.setTeleporterId(teleporterAdmin.getTeleporter().getTeleporterId());

			List<Rider> riders = riderService.pageListByCondition(page,rows,riderQueryCondition);

			Long count = riderService.getCountByCondition(riderQueryCondition);
			if(riders != null) {
				bootstrapTableDTO.setCode(HttpCodeEnum.OK.getCode());
				bootstrapTableDTO.setTotal(count.intValue());
				bootstrapTableDTO.setRows(riders);
			}else {
				bootstrapTableDTO.setCode(HttpCodeEnum.FAIL.getCode());
				bootstrapTableDTO.setMessage(HttpCodeEnum.INVALID_REQUEST.getMessage());
			}
		}catch (Exception e) {
			e.printStackTrace();
			bootstrapTableDTO.setCode(HttpCodeEnum.FAIL.getCode());
			bootstrapTableDTO.setMessage(e.getMessage());
		}
		return BOOTSTRAP_TABLE_JSON_DATA;
	}

	/**
	 * 登记骑手
	 * @return
	 */
	public String checkIn() {
		logger.info("开始登记骑手");

		TeleporterAdmin teleporterAdmin = (TeleporterAdmin) this.request.getSession().getAttribute(Constants.PortalSessionKey.USER_SESSION_KEY);

		try {
			riderService.validateCheckInData(rider,teleporterAdmin.getTeleporter());

            riderService.doRiderCheckin(rider,teleporterAdmin.getTeleporter());

			returnDTO = ReturnDTOUtil.success(rider.getTel()+"登记成功");
		}catch (Exception e) {
			e.printStackTrace();
			logger.info("登记骑手失败，失败原因:"+e.getMessage());
			returnDTO = ReturnDTOUtil.fail(e.getMessage());
		}

		return JSON_DATA;
	}

	/**
	 * 查询骑手详情
	 * @return
	 */
	public String queryRiderDetailByTel() {
		logger.info("查询骑手详情");

		try {

			Rider returnRider = riderService.findRiderByTel(rider.getTel());
			returnDTO = ReturnDTOUtil.success(returnRider);
		}catch (Exception e) {
			e.printStackTrace();;
			logger.info("查询骑手详情失败，失败原因:"+e.getMessage());
			returnDTO = ReturnDTOUtil.fail(e.getMessage());
		}
		return JSON_DATA;
	}
}
