import { Component, OnInit } from '@angular/core';
import { UserService } from '../../service/user.service';
import { Router, RouterModule } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  public menu_datas;

  constructor(
    private user: UserService,
    private router: Router
  ) { }

  ngOnInit() {
    this.menu_datas = this.user.get_menu_data(-1);
  }

  onLogout() {
    this.user.logout();
    this.router.navigate(['/login']);
  }

  onMainMenuClick(menu_id){
    this.user.menu_datas = this.user.get_menu_data(menu_id);
    //this.menu_datas = this.user.menu_datas;
    //this.menu_datas = this.user.get_menu_data(menu_id);
    this.router.navigate(['/main-menu/-1']);
  }

}
