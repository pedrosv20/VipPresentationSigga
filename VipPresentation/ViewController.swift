//
//  ViewController.swift
//  VipPresentation
//
//  Created by Pedro Vargas on 02/04/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        setupButtons()
    }
    
    func setupButtons() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.setTitle("GoToVipScene", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(didTapGoToVipSceneButton), for: .touchUpInside)
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc func didTapGoToVipSceneButton() {
        let viewController = BaseMenuAssembler().resolveViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    


}

