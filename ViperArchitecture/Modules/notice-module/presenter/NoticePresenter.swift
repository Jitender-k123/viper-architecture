//
//  LoginPresenter.swift
//  VIPER-demo
//
//  Created by Jitender Kumar on 25/7/20.
//  Copyright © 2020 Jitender Kumar. All rights reserved.
//

import Foundation
import UIKit

class NoticePresenter: NoticeProtocol {
    var view: ViewNoticeProtocol?
    var interactor: InteractorNoticeProtocol?
    var router: RouterNoticeProtocol?
   
    func startFetchingNotice() {
        interactor?.fetchNotice()
    }
    func showMovieController(navigationController: UINavigationController) {
        router?.pushToMovieScreen(navigationConroller:navigationController)
    }
}

extension NoticePresenter: PresenterNoticeProtocol{
    func noticeFetchedSuccess(noticeModelArray: Array<NoticeModel>) {
        view?.showNotice(noticeArray: noticeModelArray)
    }
    
    func noticeFetchFailed() {
        view?.showError()
    }
}
