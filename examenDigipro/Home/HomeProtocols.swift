//
//  HomeProtocols.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    func requestShowAlert()
}

protocol HomeRouterProtocol: AnyObject {
    func navigateShowAlert()
}
