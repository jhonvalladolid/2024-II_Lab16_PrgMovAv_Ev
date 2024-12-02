//
//  HypotenuseView.swift
//  MiCalculadora
//
//  Created by Mac05 on 2/12/24.
//

import SwiftUI

struct HypotenuseView: View {
    @State private var catetoA: String = ""
    @State private var catetoB: String = ""
    @State private var hipotenusa: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Calculadora de Hipotenusa")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)

            // Triángulo rectángulo con etiquetas dinámicas
            ZStack {
                RightTriangle()
                    .stroke(Color.blue, lineWidth: 2)
                    .frame(width: 200, height: 200)

                // Etiquetas dinámicas
                if let aValue = Double(catetoA), let bValue = Double(catetoB), let cValue = Double(hipotenusa) {
                    // Cateto A
                    Text(String(format: "%.2f", aValue))
                        .font(.caption)
                        .foregroundColor(.black)
                        .rotationEffect(.degrees(-90))
                        .offset(x: -100, y: 40)

                    // Cateto B
                    Text(String(format: "%.2f", bValue))
                        .font(.caption)
                        .foregroundColor(.black)
                        .offset(x: 40, y: 100)

                    // Hipotenusa
                    Text(String(format: "%.2f", cValue))
                        .font(.caption)
                        .foregroundColor(.red)
                        .offset(x: -50, y: -50)
                }
            }

            // Campos de entrada
            VStack(spacing: 15) {
                CustomTextField(placeholder: "Ingrese el valor del cateto A", text: $catetoA)
                CustomTextField(placeholder: "Ingrese el valor del cateto B", text: $catetoB)
            }
            .padding(.horizontal)

            // Botones
            HStack(spacing: 15) {
                CustomButton(title: "Limpiar", backgroundColor: .gray) {
                    limpiar()
                }

                CustomButton(title: "Calcular", backgroundColor: .blue) {
                    calcularHipotenusa()
                }
            }
            .padding(.horizontal)

            // Resultado
            if !hipotenusa.isEmpty {
                Text("Hipotenusa: \(hipotenusa)")
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

    // Función para limpiar los campos
    func limpiar() {
        catetoA = ""
        catetoB = ""
        hipotenusa = ""
    }

    // Función para calcular la hipotenusa
    func calcularHipotenusa() {
        guard let aValue = Double(catetoA), let bValue = Double(catetoB) else {
            alertMessage = "Por favor, ingrese números válidos."
            showAlert = true
            return
        }

        let hipotenusaValue = sqrt(pow(aValue, 2) + pow(bValue, 2))
        hipotenusa = String(format: "%.2f", hipotenusaValue)
    }
}

// Dibujo de un triángulo rectángulo
struct RightTriangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY)) // Punto en la esquina inferior izquierda
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Línea hacia la derecha
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY)) // Línea hacia arriba
        path.closeSubpath() // Cierra el triángulo
        return path
    }
}

// Componente de vista previa
#Preview {
    HypotenuseView()
}
