package com.itwill.springmvc;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

/*
 * properties 파일로부터 mapping 정보를 읽어서
 * 요청 command(/guest_xxx.do)에 해당하는 Controller객체를 생성
 * Mapping하고 있는 객체
 */


public class HandlerMapping {
	private HashMap<String, Controller> controllerMap = new HashMap<String, Controller>();

	public HandlerMapping(String configFile) {
		try {
			FileInputStream in = new FileInputStream(configFile);
			Properties prop = new Properties();
			prop.load(in);
			Set keySet = prop.keySet();
			Iterator keyIter = keySet.iterator();
			System.out.println("--------------- controller_mapping.properties ---------------");
			while (keyIter.hasNext()) {
				String keyCommand = (String) keyIter.next();		
				String controllerClassName = prop.getProperty(keyCommand);
				System.out.println("keyCommand : " + keyCommand + ", controllerClassName : " + controllerClassName);
				Class controllerClass=Class.forName(controllerClassName);
				Controller controllerInstance=(Controller)controllerClass.newInstance();
				controllerMap.put(keyCommand, controllerInstance);
				System.out.println(keyCommand+"="+controllerInstance);
			}
			System.out.println("-------------------------------------------------------------");
			
			System.out.println(prop);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	public Controller getController(String command) {
		return controllerMap.get(command);
		
	}
}
