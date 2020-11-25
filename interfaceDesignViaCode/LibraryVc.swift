//
//  LibraryVc.swift
//  interfaceDesignViaCode
//
//  Created by Andy Peralta on 11/24/20.
//

import UIKit

class LibraryVc: UIViewController {

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
