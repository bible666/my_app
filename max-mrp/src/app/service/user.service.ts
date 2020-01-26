import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { BehaviorSubject } from 'rxjs';

const BASE_URL = environment.api_url;

interface MenuNode {
	name: string;
	URL: string;
	image: string;
	children?: MenuNode[];
}

//const headers = new HttpHeaders().set("Authorization", "custom header value");
const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type':  'application/json',
    'Authorization': 'my-auth-token'
  })
};

@Injectable({
  providedIn: 'root'
})
export class UserService {

  Menu_Data: MenuNode[];

  private MenuDataSource = new BehaviorSubject(this.Menu_Data);
  currentMenuDataSource = this.MenuDataSource.asObservable();

  constructor(
    private http:HttpClient
  ) { }

  changeMenu(newMenu: MenuNode[]){
    this.MenuDataSource.next(newMenu);
  }

  public getUser(){
    return this.http.get(BASE_URL+'ode.com/todos/1');
     
  }

  public getMenu(){
    let httpData : cGetMenu = new cGetMenu();
    httpData.token	= sessionStorage.getItem('token');
    return this.http.post(BASE_URL+'/UserController/getMenu',JSON.stringify(httpData));
  }

  public clear_cache(){
    sessionStorage.clear();
  }

  public login(pData){
    let httpData : cLogin = new cLogin();
    httpData.user_login     = pData['login_name'];
    httpData.user_password  = pData['login_pwd'];
    console.log(httpOptions);
    return this.http.post(BASE_URL+'/UserController/login',JSON.stringify(httpData),httpOptions);
  }

  public logout(){
    sessionStorage.clear();
  }

  public set_token(p_token){
    sessionStorage.setItem('token', p_token);
  }

  public get_token(){
    return sessionStorage.getItem('token');
  }

  public set_company_id(p_company_id){
    sessionStorage.setItem('company_id', p_company_id);
  }

  public get_company_id(){
    return sessionStorage.getItem('company_id');
  }
}

class cLogin{
  user_login:string;
  user_password:string;
}

class cGetMenu{
	token:string;
}
