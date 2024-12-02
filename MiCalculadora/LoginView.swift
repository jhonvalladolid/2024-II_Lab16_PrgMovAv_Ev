//
//  LoginView.swift
//  MiCalculadora
//
//  Created by Mac05 on 2/12/24.
//

import SwiftUI

struct LoginView: View {
    @State private var usuario: String = ""
    @State private var contraseña: String = ""
    @State private var intentosLogin = 0
    @State private var mostrarAlerta = false
    @State private var mensajeAlerta = ""
    @State private var accesoConcedido = false // Para manejar la navegación

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Logo o Nombre de la App
                Text("MiCalculadora")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                // Campo de Usuario
                TextField("Teléfono, usuario o correo electrónico", text: $usuario)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .padding(.horizontal)
                
                // Campo de Contraseña
                SecureField("Contraseña", text: $contraseña)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .padding(.horizontal)
                
                // ¿Olvidaste tu Contraseña?
                HStack {
                    Spacer()
                    Button("¿Olvidaste tu contraseña?") {
                        mensajeAlerta = "Función no implementada todavía."
                        mostrarAlerta = true
                    }
                    .foregroundColor(.blue)
                    .font(.footnote)
                    .padding(.trailing)
                }
                
                // Botón de Iniciar Sesión
                Button(action: {
                    iniciarSesion()
                }) {
                    Text("Iniciar Sesión")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                // Separador O
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray.opacity(0.5))
                    Text("O")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray.opacity(0.5))
                }
                .padding(.horizontal)
                
                // Continuar con Facebook
                Button(action: {
                    mensajeAlerta = "Esta función está en desarrollo y será implementada próximamente."
                    mostrarAlerta = true
                }) {
                    HStack {
                        Image(systemName: "f.circle.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                        Text("Continuar con Facebook")
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                }
                
                Spacer()
                
                // Opción para Registrarse
                HStack {
                    Text("¿No tienes una cuenta?")
                    Button("Regístrate.") {
                        mensajeAlerta = "Esta función está en desarrollo y será implementada próximamente."
                        mostrarAlerta = true
                    }
                    .foregroundColor(.blue)
                    .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.bottom, 20)
                
                // Navegación condicional al HomeView
                NavigationLink(
                    destination: HomeView(),
                    isActive: $accesoConcedido
                ) {
                    EmptyView()
                }
            }
            .alert(isPresented: $mostrarAlerta) {
                Alert(title: Text("Información"), message: Text(mensajeAlerta), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    // Función para manejar el inicio de sesión
    func iniciarSesion() {
        if usuario.isEmpty || contraseña.isEmpty {
            mensajeAlerta = "Por favor, ingresa tu usuario y contraseña."
            mostrarAlerta = true
        } else if usuario == "jhon" && contraseña == "1234" {
            accesoConcedido = true
        } else {
            intentosLogin += 1
            if intentosLogin >= 3 {
                mensajeAlerta = "Demasiados intentos fallidos. Por favor, intenta más tarde."
            } else {
                mensajeAlerta = "Credenciales incorrectas. Intentos restantes: \(3 - intentosLogin)"
            }
            mostrarAlerta = true
        }
    }
}

#Preview {
    LoginView()
}
