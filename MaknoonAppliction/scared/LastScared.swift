//
//  LastScared.swift
//  MaknoonAppliction
//
//  Created by Reyouf Alqahtani on 08/06/1445 AH.
//
import SwiftUI
import AVFAudio
struct LastScared: View {
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var spokenHappyWord: String = "Thunder makes me scared"
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
                    Image("LastScared")
                        .resizable() .foregroundColor(Color("purple"))
                        .frame(width: 400,height:400)
                        .offset(x:0,y:-10)
                        .cornerRadius(10)
                        .accessibility(label: Text("Scared Kid"))
                    //description
                        .accessibility(hint: Text("In this image, a little child wears  white thaube , looks scared because of thunder. The child's face shows fear with wide eyes and a tense expression. he tightly hold onto his thaube, seeking comfort. The image captures the moment of a child feeling scared and looking for reassurance."))
                    // Add more to the discription
                    HStack{
                        Button(action:{
                            speakText()
                            print("tapped")
                            
                        }){
                            Image(systemName: "speaker.wave.2")
                                .font(.system(size: 44))
                                .fontWeight(.bold)
                                .foregroundColor(Color("purple"))
                                .padding([.bottom, .trailing],480.0)
                            .offset(x:-40,y: 0).accessibility(label: Text("Speaker"))
                            .accessibility(hint: Text("Tap to hear the phrase 'Thunder makes me scared'"))}
                    }
                    
                    HStack{
                        Text("Thunder makes me scared")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .offset(x:5,y:237)
                            .foregroundColor(Color("purple"))
                            .accessibility(label: Text("Sentence"))
                            .accessibility(hint: Text("Thunder makes me scared"))
                       
                        }  }
                .padding(10)
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
            Home()}}
    func speakText(){
            let speechUtterance = AVSpeechUtterance(string:spokenHappyWord)
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            speechSynthesizer.speak(speechUtterance)
        }}
#Preview {
    LastScared()
}
