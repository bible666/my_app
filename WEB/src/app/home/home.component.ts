import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import { UserService } from '../service/user.service';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  registerForm:FormGroup;

  constructor(private user:UserService) { }

  ngOnInit() {
    this.registerForm = new FormGroup({
      'email': new FormControl(null),
      'name1234': new FormControl('Mail')
    });

    this.user.getUser().subscribe(data=> {
      console.log(data);
    });
    
  }

}
