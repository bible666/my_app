import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { SortDirection } from '@angular/material';

const BASE_URL	= environment.api_url+'/CustomerController';

@Injectable({
  providedIn: 'root'
})
export class CustomerService {

	constructor(private http:HttpClient) { }

	public getListData(search_data:cSearch){
		search_data.token	= localStorage.getItem('token');

		let strJSON:string = JSON.stringify(search_data);
		return this.http.post(BASE_URL+'/get_data_list',strJSON);
	}

	public getById(){
		let search_data:cGetById	= new cGetById();
		search_data.token			= localStorage.getItem('token');
		search_data.id				= +localStorage.getItem('customer_input.id');

		let strJSON:string = JSON.stringify(search_data);
		return this.http.post(BASE_URL+'/get_data_by_id',strJSON);
		
	}

	public updateById(inputData:cInput){
		inputData.token	= localStorage.getItem('token');
		let strJSON:string = JSON.stringify(inputData);
		return this.http.post(BASE_URL+'/update_data',strJSON);
	}

	public deleteById(){
		let search_data:cGetById	= new cGetById();
		search_data.token			= localStorage.getItem('token');
		search_data.id				= +localStorage.getItem('itemTypeInput.delete_id');
		console.log(search_data);
		let strJSON:string = JSON.stringify(search_data);
		return this.http.post(BASE_URL+'/delete_data_by_id',strJSON);
	}
}



export class cGetById{
	token:string;
	id:number;
}

export class cSearch{
	token:string;
	sort_column:string;
	sort_direction:SortDirection;
	page_index:number;
	page_size:number;

	customer_name:string;
	customer_cd:string;
}

export class cInput{
	token			: string;
	id				: number;
	customer_cd		: string;
	customer_name	: string;
	customer_add1	: string;
	customer_add2	: string;
	customer_add3	: string;
	customer_zip	: string;
	customer_tel	: string;
	customer_fa		: string;
	customer_email	: string;
	contract_name	: string;
	delivery_time	: number;
	m_transport_id	: number;
	tax_no			: string;
	payment_tearm	: number;
	remark:string;
}