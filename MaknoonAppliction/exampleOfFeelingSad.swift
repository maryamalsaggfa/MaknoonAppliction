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
    @State private var spokenHappyWord: String = "I felt down I am sad"
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
                    
                    Image("happyKid")
                    .accessibility(label: Text("Sad Kid"))
                    //description
                    .accessibility(hint: Text("Image of a happy child with smooth, wheat-colored skin, dressed in a soft, white Saudi thaub. The child's skin feels warm to the touch, and their eyes sparkle with joy. A big, infectious smile lights up their face, sharing the happiness within"))
                    Spacer()
                    .frame(height:0)
                    
                    HStack(spacing: 20) {
                        
                        
                        Text("I felt down I am sad")
                            .font(.system(size: 60))
                            .fontWeight(.bold)
                            .accessibility(label: Text("phrase"))
                            .accessibility(hint: Text("sad phrase I felt down I am sad"))
                            .foregroundColor(Color("purple"))
                        
                        Image("sadIcon")
                            .resizable()
                            .frame(width:61,height:59)
                            .accessibility(label: Text("sad Face"))
                            
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
                    //feelingHappyState()
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
    exampleOfFeelingSad()
}