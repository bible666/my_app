import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SharedCommonModule } from '../common/common.module'

import { SystemRoutingModule } from './system-routing.module';
import { UnitListComponent } from './unit-list/unit-list.component';
import { UnitEditComponent } from './unit-edit/unit-edit.component';


@NgModule({
  declarations: [UnitListComponent, UnitEditComponent],
  imports: [
    CommonModule,
    SystemRoutingModule,
    SharedCommonModule
  ]
})
export class SystemModule { }
