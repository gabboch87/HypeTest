//
//  Extensions.swift
//  TestHype
//
//  Created by ulixe on 08/09/2021.
//

import Foundation
import UIKit

extension UITableView {
    func setup(vc: UIViewController){
        self.delegate = vc as? UITableViewDelegate
        self.dataSource = vc as? UITableViewDataSource
        self.translatesAutoresizingMaskIntoConstraints = false
        self.separatorColor = .clear
        self.frame = vc.view.bounds
        self.backgroundColor = .white
        let imgview = UIImageView(image: #imageLiteral(resourceName: "nbaLogo"))
        imgview.contentMode = .scaleAspectFill
        self.backgroundView = imgview
    }
}

extension UIViewController {
    func loader() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Attendere prego..", preferredStyle: .alert)
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        indicator.hidesWhenStopped = true
        if #available(iOS 13.0, *) {
            indicator.style = .large
        }
        indicator.startAnimating()
        alert.view.addSubview(indicator)
        present(alert, animated: true, completion: nil)
        return alert
    }
    
    func stopLoader(loader: UIAlertController) {
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }
    
    ///alert to retry
    func showErrorAlert(title: String, message: String?, retry: Bool = false, retryCompletion: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if retry {
            alert.addAction(UIAlertAction(title: "Riprova", style: .default, handler: { action in
                retryCompletion()
            }))
        }
        alert.addAction(UIAlertAction(title: "Chiudi", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
