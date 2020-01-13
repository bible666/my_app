import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators, FormBuilder, FormArray } from '@angular/forms';
import { MessageService } from '../../service/message.service';
import { UserService } from '../../service/user.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-template-list',
  templateUrl: './template-list.component.html',
  styleUrls: ['./template-list.component.css']
})
export class TemplateListComponent implements OnInit {

  public message: string[];

  private AllData       : number = 20;
  private CurrentPage   : number = 3;
  private AllPage       : number = 13;

  inputForm = new FormGroup({
    'user_id'     : new FormControl(''),
    'user_pass'   : new FormControl('')
  });

  constructor() { }

  ngOnInit() {
  }

  onSearch(){
    this.AllData += 1;
    this.CurrentPage += 1;
  }

  onSelectPage(PageNumber:number){
    this.CurrentPage = PageNumber;
  }

}
