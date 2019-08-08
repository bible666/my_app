import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import { HomeService } from './home.service';
import { Router } from '@angular/router';

@Component({
	selector: 'app-home',
	templateUrl: './home.component.html',
	styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

	registerForm:FormGroup;

	myCode: string = '555';

	constructor(private service:HomeService,private router: Router) { }

	ngOnInit() {
		this.service.checkToken().subscribe(data =>{
			if (data['status'] == 'success'){
				//check token ok
			} else {
				this.router.navigateByUrl('login');
			}
		});

	}

	onCodeChange(newCode: string){
		this.myCode = newCode;
	}

}
