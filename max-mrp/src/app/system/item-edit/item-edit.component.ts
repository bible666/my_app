import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../service/message.service';
import { cInput, ItemService } from '../../service/item.service';
import { Router, ActivatedRoute } from '@angular/router';
import {Observable} from 'rxjs';
import {switchMap,debounceTime, tap, finalize,map} from 'rxjs/operators';
import { async } from '@angular/core/testing';

export interface User {
  name: string;
  value: string;
}

export interface Unit {
  unit_code: string;
  unit_name: string;
}

@Component({
  selector: 'app-item-edit',
  templateUrl: './item-edit.component.html',
  styleUrls: ['./item-edit.component.css']
})
export class ItemEditComponent implements OnInit {

  public message: MessageClass[] = [];
  submitted: boolean = false;

  show_unit_name :string = 'DDD';

  unit_datas;

  options: User[] = [
    {name: 'Mary', value: 'Mary'},
    {name: 'Shelley', value: 'l'},
    {name: 'Igor', value : 'i'}
  ];

  isLoading = false;

  filteredOptions: Observable<User[]>;
  filteredUnit: Unit[] = [];

  //----------------------------------------------------------------
  // set local Valiable
  //----------------------------------------------------------------
  old_item_code  : string;
  
  inputForm = new FormGroup({
    'item_code'             : new FormControl('', [ Validators.required, Validators.maxLength(10) ]),
    'item_name'             : new FormControl('', [ Validators.required, Validators.maxLength(50) ]),
    'item_type'             : new FormControl(''),
    'lot_flag'              : new FormControl(true),
    'unit_code'             : new FormControl(''),
    'standard_location'     : new FormControl(''),
    'production_lead_time'  : new FormControl(0),
    'request_decimal'       : new FormControl(0),
    'mrp_flag'              : new FormControl(false),
    'remark'                : new FormControl('', [ Validators.maxLength(200) ])
  });
  
  constructor(private param: ActivatedRoute,
    private Service: ItemService,
    private ServiceMessage: MessageService,
    private router: Router) { }

  ngOnInit() {
    window.scroll(0,0);

    this.old_item_code    = this.param.snapshot.params.item_code;


    // this.Service.getUnit().subscribe(data=>{
    //   this.unit_datas = data['data'];
    // });

    if (this.old_item_code != '-1') {
      //get data from database
      this.Service.getDataById(this.old_item_code)
      .subscribe(data=>{
        
        if (data['status']== 'success'){
          
          let isDefault = true;
          
          this.inputForm.patchValue({
            'item_code'             : data['data'].item_code,
            'item_name'             : data['data'].item_name,
            'item_type'             : data['data'].item_type,
            'lot_flag'              : data['data'].lot_flag == 1 ?true:false,
            'unit_code'             : data['data'].unit_code,
            'standard_location'     : data['data'].standard_location,
            'production_lead_time'  : data['data'].production_lead_time,
            'request_decimal'       : data['data'].request_decimal,
            'mrp_flag'              : data['data'].mrp_flag == 1 ? true:false,
            'remark'                : data['data'].remark
          });
        } else {
          this.ServiceMessage.setError(data['message']);
          this.message = this.ServiceMessage.getMessage();
        }
        
      },
      error=>{
        this.ServiceMessage.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
        this.message = this.ServiceMessage.getMessage();
      });
    }
    //test auto complete
      this.inputForm.get("unit_code").valueChanges
      .pipe(
        debounceTime(300),
        tap(() => this.isLoading = true),
        switchMap(value => this.Service.getUnit(value)
        .pipe(
          
          finalize(
            () => this.isLoading = false)
          )
        )
      )
      .subscribe(
          unit =>{
            this.filteredUnit = unit['data'];
            this.unit_datas = unit['data'];
          }
      );
  }

  selectUnit(unit_name:string){
    this.show_unit_name = unit_name;
  }

  displayFn = value => {
    // this.Service.getUnitฺByCode(unit_code)
    // .subscribe(async data=>{
    //   console.log(data['data'].unit_name);
    //   return data['data'].unit_name;
    // });
    return this.show_unit_name;
  }


  clearUnitValue(){
    this.inputForm.patchValue({
      'unit_code'             : ''
    });
  }

  onSubmit(){
    this.submitted = true;
    if (this.inputForm.invalid){
      return;
    }

    let input_data	: cInput = new cInput(this.inputForm.value);
    input_data.old_item_code = this.old_item_code;

    this.Service.updateById(input_data)
    .subscribe(data=>{

      if (data['status']== 'success'){
        this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
        
        this.router.navigateByUrl('/system/item/list');
			} else {
        this.ServiceMessage.setError(data['message']);
        this.message = this.ServiceMessage.getMessage();
      }
			
    },
    error=>{
      this.ServiceMessage.setError('บันทึกผิดพลาด');
      this.message = this.ServiceMessage.getMessage();
    });
  }

}



