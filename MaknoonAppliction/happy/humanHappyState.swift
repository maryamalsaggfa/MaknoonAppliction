//
//  humanHappyState.swift
//  MaknoonAppliction
//
//  Created by maryam on 06/06/1445 AH.
//

import SwiftUI
import AVFoundation
// voiceover acecssability label ( .accessibility(label: Text("Greeting"))
// voiceover hint .accessibility(hint: Text("Tap to hear a friendly greeting"))
struct humanHappyState: View {
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var spokenHappyWord: String = NSLocalizedString("Happy", comment: "Default happy word")

    @State private var isButtonNextTapped = false
    
    var body: some View {
    
            ZStack{
                Color("lightGreen").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Rectangle()
                    .frame(width:697,height:600)
                    .foregroundColor(Color("lightPink"))
                    .border(Color("gray"), width: 2)
                    .cornerRadius(58)
                VStack{
                    Button(action:{
                        speakText()
                        print("tapped")
                    
                    }){
                        Image(systemName: "speaker.wave.2")
                            .font(.system(size: 40)) // Adjust the size of the icon
                                .foregroundColor(Color("purple"))
                                .padding(.trailing,500)
                                .accessibility(label: Text("Speaker"))
                                .accessibility(hint: Text("Tap to hear the word 'happy'"))
                    }
                    
                    Image("HappyIcon")
                        .resizable()
                        .frame(width:400,height:424)
                    .accessibility(label: Text("Happy Kid"))
                    .accessibility(hint: Text("In this picture, there's a cartoon kid radiating joy with a bright smile on their face. The kid is wearing a vibrant blue shirt adorned with cheerful white lines, and their hair has a playful, tousled look. The expression on the kid's face exudes happiness and excitement. The shades of blue in the shirt bring to mind a clear, sunny sky, and the white lines on the shirt add a delightful touch, resembling little bursts of happiness. Overall, the image captures a moment of pure joy and positive energy."))
                    Spacer()
                    .frame(height:0)
                    
                    HStack() {
                        
                        
                        Text("Happy")
                            .font(.system(size: 72))
                            .fontWeight(.bold)
                            .accessibility(label: Text("word"))
                            .accessibility(hint: Text("happy"))
                            .foregroundColor(Color("purple"))
                          
             
                            
                    }
                 
                    
                }
               
                    Button(action:{
                        isButtonNextTapped = true
                        print("next")
                           
                    }){
                        ZStack{
                            Rectangle()
                                .frame(width:147,height:58)
                                .foregroundColor(Color("lightPink"))
                                .border(Color("gray"), width: 2)
                                .cornerRadius(58)
                            
                            
                            
                            
                            Image(systemName:"arrowshape.turn.up.backward.fill")
                                .resizable()
                                .frame(width:22,height:23)
                                .foregroundColor(Color("purple"))
                              
                        }

                }
                .accessibility(label: Text("Next"))
                .accessibility(hint: Text("Tap to move to the next page"))
                .padding(.top,675)
                .padding(.trailing,900)
                .fullScreenCover(isPresented:$isButtonNextTapped) {
                    feelingHappyState()
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
    humanHappyState()
}