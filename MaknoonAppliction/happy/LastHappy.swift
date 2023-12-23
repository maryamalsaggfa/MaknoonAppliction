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
                        .frame(width:697,height:600) .cornerRadius(30)
                        .rotationEffect(.degrees(-180))
                        .shadow(color: Color("Shadow"), radius: 9, x: 0, y: 10)
                    VStack{
                        Button(action:{
                        speakText()
                        print("tapped")
                        
                    }){
                        Image(systemName: "speaker.wave.2")
                            .font(.system(size: 44))
                            .fontWeight(.bold)
                            .foregroundColor(Color("purple"))
                            .padding(.trailing,500)}
                    .accessibility(label: Text("Speaker"))
                    .accessibility(hint: Text("Tap to hear the phrase 'Cande makes me happy'"))
                    Image("Candy")
                            .resizable() .foregroundColor(Color("purple"))
                            .frame(width: 400,height:400)
                            .offset(x:0,y:-10.5)
                            .cornerRadius(10)
                            .accessibility(label: Text("Happy Kid"))
                        
                        .accessibility(hint: Text("In this image, there's a young child wearing a Saudi thaub and a red Shemagh, which is a traditional headscarf. The child is beaming with happiness, and you can hear the joy in their big smile, revealing clear teeth. The thaub is likely a bright white, and the Shemagh is neatly draped. In the child's hand, there's candy they're holding"))
           
                        Text("Cnady makes me happy!")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("purple"))
                            .accessibility(label: Text("Phrase"))
                            .accessibility(hint: Text("Candy makes me happy"))
                    }  }
                Button(action: {
                    activebutton = true
                })
                {
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color("lightPink"))
                            .frame(width:160,height:70)
                            .cornerRadius(20)
                            .shadow(color: Color("Shadow"), radius: 9, x: 0, y: 10)
                        Image(systemName:"arrowshape.backward.fill")
                            .resizable()
                            .frame(width:30,height:33)
                            .foregroundColor(Color("purple"))
                    }    .padding(.trailing,886)}}
            
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
