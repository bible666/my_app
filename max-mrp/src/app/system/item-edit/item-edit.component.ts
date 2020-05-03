import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../service/message.service';
import { cInput, ItemService } from '../../service/item.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-item-edit',
  templateUrl: './item-edit.component.html',
  styleUrls: ['./item-edit.component.css']
})
export class ItemEditComponent implements OnInit {

  public message: MessageClass[] = [];
  submitted: boolean = false;

  unit_datas;

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


    this.Service.getUnit().subscribe(data=>{
      this.unit_datas = data['data'];
    });

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



