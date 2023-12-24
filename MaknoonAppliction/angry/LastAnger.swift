//
//  humanAngerState.swift
//  MaknoonAppliction
//
//  Created by Reyouf Alqahtani on 08/06/1445 AH.
//
import SwiftUI
import AVFoundation
struct LastAnger: View {
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var spokenHappyWord: String = NSLocalizedString("my Toy is broken I'm angry", comment: "Default my Toy is broken I'm angry")
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
                            .fontWeight(.bold)
                            .offset(x:-20,y:18)
                                .foregroundColor(Color("purple"))
                                .padding(.trailing,500)
                                .accessibility(label: Text("Speaker"))
                                .accessibility(hint: Text("Tap to hear the phrase 'My toy is broken ,Im Angry'"))
                    }
                    
                    Image("AngryLast")
                        .resizable()
                        .frame(width:400,height:424)
                        .accessibility(label: Text("Angry Kid"))
       .accessibility(hint: Text("In this image, there's a depiction of a child in a white thaub, conveying strong emotions of anger. The child's facial features are intense, with furrowed brows and an open mouth, indicating frustration. Wrinkles on the face emphasize the depth of the emotion. The child is holding a toy with both hands, perhaps gripping it tightly in response to their anger"))
                    Spacer()
                    .frame(height:0)
                    
                    HStack() {
                        
                        Text("My toy is broken, I'm Angry")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .accessibility(label: Text("Phrase"))
                    .accessibility(hint: Text("My toy is broken ,I'm Angry"))
                            .foregroundColor(Color("purple"))
                        
                     
                            
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
                               
                            
                            
                            
                            
                            Image(systemName:"arrowshape.backward.fill")
                                .resizable()
                                .frame(width:30,height:33)
                                .foregroundColor(Color("purple"))
                               
                              
                        } .padding(.trailing,20)

                }
                .accessibility(label: Text("Next"))
                .accessibility(hint: Text("Tap to move to the next page"))
                .padding(.top,675)
                .padding(.trailing,900)
                .fullScreenCover(isPresented:$isButtonNextTapped) {
               Home()
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
    LastAnger()
}
