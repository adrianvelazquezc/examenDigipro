//
//  UsersInteractor.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import UIKit
import FirebaseFirestore

class UsersInteractor{
    var presenter: UsersPresenterProtocol?
    private var productsListener: ListenerRegistration?
}

extension UsersInteractor: UsersInteractorProtocol {
    func fetchUserList() {
        let collectionRef = Firestore.firestore().collection("Users")
        productsListener = collectionRef.addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                self.presenter?.responseError(tittle: "Error al obtener documentos", error: "\(error.localizedDescription)")
            } else {
                guard let documents = querySnapshot?.documents else {
                    self.presenter?.responseError(tittle: "Aviso", error: "No hay documentos en la colección")
                    return
                }
                var elements: [UserDatabase] = []
                for document in documents {
                    let data = document.data()
                    let user = UserDatabase( 
                        name: data["name"] as? String,
                        secondName: data["secondName"] as? String,
                        thirdName: data["thirdName"] as? String,
                        email: data["email"] as? String,
                        phone: data["phone"] as? String
                    )
                    elements.append(user)
                }
                self.presenter?.responseUserList(userList: elements)
            }
        }
    }
}
