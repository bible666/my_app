import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from '../service/user.service';
import {TranslateService} from '@ngx-translate/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginForm:FormGroup;

  constructor(private userService:UserService,
	private router: Router,
	private translate: TranslateService) {
	
	this.userService.clear_cache();
	translate.setDefaultLang('th');
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
          
          this.userService.getMenu().subscribe(result=>{
            if (result['status'] == 'success'){
              
              this.userService.Menu_Data = result['data'];
              this.userService.changeMenu(this.userService.Menu_Data);
            } else {
              this.userService.Menu_Data = [{
                name: 'menu1',
                URL: '',
                image: '',
                children: []
              }]
              console.log(result['message']);
            }
            this.router.navigateByUrl('/');
          })
          
        }else{
          this.userService.clear_cache();
        }
      });
  }

}
