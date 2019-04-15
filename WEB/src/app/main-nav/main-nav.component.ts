import { Component } from '@angular/core';
import { BreakpointObserver, Breakpoints } from '@angular/cdk/layout';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { UserService } from '../service/user.service';
import { Router } from '@angular/router';
import {FlatTreeControl} from '@angular/cdk/tree';
import {MatTreeFlatDataSource, MatTreeFlattener} from '@angular/material/tree';

interface MenuNode {
	name: string;
	URL: string;
	image: string;
	children?: MenuNode[];
}

//create test data
//const Menu_Data : MenuNode[] = [
//	{
//	name: 'menu1',
//	children: [
//		{name:'sub 1 1'},
//		{name:'sub 1 2'}
//	]
//	},
//	{
//		name: 'menu2',
//		children: [
//
//		]
//	}
//];

/** Flat node with expandable and level information */
interface ExampleFlatNode {
	expandable: boolean;
	name: string;
	level: number;
}

@Component({
  selector: 'app-main-nav',
  templateUrl: './main-nav.component.html',
  styleUrls: ['./main-nav.component.css']
})
export class MainNavComponent {

	Menu_Data: MenuNode[];

	private transformer = (node: MenuNode, level: number) => {
		return {
		  expandable: !!node.children && node.children.length > 0,
		  name: node.name,
		  level: level,
		};
	}

	treeControl = new FlatTreeControl<ExampleFlatNode>(
		node => node.level, node => node.expandable);

	treeFlattener = new MatTreeFlattener(
		this.transformer, 
		node => node.level, 
		node => node.expandable, 
		node => node.children,
		
	);
	
	dataSource = new MatTreeFlatDataSource(this.treeControl, this.treeFlattener);


  isHandset$: Observable<boolean> = this.breakpointObserver.observe(Breakpoints.Handset)
    .pipe(
      map(result => result.matches)
    );

  	constructor(private breakpointObserver: BreakpointObserver,private user:UserService,
    	private router: Router) {
		
		//set menu
		user.getMenu().subscribe(result=>{
			console.log(result);
			if (result['status'] == 'success'){
				
				this.Menu_Data = result['data'];
			} else {
				this.Menu_Data = [{
					name: 'menu1',
					URL: '',
					image: '',
					children: []
				}]
				console.log(result['message']);
			}

			this.dataSource.data = this.Menu_Data;
    		this.treeControl.expandAll();
		})

		
	}

	hasChild = (_: number, node: ExampleFlatNode) => node.expandable;

  logout(){
    this.user.logout();
    this.router.navigate(['/']);
  }
}
