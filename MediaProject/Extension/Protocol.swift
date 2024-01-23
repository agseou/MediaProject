//
//  Protocol.swift
//  MediaProject
//
//  Created by 은서우 on 2024/01/18.
//

import UIKit

protocol ReusableProtocol {
    static var identifier: String { get }
}

extension UITableViewCell: ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
