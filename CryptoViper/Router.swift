//
//  Router.swift
//  CryptoViper
//
//  Created by Turker Kizilcik on 11.08.2023.
//

import Foundation
import UIKit

//Class, protocol
//EntryPoint
typealias EntryPoint = AnyView & UIViewController

protocol AnyRooter {
    var entry : EntryPoint? {get}
    static func startExecution() -> AnyRooter
}


class CryptoRooter : AnyRooter {
    
    var entry : EntryPoint?
    
    static func startExecution() -> AnyRooter {
        
        let router = CryptoRooter()
        
        var view : AnyView = CryptoViewController()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.entry = view as? EntryPoint
        return router
    }
    
    
}
