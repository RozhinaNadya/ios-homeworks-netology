//
//  InfoViewController.swift
//  Navigation
//
//  Created by Надежда on 25.10.2021.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {
    
    var backgroundColor: UIColor = .green
    
    var infoView: View = {
        let view = View(frame: .zero)
        return view
    }()
    
    override func loadView() {
        let view = ViewInfo()
        view.buttonInfo.addTarget(self, action: #selector(ButtonInfo), for: .touchUpInside)
        self.view = view
        view.backgroundColor = backgroundColor
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        infoView.backgroundColor = .darkGray
        view.addSubview(infoView)
    }
    
    @objc func ButtonInfo() {
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
