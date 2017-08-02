package com.milosun.mysql.test;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.milosun.mysql.factory.ServiceFactory;
import com.milosun.mysql.service.IMemberService;
import com.milosun.mysql.service.impl.MemberServiceImpl;
import com.milosun.mysql.vo.Member;

import junit.framework.TestCase;
@SuppressWarnings("unchecked")
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TestIMemberService {
		
		private static String mid;
		private static String phone;
		private static IMemberService service;

		static {//静态块
			Random rand=new Random();
			int temp=rand.nextInt(1000);
			mid="测试ID-"+temp;
			phone="测试PHONE-"+temp; 
			
			System.out.println(mid);
		}
		
		@Test
		public void testAdd() {
			Member mem=new Member();
			service=ServiceFactory.getInstance(MemberServiceImpl.class);
			mem.setMid(mid);
			mem.setPhone(phone);
			mem.setAge(10);
			mem.setBirthday(new Date());
			mem.setNote("Hello.I'm Milo!");
			mem.setName("Milo"+mid);
			try {
				TestCase.assertTrue(service.add(mem));
				System.out.println("******** Add √*********");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		@Test
		public void testEdit() {
			Member mem=new Member();
			service=ServiceFactory.getInstance(MemberServiceImpl.class);
			mem.setMid("测试ID-172");
			mem.setPhone(phone);
			mem.setAge(40);
			mem.setBirthday(new Date());
			mem.setNote("Hello.I'm Milo!");
			mem.setName("Milo");
			try {
				TestCase.assertTrue(service.edit(mem));
				System.out.println("******** Edit √*********");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		@Test
		public void testRemove() {
			service=ServiceFactory.getInstance(MemberServiceImpl.class);
			Set<String> set=new HashSet<String>();
			set.add(mid);
			try {
				service.remove(set);
				System.out.println("******** Remove √*********");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		@Test
		public void testGet() {
			service=ServiceFactory.getInstance(MemberServiceImpl.class);
			try {
				TestCase.assertNotNull(service.get(mid));
				System.out.println("******** Get √*********");
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		@Test
		public void testList() {
			service=ServiceFactory.getInstance(MemberServiceImpl.class);
			try {
				TestCase.assertTrue(service.list().size()>0);
				System.out.println("******** List √*********");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		@Test
		public void testListIntInt() {
			service=ServiceFactory.getInstance(MemberServiceImpl.class);
			try {
				Map<String, Object> map=service.list(1,10);
				long count=(Long)map.get("memberCount");
				List<Member> all= (List<Member>)map.get("allMembers");
				TestCase.assertTrue(count>0 && all.size()>0);
				System.out.println("******** List2 √*********");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		@Test
		public void testListStringStringIntInt() {
			service=ServiceFactory.getInstance(MemberServiceImpl.class);
			try {
				Map<String, Object> map=service.list("name","Milo",1,10);
				long count=(Long)map.get("memberCount");
				List<Member> all= (List<Member>)map.get("allMembers");
				TestCase.assertTrue(count>0 && all.size()>0);
				System.out.println("******** List3 √*********");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
