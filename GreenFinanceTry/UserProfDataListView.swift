//
//  UserProfDataListView.swift
//  GreenFinanceTry
//
//  Created by yoko on 16/03/2021.
//

import SwiftUI
import CoreData

struct UserProfDataListView: View {
    
    @State private var showProfileSheet = false
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: UserProfData.entity(), sortDescriptors: [])
    var userProfDatas: FetchedResults<UserProfData>

    @State private var showingDetail = false
    
    
    func removeElement (at offsets: IndexSet) {
        for index in offsets {
            let userProfDataList = userProfDatas[index]
            managedObjectContext.delete(userProfDataList)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.userProfDatas){ element in
                    NavigationLink (
                        destination:
                            UserProfDataDetailView(elem: element),
                            //Text("detail of a UserProfData"),
                        label: {
                            HStack{
                                //Text("Hello")
                                Text(element.accountName )
                                //Text(element.age)
                            }
                            
                        })
                }
                .onDelete(perform: removeElement(at:))
            }
        .navigationTitle("Profile list")
        .navigationBarItems(trailing: Button(action: {
                //print("Open profile sheet")
            self.showProfileSheet.toggle()
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
            }))
            .sheet(isPresented: $showProfileSheet) {
                //Text("Profile sheet")
                UserProfDataSheet(isShown: self.$showProfileSheet).environment(\.managedObjectContext, self.managedObjectContext)
            }
        }
    }
}

struct UserProfDataListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let persistenceController = PersistenceController.shared
        
        return
            UserProfDataListView().environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}

/*
extension UserProfData {
    func removeElement (at offsets: IndexSet) {
        for index in offsets {
            let userProfDataList = userProfDatas[index]
            managedObjectContext.delete(userProfDataList)
        }
    }
}
*/
