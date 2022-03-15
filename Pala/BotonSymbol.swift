//
//  BotonSymbol.swift
//  Pala
//
//  Created by Jaime Castañeda on 15/03/22.
//

import SwiftUI

struct BotonSymbol: View {
    
    let simbolo: String
    let color: Color
    let ancho: Double
    let altura: Double
    let animacion: Animation
    
    var body: some View {
        Image(systemName: simbolo)
            .resizable()
            .scaledToFit()
            .foregroundColor(color)
            .font(.system(size: UIScreen.main.bounds.height / 40,
                          weight: .light,
                          design: .monospaced))
            .frame(width: UIScreen.main.bounds.width * ancho,
                   height: UIScreen.main.bounds.width * altura)
            .animation(animacion)
    }
}

struct BotonSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BotonSymbol(simbolo: "xmark", color: .red, ancho: 0.3, altura: 0.3, animacion: .spring())
    }
}
