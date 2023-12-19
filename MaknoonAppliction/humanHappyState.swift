//
//  humanHappyState.swift
//  MaknoonAppliction
//
//  Created by maryam on 06/06/1445 AH.
//

import SwiftUI
import AVFoundation

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
                    }
                    
                    Image("happyKid")
                    Spacer()
                    .frame(height:0)
                    HStack(spacing: 20) {
                        
                        
                        Text("Happy")
                            .font(.system(size: 72))
                            .fontWeight(.bold)
                            .foregroundColor(Color("purple"))
                        
                        Image("happyFace")
                            .resizable()
                            .frame(width:61,height:59)
                    }
                 
                    
                }
                ZStack{
                    Button(action:{
                        isButtonNextTapped = true
                        print("next")
                           
                    }){
                        Rectangle()
                            .frame(width:147,height:58)
                            .foregroundColor(Color("lightPink"))
                            .border(Color("gray"), width: 2)
                            .cornerRadius(58)
                    }
                        Image(systemName:"arrowshape.turn.up.backward.fill")
                            .resizable()
                            .frame(width:22,height:23)
                            .foregroundColor(Color("purple"))

                }
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
