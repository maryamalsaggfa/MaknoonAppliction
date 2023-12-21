//
//  LastAnger.swift
//  MaknoonAppliction
//
//  Created by Reyouf Alqahtani on 08/06/1445 AH.
//


import SwiftUI
import AVFAudio
struct LastAnger: View {
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var spokenHappyWord: String = "heate makes me angry"
    @State private var activebutton = false
    var body: some View {
        ZStack{
            Color("lightGreen")
                .ignoresSafeArea()
            VStack{
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("lightPink"))
                        .frame(width:697,height:600) .cornerRadius(20)
                        .rotationEffect(.degrees(-180))
                        .shadow(color: Color("Shadow"), radius: 2, x: 0, y: 2)
                    Image("Candy")
                        .resizable() .foregroundColor(Color("purple"))
                        .frame(width: 400,height:400)
                        .offset(x:0,y:-30)
                        .cornerRadius(10)
                        .accessibility(label: Text("Angry Kid"))
                    //description
                        .accessibility(hint: Text("In this image, there's a depiction of a child in a white thaub, conveying strong emotions of anger. The child's facial features are intense, with furrowed brows and an open mouth, indicating frustration. Wrinkles on the face emphasize the depth of the emotion. The child is holding a toy with both hands, perhaps gripping it tightly in response to their anger"))
                    // Add more to the discription
                    HStack{
                        Button(action:{
                            speakText()
                            print("tapped")
                            
                        }){
                            Image(systemName: "speaker.wave.2")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(Color("DarkPurple"))
                                .padding([.bottom, .trailing],480.0)
                            .offset(x:-40,y: 0)}
                    }
                    
                    HStack{
                        Text("Im angry because.. !")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .offset(x:5,y:237)
                            .foregroundColor(Color("purple"))
                        }  }
                .padding(10)
                Button(action: {
                    activebutton = true
                })
                {
                    ZStack{
                        
                        Rectangle()
                            .foregroundColor(Color("lightPink"))
                            .frame(width: 147, height: 58)
                            .cornerRadius(30)
                            .rotationEffect(.degrees(-180))
                            .shadow(color: Color("Shadow"), radius: 2, x: 0, y: 2)
                        Image(systemName:"arrowshape.turn.up.backward.fill")
                            .resizable()
                            .frame(width:22,height:23)
                            .foregroundColor(Color("purple"))
                    }    .padding(.trailing,740)}}
            
            .padding(.bottom,-50)
        }
        .fullScreenCover(isPresented:$activebutton) {
            Home()
        }}
    
    func speakText(){
            let speechUtterance = AVSpeechUtterance(string:spokenHappyWord)
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            speechSynthesizer.speak(speechUtterance)
        }}
#Preview {
    LastAnger()
}
 
