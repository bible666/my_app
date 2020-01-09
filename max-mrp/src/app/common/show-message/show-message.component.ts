import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'show-message',
  templateUrl: './show-message.component.html',
  styleUrls: ['./show-message.component.css']
})
export class ShowMessageComponent implements OnInit {

  @Input() message: string[]  = [];

  constructor() { }

  ngOnInit() {
    console.log(this.message);
  }

}
