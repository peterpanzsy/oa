package cn.wangan.service;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import cn.wangan.domain.MyEmail;

public interface MyEmailService {

	Map<String,String> send(MyEmail model,String[] realname) throws UnsupportedEncodingException;

}
