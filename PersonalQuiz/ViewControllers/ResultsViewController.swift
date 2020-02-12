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
	private var catCount = 0
	private var dogCount = 0
	private var rabbitCount = 0
	private var turtleCount = 0
	
	struct Result {
		var type: AnimalType
		var count: Int
	}
	
	
	// 2. Определить наиболее часто встречающийся тип животного
	// 3. Отобразить результаты в соотвствии с этим животным
	
	override func viewDidLoad() {
		super.viewDidLoad()
		countAnimals()
		
		
		var array: [Result] = [
			Result(type: .cat, count: catCount),
			Result(type: .dog, count: dogCount),
			Result(type: .rabbit, count: rabbitCount),
			Result(type: .turtle, count: turtleCount)
		]
		
		var maxResult = array.first
		
		for animal in array {
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
		
		print("dog", dogCount)
		print("cat", catCount)
		print("rabbit", rabbitCount)
		print("turle", turtleCount)
	}
	
	
	deinit {
		print("ResultsViewController was been dealocated")
	}
}
