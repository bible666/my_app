import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material';

import { ItemService, cSearch, cInput } from '../item.service';
import { MyMessageComponent } from '../../../common/my-message/my-message.component'
import { TranslateService } from '@ngx-translate/core';
import { cRetValue } from '../../../common/my-dropdown/my-dropdown.component'

@Component({
	selector: 'app-item-entry',
	templateUrl: './item-entry.component.html',
	styleUrls: ['./item-entry.component.css']
})
export class ItemEntryComponent implements OnInit {
	//----------------------------------------------------------------
	// set local Valiable
	//----------------------------------------------------------------
	id:number;
	texts:any;
	back_url:string		= 'item_list';

	//----------------------------------------------------------------
	// set local store object
	//----------------------------------------------------------------
	localNameList:string	= 'itemList';
	localNameInput:string	= 'itemInput';

	//----------------------------------------------------------------
	// Set Form for input
	//----------------------------------------------------------------
	bReadonly:boolean = false;
	readonlyText:string = "(อ่านอย่างเดียว)";

	inputForm = new FormGroup({
		'item_code'			: new FormControl('', [ Validators.required ]),
		'item_name'			: new FormControl(''),
		'unit_id'			: new FormControl(-1),
		'unit_code'			: new FormControl(''),
		'unit_name'			: new FormControl(''),
		'item_type_id'		: new FormControl(-1),
		'item_type_code'	: new FormControl(''),
		'item_type_name'	: new FormControl(''),
		'lot_flag'			: new FormControl(false),
		'mrp_flag'			: new FormControl(false),
		'remark'			: new FormControl('')
	});

	constructor(private router: Router, 
		private snackBar: MatSnackBar, 
		private Service: ItemService,
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
							item_code		: data['data']['item_code'],
							item_name		: data['data']['item_name'],
							unit_id			: data['data']['unit_id'],
							unit_code		: data['data']['unit_code'],
							unit_name		: data['data']['unit_name'],
							item_type_id	: data['data']['item_type_id'],
							item_type_code	: data['data']['item_type_code'],
							item_type_name	: data['data']['item_type_name'],
							lot_flag		: data['data']['lot_flag'] == 1 ? true : false,
							mrp_flag		: data['data']['mrp_flag'] == 1 ? true : false,
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

	//event when unit code change
	onUnitChange(newCode: cRetValue){
		this.inputForm.patchValue({
			unit_id		: newCode.id,
			unit_code	: newCode.code,
			unit_name	: newCode.name
		});
	}

	//event when item type change
	onItemTypeChange(newCode: cRetValue){
		this.inputForm.patchValue({
			item_type_id	: newCode.id,
			item_type_code	: newCode.code,
			item_type_name	: newCode.name
		});
	}

}
