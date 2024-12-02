//
//  EquationView.swift
//  MiCalculadora
//
//  Created by Mac05 on 2/12/24.
//

import SwiftUI

struct EquationView: View {
    @State private var a: String = ""
    @State private var b: String = ""
    @State private var c: String = ""
    @State private var result: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Ecuación Cuadrática")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)

            // Ecuación visual
            Text("ax² + bx + c = 0")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.gray)

            // Campos de entrada
            VStack(spacing: 15) {
                CustomTextField(placeholder: "Ingrese el valor de a", text: $a)
                CustomTextField(placeholder: "Ingrese el valor de b", text: $b)
                CustomTextField(placeholder: "Ingrese el valor de c", text: $c)
            }
            .padding(.horizontal)

            // Botones de acción
            HStack(spacing: 15) {
                CustomButton(title: "Limpiar", backgroundColor: .gray) {
                    limpiar()
                }

                CustomButton(title: "Calcular", backgroundColor: .blue) {
                    calcularRaices()
                }
            }
            .padding(.horizontal)

            // Resultado
            if !result.isEmpty {
                Text(result)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .foregroundColor(.black)
            }

            Spacer()
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    // Funciones
    func limpiar() {
        a = ""
        b = ""
        c = ""
        result = ""
    }

    func calcularRaices() {
        guard let aValue = Double(a), let bValue = Double(b), let cValue = Double(c) else {
            alertMessage = "Por favor, ingrese números válidos."
            showAlert = true
            return
        }

        if aValue == 0 {
            alertMessage = "El valor de 'a' no puede ser 0."
            showAlert = true
            return
        }

        let discriminante = pow(bValue, 2) - (4 * aValue * cValue)
        if discriminante < 0 {
            result = "No tiene soluciones reales."
        } else {
            let x1 = (-bValue + sqrt(discriminante)) / (2 * aValue)
            let x2 = (-bValue - sqrt(discriminante)) / (2 * aValue)
            result = "Raíces: x1 = \(String(format: "%.2f", x1)), x2 = \(String(format: "%.2f", x2))"
        }
    }
}

// Componente personalizado de campo de texto
struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(.decimalPad)
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
    }
}

// Componente personalizado de botón
struct CustomButton: View {
    var title: String
    var backgroundColor: Color
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

#Preview {
    EquationView()
}
