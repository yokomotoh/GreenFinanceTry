//
//  TabBarView.swift
//  GreenFinanceTry
//
//  Created by vincent schmitt on 17/03/2021.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Text("Project list")
                .tabItem{
                    Label(
                        title: { Text("Projects") },
                        icon: { Image(systemName: "1.circle") }
)
                }
            UserProfDataListView()
                .tabItem{
                    Label(
                        title: { Text("Profile") },
                        icon: { Image(systemName: "2.circle") }
)
                }
        }
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
