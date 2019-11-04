import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { FormControl, FormGroup, Validators, FormBuilder, FormArray } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material';

import { PoService, cSearch, cInput, po_detail } from '../po.service';
import { MyMessageComponent } from '../../../common/my-message/my-message.component'
import { TranslateService } from '@ngx-translate/core';
import { cRetValue } from '../../../common/my-dropdown/my-dropdown.component'

@Component({
  selector: 'app-po-input',
  templateUrl: './po-input.component.html',
  styleUrls: ['./po-input.component.css']
})
export class PoInputComponent implements OnInit {

	//----------------------------------------------------------------
	// set local Valiable
	//----------------------------------------------------------------
	id			: number;
	texts		: any;
	back_url	: string		= 'po_list';
	qty			: number		= 0;
	price		: number		= 0;
	total_price	: number 		= 0;

	//----------------------------------------------------------------
	// set local store object
	//----------------------------------------------------------------
	localNameInput	: string	= 'poInput';

	//----------------------------------------------------------------
	// Set Form for input
	//----------------------------------------------------------------
	bReadonly		: boolean = false;
	readonlyText	: string = "(อ่านอย่างเดียว)";

	test_input_data	: cInput;

	inputForm = new FormGroup({
		'supplier_cd'		: new FormControl('', [ Validators.required, Validators.maxLength(20) ]),
		'po_no'				: new FormControl(''),
		'po_date'			: new FormControl(''),
		'po_due_date'		: new FormControl(''),
		'supplier_name'		: new FormControl(''),
		'address_1'			: new FormControl('', [ Validators.maxLength(100) ]),
		'address_2'			: new FormControl('', [ Validators.maxLength(100) ]),
		'address_3'			: new FormControl('', [ Validators.maxLength(100) ]),
		'zip_code'			: new FormControl('', [ Validators.maxLength(20) ]),
		'phone'				: new FormControl('', [ Validators.maxLength(45) ]),
		'fax'				: new FormControl('', [ Validators.maxLength(45) ]),
		'contract_name'		: new FormControl('', [ Validators.maxLength(100) ]),
		'tax_no'			: new FormControl(''),
		'total_qty'			: new FormControl(0),
		'total_amount'		: new FormControl(0),
		'discount_value'	: new FormControl(0),
		'discount_type'		: new FormControl(0),
		'vat'				: new FormControl(0),
		'final_amount'		: new FormControl(0),
		'remark'			: new FormControl(''),
		'add_item_id'		: new FormControl(''),
		'add_item_cd'		: new FormControl('', [Validators.required]),
		'add_item_name'		: new FormControl('', [Validators.required]),
		'add_qty'			: new FormControl(''),
		'add_unit_cd'		: new FormControl(''),
		'add_unit_price'	: new FormControl(''),
		'po_details'		: new FormArray([])

	});

	constructor(private router: Router, 
		private snackBar: MatSnackBar, 
		private Service: PoService,
		private param: ActivatedRoute,
		private translate: TranslateService,
		private _formBuild: FormBuilder) {

		//constructor code
		this.translate.setDefaultLang('th');

		//Load Text
		this.translate.get(['common.data_not_found','common.save_complete','supplier.supplier_code_dupplicate'])
		.subscribe(texts => {
			this.texts = texts;
			this.id	= this.param.snapshot.params.id;

			if (this.id != -1){
				this.Service.getById(this.id).subscribe(data =>{
					if (data['status'] == 'success'){
						//have id in database
						this.inputForm.patchValue({
							supplier_cd		: data['data']['supplier_cd'],
							supplier_name	: data['data']['supplier_name'],
							supplier_add1	: data['data']['supplier_add1'],
							supplier_add2	: data['data']['supplier_add2'],
							supplier_add3	: data['data']['supplier_add3'],
							supplier_zip	: data['data']['supplier_zip'],
							supplier_tel	: data['data']['supplier_tel'],
							supplier_fax	: data['data']['supplier_fax'],
							supplier_email	: data['data']['supplier_email'] ,
							contract_name	: data['data']['contract_name'],
							delivery_time	: data['data']['delivery_time'],
							m_transport_id	: data['data']['m_transport_id'],
							m_transport_cd	: data['data']['m_transport_cd'],
							tax_no			: data['data']['tax_no'],
							payment_tearm	: data['data']['payment_tearm'],
							remark			: data['data']['remark']
						});
						//data['data']['unit_code']['disabled'] = true;
						if (data['data']['permission'] == 1){
							this.bReadonly		= true;
						}else {
							this.readonlyText	= '';
						}
					} else {
						//not have data
	
						this.snackBar.openFromComponent(MyMessageComponent,{
							data:[this.texts['common.data_not_found']],
							duration:5000,
							panelClass:['mat-snack-bar-container-message']
						});

						this.router.navigateByUrl(this.back_url);
					}
				});
			}
		});
	}

