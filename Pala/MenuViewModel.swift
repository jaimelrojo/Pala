//
//  MenuViewModel.swift
//  Pala
//
//  Created by Jaime Castañeda on 12/03/22.
//

import Foundation

class MenuViewModel: ObservableObject {
    
    @Published var anchoBoton: Double = 0.88
    @Published var altoBoton: Double = 0.08
    
    @Published var mostrarPalabraScore: Bool = true
    @Published var anchoScore: Double = 0.55
    @Published var conteoTimer: Timer?
    @Published var conteoCounter = 0
    
    func EraseWordPuntuacion() {
        conteoTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { index in
            if self.conteoCounter < 4 {
                self.conteoCounter += 1
            } else {
                self.conteoTimer?.invalidate()
                self.mostrarPalabraScore = false
                self.anchoScore = 0.20
                self.conteoCounter = 0
            }
        }
    }
    
    func TapPuntuacion() {
        if mostrarPalabraScore == false {
            mostrarPalabraScore = true
            anchoScore = 0.55
            conteoTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { index in
                if self.conteoCounter < 4 {
                    self.conteoCounter += 1
                } else {
                    self.conteoTimer?.invalidate()
                    self.mostrarPalabraScore = false
                    self.anchoScore = 0.20
                    self.conteoCounter = 0
                }
            }
        } else {
            conteoCounter = 0
        }
    }
}
