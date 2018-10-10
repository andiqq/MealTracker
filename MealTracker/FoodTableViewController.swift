//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Andreas on 10.10.18.
//  Copyright © 2018 Andreas. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] {
            var breakfast: Meal {
                let eggs = Food(name: "scrambled eggs", description: "an egg meal")
                let bacon = Food(name: "bacon", description: "meaty stuff")
                let rolls = Food(name: "rolls", description: "assorted bread")
                return Meal(name: "breakfast",food: [eggs, bacon, rolls])
            }
            var lunch: Meal {
                let fries = Food(name: "fries", description: "fried potatoes")
                let steak = Food(name: "steak", description: "grilled beef")
                let peas = Food(name: "peas", description: "vegetable")
                return Meal(name: "lunch",food: [fries, steak, peas])
            }
            var dinner: Meal {
                let bread = Food(name: "bread", description: "freshly prepared slices")
                let cheese = Food(name: "cheese", description: "French selection")
                let salami = Food(name: "salami", description: "Italian speciality")
                return Meal(name: "dinner",food: [bread, cheese, salami])
            }
        return [breakfast, lunch, dinner]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfFoods = meals[section].food.count
        return numberOfFoods
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
        
        let actualMeal = meals[indexPath.section]
        let actualFood = actualMeal.food[indexPath.row]
        
        let name = actualFood.name
        let description = actualFood.description
        
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = description

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
}
