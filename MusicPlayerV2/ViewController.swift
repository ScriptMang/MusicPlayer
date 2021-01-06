//
//  ViewController.swift
//  interfaceDesignViaCode
//
//  Created by Andy Peralta on 11/21/20.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()

    //MARK: UIObject Creation
    let playerView = PlayerUI().view!
    self.view.addSubview(playerView)
    view.backgroundColor = .black

    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Library", style: .plain, target: self, action: #selector(transitionToLibraryVC))
  }

//MARK: Push to a LibraryTableViewController
  @objc func transitionToLibraryVC() {
    navigationController?.pushViewController(LibraryTableViewController(), animated: false)
  }

}

