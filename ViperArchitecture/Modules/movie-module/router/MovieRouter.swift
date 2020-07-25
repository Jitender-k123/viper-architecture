//
//  MovieRouter.swift
//  VIPER-demo
//
//  Created by Jitender Kumar on 25/7/20.
//  Copyright © 2020 Jitender Kumar. All rights reserved.
//


import Foundation
import UIKit

class MovieRouter:RouterMovieProtocol{
    static func createMovieModule() -> MovieViewController {
        let view = MovieRouter.mainstoryboard.instantiateViewController(withIdentifier: "MovieViewController") as! MovieViewController
        let presenter = MoviePresenter()
        let interactor = MovieInteractor()
        
        view.moviePresenter = presenter
        presenter.view = view
        presenter.router = MovieRouter()
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
