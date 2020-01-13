import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { LogoutComponent } from './logout/logout.component';
import { MainMenuComponent } from './common/main-menu/main-menu.component';
import { TemplateListComponent } from './template/template-list/template-list.component'


const routes: Routes = [
  { path: 'login',        component:LoginComponent},
  { path: 'logout',       component:LogoutComponent},
  { path: 'main-menu',    component:MainMenuComponent},
  { path: 'template/list',    component:TemplateListComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
