import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class MessageService {

  private message: string[] = [];
  constructor() { }

  public setWarning(message:string){
    this.message.push(message);
    console.log(this.message);
  }

  public getMessage(){
    let retMessage: string[] = this.message;
    this.message  = [];
    return retMessage;
  }
}

