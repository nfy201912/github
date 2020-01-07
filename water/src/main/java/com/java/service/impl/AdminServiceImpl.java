package com.java.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.AdminMapper;
import com.java.po.Admin;
import com.java.service.AdminService;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public Admin login(Admin admin,int flag) throws Exception {
		if(2==flag){//flag=2 为检验
			return adminMapper.login(admin);
		}
		Admin adm = new Admin();
		try {
			
			if(admin.getAdm_password()!=null&&adminMapper.login(admin) !=null){
				if(adminMapper.login(admin).isAdm_status()){
					return adminMapper.login(admin);
				}
				adm.setAdm_name("账户已被锁定");
				
			}else{
				
				adm.setAdm_name(admin.getAdm_name());
				if(adminMapper.login(adm)==null){
					adm.setAdm_name("用户名错误");
				}else{
					adm.setAdm_name(admin.getAdm_name());
					adm.setAdm_password(admin.getAdm_password());
					if(adminMapper.login(adm)==null){
						adm.setAdm_name("密码错误");
					}
				}
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		
		}
		return adm;
	}

	@Override
	public boolean insert(Admin admin) {
		
			
			try {
				adminMapper.insert(admin);
				return true;
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			return false;
	
		
		
	}

	@Override
	public List<Admin> findUsers() throws Exception {
		
		return adminMapper.findUsers();
	}

	@Override
	public void delete(int[] array) throws Exception {
		adminMapper.delete(array);
		
	}

	@Override
	public Admin loadById(int aid) throws Exception {
		
		return adminMapper.loadById(aid);
	}

	@Override
	public String unique(Admin admin) throws Exception {
		String flag = "";
		if(adminMapper.unique(admin)==null||adminMapper.unique(admin).size()==0){
			
			flag = "更新成功";
		}else{
			flag="用户名不能相同";
		}
		return flag;
	}

	@Override
	public void update(Admin admin) throws Exception {
		adminMapper.update(admin);
		
	}

}
