//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 26.10.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавится от кнопки возврата на предыдущий экран
    @IBOutlet var animalLabel: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        animalLabel.first?.text = "Вы - \(resultAnimal.rawValue)"
        animalLabel.last?.text = resultAnimal.definition
    }
    var answerResults:[Answer]!
    var resultAnimal: AnimalType {
        resultCalculation()
    }
    
    func resultCalculation() -> AnimalType{
        var dogs = 0
        var cats = 0
        var rabbits = 0
        var turtles = 0
        for result in answerResults {
            switch result.type {
            case .dog: dogs += 1
            case .cat: cats += 1
            case .rabbit: rabbits += 1
            case .turtle: turtles += 1
            }
        }
        switch max(dogs, cats, rabbits, turtles) {
        case dogs: return .dog
        case cats: return .cat
        case rabbits: return .rabbit
        default:
            return .turtle
        }
    }
}


