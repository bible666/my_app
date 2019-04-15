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

	}

	ngOnInit(){
		//set menu
		this.user.getMenu().subscribe(result=>{
			if (result['status'] == 'success'){
				
				this.user.Menu_Data = result['data'];
			} else {
				this.user.Menu_Data = [{
					name: 'menu1',
					URL: '',
					image: '',
					children: []
				}]
			}
			this.user.currentMenuDataSource.subscribe(data =>{
				console.log(data);
				this.dataSource.data = this.user.Menu_Data;
    			this.treeControl.expandAll();
			})
			
		})
	}

	hasChild = (_: number, node: ExampleFlatNode) => node.expandable;

  logout(){
    this.user.logout();
    this.router.navigate(['/']);
  }
}
