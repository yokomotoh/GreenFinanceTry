//
//  UserProfDataSheet.swift
//  GreenFinanceTry
//
//  Created by yoko on 16/03/2021.
//

import SwiftUI

struct UserProfDataSheet: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var myAccountName = ""
    //@State var myLastName = ""
    @State var myEmail = ""
    //@State var myAddress = ""
    //@State var myAge = ""
    //@State var myProfilePhoto = ""
    @State var myPassword = ""
    
    @Binding var isShown: Bool
    
    var body: some View {
        
        VStack {
        Form {
            Section(header: Text("Account Name")) {
                TextField("", text: $myAccountName)
            }
            
            Section(header: Text("Email")) {
                TextField("", text: $myEmail)
            }
            Section(header: Text("Password")) {
                TextField("", text: $myPassword)
            }

        }
        Spacer()
        Button(action: {
            let newUserProfileData = UserProfData(context: self.managedObjectContext)
            newUserProfileData.id = UUID()
            newUserProfileData.accountName = myAccountName
            newUserProfileData.email = myEmail
            newUserProfileData.password = myPassword
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
