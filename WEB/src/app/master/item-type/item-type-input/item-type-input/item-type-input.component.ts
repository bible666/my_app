import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import { Router } from '@angular/router';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material';

import { ItemTypeService, cSearch, cInput } from '../../item-type.service';
import { MyMessageComponent } from '../../../../common/my-message/my-message.component'

@Component({
  selector: 'app-item-type-input',
  templateUrl: './item-type-input.component.html',
  styleUrls: ['./item-type-input.component.css']
})
export class ItemTypeInputComponent implements OnInit {
	//----------------------------------------------------------------
	// set local store object
	//----------------------------------------------------------------
	localNameList:string	= 'itemTypeList';
	localNameInput:string	= 'itemTypeInput';

	//----------------------------------------------------------------
	// Set Form for input
	//----------------------------------------------------------------
	id:number;
	bReadonly:boolean = false;
	readonlyText:string = "(อ่านอย่างเดียว)";
	
	inputForm = new FormGroup({
		'item_type_name': new FormControl('', [ Validators.required ]),
		'remark':new FormControl('')
	});

	private configError: MatSnackBarConfig = {
		panelClass: ['style-error'],
		duration: 2000,
	};



	constructor(private router: Router, 
		private snackBar: MatSnackBar, 
		private Service: ItemTypeService) { }

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
		this.router.navigateByUrl('item_type_list');
	}

	onSave(){
		let unitI: cInput = new cInput();
		unitI.id			= this.id;
		unitI.itemTypeName	= this.inputForm.controls['item_type_name'].value;
		unitI.remark		= this.inputForm.controls['remark'].value;
		
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
