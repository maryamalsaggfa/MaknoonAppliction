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
                            .font(.system(size: 44)) .fontWeight(.bold)
                            .offset(x:-20,y:18)
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
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .accessibility(label: Text("word"))
                            .accessibility(hint: Text("sad"))
                            .foregroundColor(Color("purple"))
                        
                       
                            
                    
                 
                    
                }
               
                    Button(action:{
                        isButtonNextTapped = true
                        print("next")
                           
                    }){
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
                              
                        }.padding(.trailing,20)

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
