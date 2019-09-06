import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { MatSnackBar } from '@angular/material';

import { UnitService, cUnitInput } from '../unit.service';
import { MyMessageComponent } from '../../../common/my-message/my-message.component'
import { TranslateService } from '@ngx-translate/core';

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
	bReadonly:boolean	= false;
	readonlyText:string	= "(อ่านอย่างเดียว)";
	texts:any;
	back_url:string		= 'unit_list';

	//set form Controller
	inputForm = new FormGroup({
		'unit_code': new FormControl('', [ Validators.required ]),
		'unit_name': new FormControl(''),
		'remark':new FormControl('')
	});

	constructor(private router: Router, 
		private snackBar: MatSnackBar, 
		private unitS: UnitService,
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

			//get id
			this.id	= this.param.snapshot.params.id;

			if (this.id == -1){
				this.readonlyText	= '';
				this.inputForm.patchValue({
					unit_code: '',
					unit_name: '',
					remark: ''
				});
			} else {
				this.unitS.getById(this.id).subscribe(data =>{
					if (data['status'] == 'success'){
						//have id in database
						this.inputForm.patchValue({
							unit_code: data['data']['unit_code'],
							unit_name: data['data']['unit_name'],
							remark: data['data']['remark']
						});

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

	onSave(){
		let unitI: cUnitInput = new cUnitInput(this.inputForm.value);
		unitI.id		= this.id;
		
		this.unitS.updateById(unitI)
		.subscribe(data=>{
			if (data['status']== 'success'){
				this.snackBar.openFromComponent(MyMessageComponent,{
					data:data['message'],
					duration:5000,
					panelClass:['mat-snack-bar-container-message']
				})
				this.router.navigateByUrl(this.back_url);
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
