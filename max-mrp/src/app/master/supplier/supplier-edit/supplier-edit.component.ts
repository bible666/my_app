import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { cInput, SupplierService } from '../../../service/supplier.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-supplier-edit',
  templateUrl: './supplier-edit.component.html',
  styleUrls: ['./supplier-edit.component.css']
})
export class SupplierEditComponent implements OnInit {

  public message: MessageClass[] = [];
  submitted: boolean = false;

  //----------------------------------------------------------------
  // set local Valiable
  //----------------------------------------------------------------
  id      : number;
  
  inputForm = new FormGroup({
    'supplier_cd'         : new FormControl('', [ Validators.required, Validators.maxLength(20) ]),
    'supplier_name'       : new FormControl('', [ Validators.required, Validators.maxLength(200) ]),
    'supplier_add1'       : new FormControl('', [ Validators.maxLength(100) ]),
    'supplier_add2'       : new FormControl('', [ Validators.maxLength(100) ]),
    'supplier_add3'       : new FormControl('', [ Validators.maxLength(100) ]),
    'supplier_zip'        : new FormControl('', [ Validators.maxLength(20) ]),
    'supplier_tel'        : new FormControl('', [ Validators.maxLength(45) ]),
    'supplier_fax'        : new FormControl('', [ Validators.maxLength(45) ]),
    'supplier_email'      : new FormControl('', [ Validators.email,Validators.maxLength(45) ]),
    'contract_name'       : new FormControl('', [ Validators.maxLength(100) ]),
    'delivery_time'       : new FormControl(0),
    'm_transport_id'      : new FormControl(0),
    'm_transport_cd'      : new FormControl(''),
    'tax_no'              : new FormControl('', [ Validators.maxLength(20) ]),
    'payment_tearm'       : new FormControl('', [ Validators.maxLength(200) ]),
    'remark'              : new FormControl('', [ Validators.maxLength(200) ])
  });
  
  constructor(private param: ActivatedRoute,
    private Service: SupplierService,
    private ServiceMessage: MessageService,
    private router: Router) { }

  ngOnInit() {
    this.id	= this.param.snapshot.params.id;
  }

  onSubmit(){
    this.submitted = true;
    if (this.inputForm.invalid){
      return;
    }

    let input_data	: cInput = new cInput(this.inputForm.value);
    input_data.id	= this.id;
    this.Service.updateById(input_data)
    .subscribe(data=>{

      if (data['status']== 'success'){
        this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
        this.router.navigateByUrl('/supplier/list');
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
