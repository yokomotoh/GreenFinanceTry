//
//  UserProfDataSheet.swift
//  GreenFinanceTry
//
//  Created by vincent schmitt on 16/03/2021.
//

import SwiftUI

struct UserProfDataSheet: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var myFirstName = ""
    @State var myLastName = ""
    @State var myEmail = ""
    @State var myAddress = ""
    @State var myAge = ""
    @State var myProfilePhoto = ""
    
    @Binding var isShown: Bool
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack {
        Form {
            Section(header: Text("First Name")) {
                TextField("", text: $myFirstName)
            }
            Section(header: Text("Age")) {
                TextField("", text: $myAge)
            }
            /*
            Section(header: Text("Last Name")) {
                TextField("", text: $myLastName)
            }
            Section(header: Text("Email")) {
                TextField("", text: $myEmail)
            }
            Section(header: Text("Address")) {
                TextField("", text: $myAddress)
            }
            
            Section(header: Text("Profile Photo")) {
                TextField("", text: $myProfilePhoto)
            }
            */
        }
        Spacer()
        Button(action: {
            let newUserProfileData = UserProfData(context: self.managedObjectContext)
            newUserProfileData.id = UUID()
            newUserProfileData.firstName = myFirstName
            newUserProfileData.age = myAge
            do {
                try self.managedObjectContext.save()
            } catch {
                print(error.localizedDescription)
            }
            self.isShown.toggle()
        }, label: {
                    Text("Add profile")
        })
        }
    }
}

struct UserProfDataSheet_Previews: PreviewProvider {
    static var previews: some View {
        UserProfDataSheet(isShown: .constant(Bool()))
    }
}
