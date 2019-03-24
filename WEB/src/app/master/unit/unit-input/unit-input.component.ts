import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import { Router } from '@angular/router';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material';

import { UnitService, cUnitSearch, cUnitInput } from '../unit.service';

@Component({
  selector: 'app-unit-input',
  templateUrl: './unit-input.component.html',
  styleUrls: ['./unit-input.component.css']
})
export class UnitInputComponent implements OnInit {

	//----------------------------------------------------------------
	// Set Form for input
	//----------------------------------------------------------------
	inputForm:FormGroup;
	unitCode:string;
	unitName:string;
	remark:string;
	id:number;


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
			this.unitCode	= '';
			this.unitName	= '';
			this.remark 	= 'hiii';
		}
		this.inputForm = new FormGroup({
			'unit_code': new FormControl(this.unitCode,	 [ Validators.required ]),
			'unit_name': new FormControl(this.unitName),
			'remark':new FormControl(this.remark)
		});
		
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
			//this.dataSource = new MatTableDataSource(data);
			console.log(data);
			alert('ok');
		},
		error=>{
			console.log(error);
			this.snackBar.open("hiiiii", "close",  {
				duration: 2000000,
				panelClass: ['mat-snack-bar-container']
			});
		});

		
	}

}
