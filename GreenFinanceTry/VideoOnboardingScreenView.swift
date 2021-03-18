//
//  VideoOnboardingScreenView.swift
//  GreenFinanceTry
//
//  Created by vincent schmitt on 17/03/2021.
//

import SwiftUI

struct VideoOnboardingScreenView: View {
    @State private var showOnboarding = false
    var body: some View {

        ZStack {
            //Color.black
            PlayerView()
                .overlay(Color.green.opacity(0.4))
                .blur(radius: 1)
                .edgesIgnoringSafeArea(.all)
        
        VStack {
            Spacer()
            //Image(systemName: "leaf.fill")
            Image("LogoGreen4all")
                .resizable()
                .frame(width: 200, height: 200)
                //.aspectRatio(contentMode: .fit)
                .scaledToFit()
                .foregroundColor(.white)
                .padding(.bottom, 30)
            Text("Green 4 all")
                .font(.largeTitle)
                .foregroundColor(.white)
            Text("RENDRE LA FINANCE VERTE VRAIMENT PLUS VERTE")
                .foregroundColor(.white)
                .frame(maxWidth: 320)
                .padding(.top, 20)
                .padding(.bottom, 50)
            Spacer()
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white)
            HStack {
                //Spacer()
                Text("Enter")
                    .foregroundColor(.white)
                    .padding(20)
                //Spacer()
                //Text("Signup").foregroundColor(.white).padding(20)
                //Spacer()
                    .onTapGesture {
                        //showOnboarding.toggle()
                        TabBarView()
                    }
            }
        }
            
        }
        .sheet(isPresented: $showOnboarding, content: {
            TabBarView()//.environment(\.managedObjectContext, managedObjectContext)
        })

    }
}

struct VideoOnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        VideoOnboardingScreenView()
    }
}
