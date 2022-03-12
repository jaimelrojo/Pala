//
//  Logo.swift
//  Pala
//
//  Created by Jaime Castañeda on 21/02/22.
//

import SwiftUI

struct Logo: View {
    
    let colorLetras: Color
    var animation: Animation = .spring(response: 0.7, dampingFraction: 0.8)
    
    var body: some View {
        VStack(spacing: 10) {
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
        .animation(animation)
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo(colorLetras: Color("ColorPrincipalBlanco"))
    }
}
