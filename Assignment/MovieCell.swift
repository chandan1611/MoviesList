//
//  MovieCell.swift
//  Assignment
//
//  Created by Chandan on 27/02/22.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var lblLang: UILabel!
    @IBOutlet weak var lblPopularity: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func SetData(data : Result)
    {
        lbltitle.text = "Title: \(data.title)"
        lblId.text = "Id: \(String(data.id))"
        lblPopularity.text = "Popularity: \(String(data.popularity))"
        lblLang.text = "Language: \(data.originalLanguage)"
    }
    
    
}
