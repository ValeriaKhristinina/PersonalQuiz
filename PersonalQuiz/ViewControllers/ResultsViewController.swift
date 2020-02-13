//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 11.02.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var descriptionLabel: UILabel!
	
	// MARK: - Private properties
	var resultAnswers: [Answer] = []
	private var animalsCounter: [AnimalsCounter] = []
	private var catCount = 0
	private var dogCount = 0
	private var rabbitCount = 0
	private var turtleCount = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		countAnimals()
		 animalsCounter = [
			AnimalsCounter(type: .cat, count: catCount),
			AnimalsCounter(type: .dog, count: dogCount),
			AnimalsCounter(type: .rabbit, count: rabbitCount),
			AnimalsCounter(type: .turtle, count: turtleCount)
		]
		
		var maxResult = animalsCounter.first
		for animal in animalsCounter {
			if(animal.count > maxResult?.count ?? 0) {
				maxResult = animal
			}
		}
		
		titleLabel.text = "Вы - \(maxResult?.type.rawValue ?? "🤷🏼‍♀️")"
		descriptionLabel.text = maxResult?.type.definition
	}
	
	
	func countAnimals() {
		for item in resultAnswers {
			switch item.type {
			case .dog: dogCount += 1
			case .cat: catCount += 1
			case .rabbit: rabbitCount += 1
			case .turtle: turtleCount += 1
			}
		}
	}
	
	
	deinit {
		print("ResultsViewController was been dealocated")
	}
}
