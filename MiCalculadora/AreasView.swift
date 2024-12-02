//
//  AreasView.swift
//  MiCalculadora
//
//  Created by Mac05 on 2/12/24.
//

import SwiftUI

struct AreasView: View {
    @State private var radio: String = ""
    @State private var baseTriangulo: String = ""
    @State private var alturaTriangulo: String = ""
    @State private var baseRectangulo: String = ""
    @State private var alturaRectangulo: String = ""
    
    @State private var areaCirculo: Double? = nil
    @State private var areaTriangulo: Double? = nil
    @State private var areaRectangulo: Double? = nil
    
    @State private var mostrarAlerta = false
    @State private var mensajeAlerta = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Calculadora de Áreas")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                // Círculo
                VStack(alignment: .leading, spacing: 10) {
                    Text("Círculo")
                        .font(.headline)
                    
                    TextField("Radio", text: $radio)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Button(action: calcularAreaCirculo) {
                        Text("Calcular")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    if let area = areaCirculo {
                        Text("Área: \(String(format: "%.2f", area))")
                            .font(.subheadline)
                            .foregroundColor(.green)
                            .padding(.horizontal)
                    }
                }
                
                // Triángulo
                VStack(alignment: .leading, spacing: 10) {
                    Text("Triángulo")
                        .font(.headline)
                    
                    TextField("Base", text: $baseTriangulo)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    TextField("Altura", text: $alturaTriangulo)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Button(action: calcularAreaTriangulo) {
                        Text("Calcular")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    if let area = areaTriangulo {
                        Text("Área: \(String(format: "%.2f", area))")
                            .font(.subheadline)
                            .foregroundColor(.green)
                            .padding(.horizontal)
                    }
                }
                
                // Rectángulo
                VStack(alignment: .leading, spacing: 10) {
                    Text("Rectángulo")
                        .font(.headline)
                    
                    TextField("Base", text: $baseRectangulo)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    TextField("Altura", text: $alturaRectangulo)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Button(action: calcularAreaRectangulo) {
                        Text("Calcular")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    if let area = areaRectangulo {
                        Text("Área: \(String(format: "%.2f", area))")
                            .font(.subheadline)
                            .foregroundColor(.green)
                            .padding(.horizontal)
                    }
                }
            }
            .padding()
        }
        .alert(isPresented: $mostrarAlerta) {
            Alert(title: Text("Error"), message: Text(mensajeAlerta), dismissButton: .default(Text("OK")))
        }
    }
    
    // Función para calcular el área del círculo
    func calcularAreaCirculo() {
        guard let radioValue = Double(radio), radioValue > 0 else {
            mensajeAlerta = "Por favor, ingresa un valor válido para el radio."
            mostrarAlerta = true
            return
        }
        areaCirculo = Double.pi * pow(radioValue, 2)
    }
    
    // Función para calcular el área del triángulo
    func calcularAreaTriangulo() {
        guard let baseValue = Double(baseTriangulo), baseValue > 0,
              let alturaValue = Double(alturaTriangulo), alturaValue > 0 else {
            mensajeAlerta = "Por favor, ingresa valores válidos para la base y la altura."
            mostrarAlerta = true
            return
        }
        areaTriangulo = (baseValue * alturaValue) / 2
    }
    
    // Función para calcular el área del rectángulo
    func calcularAreaRectangulo() {
        guard let baseValue = Double(baseRectangulo), baseValue > 0,
              let alturaValue = Double(alturaRectangulo), alturaValue > 0 else {
            mensajeAlerta = "Por favor, ingresa valores válidos para la base y la altura."
            mostrarAlerta = true
            return
        }
        areaRectangulo = baseValue * alturaValue
    }
}

#Preview {
    AreasView()
}
