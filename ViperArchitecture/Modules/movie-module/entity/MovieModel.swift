//
//  MovieModel.swift
//  VIPER-demo
//
//  Created by Jitender Kumar on 25/7/20.
//  Copyright © 2020 Jitender Kumar. All rights reserved.
//
import Foundation
import ObjectMapper

private let ID = "id"
private let TITLE = "title"
private let BRIEF = "brief"
private let IMAGESOURCE = "image_url"

class MovieModel:Mappable{
    
    internal var id:String?
    internal var title:String?
    internal var brief:String?
    internal var imagesource:String?
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map){
        id <- map[ID]
        title <- map[TITLE]
        brief <- map[BRIEF]
        imagesource <- map[IMAGESOURCE]
    }
    
}
