//
//  humanAngerState.swift
//  MaknoonAppliction
//
//  Created by Reyouf Alqahtani on 08/06/1445 AH.
//
import SwiftUI
import AVFoundation
struct humanAngerState: View {
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var spokenHappyWord: String = NSLocalizedString("Angry", comment: "Default Angry")

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
                                .accessibility(hint: Text("Tap to hear the word 'Angry'"))
                    }
                    
                    Image("AngryIcon")
                        .resizable()
                        .frame(width:400,height:424)
                    .accessibility(label: Text("Angry kid"))
                    //add the discription
                    .accessibility(hint: Text("In this image, there's a cartoon kid expressing strong emotions with a serious demeanor. The child is wearing a vivid blue shirt with noticeable white lines, and their hair appears slightly disheveled, reflecting a sense of frustration or anger. The expression on the kid's face suggests intense feelings of displeasure or irritation. The shades of blue in the shirt may evoke a stormy atmosphere, and the white lines contribute to the overall portrayal of heightened emotions. "))
                    Spacer()
                    .frame(height:0)
                    
                    HStack() {
                        
                        
                        Text("Angry")
                            .font(.system(size: 72))
                            .fontWeight(.bold)
                            .accessibility(label: Text("word"))
                            .accessibility(hint: Text("Angry"))
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
                    feelingAngerState()
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
    humanAngerState()
}
