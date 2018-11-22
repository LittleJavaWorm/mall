package pers.liyonghong.mall.beans;


/**
 * 用户实体类
 * @author Administrator
 *
 */
public class User {
	
	//用户ID
	private String id;
	//用户名，收货人真实姓名
	private String username;
	//用户性别,0-男,1-女
	private Integer gender;
	//用户密码
	private String password;
	//昵称
	private String nickName;
	//电子邮箱
	private String email;
	//地址
	private String address;
	//手机号
	private String cellPhoneNumber;
	//出生日期
	private String birthday;
	//激活码
	private String activationCode;
	//是否激活,默认0-未激活
	private int isActivated;
	//注册时间
	private String regTime;
	//头像地址ID
	private String headPortraitId;
	//最后一次登录时间
	private String lastLoginTime;
	//会员等级，1-5级，默认1级
	private Integer memberLevel;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCellPhoneNumber() {
		return cellPhoneNumber;
	}

	public void setCellPhoneNumber(String cellPhoneNumber) {
		this.cellPhoneNumber = cellPhoneNumber;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getActivationCode() {
		return activationCode;
	}

	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}

	public int getIsActivated() {
		return isActivated;
	}

	public void setIsActivated(int isActivated) {
		this.isActivated = isActivated;
	}

	public String getRegTime() {
		return regTime;
	}

	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}

	public String getHeadPortraitId() {
		return headPortraitId;
	}

	public void setHeadPortraitId(String headPortraitId) {
		this.headPortraitId = headPortraitId;
	}

	public String getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Integer getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(Integer memberLevel) {
		this.memberLevel = memberLevel;
	}

	 
}
