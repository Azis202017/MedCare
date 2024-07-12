//
//  SplashView.swift
//  Medcare
//
//  Created by Abdul Azis  Al Ayubbi on 12/07/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    var body: some View {
        if isActive {
            OnboardingView()
        }else {
            ZStack {
                Color("SplashColor")
                    .ignoresSafeArea()
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:183, height:166.58)
                
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                    withAnimation {
                        self.isActive = true
                    }
                })
            }
        }
       
    }
}

#Preview {
    SplashView()
}
