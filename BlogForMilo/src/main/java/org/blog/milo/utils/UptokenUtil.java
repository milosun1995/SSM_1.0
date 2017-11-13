package org.blog.milo.utils;

import org.springframework.stereotype.Component;

import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.config.Config;
import com.qiniu.api.io.IoApi;
import com.qiniu.api.io.PutExtra;
import com.qiniu.api.io.PutRet;
import com.qiniu.api.rs.PutPolicy;

@Component
public class UptokenUtil {
	public void uploadImageToQiNiu(String key,String localFile) throws Exception{
		Config.ACCESS_KEY = "_Fj_I5ZEnlcixfgUqSDGjLiPWDciOOjc-FIpa4KI";// <YOUR APP ACCESS_KEY>
		Config.SECRET_KEY = "LKGCqBF-_0zg7xjrnRYhnI0kz3ptm4RcJB45Ki_K";// <YOUR APP SECRET_KEY>
		Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);
		String bucketName = "images";// Your bucket name
		PutPolicy putPolicy = new PutPolicy(bucketName);
		String uptoken = putPolicy.token(mac);
		PutExtra extra = new PutExtra();
//		String key = "20171113.jpg";
//		String localFile = "F://images//ErTlQHu4r9sO.jpg";
		PutRet ret = IoApi.putFile(uptoken, key, localFile, extra);
	}
}
