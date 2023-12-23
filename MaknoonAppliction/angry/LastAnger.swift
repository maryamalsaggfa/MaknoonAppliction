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
    @State private var spokenHappyWord: String = "my Toy is broken I'm angry"
    @State private var activebutton = false
    var body: some View {
        ZStack{
            Color("lightGreen")
                .ignoresSafeArea()
            VStack{
                ZStack{
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
                            .foregroundColor(Color("purple"))
                            .padding(.trailing,500)
                            .accessibility(label: Text("Speaker"))
                            .accessibility(hint: Text("Tap to hear the phrase 'My toy is broken ,Im Angry'"))
                    }
                        Image("AngryLast")
                            .resizable() .foregroundColor(Color("purple"))
                            .frame(width: 400,height:400)
                            .offset(x:0,y:-10.5)
                            .cornerRadius(10)
                            .accessibility(label: Text("Angry Kid"))
                        //description
                        .accessibility(hint: Text("In this image, there's a depiction of a child in a white thaub, conveying strong emotions of anger. The child's facial features are intense, with furrowed brows and an open mouth, indicating frustration. Wrinkles on the face emphasize the depth of the emotion. The child is holding a toy with both hands, perhaps gripping it tightly in response to their anger"))
                    // Add more to the discription
                    
                    Text("My toy is broken ,I'm Angry")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("purple"))
                        .accessibility(label: Text("Phrase"))
                        .accessibility(hint: Text("My toy is broken ,I'm Angry"))
                      
                }
            }
                Button(action: {
                    activebutton = true
                })
                {
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
                    }    .padding(.trailing,886)}}
            
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
 
