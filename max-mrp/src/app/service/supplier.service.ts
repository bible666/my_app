import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url+'/SupplierController';

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type'  : 'application/json',
    'Authorization' : sessionStorage.getItem('token')
  })
};

@Injectable({
  providedIn: 'root'
})
export class SupplierService {

  constructor(
    private http:HttpClient
  ) { }

  public getListData(search_data:cSearch){
    let strJSON:string = JSON.stringify(search_data);
    return this.http.post(BASE_URL+'/get_data_list',strJSON,httpOptions);
  }
}


export class cSearch{
  page_index  :number;
  rowsPerpage   :number;

  //manual search condition
  supplier_cd   :string;
  supplier_name :string;

  public constructor(init?: Partial<cSearch>){
		Object.assign(this,init);
	}
}

export class cData{
  supplier_cd : string;
  supplier_name : string;
}
