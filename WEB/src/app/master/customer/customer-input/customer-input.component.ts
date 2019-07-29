import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import { Router } from '@angular/router';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material';

import { CustomerService, cSearch, cInput } from '../customer.service';
import { MyMessageComponent } from '../../../common/my-message/my-message.component'

@Component({
  selector: 'app-customer-input',
  templateUrl: './customer-input.component.html',
  styleUrls: ['./customer-input.component.css']
})
export class CustomerInputComponent implements OnInit {
//----------------------------------------------------------------
	// set local store object
	//----------------------------------------------------------------
	localNameList:string	= 'customer_list';
	localNameInput:string	= 'customer_input';

	//----------------------------------------------------------------
	// Set Form for input
	//----------------------------------------------------------------
	id:number;
	bReadonly:boolean = false;
	readonlyText:string = "(อ่านอย่างเดียว)";
	
	inputForm = new FormGroup({
		'customer_cd'		: new FormControl('', [ Validators.required ]),
		'customer_name'		: new FormControl('', [ Validators.required ]),
		'customer_add1'		: new FormControl(''),
		'customer_add2'		: new FormControl(''),
		'customer_add3'		: new FormControl(''),
		'customer_zip'		: new FormControl(''),
		'customer_tel'		: new FormControl(''),
		'customer_fa'		: new FormControl(''),
		'customer_email'	: new FormControl(''),
		'contract_name'		: new FormControl(''),
		'delivery_time'		: new FormControl(''),
		'm_transport_id'	: new FormControl(''),
		'tax_no'			: new FormControl(''),
		'payment_tearm'		: new FormControl(''),
		'remark'			: new FormControl(''),
	});

	private configError: MatSnackBarConfig = {
		panelClass: ['style-error'],
		duration: 2000,
	};

	constructor(private router: Router, 
		private snackBar: MatSnackBar, 
		private Service: CustomerService) { }

	ngOnInit() {
		this.id	= +localStorage.getItem(this.localNameInput+ '.id');

		if (this.id == -1){
			this.inputForm.patchValue({
				item_type_name: '',
				remark: ''
			});
		} else {
			this.Service.getById().subscribe(data =>{
				if (data['status'] == 'success'){

					this.inputForm.patchValue({
						item_type_name: data['data']['item_type_name'],
						remark: data['data']['remark']
					});
					//data['data']['unit_code']['disabled'] = true;
					if (data['data']['permission'] == 1){
						this.bReadonly		= true;
					}else {
						this.readonlyText	= '';
					}
				} else {
					
				}
			});
		}
	}

	onBackClick(){
		this.router.navigateByUrl('customer_list');
	}

	onSave(){
		let unitI: cInput = new cInput();
		unitI.id				= this.id;
		unitI.customer_cd		= this.inputForm.controls['customer_cd'].value;
		unitI.customer_name		= this.inputForm.controls['customer_name'].value;
		unitI.customer_add1		= this.inputForm.controls['customer_add1'].value;
		unitI.customer_add2		= this.inputForm.controls['customer_add2'].value;
		unitI.customer_add3		= this.inputForm.controls['customer_add3'].value;
		unitI.customer_zip		= this.inputForm.controls['customer_zip'].value;
		unitI.customer_tel		= this.inputForm.controls['customer_tel'].value;
		unitI.customer_fa		= this.inputForm.controls['customer_fa'].value;
		unitI.customer_email	= this.inputForm.controls['customer_email'].value;
		unitI.contract_name		= this.inputForm.controls['contract_name'].value;
		unitI.delivery_time		+= this.inputForm.controls['delivery_time'].value;
		unitI.m_transport_id	+= this.inputForm.controls['m_transport_id'].value;
		unitI.tax_no			= this.inputForm.controls['tax_no'].value;
		unitI.payment_tearm		+= this.inputForm.controls['payment_tearm'].value;
		unitI.remark			= this.inputForm.controls['remark'].value;
		
		this.Service.updateById(unitI)
		.subscribe(data=>{
			if (data['status']== 'success'){

				this.snackBar.openFromComponent(MyMessageComponent,{
					data:data['message'],
					duration:5000,
					panelClass:['mat-snack-bar-container-message']
				})
			} else {
				this.snackBar.openFromComponent(MyMessageComponent,{
					data:data['message'],
					duration:2000,
					panelClass:['mat-snack-bar-container-warning']
				})
				
			}
			
		},
		error=>{
			console.log(error);
			this.snackBar.open(error, "close",  {
				duration: 2000,
				panelClass: ['mat-snack-bar-container-error']
			});
		});

	}

}
