//
//  ViewController.swift
//  interfaceDesignViaCode
//
//  Created by Andy Peralta on 11/21/20.
//

import UIKit
class ViewController: UIViewController, UINavigationControllerDelegate {
  private lazy var libraryVC: LibraryTableViewController = {
        let libraryVC = LibraryTableViewController()
        libraryVC.delegate = playerView
        return libraryVC
    }()

  private let playerView = PlayerUIView()

  override func viewDidLoad() {
    super.viewDidLoad()

    //MARK: UIObject Creation
    playerView.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(playerView)
    view.backgroundColor = .black

    navigationItem.leftBarButtonItem =
        UIBarButtonItem(title: "Library", style: .plain, target: self, action: #selector(transitionToLibraryVC))

    NSLayoutConstraint.activate([
        //PlayerViewFrame
        playerView.heightAnchor.constraint(equalToConstant: self.view.frame.height),
        playerView.widthAnchor.constraint(equalToConstant: self.view.frame.width)
    ])


  }

//MARK: Push to a LibraryTableViewController
  @objc func transitionToLibraryVC() {
    navigationController?.pushViewController(libraryVC, animated: false)
  }
}

