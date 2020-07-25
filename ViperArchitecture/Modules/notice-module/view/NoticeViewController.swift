//
//  ViewController.swift
//  VIPER-demo
//
//  Created by Jitender Kumar on 25/7/20.
//  Copyright © 2020 Jitender Kumar. All rights reserved.
//

import UIKit

class NoticeViewController: UIViewController {
    var presentor:NoticePresenter?
    @IBOutlet weak var uiTableView: UITableView!
    var noticeArrayList:Array<NoticeModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notice-Module"
        presentor?.startFetchingNotice()
        showProgressIndicator(view: self.view)
    }
}

extension NoticeViewController:ViewNoticeProtocol{
    func showNotice(noticeArray: Array<NoticeModel>) {
        self.noticeArrayList = noticeArray
        self.uiTableView.reloadData()
        hideProgressIndicator(view: self.view)
    }
    
    func showError() {
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension NoticeViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoticeCell
        cell.id.text = noticeArrayList[indexPath.row].id
        cell.title.text = noticeArrayList[indexPath.row].title
        cell.brief.text = noticeArrayList[indexPath.row].brief
        cell.file_source.text = noticeArrayList[indexPath.row].filesource
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentor?.showMovieController(navigationController: navigationController!)
    }
}

class NoticeCell:UITableViewCell{
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var brief: UILabel!
    @IBOutlet weak var file_source: UILabel!
}
