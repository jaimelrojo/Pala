//
//  Teclado.swift
//  Pala
//
//  Created by Jaime Castañeda on 21/02/22.
//

import SwiftUI

struct Teclado: View {
    
    @ObservedObject var palabraViewModel: PalabrasModelView
    
    var body: some View {
        VStack(spacing: UIScreen.main.bounds.height * 0.0035) {
            
            HStack(spacing: UIScreen.main.bounds.height * 0.0035) {
                ForEach(0..<10) { index in
                    Button {
                        if palabraViewModel.palabra[0] == "" {
                            palabraViewModel.palabra[0] = palabraViewModel.letras[index]
                        } else if palabraViewModel.palabra[1] == "" {
                            palabraViewModel.palabra[1] = palabraViewModel.letras[index]
                        } else if palabraViewModel.palabra[2] == "" {
                            palabraViewModel.palabra[2] = palabraViewModel.letras[index]
                        } else if palabraViewModel.palabra[3] == "" {
                            palabraViewModel.palabra[3] = palabraViewModel.letras[index]
                        } else if palabraViewModel.palabra[4] == "" {
                            palabraViewModel.palabra[4] = palabraViewModel.letras[index]
                        }
                    } label: {
                        Tecla(palabraViewModel: palabraViewModel,
                              text: palabraViewModel.letras[index],
                              colorFondo: palabraViewModel.coloresTeclas[index],
                              colorLetra: palabraViewModel.coloresTeclasLetras[index],
                              width: UIScreen.main.bounds.width / 11,
                              height: UIScreen.main.bounds.height / 15,
                              opacity: 1)
                    }
                    .disabled(palabraViewModel.coloresTeclas[index] == Color.gray)
                }
            }
            
            HStack(spacing: UIScreen.main.bounds.height * 0.0035) {
                ForEach(10..<20) { index in
                    Button {
                        if palabraViewModel.palabra[0] == "" {
                            palabraViewModel.palabra[0] = palabraViewModel.letras[index]
                        } else if palabraViewModel.palabra[1] == "" {
                            palabraViewModel.palabra[1] = palabraViewModel.letras[index]
                        } else if palabraViewModel.palabra[2] == "" {
                            palabraViewModel.palabra[2] = palabraViewModel.letras[index]
                        } else if palabraViewModel.palabra[3] == "" {
                            palabraViewModel.palabra[3] = palabraViewModel.letras[index]
                        } else if palabraViewModel.palabra[4] == "" {
                            palabraViewModel.palabra[4] = palabraViewModel.letras[index]
                        }
                    } label: {
                        Tecla(palabraViewModel: palabraViewModel,
                              text: palabraViewModel.letras[index],
                              colorFondo: palabraViewModel.coloresTeclas[index],
                              colorLetra: palabraViewModel.coloresTeclasLetras[index],
                              width: UIScreen.main.bounds.width / 11,
                              height: UIScreen.main.bounds.height / 15,
                              opacity: 1)
                    }
                    .disabled(palabraViewModel.coloresTeclas[index] == Color.gray)
                }
            }
            
            HStack(spacing: UIScreen.main.bounds.height * 0.0035) {
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width / 7.15,
                           height: UIScreen.main.bounds.height / 15)
                    .opacity(0)
                
                ForEach(20..<27) { index in
                    Button {
                        if palabraViewModel.palabra[0] == "" {
                            palabraViewModel.palabra[0] = palabraViewModel.letras[index]
                        } else if palabraViewModel.palabra[1] == "" {
                            palabraViewModel.palabra[1] = palabraViewModel.letras[index]
                        } else if palabraViewModel.palabra[2] == "" {
                            palabraViewModel.palabra[2] = palabraViewModel.letras[index]
                        } else if palabraViewModel.palabra[3] == "" {
                            palabraViewModel.palabra[3] = palabraViewModel.letras[index]
                        } else if palabraViewModel.palabra[4] == "" {
                            palabraViewModel.palabra[4] = palabraViewModel.letras[index]
                        }
                    } label: {
                        Tecla(palabraViewModel: palabraViewModel,
                              text: palabraViewModel.letras[index],
                              colorFondo: palabraViewModel.coloresTeclas[index],
                              colorLetra: palabraViewModel.coloresTeclasLetras[index],
                              width: UIScreen.main.bounds.width / 11,
                              height: UIScreen.main.bounds.height / 15,
                              opacity: 1)
                    }
                    .disabled(palabraViewModel.coloresTeclas[index] == Color.gray)
                }
                
                Button {
                    palabraViewModel.EraseLetters()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .frame(width: UIScreen.main.bounds.width / 7.15,
                               height: UIScreen.main.bounds.height / 15)
                        .foregroundColor(Color("ColorPrincipalBlanco"))
                        .background(Color("ColorPrincipalNegro"))
                        .cornerRadius(5)
                        .animation(palabraViewModel.animation)
                }
            }
            
            Button {
                palabraViewModel.IntroButton()
            } label: {
                Tecla(palabraViewModel: palabraViewModel,
                      text: "INTRO",
                      colorFondo: Color("ColorPrincipalNegro"),
                      colorLetra: Color("ColorPrincipalBlanco"),
                      width: UIScreen.main.bounds.width / 1.025,
                      height: UIScreen.main.bounds.height / 15,
                      opacity: palabraViewModel.CheckValidIntroDicc() ? 1.0 : 0.6)
            }
            .disabled(!palabraViewModel.CheckValidIntroDicc())
        }
        .foregroundColor(Color("ColorPrincipalBlanco"))
        .font(.system(size: UIScreen.main.bounds.height / 35,
                      weight: .light,
                      design: .monospaced))
        .disabled(palabraViewModel.showWinner)
    }
}

struct Teclado_Previews: PreviewProvider {
    static var previews: some View {
        VistaPrincipal()
    }
}
