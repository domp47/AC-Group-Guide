import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ArtCardComponent } from './art-card.component';

describe('ArtCardComponent', () => {
  let component: ArtCardComponent;
  let fixture: ComponentFixture<ArtCardComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ArtCardComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ArtCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
