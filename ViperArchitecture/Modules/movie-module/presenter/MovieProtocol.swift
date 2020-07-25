//
//  MovieProtocol.swift
//  VIPER-demo
//
//  Created by Jitender Kumar on 25/7/20.
//  Copyright © 2020 Jitender Kumar. All rights reserved.
//

import Foundation

protocol MovieProtocol:class {
    var view: ViewMovieProtocol? {get set}
    var interactor: InteractorMovieProtocol? {get set}
    var router: RouterMovieProtocol? {get set}
    func startFetchingMovie()
}

protocol ViewMovieProtocol:class {
    func onMovieResponseSuccess(movieModelArrayList:Array<MovieModel>)
    func onMovieResponseFailed(error:String)
}

protocol RouterMovieProtocol:class {
    static func createMovieModule()->MovieViewController
}

protocol InteractorMovieProtocol:class {
    var presenter:PresenterMovieProtocol? {get set}
    func fetchMovie()
}

protocol PresenterMovieProtocol:class {
    func movieFetchSuccess(movieList:Array<MovieModel>)
    func movieFetchFailed()
}
