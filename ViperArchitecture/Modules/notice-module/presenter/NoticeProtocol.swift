//
//  login-protocols.swift
//  VIPER-demo
//
//  Created by Jitender Kumar on 25/7/20.
//  Copyright © 2020 Jitender Kumar. All rights reserved.
//

import Foundation
import UIKit

protocol NoticeProtocol: class {
    var view: ViewNoticeProtocol? {get set}
    var interactor: InteractorNoticeProtocol? {get set}
    var router: RouterNoticeProtocol? {get set}
    
    func startFetchingNotice()
    func showMovieController(navigationController:UINavigationController)
}

protocol ViewNoticeProtocol: class{
    func showNotice(noticeArray:Array<NoticeModel>)
    func showError()
}

protocol InteractorNoticeProtocol: class {
    var presenter:PresenterNoticeProtocol? {get set}
    func fetchNotice()
}

protocol RouterNoticeProtocol: class {
    static func createModule()-> NoticeViewController
    func pushToMovieScreen(navigationConroller:UINavigationController)
}

protocol PresenterNoticeProtocol: class {
    func noticeFetchedSuccess(noticeModelArray:Array<NoticeModel>)
    func noticeFetchFailed()
}
