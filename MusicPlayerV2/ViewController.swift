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

    // MARK: Music TextLabels
    let songTitle = UILabel()
    songTitle.translatesAutoresizingMaskIntoConstraints = false
    songTitle.text = "Hello IPhone User"
    songTitle.sizeToFit()
    view.addSubview(songTitle)

    let artist = UILabel()
    artist.translatesAutoresizingMaskIntoConstraints = false
    artist.text = "Welcome to constraints"
    artist.sizeToFit()
    view.addSubview(artist)

    // AlbumArt
    let musicHouseArt = UIImage(systemName: "music.note.house.fill")
    let albumArt = UIImageView(image: musicHouseArt)
    albumArt.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(albumArt)

    // MARK: Music Control Buttons
    let playButton = UIButton(type: .system)
    let playIconConfig = UIImage.SymbolConfiguration(pointSize: 40)
    let playIcon = UIImage(systemName: "play.fill", withConfiguration: playIconConfig)
    let pauseIcon = UIImage(systemName: "pause.fill")
    playButton.setImage(playIcon, for: .normal)
    playButton.setImage(pauseIcon, for: .selected)
    playButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(playButton)

    let fastForwardButton = UIButton(type: .system)
    let fastForwardIcon = UIImage(systemName: "forward.fill")
    fastForwardButton.setImage(fastForwardIcon, for: .normal)
    fastForwardButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(fastForwardButton)

    let rewindButton = UIButton(type: .system)
    let rewindIcon = UIImage(systemName: "backward.fill")
    rewindButton.setImage(rewindIcon, for: .normal)
    rewindButton.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(rewindButton)

    // StackView for Play, Forward, Backward, Pause
    let musicStackView = UIStackView(arrangedSubviews: [rewindButton, playButton, fastForwardButton])
    musicStackView.axis = .horizontal
    musicStackView.alignment = .fill
    musicStackView.distribution = .fillEqually
    musicStackView.translatesAutoresizingMaskIntoConstraints = false
    musicStackView.spacing = 0
    self.view.addSubview(musicStackView)

    let marginLayoutGuide = self.view.layoutMarginsGuide
    let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide

    //transition LibraryVC
    view.backgroundColor = .black
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Library", style: .plain, target: self, action: #selector(transitionToLibraryVC))

    //MARK: Constraints
    NSLayoutConstraint.activate(
      [
        //Song Label
        songTitle.leadingAnchor.constraint(lessThanOrEqualTo: v1.leadingAnchor, constant: 120),
        songTitle.centerYAnchor.constraint(equalTo: v1.topAnchor, constant:  500),
        songTitle.trailingAnchor.constraint(lessThanOrEqualTo: v1.trailingAnchor, constant: 200),

        // Artist Label
        artist.leadingAnchor.constraint(greaterThanOrEqualTo: v1.leadingAnchor, constant: 100),
        artist.topAnchor.constraint(greaterThanOrEqualTo: songTitle.bottomAnchor, constant: 10),
        artist.bottomAnchor.constraint(equalTo: v1.bottomAnchor, constant: 200),
        artist.trailingAnchor.constraint(equalTo: v1.trailingAnchor, constant: 200),

        //Album Art
        albumArt.topAnchor.constraint(equalTo: v1.topAnchor, constant: 100),
        albumArt.leadingAnchor.constraint(equalTo: v1.leadingAnchor, constant: 50),
        albumArt.heightAnchor.constraint(equalToConstant:  320),
        albumArt.widthAnchor.constraint(equalToConstant:  320),

        //MusicPlayer Horizontal StackView
        musicStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
        musicStackView.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor),
        musicStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)

     ]
    )
    // Do any additional setup after loading the view.
  }

    //MARK: Push to a LibraryTableViewController
  @objc func transitionToLibraryVC() {
    navigationController?.pushViewController(LIbraryTableViewController(), animated: true)
  }

}

