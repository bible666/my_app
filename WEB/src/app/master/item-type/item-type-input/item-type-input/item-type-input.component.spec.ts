import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ItemTypeInputComponent } from './item-type-input.component';

describe('ItemTypeInputComponent', () => {
  let component: ItemTypeInputComponent;
  let fixture: ComponentFixture<ItemTypeInputComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ItemTypeInputComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ItemTypeInputComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
