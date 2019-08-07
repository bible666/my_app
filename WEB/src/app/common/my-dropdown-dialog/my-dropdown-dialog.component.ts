import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { MyDropdownComponent } from '../my-dropdown/my-dropdown.component';

export interface DialogData {
	code: string;
	name: string;
}

@Component({
  selector: 'app-my-dropdown-dialog',
  templateUrl: './my-dropdown-dialog.component.html',
  styleUrls: ['./my-dropdown-dialog.component.css']
})
export class MyDropdownDialogComponent implements OnInit {

  constructor(
	public dialogRef: MatDialogRef<MyDropdownComponent>,
	@Inject(MAT_DIALOG_DATA) public data: DialogData) {}

	ngOnInit() {
	}

  	onNoClick(): void {
		this.dialogRef.close();
  	}

}
