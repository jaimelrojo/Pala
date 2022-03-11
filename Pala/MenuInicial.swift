//
//  MenuInicial.swift
//  Pala
//
//  Created by Jaime Castañeda on 10/03/22.
//

import SwiftUI

struct MenuInicial: View {
    var body: some View {
        ZStack{
            
            Color("ColorPrincipalNegro")
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Logo()
            }
            
        }
    }
}

struct MenuInicial_Previews: PreviewProvider {
    static var previews: some View {
        MenuInicial()
    }
}
