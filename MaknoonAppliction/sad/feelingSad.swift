//
//  feelingSad.swift
//  MaknoonAppliction
//
//  Created by maryam on 07/06/1445 AH.
//

import SwiftUI
import AVFAudio

struct feelingSad: View {
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var spokenHappyWord: String = NSLocalizedString("I am sad", comment: "Default I am sad")

   
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
                                .accessibility(hint: Text("Tap to hear the phrase 'I am sad'"))
                    }
                    
                    Image("sadd")
                        
                        .accessibility(label: Text("sad kid"))
                        .accessibility(hint: Text("In this image, a child is depicted wearing a traditional Saudi thaub in a bright shade of white. The child's facial expression suggests a profound sense of sadness, with furrowed brows and clear tears streaming down their face. The sadness is evident in their eyes, which are full of tears. The emotional intensity is conveyed through the clear depiction of numerous tears on the child's face"))
                    Spacer()
                    .frame(height:55)
                    HStack(spacing: 20) {
                        
                        
                        Text("I am sad")
                            .accessibility(label: Text("phrase"))
                            .accessibility(hint: Text("I am sad"))
                            .font(.system(size: 72))
                            .fontWeight(.bold)
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
                // move to reyof page
            .fullScreenCover(isPresented:$isButtonNextTapped) {
                    exampleOfFeelingSad()
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
    }}


#Preview {
    feelingSad()
}
