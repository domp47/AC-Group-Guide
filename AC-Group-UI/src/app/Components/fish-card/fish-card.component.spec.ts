import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FishCardComponent } from './fish-card.component';

describe('FishCardComponent', () => {
  let component: FishCardComponent;
  let fixture: ComponentFixture<FishCardComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FishCardComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FishCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
