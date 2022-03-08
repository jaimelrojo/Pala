//
//  Cubitos.swift
//  Pala
//
//  Created by Jaime Castañeda on 22/02/22.
//

import SwiftUI

struct Cubito: View {
    
    let text: String
    let colorLetra: Color
    let colorFondo: Color
    let width: Double
    
    var body: some View {
        Text(text)
            .font(.system(size: UIScreen.main.bounds.height / 30,
                          weight: .regular,
                          design: .monospaced))
            .foregroundColor(colorLetra)
            .frame(width: width,
                    height: UIScreen.main.bounds.width / 5.8)
//            .animation(.default)
//            .animation(.spring(response: 0.7, dampingFraction: 0.7))
            .background(colorFondo)
            .cornerRadius(5)
    }
}

struct Cubito_Previews: PreviewProvider {
    static var previews: some View {
        Juego()
    }
}
