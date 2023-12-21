//
//  SplashScreenView.swift
//  MaknoonAppliction
//
//  Created by maryam on 08/06/1445 AH.
//

//  SplashScreenView.swift
//  SplashScreen
//
//  Created by Federico on 20/01/2022.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        ZStack{
            Color("lightGreen") .ignoresSafeArea()
            VStack{
                if isActive {
                    Home()
                } else {
                    VStack {
                        VStack(spacing: 110) {
                            Image("logo")
                                .scaleEffect(1.5)
                                .font(.system(size: 80))
                            
                            
                            Text("مكنون")
                                .font(Font.custom("Baskerville-Bold", size: 60))
                                .foregroundColor(Color("purple"))
                        }
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.2)) {
                                self.size = 0.9
                                self.opacity = 1.00
                            }
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

