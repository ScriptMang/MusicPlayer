//
//  CategorySection.swift
//  interfaceDesignViaCode
//
//  Created by Andy Peralta on 11/25/20.
//

import Foundation
import MediaPlayer
struct CategorySection: Comparable {
  var letter: String
  var songList: [Song]

  static func < (lhs: CategorySection, rhs: CategorySection) -> Bool {
    return lhs.letter < rhs.letter
  }

  static func == (lhs: CategorySection, rhs: CategorySection) -> Bool {
    return lhs.letter  == rhs.letter
  }

}
