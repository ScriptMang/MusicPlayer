//
//  LibraryVc.swift
//  interfaceDesignViaCode
//
//  Created by Andy Peralta on 11/24/20.
//

import UIKit

class LibraryVc: UIViewController, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

      //MARK: UIObject Creation
      let library = UIView()
      view.backgroundColor = .white
      library.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(library)

      // TextLabels
      let textLabel = UILabel()
      textLabel.translatesAutoresizingMaskIntoConstraints = false
      textLabel.text = "Hello IPhone User"
      textLabel.sizeToFit()
      view.addSubview(textLabel)

      let textLabel2 = UILabel()
      textLabel2.translatesAutoresizingMaskIntoConstraints = false
      textLabel2.text = "Welcome to constraints"
      textLabel2.sizeToFit()
      view.addSubview(textLabel2)



      
        // Do any additional setup after loading the view.
    }
    

}
