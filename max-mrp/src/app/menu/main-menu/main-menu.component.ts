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
    private user: UserService
  ) { 
    console.log('con');
  }

  ngOnInit() {
    window.scroll(0,0);

    if (this.param.snapshot.params.menu_id) {
      this.menu_id    = this.param.snapshot.params.menu_id;
    }

    this.menu_datas = this.user.get_menu_data(this.menu_id);
    

  }

  onMenuChange(menu_id){
    this.menu_datas = this.user.get_menu_data(menu_id);
    console.log(this.menu_datas);
  }

  onTemplateClick(){
    this.router.navigateByUrl('/template/list');
  }

}
