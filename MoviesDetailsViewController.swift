//
//  MoviesDetailsViewController.swift
//  Unit1 Project
//
//  Created by Juan Gonzalez on 9/19/21.
//

import UIKit
import Alamofire

class MoviesDetailsViewController: UIViewController {

    @IBOutlet weak var BackDropView: UIImageView!
    @IBOutlet weak var PosterView: UIImageView!
    @IBOutlet weak var TitleLable: UILabel!
    @IBOutlet weak var DescriptionLable: UILabel!
    @IBOutlet weak var RatingLable: UILabel!
    @IBOutlet weak var ReleaseDateLable: UILabel!
    @IBOutlet weak var LanguageLable: UILabel!
    
    var movie: [String:Any]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        TitleLable.text = movie["title"] as? String
        TitleLable.sizeToFit()
        DescriptionLable.text = movie["overview"] as? String
        DescriptionLable.sizeToFit()
        ReleaseDateLable.text = movie["release_date"] as? String
        ReleaseDateLable.sizeToFit()
        LanguageLable.text = movie["original_language"] as? String
        RatingLable.text = movie["vote_average"] as? String
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let baseURL1 = "https://image.tmdb.org/t/p/w1280"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        
        PosterView.af.setImage(withURL: posterURL!)
        
       
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: baseURL1 + backdropPath)
        
        BackDropView.af.setImage(withURL: backdropURL!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
