//
//  MoviesViewController.swift
//  flixter_unit1
//
//  Created by William Matrix on 31/08/2021.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableView: UITableView!
    
    
    var movies = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //step3 cos its spice girls bitch
        
        TableView.dataSource = self
        TableView.delegate = self
        
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
                
                self.movies = dataDictionary["results"] as! [[String:Any]]
                
                self.TableView.reloadData()
             }
        }
        task.resume()
    }
    
    //step2 beesh
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let curMovie = movies[indexPath.row]
        let curMovieTitle = curMovie["original_title"] as! String
        let curMovieDesc = curMovie["overview"] as! String
        let curMovieRDate = curMovie["release_date"] as! String
        let curMoviePoster = curMovie["poster_path"] as! String
        let curMovieBackdrop = curMovie["backdrop_path"] as! String
        let curMovieVotes = curMovie["vote_count"]
        let curMoviePopularity = curMovie["popularity"]
        
        cell.TitleLabel.text = curMovieTitle
        cell.DescriptionLabel.text = curMovieDesc
        
        return cell
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
