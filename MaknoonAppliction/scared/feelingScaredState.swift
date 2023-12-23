//
//  feelingAngerState.swift
//  MaknoonAppliction
//
//  Created by Reyouf Alqahtani on 08/06/1445 AH.
//
import SwiftUI
import AVFAudio
struct  feelingScaredState: View {
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var spokenHappyWord: String = NSLocalizedString("I am Scared", comment: "I am Scared")
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
                                .accessibility(label: Text("Speaker"))
                                .accessibility(hint: Text("Tap to hear the phrase 'I am Scared'"))
                    }
                    
                    Image("LastScared")
                        .resizable()
                        .frame(width:362,height: 362)
                        .accessibility(label: Text("Scared kid"))
                        .accessibility(hint: Text("In this image, a child is dressed in a Saudi thawb and a white turban, and their facial expression conveys a sense of fear. The child's features show signs of anxiety, with widened eyes and a serious expression reflecting a state of being scared or frightened."))
                    Spacer()
                    .frame(height:0)
                    HStack() {
                        
                        
                        Text("I am Scared")
                            .accessibility(label: Text("phrase"))
                            .accessibility(hint: Text("I am Scared"))
                            .font(.system(size: 50))
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
                   LastScared()
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
    feelingScaredState()
}
