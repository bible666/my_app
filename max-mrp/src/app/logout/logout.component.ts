import { Component, OnInit } from '@angular/core';
import { MessageService } from '../service/message.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-logout',
  templateUrl: './logout.component.html',
  styleUrls: ['./logout.component.css']
})
export class LogoutComponent implements OnInit {

  constructor(
    private message: MessageService,
    private router: Router
  ) { }

  ngOnInit() {
    this.message.setWarning('error his');
    this.router.navigateByUrl('/login');
  }

}