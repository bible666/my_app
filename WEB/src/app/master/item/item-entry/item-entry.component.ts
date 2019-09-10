import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material';

import { ItemService, cSearch, cInput } from '../item.service';
import { MyMessageComponent } from '../../../common/my-message/my-message.component'
import { TranslateService } from '@ngx-translate/core';

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
		'item_code' : new FormControl('', [ Validators.required ]),
		'item_name':new FormControl(''),
		'm_unit_id':new FormControl(''),
		'm_item_type_id':new FormControl(''),
		'lot_flag':new FormControl(''),
		'mrp_flag':new FormControl(''),
		'remark':new FormControl('')
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
		this.translate.get(['common.data_not_found'])
		.subscribe(texts => {
			this.texts = texts;
			this.id	= this.param.snapshot.params.id;
			console.log(this.id);
			if (this.id == -1){
				this.inputForm.patchValue({
					item_type_name: '',
					remark: ''
				});
			} else {
				this.Service.getById(this.id).subscribe(data =>{
					if (data['status'] == 'success'){
						//have id in database
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
		let unitI: cInput = new cInput(this.inputForm.value);
		unitI.id			= this.id;

		this.Service.updateById(unitI)
		.subscribe(data=>{
			if (data['status']== 'success'){

				this.snackBar.openFromComponent(MyMessageComponent,{
					data:data['message'],
					duration:5000,
					panelClass:['mat-snack-bar-container-message']
				});
				this.router.navigateByUrl(this.back_url);
			} else {
				this.snackBar.openFromComponent(MyMessageComponent,{
					data:data['message'],
					duration:2000,
					panelClass:['mat-snack-bar-container-warning']
				});
				
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
