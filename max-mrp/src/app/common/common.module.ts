import { NgModule } from '@angular/core';
import { HeaderComponent } from './header/header.component';
import { ShowMessageComponent } from './show-message/show-message.component';


@NgModule({
  declarations: [
    HeaderComponent,
    ShowMessageComponent
  ],
  exports: [
    HeaderComponent,
    ShowMessageComponent
  ],
  providers: [
  
  ],

})
export class SharedCommonModule { }
