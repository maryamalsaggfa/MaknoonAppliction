//
//  Home.swift
//  MaknoonAppliction
//
//  Created by Reyouf Alqahtani on 08/06/1445 AH.
//
import SwiftUI

struct Home: View {
    @State var activebutton:Bool = false
    @State var Sadbutton:Bool = false
    @State var Angerbutton:Bool = false
    @State var Scaredbutton:Bool = false
    @ScaledMetric var fontSize: CGFloat = 52
    @ScaledMetric var fontSize2: CGFloat = 58
    @Environment(\.sizeCategory) var sizecategory
    var body: some View {
          ZStack{
                  Color("lightGreen")
                      .ignoresSafeArea()
             
              VStack{
                  Text("My emotions")
                  
                    //  .font(.system(size: 58))
                      .font(.system(size: fontSize2))
                      .fontWeight(.bold)
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color("Midpurple"))
                      .padding()
                      
                  HStack{
                      VStack{
                          Button(action: {
                              activebutton.toggle()
                          })
                          {
                              ZStack{
                                  Rectangle()
                                      .foregroundColor(Color("lightPink"))
                                      .frame(width: 341, height: 253)                        .cornerRadius(20)
                                      .rotationEffect(.degrees(-180))
                                      .shadow(color: Color("Shadow"), radius: 2, x: 0, y: 2)
                                  Image("HappyIcon")
                                      .resizable() .foregroundColor(Color("Midpurple"))
                                      .frame(width: 140,height: 150)
                                      .offset(x:1,y:-20)
                                  Text("Happy")
                                     // .font(.system(size: 52))
                                      .font(.system(size: fontSize))
                                      .fontWeight(.bold)
                                      .multilineTextAlignment(.center)
                                      .offset(x:0,y:82
                                      )
                                      .foregroundColor(Color("Midpurple"))
                              }
                              
                          }
                          
                          .padding(40)
                          Button(action: {
                          Angerbutton.toggle()
                          })
                          {
                                      ZStack{
                                          Rectangle()
                                              .foregroundColor(Color("lightPink"))
                                              .frame(width: 341, height: 253)                        .cornerRadius(20)
                                              .rotationEffect(.degrees(-180))
                                              .shadow(color: Color("Shadow"), radius: 2, x: 0, y: 2)
                                          Image("AngryIcon")
                                              .resizable() .foregroundColor(Color("Midpurple"))
                                              .frame(width: 140,height: 150)
                                              .offset(x:1,y:-20)
                                          Text("Angry")
                                //.font(.system(size: 52))
                                              .font(.system(size: fontSize))
                                              .fontWeight(.bold)
                                              .multilineTextAlignment(.center)
                                              .offset(x:0,y:82)
                                              .foregroundColor(Color("Midpurple"))
                                      } }
                      }
                      .padding(10)
                      VStack{
                          Button(action: {
                              Sadbutton.toggle()
                          })
                          {
                                      ZStack{
                                          Rectangle()
                                              .foregroundColor(Color("lightPink"))
                                              .frame(width: 341, height: 253)                        .cornerRadius(20)
                                              .rotationEffect(.degrees(-180))
                                              .shadow(color: Color("Shadow"), radius: 2, x: 0, y: 2)
                                          Image("sad")
                                              .resizable() .foregroundColor(Color("Midpurple"))
                                              .frame(width: 140,height: 150)
                                              .offset(x:1,y:-20)
                                          Text("Sad")
                                          //    .font(.system(size: 52))
                                              .font(.system(size: fontSize))
                                              .fontWeight(.bold)
                                              .multilineTextAlignment(.center)
                                              .offset(x:0,y:82)
                                              .foregroundColor(Color("Midpurple"))
                                      } }
                              .padding(40)
                          Button(action: {
                              Scaredbutton.toggle()
                          })
                          {
                                      ZStack{
                                          Rectangle()
                                              .foregroundColor(Color("lightPink"))
                                              .frame(width: 341, height: 253)                        .cornerRadius(20)
                                              .rotationEffect(.degrees(-180))
                                              .shadow(color: Color("Shadow"), radius: 2, x: 0, y: 2)
                                          Image("Scared")
                                              .resizable() .foregroundColor(Color("Midpurple"))
                                              .frame(width: 140,height: 150)
                                              .offset(x:1,y:-20)
                                          Text("Scared")
                                             // .font(.system(size: 52))
                                              .font(.system(size: fontSize))
                                              .fontWeight(.bold)
                                              .multilineTextAlignment(.center)
                                              .offset(x:0,y:82)
                                              .foregroundColor(Color("Midpurple"))
                                      } }// .padding()
                      }
                      
                      .padding(10)    }
              }
                   //
          }
          .minimumScaleFactor(sizecategory.customMinScaleFactor)
          .fullScreenCover(isPresented:$activebutton) {
            humanHappyState()
       }
        .fullScreenCover(isPresented:$Angerbutton) {
   humanAngerState()
     }
          .fullScreenCover(isPresented:$Sadbutton) {
                 humanSadState()
                  }
                  .fullScreenCover(isPresented:$Scaredbutton) {
              humanScaredState()
                  }
    }
}

#Preview {
    Home()
}
extension ContentSizeCategory{
    var customMinScaleFactor:CGFloat{
        switch self{
        case .extraSmall,.small,.medium:
            return 1.0


        case .large ,.extraLarge,.extraExtraLarge
            ,.extraExtraExtraLarge:
         return   0.8
        default:
            return 0.85

        }
    }
}
