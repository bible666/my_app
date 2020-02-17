import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-main-menu',
  templateUrl: './main-menu.component.html',
  styleUrls: ['./main-menu.component.css']
})
export class MainMenuComponent implements OnInit {

  public message: string;
  
  constructor(
    private router: Router
  ) { }

  ngOnInit() {
  }

  onTemplateClick(){
    this.router.navigateByUrl('/template/list');
  }

}
