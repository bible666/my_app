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
	let menu_datas = JSON.parse(sessionStorage.getItem('menu_data'));

	this.menu_datas = this.getMenuData('-1',menu_datas);
	console.log(this.menu_datas);
  }

  private getMenuData(menuId:string,menu_datas) {
	let ret_menu: Array<any> = [];
    menu_datas.forEach(data => {
      if (data.parent_menu_id == menuId){
		let child_menu;
		child_menu = this.getMenuData(data.menu_id,menu_datas);
		data.child_menu = child_menu;
		ret_menu.push(data);
	  }
    });
	return ret_menu;
  }

  onLogout() {
    this.user.logout();
    this.router.navigate(['/login']);
  }

  onMainMenuClick(menu_id){
    //this.user.menu_datas = this.user.get_menu_data(menu_id);
    //this.menu_datas = this.user.menu_datas;
    //this.menu_datas = this.user.get_menu_data(menu_id);
    this.router.navigate(['/main-menu/'+menu_id]);
  }

}
