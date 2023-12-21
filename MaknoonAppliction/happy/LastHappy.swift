//
//  LastHappy.swift
//  MaknoonAppliction
//
//  Created by Reyouf Alqahtani on 08/06/1445 AH.
//

import SwiftUI
import AVFAudio
struct  LastHappy: View {
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var spokenHappyWord: String = "Candy makes me happy"
    @State private var activebutton = false
    var body: some View {
        ZStack{
            Color("lightGreen")
                .ignoresSafeArea()
            VStack{
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("lightPink"))
                        .frame(width: 697, height: 600)   .cornerRadius(20)
                        .rotationEffect(.degrees(-180))
                        .shadow(color: Color("Shadow"), radius: 2, x: 0, y: 2)
                    Image("Candy")
                        .resizable() .foregroundColor(Color("DarkPurple"))
                        .frame(width: 400,height:400)
                      // .offset(x:0,y:10)
                        .cornerRadius(10)
                        .accessibility(label: Text("Sad Kid"))
                    //description
                        .accessibility(hint: Text("Image of a happy child with smooth, wheat-colored skin, dressed in a soft, white Saudi thaub. The child's skin feels warm to the touch, and their eyes sparkle with joy. A big, infectious smile lights up their face, sharing the happiness within"))
                    HStack{
                        Button(action:{
                            speakText()
                            print("tapped")
                            
                        }){
                            Image(systemName: "speaker.wave.2")
                                .font(.system(size: 42))
                                .fontWeight(.bold)
                                .foregroundColor(Color("purple"))
                                .padding([.bottom, .trailing],480.0)
                            .offset(x:-40,y: 0)}
                    }
                    
                    HStack{
                        Text("Cnady makes me happy!")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .offset(x:5,y:237)
                            .foregroundColor(Color("purple"))
                        }  }
                .padding(10)
                Button(action: {
                    activebutton = true
                })
                {
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color("lightPink"))
                            .frame(width: 180, height: 80)
                            .cornerRadius(30)
                            .rotationEffect(.degrees(-180))
                            .shadow(color: Color("Shadow"), radius: 2, x: 0, y: 2)
                        Image(systemName: "arrowshape.turn.up.backward.fill").resizable().foregroundColor(Color("purple")).frame(width: 20 , height: 23)
                    }    .padding(.trailing,740)}}
            
            .padding(.bottom,-50) }
        .fullScreenCover(isPresented:$activebutton) {
            Home()
        }}
    
    func speakText(){
            let speechUtterance = AVSpeechUtterance(string:spokenHappyWord)
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            speechSynthesizer.speak(speechUtterance)
        }}

#Preview {
    LastHappy()
}
