//
//  MovieInteractor.swift
//  VIPER-demo
//
//  Created by Jitender Kumar on 25/7/20.
//  Copyright © 2020 Jitender Kumar. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class MovieInteractor:InteractorMovieProtocol{    
    
    var presenter: PresenterMovieProtocol?
    
    func fetchMovie() {
        
        Alamofire.request(API_MOVIE_LIST).responseJSON { response in
            
            if(response.response?.statusCode == 200){
                if let json = response.result.value as AnyObject? {
                    let arrayResponse = json["movie_list"] as! NSArray
                    let arrayObject = Mapper<MovieModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                    self.presenter?.movieFetchSuccess(movieList: arrayObject)
                }
            }else {
                self.presenter?.movieFetchFailed()
            }
        }
        
    }
    
    
    
    
}
