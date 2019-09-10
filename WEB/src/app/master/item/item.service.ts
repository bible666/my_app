import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { SortDirection } from '@angular/material';

const BASE_URL	= environment.api_url+'/itemController';

@Injectable({
  providedIn: 'root'
})
export class ItemService {

	constructor(private http:HttpClient) { }

	public getListData(search_data:cSearch){
		//let pData:cUnitSearch = new cUnitSearch();
		search_data.token	= localStorage.getItem('token');

		let strJSON:string = JSON.stringify(search_data);
		return this.http.post(BASE_URL+'/get_data_list',strJSON);
	}

	public getById(id){
		let search_data:cGetById	= new cGetById();
		search_data.token			= localStorage.getItem('token');
		search_data.id				= id;

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
		search_data.token				= localStorage.getItem('token');
		search_data.id					= +localStorage.getItem('unit_input.delete_id');
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
	
	code:string;
	name:string;
}

export class cInput{
	token			:string;
	id				:number;
	item_code		: string;
	item_name		: string;
	m_unit_id		: number;
	m_item_type_id	: number;
	lot_flag		: number;
	mrp_flag		: number;
	remark			: string;

	public constructor(init?: Partial<cInput>){
		Object.assign(this,init);
	}
}
