//
//  MealModel.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 25/4/22.
//

import Foundation

struct MealModel: Equatable, Identifiable {

  let id: String
  let title: String
  let image: String
  var category: String = ""
  var area: String = ""
  var instructions: String = ""
  var tag: String = ""
  var youtube: String = ""
  var source: String = ""
  var ingredients: [IngredientModel] = []
  var favorite: Bool = false

}
