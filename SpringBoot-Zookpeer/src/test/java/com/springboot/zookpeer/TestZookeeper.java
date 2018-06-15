package com.springboot.zookpeer;

import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooDefs;
import org.apache.zookeeper.ZooKeeper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestZookeeper {
	private final String connectString = "192.168.8.100:2181";
	private final int sessionTimeout = 100;
	private final String path = "/demo";

	@Test
	public void creat() throws Exception {
		Watcher watcher=(event)->System.out.println("监听到的事件："+event);  
		
		// 创建ZooKeeper实例
		ZooKeeper zk = new ZooKeeper(connectString, sessionTimeout, watcher);
		byte[] data = "hello".getBytes();
		
		// 创建一个节点,模式是PERSISTENT
		zk.create(path, data, ZooDefs.Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
		System.out.println("创建节点" + path + ",数据为：" + new String(zk.getData(path, watcher, null)));
		
		// 修改节点数据
		zk.setData(path, "world".getBytes(), -1);
		System.out.println("修改节点" + path + ",数据为：" + new String(zk.getData(path, watcher, null)));
		
		// 删除一个节点
		System.out.println("删除一个节点:"+zk.exists(path, watcher));
		zk.delete(path, -1);
		
		// 节点是否存在
		System.out.println("节点是否存在:"+zk.exists(path, watcher));
	}
	
	@Test
	public void find() throws Exception {
		ZooKeeper zk = new ZooKeeper(connectString, sessionTimeout, null);
		//查看ZooKeeper,是否在连接状态
		System.out.println(zk.getState());
	}
}
