import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import { Router } from '@angular/router';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material';

import { UnitService, cUnitSearch, cUnitInput } from '../unit.service';
import { MyMessageComponent } from '../../../common/my-message/my-message.component'

@Component({
  selector: 'app-unit-input',
  templateUrl: './unit-input.component.html',
  styleUrls: ['./unit-input.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class UnitInputComponent implements OnInit {

	//----------------------------------------------------------------
	// Set Form for input
	//----------------------------------------------------------------
	id:number;
	bReadonly:boolean = false;
	readonlyText:string = "(อ่านอย่างเดียว)";
	
	inputForm = new FormGroup({
		'unit_code': new FormControl('', [ Validators.required ]),
		'unit_name': new FormControl(''),
		'remark':new FormControl('')
	});

	private configError: MatSnackBarConfig = {
		panelClass: ['style-error'],
		duration: 2000,
	  };



	constructor(private router: Router, 
		private snackBar: MatSnackBar, 
		private unitS: UnitService) { }

	ngOnInit() {
		this.id	= +localStorage.getItem('unit_input.id');
		
		if (this.id == -1){
			this.inputForm.patchValue({
				unit_code: '',
				unit_name: '',
				remark: ''
			});
		} else {
			this.unitS.getById().subscribe(data =>{
				if (data['status'] == 'success'){

					this.inputForm.patchValue({
						unit_code: data['data']['unit_code'],
						unit_name: data['data']['unit_name'],
						remark: data['data']['remark']
					});
					//data['data']['unit_code']['disabled'] = true;
					if (data['data']['permission'] == 1){
						this.bReadonly		= true;
					}else {
						this.readonlyText	= '';
					}
					
					//this.permission	= data['data']['permission'];
				}
			});
		}
		
		
	}

	onBackClick(){
		this.router.navigateByUrl('unit_list');
	}

	onSave(){
		let unitI: cUnitInput = new cUnitInput();
		unitI.id		= this.id;
		unitI.unitCode	= this.inputForm.controls['unit_code'].value;
		unitI.unitName	= this.inputForm.controls['unit_name'].value;
		unitI.remark	= this.inputForm.controls['remark'].value;
		
		this.unitS.updateById(unitI)
		.subscribe(data=>{
			if (data['status']== 'success'){
				//this.snackBar.open("บันทึกสำเร็จ", "",  {
				//	duration: 2000,
				//	panelClass: ['mat-snack-bar-container-message']
				//});
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
