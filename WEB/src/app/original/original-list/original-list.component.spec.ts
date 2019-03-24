import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OriginalListComponent } from './original-list.component';

describe('OriginalListComponent', () => {
  let component: OriginalListComponent;
  let fixture: ComponentFixture<OriginalListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OriginalListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OriginalListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
