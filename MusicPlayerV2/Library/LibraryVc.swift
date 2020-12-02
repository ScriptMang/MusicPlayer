//
//  LibraryVc.swift
//  interfaceDesignViaCode
//
//  Created by Andy Peralta on 11/24/20.
//

import UIKit
import MediaPlayer
class LibraryVc: UITableViewController {




      override func viewDidLoad() {
        super.viewDidLoad()
      //MARK: UIObject Creation

      let libryTableView = UITableView()
      libryTableView.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .white
      libryTableView.dataSource = self
      libryTableView.delegate = self
      view.addSubview(libryTableView)

//        let child = AlbumTableViewController()
//        self.addChild(child)
//        self.view.addSubview(child.view)
//        child.view.frame = self.view.frame
//        child.didMove(toParent: self)
      }

   

  // MARK: TableView Methods

  




}