    ngOnInit() {

	}

	get po_details(){
		return this.inputForm.get('po_details') as FormArray;
	}

	onAddItem(){
		if (!this.inputForm.valid){
			return;
		}
		let new_detail = new FormGroup({
			'item_id'		: new FormControl(this.inputForm.get('add_item_id').value),
			'item_code'		: new FormControl(this.inputForm.get('add_item_cd').value),
			'item_name'		: new FormControl(this.inputForm.get('add_item_name').value),
			'qty'			: new FormControl(this.inputForm.get('add_qty').value),
			'unit_id'		: new FormControl(-1),
			'unit_code'		: new FormControl(''),
			'unit_price'	: new FormControl(''),
			'total'			: new FormControl('')
		});
		this.po_details.push(new_detail);

		this.test_input_data	= new cInput(this.inputForm.value);
	}

	onBackClick(){
		this.router.navigateByUrl(this.back_url);
	}

	onSubmit(){
		if (!this.inputForm.valid){
			return;
		}

		let input_data	: cInput = new cInput(this.inputForm.value);
		input_data.id	= this.id;

		this.Service.updateById(input_data)
		.subscribe(data=>{

			if (data['status']== 'success'){

				this.snackBar.openFromComponent(MyMessageComponent,{
					data:[this.texts['common.save_complete']],
					duration:5000,
					panelClass:['mat-snack-bar-container-message']
				});
				this.router.navigateByUrl(this.back_url);
			} else {
				if (data['message'] == 'token not found') {
					this.router.navigateByUrl('login');
				} else {
					this.snackBar.openFromComponent(MyMessageComponent,{
						data:[this.texts['supplier.'+data['message']]],
						duration:2000,
						panelClass:['mat-snack-bar-container-warning']
					});
				}
				
				
			}
			
		},
		error=>{
			this.snackBar.open(error, "close",  {
				duration: 2000,
				panelClass: ['mat-snack-bar-container-error']
			});
		});

	}

	// //event when unit code change
	// onUnitChange(newCode: cRetValue){
	// 	this.inputForm.patchValue({
	// 		unit_id		: newCode.id,
	// 		unit_code	: newCode.code
	// 	});
	// }

	//event when item type change
	onItemChange(newCode: cRetValue,seq_num: number){
		console.log(newCode);
		//this.inputForm.get('po_details').value[seq_num].item_name = newCode.name;
		// this.inputForm.patchValue({
		// 	item_type_id	: newCode.id,
		// 	item_type_code	: newCode.code
		// });
	}

	onAddItemChange(newCode: cRetValue){
		console.log(newCode);
		this.inputForm.patchValue({
			add_item_id		: newCode.id,
			add_item_cd		: newCode.code,
			add_item_name	: newCode.name
		});
	}

	onQtyChange(){
		this.qty			= this.inputForm.get('add_qty').value;
		this.total_price	= this.qty * this.price;
	}

	onPriceChange(newCode: cRetValue){
		
		this.price			= +newCode.input;
		this.total_price	= this.qty * this.price;
	}

}
