import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url+'/CurrencyController';

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type'  : 'application/json',
    'Authorization' : sessionStorage.getItem('token')
  })
};

@Injectable({
  providedIn: 'root'
})
export class CurrencyService {

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
  currency_code   :string;
  description :string;

  public constructor(init?: Partial<cSearch>){
      Object.assign(this,init);
   }
}

export class cData{
  currency_code : string;
  description : string;
}

export class cInput{
  token         : string;
  id            : number;

  currency_id     : number;
  currency_code   : string;
  description     : string;

  public constructor(init?: Partial<cInput>){
    Object.assign(this,init);
  }
}
