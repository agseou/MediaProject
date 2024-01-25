//
//  OverViewTableViewCell.swift
//  MediaProject
//
//  Created by 은서우 on 2024/01/25.
//

import UIKit

class OverViewTableViewCell: UITableViewCell {

    @IBOutlet var overVIewTextView: UITextView!
    @IBOutlet var folderBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }

    func configureView() {
        folderBtn.setTitle("", for: .normal)
        folderBtn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        folderBtn.tintColor = .black
    }
    
    func setData(data: Result) {
        overVIewTextView.text = data.overview
    }
    
}
