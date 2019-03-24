import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.css']
})
export class ContactComponent implements OnInit {

  breakpoint: number;

  constructor() { }

  ngOnInit() {
    if (window.innerWidth <= 400){
      this.breakpoint = 1;
    }else if (window.innerWidth <= 1200){
      this.breakpoint = 3;
    }else {
      this.breakpoint = 6;
    }
    //this.breakpoint = (window.innerWidth <= 400) ? 1 : 6;
  }

  onResize(event) {
    //this.breakpoint = (event.target.innerWidth <= 400) ? 1 : 6;
    if (event.target.innerWidth <= 400){
      this.breakpoint = 1;
    }else if (event.target.innerWidth <= 1200){
      this.breakpoint = 3;
    }else {
      this.breakpoint = 6;
    }
  }

}
