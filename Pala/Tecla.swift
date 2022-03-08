//
//  Tecla.swift
//  Pala
//
//  Created by Jaime Castañeda on 01/03/22.
//

import SwiftUI

struct Tecla: View {
    
    let text: String
    let color: Color
    let width: Double
    let height: Double
    
    var body: some View {
        Text(text)
            .frame(width: width,
                   height: height)
            .foregroundColor(Color("ColorPrincipalBlanco"))
            .background(color)
            .cornerRadius(5)
            .animation(.spring(response: 0.5, dampingFraction: 0.7))
    }
}

struct Tecla_Previews: PreviewProvider {
    static var previews: some View {
        Tecla(text: "A",
              color: Color.red,
              width: UIScreen.main.bounds.width / 11,
              height: UIScreen.main.bounds.height / 13)
    }
}
