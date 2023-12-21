//
//  exampleOfFeelingSad.swift
//  MaknoonAppliction
//
//  Created by maryam on 07/06/1445 AH.
//

import SwiftUI
import AVFAudio

struct exampleOfFeelingSad: View {
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    
    @State private var spokenHappyWord: String = NSLocalizedString("I lost the race, I'm sad", comment: "Default I lost the race, I'm sad")

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
                                .accessibility(hint: Text("Tap to hear the phrase 'I felt down I am sad'"))
                    }
                    
                    Image("crying")
                    .accessibility(label: Text("Sad Kid"))
                    //description
                    .accessibility(hint: Text("In the image, there's a young child wearing a loose Saudi thaub, a traditional outfit. The child looks upset, possibly after a race, with a sticker on the thaub holding event information. The thaub is a comfortable and unique garment, and the sticker is like a badge from the race, telling a story. The child's emotions are evident in the picture, reflecting a moment of feeling sad or disappointed"))
                    Spacer()
                    .frame(height:0)
                    
                    HStack() {
                        
                        
                        Text("I lost the race, I'm sad")
                            .padding(.top,30)
                            .font(.system(size: 60))
                            .fontWeight(.bold)
                            .accessibility(label: Text("phrase"))
                            .accessibility(hint: Text("sad phrase I felt down I am sad"))
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
            
                .padding(.top,675)
                .padding(.trailing,900)
                .accessibility(label: Text("Next"))
                .accessibility(hint: Text("Tap to move to the next page"))
                .fullScreenCover(isPresented:$isButtonNextTapped) {
                    Home()
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
    exampleOfFeelingSad()
}
