package com.iot1.sql.kendo.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot1.sql.user.dto.UserInfo;
import com.iot1.sql.user.service.UserService;



@Controller
public class KendoController {

	private class UserInfo{
		
		private String userId;
		private String userPwd;
		private String userName;
		private String age;
		private String address;
		private String hp1;
		private String hp2;
		private String hp3;
		
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getUserPwd() {
			return userPwd;
		}
		public void setUserPwd(String userPwd) {
			this.userPwd = userPwd;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getAge() {
			return age;
		}
		public void setAge(String age) {
			this.age = age;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getHp1() {
			return hp1;
		}
		public void setHp1(String hp1) {
			this.hp1 = hp1;
		}
		public String getHp2() {
			return hp2;
		}
		public void setHp2(String hp2) {
			this.hp2 = hp2;
		}
		public String getHp3() {
			return hp3;
		}
		public void setHp3(String hp3) {
			this.hp3 = hp3;
		}
		public int getUserNum() {
			return userNum;
		}
		public void setUserNum(int userNum) {
			this.userNum = userNum;
		}
		public int getDepartNum() {
			return departNum;
		}
		public void setDepartNum(int departNum) {
			this.departNum = departNum;
		}
		public String getUserRoleLevel() {
			return userRoleLevel;
		}
		public void setUserRoleLevel(String userRoleLevel) {
			this.userRoleLevel = userRoleLevel;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		private int userNum;
		private int departNum;
		private String userRoleLevel;
		private String gender;
		
		
//		String productName;
//		double unitPrice;
//		String unitsInStock;
//		String header1;
//		public String getHeader1() {
//			return header1;
//		}
//		public void setHeader1(String header1) {
//			this.header1 = header1;
//		}
//		public String getProductName() {
//			return productName;
//		}
//		public void setProductName(String productName) {
//			this.productName = productName;
//		}
//		public double getUnitPrice() {
//			return unitPrice;
//		}
//		public void setUnitPrice(double unitPrice) {
//			this.unitPrice = unitPrice;
//		}
//		public String getUnitsInStock() {
//			return unitsInStock;
//		}
//		public void setUnitsInStock(String unitsInStock) {
//			this.unitsInStock = unitsInStock;
//		}
		
	}
	private UserService us;
	
	@RequestMapping(value="/grid/api/read", method=RequestMethod.GET)
	public @ResponseBody List<UserInfo> getUserList(HttpSession hs, UserInfo user, ModelMap hm){
		UserInfo rUser = us.selectUser(user);
		return us.selectUserList(user);
		}
		
	
//	@RequestMapping(value="/grid/api/read", method=RequestMethod.GET)
//	public @ResponseBody List<Product> getList(){
//		List<Product> proList = new ArrayList<Product>();
//		for(int i=1;i<30;i++){
//			Product p = new Product();
//			p.setProductName("test" + i);
//			p.setUnitPrice(i*1.1);
//			p.setUnitsInStock("유닛테스트" + (i%2));
//			p.setHeader1("헤더" + i);
//			proList.add(p);
//		}
//		return proList;
//	}
}