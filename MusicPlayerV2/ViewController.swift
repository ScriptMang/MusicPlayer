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
  private let  controllerView = PlayerControlsView()

  override func viewDidLoad() {
    super.viewDidLoad()

    //MARK: UIObject Creation
    controllerView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(controllerView)
    view.addSubview(playerView)
    view.backgroundColor = .black

    navigationItem.leftBarButtonItem =
        UIBarButtonItem(title: "Library", style: .plain, target: self, action: #selector(transitionToLibraryVC))
  }

//MARK: Push to a LibraryTableViewController
  @objc func transitionToLibraryVC() {
    navigationController?.pushViewController(libraryVC, animated: false)
  }
}

