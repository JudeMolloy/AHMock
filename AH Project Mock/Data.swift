//
//  Data.swift
//  AH Project Mock
//
//  Created by Jude Molloy on 30/11/2018.
//  Copyright © 2018 Jude Molloy. All rights reserved.
//

import Foundation
import UIKit

struct MultipleChoiceQuestion {
    var questionText: String
    var choiceA: String
    var choiceB: String
    var choiceC: String
    var choiceD: String
    var correctChoice: String
    var answerExplanation: String
    var relatedImage: UIImage?
}

struct TextResponseQuestion {
    var questionText: String
    var correctAnswer: String
    var answerExplanation: String
    var relatedImage: UIImage?
}



