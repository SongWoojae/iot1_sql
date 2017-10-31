package com.test.biz.tj.ch16;

import org.springframework.aop.framework.ProxyFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloMain {
	
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ch16/ioc.xml");
		IPrintMsg target = new PrintMsg();
		
		//proxy 빈껍데기 생성 
		ProxyFactory pf = new ProxyFactory();
		pf.addAdvice(new MyAroundAdvice()); //충고 add
		pf.setTarget(target); //타켓 add
		IPrintMsg proxy = (IPrintMsg) pf.getProxy();
		
		proxy.hello();
		proxy.hello1();
		proxy.hello2();
		
	}

}
