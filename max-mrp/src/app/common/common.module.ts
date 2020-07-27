import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './header/header.component';
import { ShowMessageComponent } from './show-message/show-message.component';
import { ItemQtyComponent } from './item-qty/item-qty.component';


@NgModule({
  declarations: [
    HeaderComponent,
    ShowMessageComponent,
    ItemQtyComponent
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
