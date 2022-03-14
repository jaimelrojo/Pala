//
//  ContentView.swift
//  Pala
//
//  Created by Jaime Castañeda on 21/02/22.
//

import SwiftUI

struct Intento: Identifiable {
    let id: String = UUID().uuidString
    let letra1: String
    let colorFondo1: Color
    let colorLetra1: Color
    let letra2: String
    let colorFondo2: Color
    let colorLetra2: Color
    let letra3: String
    let colorFondo3: Color
    let colorLetra3: Color
    let letra4: String
    let colorFondo4: Color
    let colorLetra4: Color
    let letra5: String
    let colorFondo5: Color
    let colorLetra5: Color
    let done: Bool
}

//MARK: CLASE

class PalabrasModelView: ObservableObject {
    
//    enum Dificultades {
//        case normal
//        case dificil
//        case extremo
//    }
    
    var diccionario: [String] = ["CLIMA", "CALOR", "COMER", "SUEÑO", "CORRE", "SALIR", "HUMOR", "NEGRO", "DURAR", "BARRA", "BUQUE", "AUDIO", "PUNTO", "VIDEO", "FUEGO", "VIRAL", "GUSTO", "TACTO", "VISTA", "TEXAS", "GORRA", "REZAR", "HUESO", "BUSTO", "SUSTO", "MUSEO", "HUEVO", "BUSCO", "JUEGO", "BARES", "NARIZ", "AUTOR", "COLOR", "TELAS", "TEJAS", "TEMAS", "MOVER", "SISMO", "MIXTO", "SUMAR", "RESTA", "DOBLE", "LIBRA", "VIRGO", "TOREO", "LIBRO", "AYUDA", "PANDA", "PERRO", "TECLA", "NUEVO", "VIEJO"]
    
//    @State var numeroDeLetras = 5
    var letras: [String] = "QWERTYUIOPASDFGHJKLÑZXCVBNM".map { String($0) }
    var coloresTeclas: [Color] = []
    var coloresTeclasLetras: [Color] = []
    var anchoCubito: Double = 5.8
    
    @Published var diccionarioRevuelto: [String] = [""]
    @Published var palabraSeleccionada: String = ""
    @Published var palabraSeleccionadaDividida: [String] = ["", "", "", "", ""]
    @AppStorage("contador") var contador = 0
    
