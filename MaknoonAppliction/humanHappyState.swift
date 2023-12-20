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
    @State private var spokenHappyWord: String = "Happy"
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
                    
                    Image("happyKid")
                    .accessibility(label: Text("Happy Kid"))
                    .accessibility(hint: Text("Image of a happy child with smooth, wheat-colored skin, dressed in a soft, white Saudi thaub. The child's skin feels warm to the touch, and their eyes sparkle with joy. A big, infectious smile lights up their face, sharing the happiness within"))
                    Spacer()
                    .frame(height:0)
                    
                    HStack(spacing: 20) {
                        
                        
                        Text("Happy")
                            .font(.system(size: 72))
                            .fontWeight(.bold)
                            .accessibility(label: Text("word"))
                            .accessibility(hint: Text("happy"))
                            .foregroundColor(Color("purple"))
                        
                        Image("happyFace")
                            .resizable()
                            .frame(width:61,height:59)
                            .accessibility(label: Text("smiley Face"))
                            
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
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        speechSynthesizer.speak(speechUtterance)
    }
}

#Preview {
    humanHappyState()
}
