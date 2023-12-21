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
    
    @State private var spokenHappyWord: String = NSLocalizedString("Candy makes me happy", comment: "Default Candy makes me happy")
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
                        .accessibility(hint: Text("In this image, there's a young child wearing a Saudi thaub and a red Shemagh, which is a traditional headscarf. The child is beaming with happiness, and you can hear the joy in their big smile, revealing clear teeth. The thaub is likely a bright white, and the Shemagh is neatly draped. In the child's hand, there's candy they're holding"))
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
        let currentLanguage = Locale.current.languageCode ?? "en"
        if currentLanguage == "ar" {
               // Use Arabic voice for Arabic localization
               speechUtterance.voice = AVSpeechSynthesisVoice(language: "ar-SA") // "ar-SA" for Saudi Arabic, adjust if needed
        } else {
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        }
        speechSynthesizer.speak(speechUtterance)
    }
}

#Preview {
    LastHappy()
}
