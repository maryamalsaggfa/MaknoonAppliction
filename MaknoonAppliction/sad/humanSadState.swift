//
//  humanSadState.swift
//  MaknoonAppliction
//
//  Created by maryam on 07/06/1445 AH.
//

import SwiftUI
import AVFAudio

struct humanSadState: View {
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var spokenHappyWord: String = NSLocalizedString("sad", comment: "Default sad word")

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
                                .accessibility(hint: Text("Tap to hear the word 'Sad'"))
                    }
                    
                    Image("sad")
                        .resizable()
                        .frame(width:400,height:424)
                    .accessibility(label: Text("Sad Kid"))
                    //description
                    .accessibility(hint: Text("In this picture, there's a cartoon kid who seems to be feeling a bit sad. The kid is wearing a blue shirt with white lines on it, and their hair is a bit messy. The expression on the kid's face shows that they might be feeling a bit down. The shades of blue in the shirt might remind you of a rainy day. The white lines on the shirt are like little paths, giving the shirt a special touch."))
                    Spacer()
                    .frame(height:0)
                    
                
                        
                        
                        Text("Sad")
                            .font(.system(size: 72))
                            .fontWeight(.bold)
                            .accessibility(label: Text("word"))
                            .accessibility(hint: Text("happy"))
                            .foregroundColor(Color("purple"))
                        
                       
                            
                    
                 
                    
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
                   feelingSad()
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
    humanSadState()
}
