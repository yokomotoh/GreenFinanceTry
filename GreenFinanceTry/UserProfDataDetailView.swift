//
//  UserProfDataDetailView.swift
//  GreenFinanceTry
//
//  Created by yoko on 17/03/2021.
//

import SwiftUI

struct UserProfDataDetailView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var editMode = false
    @State private var editAccountName = ""
    @State private var editEmail = ""
    @State private var editPassword = ""
    
    @ObservedObject var element: UserProfData
    //var element: UserProfData
    
    init(elem: UserProfData) {
        self.element = elem
        self._editAccountName = State(initialValue: elem.accountName )
        self._editEmail = State(initialValue: elem.email )
        self._editPassword = State(initialValue: elem.password)
    }
    
    var body: some View {
        NavigationView {
        VStack {
            if editMode {

                TextField(element.accountName, text: $editAccountName)
                    .padding(.bottom)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            
                TextField(element.email, text: $editEmail)
                    .padding(.bottom)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField(element.password, text: $editPassword)
                    .padding(.bottom)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                Text(element.accountName)
                Text(element.email)
                Text(element.password)
            }
            Spacer()
            HStack {
                if editMode {
                    Button(action: {
                        let elem = self.element
                        self.element.accountName = self.editAccountName
                        self.element.email = self.editEmail
                        self.element.password = self.editPassword
                        self.editMode.toggle()
                    }, label: {
                        Text("Validate")
                    })
                } else {
                    Button(action: {
                        self.editMode.toggle()
                    }, label: {
                        Text("Modify")
                    })
                }
            }

        }
        .navigationTitle("Profile of \(element.accountName)")
        }
        
    }
}

struct UserProfDataDetailView_Previews: PreviewProvider {
    static var previews: some View {

        let persistenceController = PersistenceController.shared
        let context = persistenceController.container.viewContext
        let usr = UserProfData(context: context)
        usr.id = UUID()
        usr.accountName = ""
        usr.email = ""
        usr.password = ""
            
        return
            UserProfDataDetailView(elem: usr).environment(\.managedObjectContext, context)
    }
}
