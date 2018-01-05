//
//  DataSource.swift
//  iOS Example
//
//  Created by Sasha Prokhorenko on 21.12.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation

let vitamins = [Vitamin(name: "A", ammount: 0.012),
								Vitamin(name: "B", ammount: 0.35),
								Vitamin(name: "C", ammount: 0.099),
								Vitamin(name: "D", ammount: 0.000122),
								Vitamin(name: "B12", ammount: 0.5)
]

let apple = HealthyFood(type: .fruit, name: "Apple", calories: "52", fat: "0,2", protein: "0,3", carbohydrate: "14", vitamins: vitamins)
let pear = HealthyFood(type: .fruit, name: "Pear", calories: "57", fat: "0,1", protein: "0,4", carbohydrate: "15", vitamins: vitamins)
let banana = HealthyFood(type: .fruit, name: "Banana", calories: "89", fat: "0,3", protein: "1,1", carbohydrate: "23", vitamins: vitamins)
let grape = HealthyFood(type: .fruit, name: "Grape", calories: "67", fat: "0,4", protein: "0,6", carbohydrate: "17", vitamins: vitamins)
let persimmon = HealthyFood(type: .fruit, name: "Persimmon", calories: "127", fat: "0,4", protein: "0,8", carbohydrate: "34", vitamins: vitamins)

let artichokes = HealthyFood(type: .vegetable, name: "Artichokes", calories: "37", fat: "1,0", protein: "4.2", carbohydrate: "1,4", vitamins: vitamins)
let cauliflower = HealthyFood(type: .vegetable, name: "Cauliflower", calories: "16", fat: "0,1", protein: "1,3", carbohydrate: "1,9", vitamins: vitamins)
let celery = HealthyFood(type: .vegetable, name: "Celery", calories: "8", fat: "0,1", protein: "0,4", carbohydrate: "0,9", vitamins: vitamins)


let fruits = HealthyGroup(name: .fruit, items: [apple, pear, banana, grape, persimmon].sorted())
let vegetables = HealthyGroup(name: .vegetable, items: [artichokes, cauliflower, celery].sorted())

let healthyFood = [fruits, vegetables]
