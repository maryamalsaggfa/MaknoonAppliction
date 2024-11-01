
import SwiftUI
import AVFoundation
struct LastScared: View {
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @ScaledMetric var fontSize: CGFloat = 50

    @State private var spokenHappyWord: String = NSLocalizedString("Thunder makes me scared", comment: "Default Thunder makes me scared")
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
                                .foregroundColor(Color("Midpurple"))
                                .padding(.trailing,500)
                                .accessibility(label: Text("Speaker"))
                               .accessibility(hint: Text("Tap to hear the phrase 'Thunder makes me scared'"))
                    }
                    
                    Image("Scaredd")
                        .resizable()
                        .frame(width:400,height:424)
                        .accessibility(label: Text("Scared Kid"))
                .accessibility(hint: Text("In this image, a little child wears  white thaube , looks scared because of thunder. The child's face shows fear with wide eyes and a tense expression. he tightly hold onto his thaube, seeking comfort. The image captures the moment of a child feeling scared and looking for reassurance."))
                    Spacer()
                    .frame(height:0)
                    
                    HStack() {
                        
                        Text("Thunder makes me scared")
                            .font(.system(size: fontSize))
                            .fontWeight(.bold)
                            .accessibility(label: Text("Phrase"))
                        .accessibility(hint: Text("Thunder makes me scared"))
                            .foregroundColor(Color("Midpurple"))
                        
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
                               
                              
                        } .padding(.trailing,20)

                }
                .accessibility(label: Text("Next"))
                .accessibility(hint: Text("Tap to move to the next page"))
                .padding(.top,675)
                .padding(.leading,900)
                .fullScreenCover(isPresented:$isButtonNextTapped) {
                  Home()
                }
            }}
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
    LastScared()
}
