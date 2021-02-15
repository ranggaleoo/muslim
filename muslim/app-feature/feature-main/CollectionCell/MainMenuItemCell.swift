//
//  MainMenuItemCell.swift
//  muslim
//
//  Created by Rangga Leo on 14/02/21.
//

import UIKit

struct MainMenuItem {
    let icon: IImageName
    let title: String
}

class MainMenuItemCell: UICollectionViewCell {
    @IBOutlet weak var container_stack: UIStackView!
    @IBOutlet weak var btnMenu: UIMButtonIcon!
    @IBOutlet weak var lbl_title: UIMLabelTitle!
    
    struct source {
        static var nib: UINib = UINib(nibName: String(describing: MainMenuItemCell.self), bundle: Bundle(for: MainMenuItemCell.self))
        static var identifier: String = String(describing: MainMenuItemCell.self)
    }
    
    var item: MainMenuItem? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        container_stack.backgroundColor = .clear
        container_stack.spacing = 6
        
        lbl_title.setFontSize(10)
        lbl_title.textColor = UIMColor.mine_shaft.get()
        lbl_title.layer.masksToBounds = false
        lbl_title.textAlignment = .center
        lbl_title.numberOfLines = 0
    }
    
    private func updateUI() {
        let icon: IImageName = item?.icon ?? IImageName.btn_info
        let image = UIImage(identifierName: icon)?.withRenderingMode(.alwaysTemplate)
        btnMenu.setIcon(image: image)
        btnMenu.setInset(insets: UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12))
        btnMenu.setCornerRadius(radius: 10)
        
        lbl_title.text = item?.title
    }
}
