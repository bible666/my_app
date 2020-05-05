import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators, FormBuilder, FormArray } from '@angular/forms';
import { MessageService, MessageClass } from '../service/message.service';
import { UserService } from '../service/user.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  public message: MessageClass[] = [];

  inputForm = new FormGroup({
    'login_name'     : new FormControl(''),
    'login_pwd'   : new FormControl('')
  });

  constructor(
    private service: MessageService,
    private user: UserService,
    private router: Router
  ) {
    this.user.clear_cache();
  }

  ngOnInit() {
    this.message = this.service.getMessage();
  }

  onLogin(){

    this.user.login(this.inputForm.value).subscribe(
      data => {
        if (data['status'] == 'success'){
          this.user.set_token(data['data']['token']);
          this.user.set_company_id(data['data']['company_id']);

          // this.user.getMenu().subscribe(result=>{
          //   if (result['status'] == 'success'){
              
          //     this.user.Menu_Data = result['data'];
          //     this.user.changeMenu(this.user.Menu_Data);
          //   } else {
          //     this.user.Menu_Data = [{
          //       name: 'menu1',
          //       URL: '',
          //       image: '',
          //       children: []
          //     }]
          //     console.log(result['message']);
          //   }
             this.router.navigateByUrl('/');
          
          // })
          
        }else{
          //login error
          this.service.setError(data['message']);
          this.user.clear_cache();
          this.message = this.service.getMessage();
        }
      },(err)=>{
        console.log(err);
      });
  }

}