    @Published var palabra: [String] = ["", "", "", "", ""]
    @Published var coloresLetra: [Color] = [Color("ColorPrincipalBlanco"), Color("ColorPrincipalBlanco"), Color("ColorPrincipalBlanco"), Color("ColorPrincipalBlanco"), Color("ColorPrincipalBlanco")]
    @Published var coloresFondo: [Color] = [Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro")]
    @Published var encontradas: [Bool] = [false, false, false, false, false]
    
    @Published var intentos: [Intento] = [Intento(letra1: "", colorFondo1: Color("ColorPrincipalNegro"), colorLetra1: Color("ColorPrincipalBlanco"), letra2: "", colorFondo2: Color("ColorPrincipalNegro"), colorLetra2: Color("ColorPrincipalBlanco"), letra3: "", colorFondo3: Color("ColorPrincipalNegro"), colorLetra3: Color("ColorPrincipalBlanco"),  letra4: "", colorFondo4: Color("ColorPrincipalNegro"), colorLetra4: Color("ColorPrincipalBlanco"), letra5: "", colorFondo5: Color("ColorPrincipalNegro"), colorLetra5: Color("ColorPrincipalBlanco"), done: false)]
    @Published var numeroDeIntentos: Int = 6
    
    @Published var showWinner: Bool = false
    @Published var timer: Timer?
    @Published var timerCounter = 0
    
    @AppStorage("scoreActual") var scoreActual: Int = 0
    @AppStorage("highScore") var highScore: Int = 0
    
    @Published var animation = Animation.spring(response: 0.7, dampingFraction: 0.8)
    
    @Published var juegoComenzado: Bool = false
    
    init() {
        ColorKeyboardWhite()
    }
    
//    func PickDificulty(on dificultad: Dificultades) {
//        switch dificultad {
//        case .normal:
//            break
//        case .dificil:
//            break
//        case .extremo:
//            break
//        }
//    }
    
    func ColorKeyboardWhite() {
        coloresTeclas.removeAll()
        coloresTeclasLetras.removeAll()
        for _ in letras.indices {
            coloresTeclas.append(Color("ColorPrincipalNegro"))
            coloresTeclasLetras.append(Color("ColorPrincipalBlanco"))
        }
    }
    
    func SelectWord() {
        if contador == 0 {
            diccionarioRevuelto = diccionario.shuffled()
//            UserDefaults.standard.set(diccionarioRevuelto, forKey: "diccionarioRevuelto")
        }
        palabraSeleccionada.removeAll()
        palabraSeleccionada = diccionarioRevuelto[contador]
        palabraSeleccionadaDividida = palabraSeleccionada.map { String($0) }
    }
    
    func CheckValidIntro() -> Bool {
        if palabra[0] == "" {
            return false
        } else if palabra [1] == "" {
            return false
        } else if palabra [2] == "" {
            return false
        } else if palabra [3] == "" {
            return false
        } else if palabra [4] == "" {
            return false
        } else {
            return true
        }
    }
    
    func CheckWinner() -> Bool {
        if palabra[0] == palabraSeleccionadaDividida[0] && palabra[1] == palabraSeleccionadaDividida[1] && palabra[2] == palabraSeleccionadaDividida[2] && palabra[3] == palabraSeleccionadaDividida[3] && palabra[4] == palabraSeleccionadaDividida[4] {
            return true
        } else {
            return false
        }
    }
    
    func YouAreAWinner() {
        scoreActual += 1
        
        if highScore < scoreActual {
            highScore = scoreActual
        }
        
        showWinner.toggle()
        coloresFondo = [Color("ColorVerde"), Color("ColorVerde"), Color("ColorVerde"), Color("ColorVerde"), Color("ColorVerde")]
        coloresLetra = [Color("ColorBlanco"), Color("ColorBlanco"), Color("ColorBlanco"), Color("ColorBlanco"), Color("ColorBlanco")]
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { index in
            if self.timerCounter < 8 {
                self.timerCounter += 1
            } else {
                self.timerCounter = 0
            }
        }
    }
    
    func YouAreALoser() {
        scoreActual = 0
        showWinner.toggle()
        coloresFondo = [Color("ColorRojo"), Color("ColorRojo"), Color("ColorRojo"), Color("ColorRojo"), Color("ColorRojo")]
        coloresLetra = [Color("ColorBlanco"), Color("ColorBlanco"), Color("ColorBlanco"), Color("ColorBlanco"), Color("ColorBlanco")]
    }
    
    func CheckGray() {
        
        var targetValues = [""]
        
        for index in coloresFondo.indices {
            if palabra[index] != palabraSeleccionadaDividida[0] && palabra[index] != palabraSeleccionadaDividida[1] && palabra[index] != palabraSeleccionadaDividida[2] && palabra[index] != palabraSeleccionadaDividida[3] && palabra[index] != palabraSeleccionadaDividida[4] {
                coloresFondo[index] = Color.gray
                targetValues.append(palabra[index])
            }
        }
        
        for index2 in coloresTeclas.indices {
            for index3 in targetValues.indices {
                if letras[index2] == targetValues[index3] {
                    coloresTeclas[index2] = Color.gray
                    coloresTeclasLetras[index2] = Color("ColorBlanco")
                }
            }
        }
    }
    
    func CheckGreen() {
        
        var targetValues = [""]
        
        for index in coloresFondo.indices {
            if palabra[index] == palabraSeleccionadaDividida[index] {
                coloresFondo[index] = Color("ColorVerde")
                encontradas[index] = true
                targetValues.append(palabra[index])
            }
        }
        
        for index2 in coloresTeclas.indices {
            for index3 in targetValues.indices {
                if letras[index2] == targetValues[index3] {
                    coloresTeclas[index2] = Color("ColorVerde")
                    coloresTeclasLetras[index2] = Color("ColorBlanco")
                }
            }
        }
    }
    
    func CheckYellow() {
        for index in coloresFondo.indices {
            for index2 in palabraSeleccionadaDividida.indices {
                if palabra[index] != palabraSeleccionadaDividida[index] && palabra[index] == palabraSeleccionadaDividida[index2] {
                    
                    if encontradas[index2] == false {
                        coloresFondo[index] = Color("ColorAmarillo")
                        encontradas[index2] = true
                        break
                    } else {
                        coloresFondo[index] = Color.gray
                    }
                }
            }
        }
    }
    
    func EraseLetters() {
        if palabra[4] != "" {
            palabra[4] = ""
        } else if palabra[3] != "" {
            palabra[3] = ""
        } else if palabra[2] != "" {
            palabra[2] = ""
        } else if palabra[1] != "" {
            palabra[1] = ""
        } else if palabra[0] != "" {
            palabra[0] = ""
        }
    }
    
    func IntroButton() {
        if CheckWinner() == true {
            YouAreAWinner()
        } else {
            if intentos.count < numeroDeIntentos {
                CheckGreen()
                CheckGray()
                CheckYellow()
                AppendIntento()
                coloresFondo = [Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro")]
                encontradas = [false, false, false, false, false]
            } else {
                YouAreALoser()
            }
        }
    }
    
    func AppendIntento() {
        intentos.insert(.init(letra1: palabra[0], colorFondo1: coloresFondo[0], colorLetra1: Color("ColorBlanco"), letra2: palabra[1], colorFondo2: coloresFondo[1], colorLetra2: Color("ColorBlanco"), letra3: palabra[2], colorFondo3: coloresFondo[2], colorLetra3: Color("ColorBlanco"), letra4: palabra[3], colorFondo4: coloresFondo[3], colorLetra4: Color("ColorBlanco"), letra5: palabra[4], colorFondo5: coloresFondo[4], colorLetra5: Color("ColorBlanco"), done: true), at: (intentos.count - 1))
        palabra = ["", "", "", "", ""]
    }
    
    func NewRound() {
        
        self.timer?.invalidate()
        timerCounter = 0
        
        palabra = ["", "", "", "", ""]
        coloresFondo = [Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro")]
        coloresLetra = [Color("ColorPrincipalBlanco"), Color("ColorPrincipalBlanco"), Color("ColorPrincipalBlanco"), Color("ColorPrincipalBlanco"), Color("ColorPrincipalBlanco")]
        encontradas = [false, false, false, false, false]
        ColorKeyboardWhite()
        
        intentos.removeAll()
        intentos.insert(.init(letra1: palabra[0], colorFondo1: coloresFondo[0], colorLetra1: coloresLetra[0], letra2: palabra[1], colorFondo2: coloresFondo[1], colorLetra2: coloresLetra[1], letra3: palabra[2], colorFondo3: coloresFondo[2], colorLetra3: coloresLetra[2], letra4: palabra[3], colorFondo4: coloresFondo[3], colorLetra4: coloresLetra[3], letra5: palabra[4], colorFondo5: coloresFondo[4], colorLetra5: coloresLetra[4], done: false), at: 0)
        
        if contador < (diccionarioRevuelto.count - 1) {
            contador += 1
        } else {
            contador = 0
        }
        SelectWord()
    }
}

//MARK: VISTA

struct Juego: View {
    
    @ObservedObject var palabraViewModel: PalabrasModelView
    
    var body: some View {
            
        VStack(spacing: UIScreen.main.bounds.height * 0.024) {
            
            Spacer()
            VStack {
                Text("\(palabraViewModel.diccionarioRevuelto[0])")
                    .foregroundColor(Color("ColorPrincipalNegro"))
                Text("\(palabraViewModel.diccionarioRevuelto[1])")
                    .foregroundColor(Color("ColorPrincipalNegro"))
                Text("\(palabraViewModel.diccionarioRevuelto[2])")
                    .foregroundColor(Color("ColorPrincipalNegro"))
//
                HStack {
                    ForEach(0..<5) { index in
                        Text("\(palabraViewModel.palabraSeleccionadaDividida[index])")
                            .foregroundColor(Color("ColorPrincipalNegro"))
                    }
                }
//                HStack {
//                    ForEach(0..<5) { index in
//                        if palabraViewModel.encontradas[index] == false {
//                            Text("False")
//                                .foregroundColor(Color("ColorPrincipalNegro"))
//                        } else {
//                            Text("True")
//                                .foregroundColor(Color("ColorPrincipalNegro"))
//                        }
//                    }
//                }
            }
//
//            Button("Cambiar palabra") {
//                if palabraViewModel.contador < (palabraViewModel.diccionarioRevuelto.count - 1) {
//                    palabraViewModel.contador += 1
//                    palabraViewModel.SelectWord()
//                } else {
//                    palabraViewModel.contador = 0
//                    palabraViewModel.SelectWord()
//                }
//            }
//
            Spacer()
                
            VStack {
                ForEach(palabraViewModel.intentos) { index in
                    HStack {
                        Cubito(text: index.done ? index.letra1 : palabraViewModel.palabra[0],
                               colorLetra: index.done ? index.colorLetra1 : palabraViewModel.coloresLetra[0],
                               colorFondo: index.done ? index.colorFondo1 : palabraViewModel.coloresFondo[0],
                               width: palabraViewModel.anchoCubito)
//                            .animation(palabraViewModel.animation)
                            .offset(y: palabraViewModel.timerCounter == 1 ? -15 : 0)
                        Cubito(text: index.done ? index.letra2 : palabraViewModel.palabra[1],
                               colorLetra: index.done ? index.colorLetra2 : palabraViewModel.coloresLetra[1],
                               colorFondo: index.done ? index.colorFondo2 : palabraViewModel.coloresFondo[1],
                               width: palabraViewModel.anchoCubito)
//                            .animation(palabraViewModel.animation).delay(0.05))
                            .offset(y: palabraViewModel.timerCounter == 2 ? -15 : 0)
                        Cubito(text: index.done ? index.letra3 : palabraViewModel.palabra[2],
                               colorLetra: index.done ? index.colorLetra3 : palabraViewModel.coloresLetra[2],
                               colorFondo: index.done ? index.colorFondo3 : palabraViewModel.coloresFondo[2],
                               width: palabraViewModel.anchoCubito)
//                            .animation(palabraViewModel.animation).delay(0.1))
                            .offset(y: palabraViewModel.timerCounter == 3 ? -15 : 0)
                        Cubito(text: index.done ? index.letra4 : palabraViewModel.palabra[3],
                               colorLetra: index.done ? index.colorLetra4 : palabraViewModel.coloresLetra[3],
                               colorFondo: index.done ? index.colorFondo4 : palabraViewModel.coloresFondo[3],
                               width: palabraViewModel.anchoCubito)
//                            .animation(palabraViewModel.animation).delay(0.15))
                            .offset(y: palabraViewModel.timerCounter == 4 ? -15 : 0)
                        Cubito(text: index.done ? index.letra5 : palabraViewModel.palabra[4],
                               colorLetra: index.done ? index.colorLetra5 : palabraViewModel.coloresLetra[4],
                               colorFondo: index.done ? index.colorFondo5 : palabraViewModel.coloresFondo[4],
                               width: palabraViewModel.anchoCubito)
                            .offset(y: palabraViewModel.timerCounter == 5 ? -15 : 0)
//                            .animation(palabraViewModel.animation.delay(0.2))
                    }
                    .animation(palabraViewModel.animation)
                    .transition(.asymmetric(insertion: .move(edge: .bottom).combined(with: .opacity), removal: .offset(y: -UIScreen.main.bounds.height * 0.7)))
                }
            }
            Teclado(palabraViewModel: palabraViewModel)
        }
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height * 0.904)
    }
}

struct Juego_Previews: PreviewProvider {
    static var previews: some View {
        VistaPrincipal()
            .preferredColorScheme(.dark)
    }
}
