import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { SortDirection } from '@angular/material';

const BASE_URL	= environment.api_url+'/itemController';

@Injectable({
  providedIn: 'root'
})
export class PoService {

	constructor(private http:HttpClient) { }

	public getListData(search_data:cSearch){
		//let pData:cUnitSearch = new cUnitSearch();
		search_data.token	= localStorage.getItem('token');

		let strJSON:string = JSON.stringify(search_data);
		return this.http.post(BASE_URL+'/get_data_list',strJSON);
	}

	public getById(id:number){
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

	public deleteById(id:number){
		let search_data:cGetById	= new cGetById();
		search_data.token			= localStorage.getItem('token');
		search_data.id				= id;

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

	//manual search condition
	code:string;
	name:string;
}

export class cInput{
	token			: string;
	id				: number;
	supplier_id		: number;
	po_no			: string;
	po_date			: Date;
	po_due_date		: Date;
	supplier_name	: string;
	address_1		: string;
	address_2		: string;
	address_3		: string;
	zip_code		: string;
	phone			: string;
	fax				: string;
	contract_name	: string;
	tax_no			: string;
	total_qty		: number;
	total_amount	: number;
	discount_value	: number;
	discount_type	: number;
	vat				: number;
	final_amount	: number;
	remark			: string;
	ar_details		: Array<po_detail>;

	public constructor(init?: Partial<cInput>){
		Object.assign(this,init);
	}
}

export class po_detail{
	item_id		: number;
	item_code	: string;
	item_name	: string;
	qty			: number;
	unit_id		: number;
	unit_code	: string;
	unit_price	: number;
	total		: number;

	public constructor(init?: Partial<cInput>){
		Object.assign(this,init);
	}
}
