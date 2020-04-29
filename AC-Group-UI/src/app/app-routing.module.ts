import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './Components/home/home.component';
import { redirectUnauthorizedTo, redirectLoggedInTo, canActivate } from '@angular/fire/auth-guard';
import { LoginComponent } from './Components/login/login.component';
import { AdminComponent } from './Components/admin/admin.component';
import { GroupsComponent } from './Components/groups/groups.component';
import { TrackingComponent } from './Components/tracking/tracking.component';

const redirectUnauthorizedToLogin = () => redirectUnauthorizedTo(['login']);
const goHome = () => redirectLoggedInTo(['home']);

const routes: Routes = [
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path: 'login',
    component: LoginComponent, ...canActivate(goHome)
  },
  {
    path: 'home',
    component: HomeComponent, ...canActivate(redirectUnauthorizedToLogin)
  },
  {
    path: 'admin',
    component: AdminComponent, ...canActivate(redirectUnauthorizedToLogin)
  },
  {
    path: 'groups',
    component: GroupsComponent, ...canActivate(redirectUnauthorizedToLogin)
  },
  {
    path: 'tracking',
    component: TrackingComponent, ...canActivate(redirectUnauthorizedToLogin)
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
