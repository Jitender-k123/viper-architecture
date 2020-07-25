//
//  MovieViewController.swift
//  VIPER-demo
//
//  Created by Jitender Kumar on 25/7/20.
//  Copyright © 2020 Jitender Kumar. All rights reserved.
//


import UIKit
import Alamofire
import AlamofireImage

class MovieViewController: UIViewController {
    var moviePresenter:MovieProtocol?
    @IBOutlet weak var myTableView: UITableView!
    var arrayList:Array<MovieModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movie-Module"
        moviePresenter?.startFetchingMovie()
        showProgressIndicator(view: self.view)
        
    }
}

extension MovieViewController:ViewMovieProtocol{
    func onMovieResponseSuccess(movieModelArrayList: Array<MovieModel>) {
        self.arrayList = movieModelArrayList
        self.myTableView.reloadData()
        hideProgressIndicator(view: self.view)
    }
    
    func onMovieResponseFailed(error: String) {
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension MovieViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        cell.mTitle.text = arrayList[indexPath.row].title
        cell.mDescription.text = arrayList[indexPath.row].brief

        Alamofire.request(self.arrayList[indexPath.row].imagesource!).responseData { (response) in
            if response.error == nil {
                print(response.result)
                                if let data = response.data {
                    cell.mImageView.image = UIImage(data: data)
                }
            }
        }
        return cell
    }
}

class MovieCell:UITableViewCell{
    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mDescription: UILabel!
}
