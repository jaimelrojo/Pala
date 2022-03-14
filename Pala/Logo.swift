//
//  Logo.swift
//  Pala
//
//  Created by Jaime Castañeda on 21/02/22.
//

import SwiftUI

struct Logo: View {
    
    let colorLetras: Color
    let animacion: Animation
    
    var body: some View {
        VStack(spacing: UIScreen.main.bounds.height * 0.01) {
            HStack {
                Image(systemName: "eye.fill")
                Image(systemName: "eye")
            }
            Text("Rueda de la fortuna")
            HStack {
                Image(systemName: "eye")
                Image(systemName: "eye.fill")
            }
        }
        .foregroundColor(colorLetras)
        .font(.system(size: UIScreen.main.bounds.height / 40,
                      weight: .light,
                      design: .monospaced))
        .animation(animacion)
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo(colorLetras: Color("ColorPrincipalBlanco"), animacion: .spring())
    }
}
