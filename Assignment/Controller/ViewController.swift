//
//  ViewController.swift
//  Assignment
//
//  Created by Chandan on 27/02/22.
//

import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet weak var moviesTableview: UITableView!
    var currentPage = 1
    var totalPage = 0
    var isFetching = false
    var moviesList : [Result] = []
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUpTableView()
      
        activityIndicator.color = UIColor.black
        activityIndicator.center = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2)
                     view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        getData()
       
    }

    
    func setUpTableView()
    
    {
        moviesTableview.delegate = self
        moviesTableview.dataSource = self
        moviesTableview.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "cell")
        moviesTableview.register(UINib(nibName: "LoadMoreCell", bundle: nil), forCellReuseIdentifier: "moreCell")
    }
    
    func getData()
    {
        
       
        let manager = ApiManager()
        manager.getMoview(page: currentPage) { [ self] (response) in
            totalPage = response.totalResults
            if let movies = response.results
            {
                moviesList.append(contentsOf: movies)
                DispatchQueue.main.async {
                    activityIndicator.stopAnimating()
                    isFetching = false
                    moviesTableview.reloadData()
                }
            }
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if (offsetY > contentHeight - scrollView.frame.height * 0.96) && !isFetching  {
            if currentPage != totalPage {
            getData()
            }
        }
    }


}



extension ViewController : UITableViewDataSource


{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if totalPage <= currentPage
        {
            
            return 1
        }
        else
        {
            return 2
        }
       
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if section  == 0
        {
            return self.moviesList.count
            
        }
        else
        {
            return  1
            
        }
      
            
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
        let cell = moviesTableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MovieCell
        cell?.SetData(data: moviesList[indexPath.row])
        
        return cell!
        }
            
            else
            {
        
            let cell = moviesTableview.dequeueReusableCell(withIdentifier: "moreCell", for: indexPath) as? LoadMoreCell
                
            cell?.activityIndicator.startAnimating()
            return cell!
        }
    }
    
 
    
    
    }
    


extension ViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return UITableView.automaticDimension
        }
        else
        {
            return 65
        }
    }
}
