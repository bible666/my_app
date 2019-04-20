import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';

const BASE_URL	= environment.api_url+'/UserController';

@Injectable({
  providedIn: 'root'
})
export class HomeService {

	constructor(private http:HttpClient) { }

	public checkToken(){
		let chkData: cCheck = new cCheck();
		chkData.token	= localStorage.getItem('token');

		let strJSON:string = JSON.stringify(chkData);
		return this.http.post(BASE_URL+'/checkToken',strJSON);
	}
}


export class cCheck{
	token:string;
}
