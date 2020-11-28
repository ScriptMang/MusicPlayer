//
//  LibraryVc.swift
//  interfaceDesignViaCode
//
//  Created by Andy Peralta on 11/24/20.
//

import UIKit
import MediaPlayer
class LibraryVc: UIViewController, UITableViewDelegate, UITableViewDataSource {

  override func loadView() {
      super.loadView()
    }


      override func viewDidLoad() {
        super.viewDidLoad()
      //MARK: UIObject Creation
      let library = UIView()
      view.backgroundColor = .white
      library.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(library)

//        let child = AlbumTableViewController()
//        self.addChild(child)
//        self.view.addSubview(child.view)
//        child.view.frame = self.view.frame
//        child.didMove(toParent: self)

      }

  let mediaItems = MPMediaQuery.songs().items!
  let tableview = UITableView()
  let cellID =  "albumCell"


  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

  }

}
