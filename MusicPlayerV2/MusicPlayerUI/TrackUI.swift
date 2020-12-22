//
//  MusicUI.swift
//  MusicPlayerV2
//
//  Created by Andy Peralta on 12/21/20.
//

import UIKit

class TrackUI: UIViewController {

    override func viewDidLoad() {

        let albumTitle = UILabel()
        albumTitle.translatesAutoresizingMaskIntoConstraints = false
        albumTitle.text = "AlbumTitle"
        albumTitle.font = UIFont(name: "Hiragino Mincho ProN W3", size:  30.0)
        albumTitle.sizeToFit()

        view.addSubview(albumTitle)
        let songTitle = UILabel()
        songTitle.translatesAutoresizingMaskIntoConstraints = false
        songTitle.text = "SongTitle"
        songTitle.font = UIFont(name: "Hiragino Mincho ProN W3", size:  30.0)

        let artist = UILabel()
        artist.translatesAutoresizingMaskIntoConstraints = false
        artist.font = UIFont(name: "Hiragino Mincho ProN W3", size:  25.0)
        artist.text = "Artist"
        artist.sizeToFit()

        //MARK: StackView for Song/Artist Label
        let trackStackView = UIStackView(arrangedSubviews: [songTitle, artist])
        trackStackView.axis = .vertical
        trackStackView.alignment = .fill
        trackStackView.distribution = .equalSpacing
        trackStackView.translatesAutoresizingMaskIntoConstraints = false
        trackStackView.spacing = 15
        self.view.addSubview(trackStackView)

        let startTime = UILabel()
        startTime.translatesAutoresizingMaskIntoConstraints = false
        startTime.font = UIFont(name: "Hiragino Mincho ProN W3", size:  17.0)
        startTime.text = "0:00"
        startTime.sizeToFit()

        let endTime = UILabel()
        endTime.translatesAutoresizingMaskIntoConstraints = false
        endTime.font = UIFont(name: "Hiragino Mincho ProN W3", size: 17.0)
        endTime.text = " 0:00"
        endTime.sizeToFit()

        //MARK: StackView for Music ProgressBar
        let progressBar = UIProgressView(progressViewStyle: .bar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.progress = 0.10
        progressBar.progressTintColor = .white
        progressBar.backgroundColor = .gray

        let progressStackView = UIStackView(arrangedSubviews: [startTime, progressBar, endTime])
        progressStackView.axis = .horizontal
        progressStackView.alignment = .center
        progressStackView.distribution = .fillProportionally
        progressStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(progressStackView)
        progressStackView.sizeToFit()

        //MARK: Stackview for Volume
        let volumeButton = UIButton(type: .system)
        volumeButton.tintColor = .white
        let volumeButtonConfig = UIImage.SymbolConfiguration(pointSize: 32)
        let volumeIcon = UIImage(systemName: "speaker.wave.2.circle", withConfiguration: volumeButtonConfig)
        volumeButton.setImage(volumeIcon, for: .normal)
        volumeButton.translatesAutoresizingMaskIntoConstraints = false

        let volumePercentage = UILabel()
        volumePercentage.translatesAutoresizingMaskIntoConstraints = false
        volumePercentage.text = "100%"
        volumePercentage.textAlignment = .center

        let volumeStack = UIStackView(arrangedSubviews: [volumeButton, volumePercentage])
        volumeStack.axis = .vertical
        volumeStack.alignment = .fill
        volumeStack.distribution =  .fill
        volumeStack.translatesAutoresizingMaskIntoConstraints = false
        volumeStack.spacing = 5
        self.view.addSubview(volumeStack)

        let marginLayoutGuide = self.view.layoutMarginsGuide
        let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate(
            [
                // Album Title
                albumTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
                albumTitle.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 50),
                albumTitle.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -120),

                //TrackStackView
                trackStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 530),
                trackStackView.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant:  50),

                //Volume StackView
                volumeStack.topAnchor.constraint(equalTo:  trackStackView.topAnchor),
                volumeStack.leadingAnchor.constraint(greaterThanOrEqualTo: marginLayoutGuide.leadingAnchor, constant:  300),
                volumeStack.bottomAnchor.constraint(greaterThanOrEqualTo: trackStackView.bottomAnchor),

                //ProgressStackView
                progressStackView.topAnchor.constraint(lessThanOrEqualTo: trackStackView.bottomAnchor, constant: 20),
                progressStackView.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant: 50),
                progressStackView.trailingAnchor.constraint(equalTo: marginLayoutGuide.trailingAnchor, constant: 42),

                // Inside the PorgressStackView
                progressBar.widthAnchor.constraint(equalToConstant: 250),
                progressBar.heightAnchor.constraint(equalToConstant: 3)
            ]
        )
    }


}
