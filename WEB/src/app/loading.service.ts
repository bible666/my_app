import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
 })
export class LoadingService {

  public _selector:string = 'loading';
  public _element:HTMLElement;

  constructor() {
    this._element = document.getElementById(this._selector);
    let myUser = JSON.parse(localStorage.getItem('userData'));
    console.log(myUser);
  }

  public show(){
    this._element.style['display'] = 'block';
  }

  public hide(delay:number = 0):void {
    setTimeout(() => {
      this._element.style['display'] = 'none';
    }, delay);
  }
}
