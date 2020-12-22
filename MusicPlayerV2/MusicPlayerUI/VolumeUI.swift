//
//  VolumeUI.swift
//  MusicPlayerV2
//
//  Created by Andy Peralta on 12/21/20.
//

import UIKit

class VolumeUI: UIViewController {

    override func viewDidLoad() {
        //MARK: Volume Touchbars
        let touchBarStack = UIStackView()
        touchBarStack.axis = .horizontal
        touchBarStack.alignment = .fill
        touchBarStack.distribution = .fill
        touchBarStack.spacing = 4
        touchBarStack.sizeToFit()
        createVolumeBar(volumeBarStack: touchBarStack)

        let marginLayoutGuide = self.view.layoutMarginsGuide
        let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate(
            [
                //VolumeTouchBar
                safeAreaLayoutGuide.bottomAnchor.constraint(equalTo:  touchBarStack.bottomAnchor, constant: 35),
                touchBarStack.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant: 50)
            ]
        )
    }

    func createVolumeBar(volumeBarStack: UIStackView) {
        volumeBarStack.translatesAutoresizingMaskIntoConstraints = false
        for _ in 0...9 {
            let volumeBarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 6, height: 20))
            volumeBarButton.translatesAutoresizingMaskIntoConstraints = false
            volumeBarButton.backgroundColor  = .white
            volumeBarStack.addArrangedSubview(volumeBarButton)
            self.view.addSubview(volumeBarStack)
        }
    }
}
