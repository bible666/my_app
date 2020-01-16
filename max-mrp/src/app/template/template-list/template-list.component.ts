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
    'txt1'     : new FormControl(''),
    'txt2'   : new FormControl(''),
    'txt3'   : new FormControl(''),
    'txt4'   : new FormControl('')
  });

  constructor() {
    //set inital value when open form
    this.onInitValue();
  }

  ngOnInit() {
  }

  onInitValue(){
    this.inputForm.patchValue({
      'txt4'    : 'test4'
    });
  }

  onSearch(){
    this.AllData += 1;
    this.CurrentPage += 1;
  }

  onClear(){
    this.onInitValue();
  }

  onSelectPage(PageNumber:number){
    this.CurrentPage = PageNumber;
  }

}
