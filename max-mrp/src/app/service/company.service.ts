import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url+'/CompanyController';

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type'  : 'application/json',
    'Authorization' : sessionStorage.getItem('token')
  })
};

@Injectable({
  providedIn: 'root'
})
export class CompanyService {

  constructor(
    private http:HttpClient
  ) { }

  public getListData(search_data:cSearch){
    let strJSON:string = JSON.stringify(search_data);
    return this.http.post(BASE_URL+'/get_data_list',strJSON,httpOptions);
  }

  public deleteById(id:string){
    let inputData = new cInput();
    inputData.company_code = id;
    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/delete_data_by_id',strJSON,httpOptions);
  }

  public getDataById(id:string){
    let inputData = new cInput();
    inputData.company_code = id;
    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/get_data_by_id',strJSON,httpOptions);
  }

  public updateById(inputData:cInput){
    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/update_data',strJSON,httpOptions);
  }

  public getCalendar(){
    let strJSON:string  = '';
    return this.http.post(BASE_URL+'/get_calendar',strJSON,httpOptions);
  }
}


export class cSearch{
  page_index  :number;
  rowsPerpage   :number;

  //manual search condition
  company_name   : string;
  address        : string;
  phone          : string;
  remark         : string;

  public constructor(init?: Partial<cSearch>){
      Object.assign(this,init);
   }
}

export class cData{
  company_code  : string;
  company_name  : string;
  addr_1        : string;
  addr_2        : string;
  addr_3        : string;
  zip           : string;
  telno         : string;
  faxno         : string;
  email         : string;
  cal_no        : number;
  remark        : string;
}

export class cInput{
  token         : string;
  id  			: string;

  company_code  : string;
  company_name  : string;
  addr_1        : string;
  addr_2        : string;
  addr_3        : string;
  zip           : string;
  telno         : string;
  faxno         : string;
  email         : string;
  cal_no        : number;
  remark        : string;

  public constructor(init?: Partial<cInput>){
    Object.assign(this,init);
  }
}
