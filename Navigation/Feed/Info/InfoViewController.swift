//
//  InfoViewController.swift
//  Navigation
//
//  Created by Надежда on 25.10.2021.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {
    
    var backgroundColor: UIColor = .white
    
    override func loadView() {
        let view = ViewInfo()
        self.view = view
        view.backgroundColor = backgroundColor
        view.buttonInfo.onTap = {
            self.ButtonInfo()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func ButtonInfo() {
        let alert = UIAlertController(title: "Справка", message: "Здесь можно добавить новый пост. Пожалуйста, пишите грамотно и по делу", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Отмена", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"Отмена\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
