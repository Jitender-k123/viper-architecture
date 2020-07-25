//
//  MoviePresenter.swift
//  VIPER-demo
//
//  Created by Jitender Kumar on 25/7/20.
//  Copyright © 2020 Jitender Kumar. All rights reserved.
//
import Foundation

class MoviePresenter:MovieProtocol{
    
    var view: ViewMovieProtocol?
    
    var interactor: InteractorMovieProtocol?
    
    var router: RouterMovieProtocol?
    
    func startFetchingMovie() {
        interactor?.fetchMovie()
    }
    
}

extension MoviePresenter:PresenterMovieProtocol{
    
    func movieFetchSuccess(movieList: Array<MovieModel>) {
        view?.onMovieResponseSuccess(movieModelArrayList: movieList)
    }
    
    func movieFetchFailed() {
        view?.onMovieResponseFailed(error: "Some Error message from api response")
    }
    
    
}
