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
            //Text("Project list")
            VideoOnboardingScreenView()
                .tabItem{
                    Label(
                        title: { Text("Onboard") },
                        icon: { Image(systemName: "1.circle") }
)
                }
            ProjectListView()
                .tabItem{
                    Label(
                        title: { Text("Project") },
                        icon: { Image(systemName: "2.circle") }
)
                }
            UserProfDataListView()
                .tabItem{
                    Label(
                        title: { Text("Profile") },
                        icon: { Image(systemName: "3.circle") }
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
