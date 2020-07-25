//
//  FetchNoticeModel.swift
//  VIPER-demo
//
//  Created by Jitender Kumar on 25/7/20.
//  Copyright © 2020 Jitender Kumar. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class NoticeInteractor: InteractorNoticeProtocol {
    var presenter: PresenterNoticeProtocol?
    
    func fetchNotice() {
        Alamofire.request(API_NOTICE_LIST).responseJSON { response in
            if(response.response?.statusCode == 200){
                if let json = response.result.value as AnyObject? {
                    let arrayResponse = json["notice_list"] as! NSArray
                    let arrayObject = Mapper<NoticeModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                    self.presenter?.noticeFetchedSuccess(noticeModelArray: arrayObject)
                }
            }else {
                self.presenter?.noticeFetchFailed()
            }
        }
    }
}
