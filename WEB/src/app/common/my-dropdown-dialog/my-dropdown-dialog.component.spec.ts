import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MyDropdownDialogComponent } from './my-dropdown-dialog.component';

describe('MyDropdownDialogComponent', () => {
  let component: MyDropdownDialogComponent;
  let fixture: ComponentFixture<MyDropdownDialogComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MyDropdownDialogComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MyDropdownDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
