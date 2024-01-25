//
//  CastInfoTableViewCell.swift
//  MediaProject
//
//  Created by 은서우 on 2024/01/25.
//

import UIKit
import Kingfisher

class CastInfoTableViewCell: UITableViewCell {

    @IBOutlet var castImageView: UIImageView!
    @IBOutlet var castNameLabel: UILabel!
    @IBOutlet var castDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        DispatchQueue.main.async {
            self.castImageView.layer.cornerRadius = 20
        }
        castImageView.contentMode = .scaleAspectFill
        castNameLabel.font = .boldSystemFont(ofSize: 16)
        castDetailLabel.textColor = .gray
        castDetailLabel.font = .systemFont(ofSize: 14)
    }

    
    func setData(data: Cast){
        castNameLabel.text = data.name
        castDetailLabel.text = data.character
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(data.profilePath!)")
        castImageView.kf.setImage(with: url)
    }
}
