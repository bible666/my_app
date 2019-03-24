import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url;

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http:HttpClient) { }

  public getUser(){
    return this.http.get(BASE_URL+'ode.com/todos/1');
     
  }

  public clear_cache(){
    localStorage.clear();
  }

	public login(pData){
		let httpData : cLogin = new cLogin();
		httpData.user_login     = pData['login_name'];
		httpData.user_password  = pData['login_pwd'];
		return this.http.post(BASE_URL+'/UserController/login',JSON.stringify(httpData));
	}

  public logout(){
    localStorage.clear();
  }

  public set_token(p_token){
    localStorage.setItem('token', p_token);
  }

  public get_token(){
    return localStorage.getItem('token');
  }

  public set_company_id(p_company_id){
    localStorage.setItem('company_id', p_company_id);
  }

  public get_company_id(){
    return localStorage.getItem('company_id');
  }
}

class cLogin{
  user_login:string;
  user_password:string;
}
