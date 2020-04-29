import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { cInput, LocationService } from '../../../service/location.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-location-edit',
  templateUrl: './location-edit.component.html',
  styleUrls: ['./location-edit.component.css']
})
export class LocationEditComponent implements OnInit {

  public message: MessageClass[] = [];
  submitted: boolean = false;

  factory_datas;

  //----------------------------------------------------------------
  // set local Valiable
  //----------------------------------------------------------------
  id      : string;
  old_factory_code  : string;
  old_location_code : string;
  
  inputForm = new FormGroup({
    'factory_code'        : new FormControl('', [ Validators.required, Validators.maxLength(10) ]),
    'location_code'       : new FormControl('', [ Validators.required, Validators.maxLength(10) ]),
    'location_name'       : new FormControl('', [ Validators.required, Validators.maxLength(50) ]),
    'mrp_flag'            : new FormControl(-1),
    'expire_flag'         : new FormControl(-1),
    'remark'              : new FormControl('', [ Validators.maxLength(200) ])
  });
  
  constructor(private param: ActivatedRoute,
    private Service: LocationService,
    private ServiceMessage: MessageService,
    private router: Router) { }

  ngOnInit() {
    window.scroll(0,0);

    this.old_factory_code     = this.param.snapshot.params.factory_code;
    this.old_location_code    = this.param.snapshot.params.location_code;


    this.Service.getFactory().subscribe(data=>{
      this.factory_datas = data['data'];
    });

    if (this.old_location_code != '-1') {
      //get data from database
      this.Service.getDataById(this.old_factory_code,this.old_location_code)
      .subscribe(data=>{
        
        if (data['status']== 'success'){
          
          let isDefault = true;
          
          this.inputForm.patchValue({
            'company_code'    : data['data'].company_code,
            'factory_code'    : data['data'].factory_code,
            'factory_name'    : data['data'].factory_name,
            'addr_1'          : data['data'].addr_1,
            'addr_2'          : data['data'].addr_2,
            'addr_3'          : data['data'].addr_3,
            'telno'           : data['data'].telno,
            'faxno'           : data['data'].faxno,
            'email'           : data['data'].email,
            'cal_no'          : data['data'].cal_no,
            'remark'          : data['data'].remark

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
    input_data.old_factory  = this.old_factory_code;
    input_data.old_location = this.old_location_code;

    this.Service.updateById(input_data)
    .subscribe(data=>{

      if (data['status']== 'success'){
        this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
        
        this.router.navigateByUrl('/location/list');
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


