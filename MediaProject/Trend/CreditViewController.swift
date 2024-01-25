//
//  CreditViewController.swift
//  MediaProject
//
//  Created by 은서우 on 2024/01/25.
//

import UIKit

class CreditViewController: UIViewController {
    
    enum credit: CaseIterable {
        case Header
        case OverView
        case Cast
        
        var title: String? {
            switch self {
            case .Header:
                return nil
            case .OverView:
                return "OverView"
            case .Cast:
                return "Cast"
            }
        }
    }
    
    @IBOutlet var creditTableView: UITableView!
    var castList: [Cast] = []
    var movieID: Int = 0
    var movieInfo: Result?
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
        //creditTableView.rowHeight = UIScreen.main.bounds.height/8
    }
    
    func registerXIB() {
        let xib = UINib(nibName: CastInfoTableViewCell.identifier, bundle: nil)
        creditTableView.register(xib, forCellReuseIdentifier: CastInfoTableViewCell.identifier)
        let xib2 = UINib(nibName: OverViewTableViewCell.identifier, bundle: nil)
        creditTableView.register(xib2, forCellReuseIdentifier: OverViewTableViewCell.identifier)
        let xib3 = UINib(nibName: HeaderTableViewCell.identifier, bundle: nil)
        creditTableView.register(xib3, forCellReuseIdentifier:         HeaderTableViewCell.identifier)
    }

}

extension CreditViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch credit.allCases[indexPath.section] {
        case .Header:
            return 200
        case .OverView:
                return 100
        case .Cast:
            return UIScreen.main.bounds.height/8
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return credit.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return credit.allCases[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch credit.allCases[section] {
            case .Header:
                return 1
            case .OverView:
                    return 1
            case .Cast:
                return castList.count
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch credit.allCases[indexPath.section] {
            case .Header:
                let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier, for: indexPath) as! HeaderTableViewCell
                    
                cell.setData(data: movieInfo!)
                    
                    return cell
            case .OverView:
                let cell = tableView.dequeueReusableCell(withIdentifier: OverViewTableViewCell.identifier, for: indexPath) as! OverViewTableViewCell
                    
                    cell.setData(data: movieInfo!)
                    
                    return cell
                
            case .Cast:
                   let cell = tableView.dequeueReusableCell(withIdentifier: CastInfoTableViewCell.identifier, for: indexPath) as! CastInfoTableViewCell
                   
                   cell.setData(data: castList[indexPath.row])
                   
                   return cell
            }
    }
    
    
}
