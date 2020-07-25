//
//  NoticeRouter.swift
//  VIPER-demo
//
//  Created by Jitender Kumar on 25/7/20.
//  Copyright © 2020 Jitender Kumar. All rights reserved.
//

import Foundation
import UIKit

class NoticeRouter: RouterNoticeProtocol{
    static func createModule() -> NoticeViewController {
        let viewController = mainstoryboard.instantiateViewController(withIdentifier: "MyViewController") as! NoticeViewController
        let presenter = NoticePresenter()
        let interactor = NoticeInteractor()
        
        viewController.presentor = presenter
        presenter.view = viewController
        presenter.router = NoticeRouter()
        presenter.interactor = interactor
        interactor.presenter = presenter
        return viewController
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToMovieScreen(navigationConroller navigationController:UINavigationController) {
        let movieModue = MovieRouter.createMovieModule()
        navigationController.pushViewController(movieModue,animated: true)
    }
}
