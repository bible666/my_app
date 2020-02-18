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

  public updateById(inputData:cInput){
    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/update_data',strJSON,httpOptions);
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

export class cInput{
  token         : string;
  id            : number;

  supplier_cd     : string;
  supplier_name   : string;
  supplier_add1   : string;
  supplier_add2   : string;
  supplier_add3   : string;
  supplier_zip    : string;
  supplier_tel    : string;
  supplier_fax    : string;
  supplier_email  : string;
  contract_name   : string;
  delivery_time   : number;
  m_transport_id  : number;
  tax_no          : string;
  payment_tearm   : string;
  remark          : string;

  public constructor(init?: Partial<cInput>){
    Object.assign(this,init);
  }
}
