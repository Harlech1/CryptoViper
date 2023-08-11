//
//  Presenter.swift
//  CryptoViper
//
//  Created by Turker Kizilcik on 11.08.2023.
//

import Foundation

// Class, protocol
// talks to interactor, router, view

enum NetworkError : Error {
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {
    var router : AnyRooter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>)
}

class CryptoPresenter : AnyPresenter {
    var router: AnyRooter?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
            case .success(let cryptos):
            view?.update(with: cryptos)
            case .failure(_):
            view?.update(with: "Try again later...")
        }
    }
    
    
}
