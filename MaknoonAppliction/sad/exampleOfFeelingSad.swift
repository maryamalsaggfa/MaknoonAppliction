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
    @ScaledMetric var fontSize: CGFloat = 50
    @ScaledMetric var fontSize2: CGFloat = 44


    @State private var spokenHappyWord: String = NSLocalizedString("I lost the race, I'm sad", comment: "Default I lost the race, I'm sad")

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
                            .font(.system(size: 44))
                            .fontWeight(.bold)// Adjust the size of the icon
                            .foregroundColor(Color("Midpurple"))
                            .padding(.trailing,500)
                            .accessibility(label: Text("Speaker"))
                            .accessibility(hint: Text("Tap to hear the phrase 'I lost the race, I am sad'"))
                    }
                    
                    Image("crying")
                        .resizable() .foregroundColor(Color("Midpurple"))
                        .frame(width: 400,height:400)
                        .offset(x:0,y:-10.5)
                        .cornerRadius(10)
                        .accessibility(label: Text("Sad Kid"))
                    //description
                        .accessibility(hint: Text("In the image, there's a young child wearing a loose Saudi thaub, a traditional outfit. The child looks upset, possibly after a race, with a sticker on the thaub holding event information. The thaub is a comfortable and unique garment, and the sticker is like a badge from the race, telling a story. The child's emotions are evident in the picture, reflecting a moment of feeling sad or disappointed"))
                    Spacer()
                        .frame(height:0)
                    
                    
                    HStack{
                        
                        Text("I lost the race, I'm sad")
                            .padding(.top,30)
                            .font(.system(size: fontSize))
                            .fontWeight(.bold)
                            .accessibility(label: Text("phrase"))
                            .accessibility(hint: Text(" I lost the race, I am sad"))
                            .foregroundColor(Color("Midpurple"))
                        Spacer().frame(width: 8)
                        
                    }
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
                            Image(systemName:"arrowshape.forward.fill")
                                .resizable()
                                .frame(width:30,height:33)
                                .foregroundColor(Color("Midpurple"))
                                
                              
                        }.padding(.trailing,20)

                }
            
                .padding(.top,675)
                .padding(.leading,900)
                .accessibility(label: Text("Next"))
                .accessibility(hint: Text("Tap to move to the next page"))
                .fullScreenCover(isPresented:$isButtonNextTapped) {
                    Home()
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
    }
}

#Preview {
    exampleOfFeelingSad()
}
