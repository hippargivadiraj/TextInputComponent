//
//  ContentView.swift
//  TextInputComponent
//
//  Created by Vadiraj Hippargi on 6/7/21.
//

import SwiftUI

struct ContentView: View {
    @State var firstName = ""
    var body: some View {
        Form{
            Section(header: Text("Input Text")) {
                TextInputField( "First Name", text: $firstName)
            }
            
            
        }
         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextInputField: View {
    
    
    @Binding var text:String
    var title:String
    
    init( _ title:String, text:Binding<String>){
        self.title = title
        self._text = text
    }
    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor( text.isEmpty ? Color(.placeholderText) : .blue.opacity(0.8))
                .scaleEffect( text.isEmpty ?  1 : 0.6, anchor: .leading)
                .offset(y: text.isEmpty ? 0 : -22)
            TextField("", text: $text)
                .font(.headline)
                .disableAutocorrection(true)
        }.animation(.default)
        .padding(.top, 15)
    }
}
