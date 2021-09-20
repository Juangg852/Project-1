//
//  MovieGridViewController.swift
//  Unit1 Project
//
//  Created by Juan Gonzalez on 9/19/21.
//

import UIKit
import Alamofire

class MovieGridViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        
        let movie = movies[indexPath.item]
        let baseURL = "https://image.tmdb.org/t/p/w1280"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        
        cell.PosterView.af.setImage(withURL: posterURL!)
        
        return cell
        
    }
    

    @IBOutlet weak var CollectionView: UICollectionView!
    
    
    var movies = [[String:Any]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()



        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        let layout = CollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 1

        let width = (view.frame.size.width - layout.minimumInteritemSpacing ) / 3
        layout.itemSize = CGSize(width: width, height: width * 3/2)
        
        
        let url = URL(string:"https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    
                
                self.movies = dataDictionary["results"] as! [[String:Any]]
                self.CollectionView.reloadData()
                
                    print(dataDictionary)
                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

             }
        }
        task.resume()// Do any additional setup after loading the view.
        }
}
