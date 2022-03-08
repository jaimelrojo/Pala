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
    
    var diccionario: [String] = ["CLIMA", "CALOR", "COMER", "SUEÑO", "CORRE", "SALIR", "HUMOR", "NEGRO", "DURAR", "BARRA", "BUQUE", "AUDIO", "PUNTO", "VIDEO", "FUEGO", "VIRAL", "GUSTO", "TACTO", "VISTA", "TEXAS", "GORRA", "REZAR", "HUESO", "BUSTO", "SUSTO", "MUSEO", "HUEVO", "BUSCO", "JUEGO", "BARES", "NARIZ", "AUTOR", "COLOR", "TELAS", "TEJAS", "TEMAS", "MOVER", "SISMO", "MIXTO", "SUMAR", "RESTA", "DOBLE", "LIBRA", "VIRGO", "TOREO", "LIBRO", "AYUDA", "PANDA", "PERRO", "TECLA", "NUEVO", "VIEJO"]
    
    @State var numeroDeLetras = 5
    var letras: [String] = "QWERTYUIOPASDFGHJKLÑZXCVBNM".map { String($0) }
    var coloresTeclas: [Color] = []
    @State var anchoCubito: Double = UIScreen.main.bounds.width / 5.8
    
    @Published var diccionarioRevuelto: [String] = [""]
    @Published var palabraSeleccionada: String = ""
    @Published var palabraSeleccionadaDividida: [String] = ["", "", "", "", ""]
    @Published var contador = 0
    
    @Published var palabra: [String] = ["", "", "", "", ""]
    @Published var coloresLetra: [Color] = [Color("ColorPrincipalBlanco"), Color("ColorPrincipalBlanco"), Color("ColorPrincipalBlanco"), Color("ColorPrincipalBlanco"), Color("ColorPrincipalBlanco")]
    @Published var coloresFondo: [Color] = [Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro"), Color("ColorPrincipalNegro")]
    @Published var encontradas: [Bool] = [false, false, false, false, false]
    
    @Published var intentos: [Intento] = [Intento(letra1: "", colorFondo1: Color("ColorPrincipalNegro"), colorLetra1: Color("ColorPrincipalBlanco"), letra2: "", colorFondo2: Color("ColorPrincipalNegro"), colorLetra2: Color("ColorPrincipalBlanco"), letra3: "", colorFondo3: Color("ColorPrincipalNegro"), colorLetra3: Color("ColorPrincipalBlanco"),  letra4: "", colorFondo4: Color("ColorPrincipalNegro"), colorLetra4: Color("ColorPrincipalBlanco"), letra5: "", colorFondo5: Color("ColorPrincipalNegro"), colorLetra5: Color("ColorPrincipalBlanco"), done: false)]
    @Published var numeroDeIntentos: Int = 5
    
    @Published var showWinner: Bool = false
    @Published var timer: Timer?
    @Published var timerCounter = 0
    
    init() {
        SelectWord()
        ColorKeyboardWhite()
    }
    
    func ColorKeyboardWhite() {
        coloresTeclas.removeAll()
        for _ in letras.indices {
            coloresTeclas.append(Color("ColorPrincipalNegro"))
        }
    }
    
    func SelectWord() {
        if contador == 0 {
            diccionarioRevuelto = diccionario.shuffled()
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
                }
            }
        }
    }
    
    func CheckGreen() {
        
        var targetValues = [""]
        
        for index in coloresFondo.indices {
            if palabra[index] == palabraSeleccionadaDividida[index] {
                coloresFondo[index] = Color.green
                encontradas[index] = true
                targetValues.append(palabra[index])
            }
        }
        
        for index2 in coloresTeclas.indices {
            for index3 in targetValues.indices {
                if letras[index2] == targetValues[index3] {
                    coloresTeclas[index2] = Color.green
                }
            }
        }
    }
    
    func CheckYellow() {
        for index in coloresFondo.indices {
            for index2 in palabraSeleccionadaDividida.indices {
                if palabra[index] != palabraSeleccionadaDividida[index] && palabra[index] == palabraSeleccionadaDividida[index2] {
                    
                    if encontradas[index2] == false  {
                        coloresFondo[index] = Color.yellow
                        encontradas[index2] = true
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
    
    func AppendIntento() {
        intentos.insert(.init(letra1: palabra[0], colorFondo1: coloresFondo[0], colorLetra1: Color("ColorNegro"), letra2: palabra[1], colorFondo2: coloresFondo[1], colorLetra2: Color("ColorNegro"), letra3: palabra[2], colorFondo3: coloresFondo[2], colorLetra3: Color("ColorNegro"), letra4: palabra[3], colorFondo4: coloresFondo[3], colorLetra4: Color("ColorNegro"), letra5: palabra[4], colorFondo5: coloresFondo[4], colorLetra5: Color("ColorNegro"), done: true), at: (intentos.count - 1))
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
    
    @StateObject var palabraViewModel: PalabrasModelView = PalabrasModelView()
//    @ObservedObject var palabraViewModel: PalabrasModelView
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 18) {
                
                VStack {
//                    Text("\(palabraViewModel.diccionarioRevuelto[0])")
//                        .foregroundColor(Color("ColorNegro"))
//                    Text("\(palabraViewModel.diccionarioRevuelto[1])")
//                        .foregroundColor(Color("ColorNegro"))
//                    Text("\(palabraViewModel.diccionarioRevuelto[2])")
//                        .foregroundColor(Color("ColorNegro"))
                    Text("\(palabraViewModel.diccionarioRevuelto[palabraViewModel.contador])")
                        .foregroundColor(.red)

                    HStack {
                        ForEach(0..<5) { index in
                            Text("\(palabraViewModel.palabraSeleccionadaDividida[index])")
                                .foregroundColor(.white)
                        }
                    }
                }
                
                Spacer()
                
//                Image("cheems")
//                    .resizable()
//                    .scaledToFit()
//                    .animation(.spring(response: 0.7, dampingFraction: 0.7))
                
//                Button("Cambiar palabra") {
//                    if palabraViewModel.contador < (palabraViewModel.diccionarioRevuelto.count - 1) {
//                        palabraViewModel.contador += 1
//                    } else {
//                        palabraViewModel.contador = 0
//                    }
//                }
                
                VStack {
                    ForEach(palabraViewModel.intentos) { index in
                        HStack {
                            Cubito(text: index.done ? index.letra1 : palabraViewModel.palabra[0],
                                   colorLetra: index.done ? index.colorLetra1 : palabraViewModel.coloresLetra[0],
                                   colorFondo: index.done ? index.colorFondo1 : palabraViewModel.coloresFondo[0],
                                   width: palabraViewModel.anchoCubito)
//                                .animation(.spring(response: 0.7, dampingFraction: 0.7))
                                .offset(y: palabraViewModel.timerCounter == 1 ? -15 : 0)
                            Cubito(text: index.done ? index.letra2 : palabraViewModel.palabra[1],
                                   colorLetra: index.done ? index.colorLetra2 : palabraViewModel.coloresLetra[1],
                                   colorFondo: index.done ? index.colorFondo2 : palabraViewModel.coloresFondo[1],
                                   width: palabraViewModel.anchoCubito)
//                                .animation(.spring(response: 0.7, dampingFraction: 0.7).delay(0.05))
                                .offset(y: palabraViewModel.timerCounter == 2 ? -15 : 0)
                            Cubito(text: index.done ? index.letra3 : palabraViewModel.palabra[2],
                                   colorLetra: index.done ? index.colorLetra3 : palabraViewModel.coloresLetra[2],
                                   colorFondo: index.done ? index.colorFondo3 : palabraViewModel.coloresFondo[2],
                                   width: palabraViewModel.anchoCubito)
//                                .animation(.spring(response: 0.7, dampingFraction: 0.7).delay(0.1))
                                .offset(y: palabraViewModel.timerCounter == 3 ? -15 : 0)
                            Cubito(text: index.done ? index.letra4 : palabraViewModel.palabra[3],
                                   colorLetra: index.done ? index.colorLetra4 : palabraViewModel.coloresLetra[3],
                                   colorFondo: index.done ? index.colorFondo4 : palabraViewModel.coloresFondo[3],
                                   width: palabraViewModel.anchoCubito)
//                                .animation(.spring(response: 0.7, dampingFraction: 0.7).delay(0.15))
                                .offset(y: palabraViewModel.timerCounter == 4 ? -15 : 0)
                            Cubito(text: index.done ? index.letra5 : palabraViewModel.palabra[4],
                                   colorLetra: index.done ? index.colorLetra5 : palabraViewModel.coloresLetra[4],
                                   colorFondo: index.done ? index.colorFondo5 : palabraViewModel.coloresFondo[4],
                                   width: palabraViewModel.anchoCubito)
//                                .animation(.spring(response: 0.7, dampingFraction: 0.7).delay(0.2))
                                .offset(y: palabraViewModel.timerCounter == 5 ? -15 : 0)
                        }
                        .animation(.spring(response: 0.7, dampingFraction: 0.7))
                        .transition(.asymmetric(insertion: .move(edge: .bottom).combined(with: .opacity), removal: .offset(y: -UIScreen.main.bounds.height * 0.7)))
                    }
                }
                
                Teclado(palabraViewModel: palabraViewModel)
            }
            .transition(.opacity)
            
            VStack {
                if palabraViewModel.showWinner == true {
                    
                    Spacer()
                    
                    RoundPopUp(palabraViewModel: palabraViewModel)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Juego_Previews: PreviewProvider {
    static var previews: some View {
        Juego()
    }
}
