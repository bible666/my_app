import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './header/header.component';
import { ShowMessageComponent } from './show-message/show-message.component';


@NgModule({
  declarations: [
    HeaderComponent,
    ShowMessageComponent
  ],
  imports: [
    CommonModule
  ],
  exports: [
    HeaderComponent,
    ShowMessageComponent
  ],
  providers: [
  
  ],

})
export class SharedCommonModule { }
