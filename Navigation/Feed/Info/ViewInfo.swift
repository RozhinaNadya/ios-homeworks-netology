//
//  ViewInfo.swift
//  Navigation
//
//  Created by Надежда on 26.10.2021.
//

import UIKit

class ViewInfo: UIView {
    
    var orbitalPeriod: String?
    
    var buttonInfo: CustomButton = {
        let button = CustomButton(title: "Подробне")
        return button
    }()
    
    var requestLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.toAutoLayout()
        return label
    }()
    
    var tatooineLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.toAutoLayout()
        return label
    }()
    
    private let networkService: NetworkServiceInfoProtocol = NetworkServiceInfo()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayoutButtonInfo()
        fetchData()
        fetchPlanetWithDeccoder()
    }
    
    private func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/10") else {return}
        self.networkService.request(url: url) {
            result in
            switch result {
            case .success(let data):
                print("SUCCESS", String(data: data, encoding: .utf8))
                do {
                    let object = try JSONSerialization.jsonObject(with: data, options: [])
                    print("OBJECT", object)
                    
                    if let dictionary = object as? [String: Any] {
                        guard let textLabel = dictionary["title"] else {return}
                        self.requestLabel.text = textLabel as? String
                    }
                } catch let error {
                    print("ERROR", error)
                }
            case .failure(let error):
                print("FAILURE", error)
            }
        }
    }
    
    private func fetchPlanetWithDeccoder() {
        guard let url = URL(string: "https://swapi.dev/api/planets/1") else {return}
        self.networkService.request(url: url) {
            [weak self] result in
            switch result {
            case .success(let data):
                do {
                let planet = try JSONDecoder().decode(Planet.self, from: data)
                print("SUCCESS fetchPlanetWithDeccoder", dump(planet))
                        self?.tatooineLabel.text = "The period of revolution of the planet Tatooine around its star: \(planet.orbital_period)"
                } catch let error {
                    print("ERROR", error)
                }
            case .failure(let error):
                print("FAILURE", error)
            }
        }
    }
    
    func configureLayoutButtonInfo() {
        addSubviews([buttonInfo, requestLabel, tatooineLabel])
        let constrInfo: [NSLayoutConstraint] = [
            buttonInfo.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonInfo.heightAnchor.constraint(equalToConstant: 50),
            buttonInfo.widthAnchor.constraint(equalToConstant: 200),
            
            requestLabel.topAnchor.constraint(equalTo: buttonInfo.bottomAnchor, constant: 20),
            requestLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            requestLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            tatooineLabel.topAnchor.constraint(equalTo: requestLabel.bottomAnchor, constant: 20),
            tatooineLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tatooineLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

        ]
        NSLayoutConstraint.activate(constrInfo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
