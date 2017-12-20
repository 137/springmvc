package sy.model;

import org.springframework.stereotype.Repository;

@Repository
public class MyFriend {
	private String createdate;
	private String name;
	private String sex;
	private String birthday;
	private String telephone;
	private String qq;
	private String hobby;
	private String school;
	private String education_background;
	private String major;
	private String address;
	private String company;
	private String relation;

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getEducation_background() {
		return education_background;
	}

	public void setEducation_background(String education_background) {
		this.education_background = education_background;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	@Override
	public String toString() {
		return "MyFriend{" +
				"createdate='" + createdate + '\'' +
				", name='" + name + '\'' +
				", sex='" + sex + '\'' +
				", birthday='" + birthday + '\'' +
				", telephone='" + telephone + '\'' +
				", qq='" + qq + '\'' +
				", hobby='" + hobby + '\'' +
				", school='" + school + '\'' +
				", education_background='" + education_background + '\'' +
				", major='" + major + '\'' +
				", address='" + address + '\'' +
				", company='" + company + '\'' +
				", relation='" + relation + '\'' +
				'}';
	}
}
