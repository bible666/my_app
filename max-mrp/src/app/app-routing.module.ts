import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from './service/auth.guard';

import { LoginComponent } from './login/login.component';
import { LogoutComponent } from './logout/logout.component';
import { TemplateListComponent } from './template/template-list/template-list.component';
import { TemplateEditComponent } from './template/template-edit/template-edit.component';
import { MainMenuComponent } from './menu/main-menu/main-menu.component';


const routes: Routes = [
  { path: '' ,					component: MainMenuComponent ,canActivate:[AuthGuard]},
  { path: 'login',        component:LoginComponent},
  { path: 'logout',       component:LogoutComponent},
  { path: 'main-menu',    component:MainMenuComponent,canActivate:[AuthGuard]},
  { path: 'template/list',    component:TemplateListComponent,canActivate:[AuthGuard]},
  { path: 'template/edit/:id',    component:TemplateEditComponent,canActivate:[AuthGuard]}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
