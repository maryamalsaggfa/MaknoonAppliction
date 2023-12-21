//
//  feelingAngerState.swift
//  MaknoonAppliction
//
//  Created by Reyouf Alqahtani on 08/06/1445 AH.
//

import SwiftUI
import AVFAudio
struct feelingAngerState: View {
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var spokenHappyWord: String = NSLocalizedString("I am Angry", comment: "I am Angry")
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
                                .accessibility(hint: Text("Tap to hear the phrase 'I am Angry'"))
                    }
                    
                    Image("AngryImage")
                        .resizable()
                        .frame(width:362,height: 362)
                        .accessibility(label: Text("Angry kid"))
                        .accessibility(hint: Text("In this image, there's a depiction of a child wearing a Saudi thawb and a white turban. The child's facial expression suggests anger, with furrowed brows and a serious face expression."))
                    Spacer()
                    .frame(height:0)
                    HStack() {
                        
                        
                        Text("I am Angry ")
                            .accessibility(label: Text("phrase"))
                            .accessibility(hint: Text("I am Angry"))
                            .font(.system(size: 72))
                            .fontWeight(.bold)
                            .foregroundColor(Color("purple"))
                            .padding(.top,30)
                         
                        
                       
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
                   LastAnger()
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
    feelingAngerState()
}
