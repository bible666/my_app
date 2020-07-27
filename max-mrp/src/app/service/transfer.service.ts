import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url+'/ItemController';

@Injectable({
  providedIn: 'root'
})
export class TransferService {

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type'  : 'application/json',
      'Authorization' : localStorage.getItem('token')
    })
  };

  constructor(
    private http:HttpClient
  ) { }

  public getItemList(factory_code:string,location_code:string){
    let inputData = new cGetDataList();
    inputData.factory_code           = factory_code;
    inputData.location_code          = location_code;

    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/get_all_item_by_location',strJSON,this.httpOptions);
  }

}

export class cGetDataList{
  factory_code:    string;
  location_code:   string;
}