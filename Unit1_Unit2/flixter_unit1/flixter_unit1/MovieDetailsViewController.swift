//
//  MovieDetailsViewController.swift
//  flixter_unit1
//
//  Created by William Matrix on 17/09/2021.
//

import UIKit
import AlamofireImage


class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var backDropView: UIImageView!
    
    @IBOutlet weak var posterView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var synopLabel: UILabel!
    
    
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.layer.cornerRadius = 5
        titleLabel.layer.masksToBounds = true

        synopLabel.layer.cornerRadius = 5
        synopLabel.layer.masksToBounds = true

        
        titleLabel.text = movie["original_title"] as? String
        synopLabel.text = movie["overview"] as? String
        
        let bdpth = movie["backdrop_path"] as! String
        let pospth = movie["poster_path"] as! String
        let baseUrl = "https://image.tmdb.org/t/p/w300"
        
        let backdropUrl = URL(string: baseUrl + bdpth)
        let posterUrl = URL(string: baseUrl + pospth)
        
        
        
        posterView.af_setImage(withURL: posterUrl!)
        backDropView.af_setImage(withURL: backdropUrl!)
    
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
