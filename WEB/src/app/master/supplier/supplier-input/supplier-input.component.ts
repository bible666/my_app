import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material';

import { SupplierService, cSearch, cInput } from '../supplier.service';
import { MyMessageComponent } from '../../../common/my-message/my-message.component'
import { TranslateService } from '@ngx-translate/core';
import { cRetValue } from '../../../common/my-dropdown/my-dropdown.component'

@Component({
	selector: 'app-supplier-input',
	templateUrl: './supplier-input.component.html',
	styleUrls: ['./supplier-input.component.css']
  })
export class SupplierInputComponent implements OnInit {
	//----------------------------------------------------------------
	// set local Valiable
	//----------------------------------------------------------------
	id			: number;
	texts		: any;
	back_url	: string		= 'item_list';

	//----------------------------------------------------------------
	// set local store object
	//----------------------------------------------------------------
	localNameInput	: string	= 'itemInput';

	//----------------------------------------------------------------
	// Set Form for input
	//----------------------------------------------------------------
	bReadonly		: boolean = false;
	readonlyText	: string = "(อ่านอย่างเดียว)";

	inputForm = new FormGroup({
		'supplier_cd'		: new FormControl('', [ Validators.required, Validators.maxLength[20] ]),
		'supplier_name'		: new FormControl('', [ Validators.required, Validators.maxLength[200] ]),
		'supplier_add1'		: new FormControl('', [ Validators.maxLength[100] ]),
		'supplier_add2'		: new FormControl('', [ Validators.maxLength[100] ]),
		'supplier_add3'		: new FormControl('', [ Validators.maxLength[100] ]),
		'supplier_zip'		: new FormControl('', [ Validators.maxLength[20] ]),
		'supplier_tel'		: new FormControl('', [ Validators.maxLength[45] ]),
		'supplier_fax'		: new FormControl('', [ Validators.maxLength[45] ]),
		'supplier_email'	: new FormControl('', [ Validators.email,Validators.maxLength[45] ]),
		'contract_name'		: new FormControl('', [ Validators.maxLength[100] ]),
		'delivery_time'		: new FormControl(0),
		'm_transport_id'	: new FormControl(0),
		'm_transport_cd'	: new FormControl(''),
		'tax_no'			: new FormControl('', [ Validators.maxLength[20] ]),
		'payment_tearm'		: new FormControl('', [ Validators.maxLength[200] ]),
		'remark'			: new FormControl('', [ Validators.maxLength[200] ])
	});

	constructor(private router: Router, 
		private snackBar: MatSnackBar, 
		private Service: SupplierService,
		private param: ActivatedRoute,
		private translate: TranslateService) {
			//constructor code
			this.translate.setDefaultLang('th');
	}

    ngOnInit() {
		//Load Text
		this.translate.get(['common.data_not_found','common.save_complete'])
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
						data:data['message'],
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

	// //event when item type change
	// onItemTypeChange(newCode: cRetValue){
	// 	this.inputForm.patchValue({
	// 		item_type_id	: newCode.id,
	// 		item_type_code	: newCode.code
	// 	});
	// }

}
