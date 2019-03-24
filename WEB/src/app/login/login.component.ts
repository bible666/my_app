import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from '../service/user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginForm:FormGroup;

  constructor(private userService:UserService,
    private router: Router,) { 
    this.userService.clear_cache();
  }

  ngOnInit() {
    this.loginForm = new FormGroup({
      'login_name': new FormControl(null),
      'login_pwd': new FormControl(null)
    });

  }

  onLogin(){
    this.userService.login(this.loginForm.value).subscribe(
      data => { 
        if (data['status'] == 'success'){
          this.userService.set_token(data['data']['token']);
          this.userService.set_company_id(data['data']['company_id']);
          this.router.navigate(['/']);
        }else{
          this.userService.clear_cache();
        }
      });
    //console.log(this.loginForm.value.login_name);
  }

}
