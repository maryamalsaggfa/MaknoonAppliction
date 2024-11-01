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

    @ScaledMetric var fontSize: CGFloat = 50

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
                            .foregroundColor(Color("Midpurple"))
                                .padding(.trailing,500)
                                .offset(x:0,y:13)
                                .accessibility(label: Text("Speaker"))
                                .accessibility(hint: Text("Tap to hear the phrase 'I am sad'"))
                    }
                    
                    Image("sadd")
                        .resizable()
                        .frame(width:362,height: 362)
                        .accessibility(label: Text("sad kid"))
                        .accessibility(hint: Text("In this image, a child is depicted wearing a traditional Saudi thaub in a bright shade of white. The child's facial expression suggests a profound sense of sadness, with furrowed brows and clear tears streaming down their face. The sadness is evident in their eyes, which are full of tears. The emotional intensity is conveyed through the clear depiction of numerous tears on the child's face"))
                    Spacer()
                    .frame(height:45)
                
                        Text("I am sad")
                            .accessibility(label: Text("phrase"))
                            .accessibility(hint: Text("I am sad"))
                            .font(.system(size:fontSize))
                            .fontWeight(.bold)
                            .foregroundColor(Color("Midpurple"))
                         
                        
                       
                
                 
                    
                }
               
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
                                
    
                            Image(systemName:"arrowshape.forward.fill")
                                .resizable()
                                .frame(width:30,height:33)
                                .foregroundColor(Color("Midpurple"))
                        }

                }
                .padding(.top,675)
                .padding(.leading,900)
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
        
        speechUtterance.pitchMultiplier = 1.2// You can adjust this value as needed
        
    speechUtterance.rate = AVSpeechUtteranceDefaultSpeechRate // You can adjust this value as needed
        
    speechUtterance.volume = 2// You can adjust this value as needed
        let currentLanguage = Locale.current.language.languageCode?.identifier ?? "en"
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
