//
//  ViewController.swift
//  JointMap
//
//  Created by Aleksey Kayryak on 19.01.2021.
//

import UIKit

class ViewController: UIViewController {
    private lazy var services: ApplicationServices = {
        let app = UIApplication.shared.delegate as! AppDelegate
        return app.services
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let roads = services.localDataSource.railroadRepository.getRailroads()
        var message = ""
        roads.forEach {
            message.append("\($0.name)\n")
        }
        
        let alert = UIAlertController(title: "Дороги", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

