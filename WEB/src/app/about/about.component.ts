import { Component, OnInit } from '@angular/core';
import { LoadingService } from '../loading.service';

@Component({
  selector: 'app-about',
  templateUrl: './about.component.html',
  styleUrls: ['./about.component.css']
})
export class AboutComponent implements OnInit {

  constructor(public _loading:LoadingService) { }

  ngOnInit() {
    this._loading.show();
  }

  onShow(){
    this._loading.hide();
  }
}
