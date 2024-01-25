//
//  CreditViewController.swift
//  MediaProject
//
//  Created by 은서우 on 2024/01/25.
//

import UIKit

class CreditViewController: UIViewController {
    
    @IBOutlet var creditTableView: UITableView!
    var castList: [Cast] = []
    var movieID: Int = 0
    var overView: String = ""
    let creditManager = CreditAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        registerXIB()
        creditManager.callRequest(id: movieID) { Credit in
            self.castList = Credit.cast
            self.creditTableView.reloadData()
        }
    }
    
    
    func configureView() {
        creditTableView.delegate = self
        creditTableView.dataSource = self
        creditTableView.rowHeight = UIScreen.main.bounds.height/8
    }
    
    func registerXIB() {
        let xib = UINib(nibName: CastInfoTableViewCell.identifier, bundle: nil)
        creditTableView.register(xib, forCellReuseIdentifier: CastInfoTableViewCell.identifier)
    }

}

extension CreditViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Cast"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return castList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CastInfoTableViewCell.identifier, for: indexPath) as! CastInfoTableViewCell
        
        cell.setData(data: castList[indexPath.row])
        
        return cell
    }
    
    
}
