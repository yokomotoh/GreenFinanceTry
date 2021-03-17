//
//  ContentView.swift
//  GreenFinanceTry
//
//  Created by vincent schmitt on 16/03/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //@Environment(\.managedObjectContext) var managedObjectContext
    //@FetchRequest(entity: UserProfData.entity(), sortDescriptors: [])
    //var userProfDatas: FetchedResults<UserProfData>
    
    var body: some View {
        TabView {
            UserProfDataListView()
                .tabItem{
                    Label(
                        title: { Text("Profile") },
                        icon: { Image(systemName: "1.circle") }
)
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
