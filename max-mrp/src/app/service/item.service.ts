import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url+'/ItemController';

@Injectable({
  providedIn: 'root'
})
export class ItemService {

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type'  : 'application/json',
      'Authorization' : localStorage.getItem('token')
    })
  };

  constructor(
    private http:HttpClient
  ) { }

  public getListData(search_data:cSearch){
    let strJSON:string = JSON.stringify(search_data);
    return this.http.post(BASE_URL+'/get_data_list',strJSON,this.httpOptions);
  }

  public deleteById(item_code:string){
    let inputData = new cInput();
    
    inputData.item_code = item_code;
    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/delete_data_by_id',strJSON,this.httpOptions);
  }

  public getDataById(item_code:string){
    let inputData = new cInput();
    inputData.item_code           = item_code;
    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/get_data_by_id',strJSON,this.httpOptions);
  }

  public updateById(inputData:cInput){
    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/update_data',strJSON,this.httpOptions);
  }

  public getUnit(unit_name:string){
    let inputData = new unitSearch();
    inputData.unit_name = unit_name;

    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/get_unit',strJSON,this.httpOptions);
  }

  public getUnitฺCode(unit_name:string){
    let inputData = new unitSearch();
    inputData.unit_name = unit_name;

    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/get_unit_code',strJSON,this.httpOptions);
  }

    public getItemListByLocation(location_code:string,item_name:string){
        let inputData = new cGetDataList();
        inputData.location_code          = location_code;
        inputData.item_name              = item_name;

        let strJSON:string  = JSON.stringify(inputData);
        return this.http.post(BASE_URL+'/get_all_item_by_location',strJSON,this.httpOptions);
    }

}

export class cGetDataList{
    location_code:   string;
    item_name:       string;
}


export class cSearch{
  page_index  :number;
  rowsPerpage   :number;

  //manual search condition
  item_code  : string;
  item_name  : string;

  public constructor(init?: Partial<cSearch>){
      Object.assign(this,init);
   }
}

export class unitSearch{
  unit_name : string;
  unit_code : string;
}

export class cData{
  item_code     : string;
  item_name     : string;
  mrp_flag      : boolean;
  remark        : string;
}

export class cInput{
  token                : string;
  old_item_code        : string;

  item_code            : string;
  item_name            : string;
  item_type            : string;
  lot_flag             : boolean;
  production_lead_time : number;
  request_decimal      : number;
  mrp_flag             : boolean;
  standard_location    : boolean;
  remark               : string;

  public constructor(init?: Partial<cInput>){
    Object.assign(this,init);
  }
}
