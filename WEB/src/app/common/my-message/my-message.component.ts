import { Component, OnInit, Inject } from '@angular/core';
import {MAT_SNACK_BAR_DATA, MatSnackBarRef} from '@angular/material';

@Component({
  selector: 'app-my-message',
  templateUrl: './my-message.component.html',
  styleUrls: ['./my-message.component.css']
})
export class MyMessageComponent implements OnInit {

	constructor(public snackBarRef: MatSnackBarRef<MyMessageComponent>,@Inject(MAT_SNACK_BAR_DATA) public data: any) { }

  ngOnInit() {
  }

	onClose(){

	}

}
