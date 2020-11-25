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
    let v1 = UIView()
    v1.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(v1)

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

    // AlbumArt
    let musicHouseArt = UIImage(systemName: "music.note.house.fill")
    let albumArt = UIImageView(image: musicHouseArt)
    albumArt.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(albumArt)

    //transition LibraryVC
    view.backgroundColor = .white
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Library", style: .plain, target: self, action: #selector(transitionToLibraryVC))

    //MARK: Constraints
    NSLayoutConstraint.activate(
      [
        //Text Label Welcome
        textLabel.leadingAnchor.constraint(lessThanOrEqualTo: v1.leadingAnchor, constant: 120),
        textLabel.centerYAnchor.constraint(equalTo: v1.topAnchor, constant:  500),
        textLabel.trailingAnchor.constraint(lessThanOrEqualTo: v1.trailingAnchor, constant: 200),

        // TextLabel Welcome
        textLabel2.leadingAnchor.constraint(greaterThanOrEqualTo: v1.leadingAnchor, constant: 100),
        textLabel2.topAnchor.constraint(greaterThanOrEqualTo: textLabel.bottomAnchor, constant: 10),
        textLabel2.bottomAnchor.constraint(equalTo: v1.bottomAnchor, constant: 200),
        textLabel2.trailingAnchor.constraint(equalTo: v1.trailingAnchor, constant: 200),

        //Album Art
        albumArt.topAnchor.constraint(equalTo: v1.topAnchor, constant: 100),
        albumArt.leadingAnchor.constraint(equalTo: v1.leadingAnchor, constant: 50),
        albumArt.heightAnchor.constraint(equalToConstant:  320),
        albumArt.widthAnchor.constraint(equalToConstant:  320)

     ]
    )
    // Do any additional setup after loading the view.
  }

  @objc func transitionToLibraryVC() {
    navigationController?.pushViewController(LibraryVc(), animated: true)
  }

}

