import { Component } from '@angular/core';

@Component({
   selector: 'app-root',
   templateUrl: './app.component.html',
   styleUrls: ['./app.component.css']
})
export class AppComponent {
   serverElements = [];
   newData = '';
   newValor = '';
   newTipo = '';
   error = false;

   onAddServer() {
      this.checkValue();
      if(!this.error)
      this.serverElements.push({
         type: 'server',
         name: this.newData,
         content: this.newValor
      });
   }

   checkValue() {
      if(this.newTipo != '1' && this.newTipo != '2'){
         this.newTipo = '';
         this.error = true;
      } else
         this.error = false;
   }
}
