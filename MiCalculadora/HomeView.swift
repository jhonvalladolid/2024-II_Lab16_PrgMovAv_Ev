//
//  HomeView.swift
//  MiCalculadora
//
//  Created by Mac05 on 2/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Seleccione una Calculadora")
                    .font(.title)
                    .fontWeight(.semibold)

                // Botón para Ecuación de Segundo Grado
                NavigationLink(destination: EquationView()) {
                    Text("Ecuación de Segundo Grado")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                // Botón para Cálculo de Áreas
                NavigationLink(destination: AreasView()) {
                    Text("Cálculo de Áreas")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                // Botón para Cálculo de Hipotenusa
                NavigationLink(destination: HypotenuseView()) {
                    Text("Cálculo de Hipotenusa")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Menú Principal")
        }
    }
}

#Preview {
    HomeView()
}
