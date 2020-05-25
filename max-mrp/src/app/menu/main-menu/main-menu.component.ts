import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { UserService } from '../../service/user.service';

@Component({
  selector: 'app-main-menu',
  templateUrl: './main-menu.component.html',
  styleUrls: ['./main-menu.component.css']
})
export class MainMenuComponent implements OnInit {

  public message: string;

  public menu_id: number = -1;
  public menu_datas;
  
  constructor(
    private router: Router,
    private param: ActivatedRoute,
    public user: UserService
  ) { 
    //Constructor code
  }

  ngOnInit() {
    window.scroll(0,0);

    if (this.param.snapshot.params.menu_id) {
      this.menu_id    = this.param.snapshot.params.menu_id;
    }

    this.user.menu_datas = this.user.get_menu_data(this.menu_id);
    //this.menu_datas = this.user.menu_datas;

  }

  onMenuChange(menu_id){
    this.user.menu_datas = this.user.get_menu_data(menu_id);
    //this.menu_datas = this.user.menu_datas;
  }

  onTemplateClick(){
    this.router.navigateByUrl('/template/list');
  }

}
