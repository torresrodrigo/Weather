//
//  FavoritesCell.swift
//  weather
//
//  Created by Rodrigo Torres on 09/11/2021.
//

import UIKit


protocol FavoritesCellDelegate {
    func delete(name: String)
}


class FavoritesCell: UITableViewCell {
    
    var delegate: FavoritesCellDelegate?
    
    static let identifier = String(describing: FavoritesCell.self)
    static func nib() -> UINib {
        return UINib(nibName: String(describing: FavoritesCell.self), bundle: nil)
    }
    
    @IBOutlet weak var nameCityLabel: UILabel!
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        print("Pressed")
        if let namePlace = nameCityLabel.text {
            delegate?.delete(name: namePlace)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(data: Locations) {
        nameCityLabel.text = data.name
    }
    
}
