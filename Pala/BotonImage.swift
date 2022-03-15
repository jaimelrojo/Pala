//
//  BotonImage.swift
//  Pala
//
//  Created by Jaime Castañeda on 15/03/22.
//

import SwiftUI

struct BotonImage: View {
    
    let imagen: String
    let color: Color
    let ancho: Double
    let altura: Double
    let animacion: Animation
    
    var body: some View {
        Image(imagen)
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

struct BotonImage_Previews: PreviewProvider {
    static var previews: some View {
        BotonImage(imagen: "instagram", color: .red, ancho: 0.2, altura: 0.2, animacion: .spring())
    }
}
