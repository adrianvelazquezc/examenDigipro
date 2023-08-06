//
//  RegisterInteractor.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class RegisterInteractor{
    var presenter: RegisterPresenterProtocol?
    let db = Firestore.firestore()
}

extension RegisterInteractor: RegisterInteractorProtocol {
    func postNewUser(model: UserDatabase) {
            db.collection("Users").addDocument(data: [
                "name": model.name,
                "secondName": model.secondName,
                "thirdName": model.thirdName,
                "email": model.email,
                "phone": model.phone
            ]) { error in
                if let e = error {
                    self.presenter?.responseUser(tittle: "Hubo un error", message: "\(e)")
                } else {
                    self.presenter?.responseUser(tittle: "Bienvenido", message: "Usuario creado sin problemas")
                }
            }
    }
    
    
}
