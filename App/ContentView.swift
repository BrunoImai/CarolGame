import SwiftUI

struct ContentView: View {
    
    @State private var beginGame = false
    @State private var textCont = 0
    @State private var boxOpacity = 0
    @State private var minigame = true

    
    @State private var textLines = ["primeira frase", "Segunda frase","3", "4", "Mudar para minigame"]
    @State var background = "Iguana"
    
    
    var body: some View {
        
        ZStack {
            // Background
            Image(background).resizable()
                .onTapGesture {
                    self.beginGame = true
                }
            VStack {
                // Texto Superior
                Text("Clique na tela para fazer a crinça dormir")
                    .font(.system(size: 48).bold())
                    .opacity(beginGame ? 0 : 1)
                    .animation(.easeInOut(duration: 0.25), value: beginGame)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                if minigame {
                    Ball()
                }
                Spacer()
                ZStack {
                    // Caixa de Texto
                    Text(textLines[textCont])
                        .font(.system(size: 48).bold())
                        .animation(.easeInOut(duration: 0.25), value: beginGame)
                        .foregroundColor(.blue)
                        .padding(.bottom, 15)
                        .statusBar(hidden: true)
                        .onTapGesture {
                            if beginGame {
                                if textCont + 1 < textLines.count{
                                    textCont += 1
                                }
                                checkActions()
                            }
                        }
                    Image("hand")
                        .resizable()
                        .frame(width: 100, height: 200)
                        .offset(x: 100)
                        .opacity(0)
                }
                
            }

        }
    }
    
    func checkActions() {
        
        print(textCont)
        switch textCont + 1 {
            
            case 3:
                background = "Camelo"
            break

        default:
            print("Deu Ruim")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
