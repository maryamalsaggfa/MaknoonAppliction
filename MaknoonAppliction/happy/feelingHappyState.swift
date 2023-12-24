//
//  feelingHappyState.swift
//  MaknoonAppliction
//
//  Created by maryam on 06/06/1445 AH.
//

import SwiftUI
import AVFAudio

struct feelingHappyState: View {
    @State private var speechSynthesizer = AVSpeechSynthesizer()
   
    @State private var spokenHappyWord: String = NSLocalizedString("I am happy", comment: "Default I am happy")

    @State private var isButtonNextTapped = false
    
    var body: some View {
    
            ZStack{
                Color("lightGreen").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Rectangle()
                    .frame(width:697,height:600)
                    .foregroundColor(Color("lightPink"))
                    .cornerRadius(58)
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
                                .padding(.trailing,500)
                                .offset(x:0,y:13)
                                .accessibility(label: Text("Speaker"))
                                .accessibility(hint: Text("Tap to hear the word 'I'm happy'"))
                    }
                    
                    Image("happyKid")
                        .resizable()
                        .frame(width:362,height: 362)
                        
                        .accessibility(label: Text("happy kid"))
                        .accessibility(hint: Text("In this image, a little child dons a bright white thobe, radiating happiness. The child's face is adorned with a beaming smile, and his eyes sparkle with delight. The overall expression exudes pure joy and contentment. "))
                    Spacer()
                    .frame(height:45)
                    HStack() {
                        
                        
                        Text("I am happy")
                            .accessibility(label: Text("phrase"))
                            .accessibility(hint: Text("I am happy"))
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(Color("purple"))
                         
                        
                       
                    }
                 
                    
                }
               // ZStack{
                    Button(action:{
                        isButtonNextTapped = true
                        print("next")
                           
                    }){
                        ZStack{
                            Rectangle()
                                .frame(width:160,height:70)
                                .foregroundColor(Color("lightPink"))
                                .cornerRadius(20)
                                .shadow(color: Color("Shadow"), radius: 9, x: 0, y: 10)
                             
                            Image(systemName:"arrowshape.backward.fill")
                                .resizable()
                                .frame(width:30,height:33)
                                .foregroundColor(Color("purple"))
                        }

                }
                .padding(.top,675)
                .padding(.trailing,900)
                .accessibility(label: Text("Next"))
                .accessibility(hint: Text("Tap to move to the next page"))
                // move to reyof page
            .fullScreenCover(isPresented:$isButtonNextTapped) {
                   LastHappy()
                }
                
            }
        
       
           
        
        
    }
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
    feelingHappyState()
}
