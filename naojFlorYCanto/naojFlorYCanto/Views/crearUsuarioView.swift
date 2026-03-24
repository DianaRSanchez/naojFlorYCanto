//
//  crearUsuarioView.swift
//  naojFlorYCanto
//
//  Created by CEDAM22 on 23/03/26.
//

import SwiftUI

struct crearUsuarioView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(spacing: 20) {
                    Text("Crear Cuenta")
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)

                    Group {
                        Text("Usuario")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Usuario", text: .constant(""))
                            .font(.title3)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }

                    Group {
                        Text("Correo")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Correo", text: .constant(""))
                            .font(.title3)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                    }

                    Group {
                        Text("Celular")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Celular", text: .constant(""))
                            .font(.title3)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .keyboardType(.phonePad)
                    }

                    Group {
                        Text("Contraseña")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                        SecureField("Contraseña", text: .constant(""))
                            .font(.title3)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }

                    Group {
                        Text("Confirmar contraseña")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                        SecureField("Contraseña", text: .constant(""))
                            .font(.title3)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }

                    Group {
                        Text("Fecha de Nacimiento")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                        DatePicker("Fecha", selection: .constant(Date()), displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .labelsHidden()
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    }

                    NavigationLink(destination: iniciarSesionView()) {
                        Text("Registrar Usuario")
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                            .background(Color(.systemGray5))
                            .foregroundColor(.black)
                            .cornerRadius(16)
                            .font(.title2.bold())
                            .padding(.horizontal, 40)
                            .padding(.vertical, 10)
                    }
                }
                .padding(.horizontal, 40)
                .frame(maxWidth: 500)
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    crearUsuarioView()
}
