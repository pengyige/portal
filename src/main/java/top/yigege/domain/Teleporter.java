package top.yigege.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

/**
 * 
 * @ClassName:  Teleporter   
 * @Description:传送点实体
 * @author: yigege
 * @date:   2018年12月16日 上午11:19:57
 */
public class Teleporter {
	
	/**传送点id*/
	private Integer teleporterId;
	
	/**创建日期*/
	private Date createDate;
	
	/**传送点地址*/
	private String address;
	
	/**备注*/
	private String remark;
	

	
	//传送点与传送点管理员一对一
	private TeleporterAdmin teleporterAdmin;
	
	/**传送点与区域一对一*/
	private Area area;
	
	/**录入人*/
	private SuperAdmin superAdmin;
	
	
	public SuperAdmin getSuperAdmin() {
		return superAdmin;
	}
	public void setSuperAdmin(SuperAdmin superAdmin) {
		this.superAdmin = superAdmin;
	}
	public Area getArea() {
		return area;
	}
	public void setArea(Area area) {
		this.area = area;
	}
	//传送点与骑手一对多
	private Set<Rider> riders = new HashSet<Rider>();
	
	@JSON(serialize=false)
	public Set<Rider> getRiders() {
		return riders;
	}
	public void setRiders(Set<Rider> riders) {
		this.riders = riders;
	}
	public TeleporterAdmin getTeleporterAdmin() {
		return teleporterAdmin;
	}
	public void setTeleporterAdmin(TeleporterAdmin teleporterAdmin) {
		this.teleporterAdmin = teleporterAdmin;
	}
	public Integer getTeleporterId() {
		return teleporterId;
	}
	public void setTeleporterId(Integer teleporterId) {
		this.teleporterId = teleporterId;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Teleporter [teleporterId=" + teleporterId + ", createDate=" + createDate + ", address=" + address
				+ ", remark=" + remark + ", teleporterAdmin=" + teleporterAdmin + ", area=" + area + ", superAdmin="
				+ superAdmin + ", riders=" + riders + ", getSuperAdmin()=" + getSuperAdmin() + ", getArea()="
				+ getArea() + ", getRiders()=" + getRiders() + ", getTeleporterAdmin()=" + getTeleporterAdmin()
				+ ", getTeleporterId()=" + getTeleporterId() + ", getCreateDate()=" + getCreateDate()
				+ ", getAddress()=" + getAddress() + ", getRemark()=" + getRemark() + "]";
	}
	
	
	
}
