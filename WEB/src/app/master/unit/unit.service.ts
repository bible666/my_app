import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { SortDirection } from '@angular/material';

const BASE_URL	= environment.api_url+'/UnitController';

@Injectable({
	providedIn: 'root'
})
export class UnitService {

	constructor(private http:HttpClient) { }

	public getListData(search_data:cUnitSearch){
		//let pData:cUnitSearch = new cUnitSearch();
		search_data.token	= localStorage.getItem('token');

		let strJSON:string = JSON.stringify(search_data);
		return this.http.post(BASE_URL+'/get_data_list',strJSON);
	}

	public getById(){
		let search_data:cUnitGetById	= new cUnitGetById();
		search_data.token				= localStorage.getItem('token');
		search_data.id					= +localStorage.getItem('unit_input.id');

		let strJSON:string = JSON.stringify(search_data);
		return this.http.post(BASE_URL+'/get_data_by_id',strJSON);
		
	}

	public updateById(inputData:cUnitInput){
		inputData.token	= localStorage.getItem('token');
		let strJSON:string = JSON.stringify(inputData);
		return this.http.post(BASE_URL+'/update_data',strJSON);
	}

	public deleteById(){
		let search_data:cUnitGetById	= new cUnitGetById();
		search_data.token				= localStorage.getItem('token');
		search_data.id					= +localStorage.getItem('unit_input.id');

		let strJSON:string = JSON.stringify(search_data);
		return this.http.post(BASE_URL+'/get_data_by_id',strJSON);
	}
}

export class cUnitGetById{
	token:string;
	id:number;
}

export class cUnitSearch{
	token:string;
	sort_column:string;
	sort_direction:SortDirection;
	page_index:number;
	page_size:number;
	unit_code:string;
	unit_name:string;
}

export class cUnitInput{
	token:string;
	id:number;
	unitCode:string;
	unitName:string;
	remark:string;
}
