import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material';

export interface DialogData {
	description: string;
}

@Component({
  selector: 'app-show-dialog',
  templateUrl: './show-dialog.component.html',
  styleUrls: ['./show-dialog.component.css']
})
export class ShowDialogComponent implements OnInit {

	constructor(
		public dialogRef: MatDialogRef<ShowDialogComponent>,
		@Inject(MAT_DIALOG_DATA) public data: DialogData) {

		 }

  ngOnInit() {
  }

  onNoClick(): void {
    this.dialogRef.close();
  }
}
