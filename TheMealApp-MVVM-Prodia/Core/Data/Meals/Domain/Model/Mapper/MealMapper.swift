//
//  CategoryMapper.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 14/4/22.
//

import Foundation

final class MealMapper {
    
    static func mapCategoryResponseToModel(
        input categoryResponse: [MealCategories]
    ) -> [MealCategoryModel] {
        
        return categoryResponse.map { result in
            return MealCategoryModel(
                id: result.id ?? "",
                title: result.title ?? "",
                image: result.image ?? "",
                description: result.description ?? "")
        }
        
    }
    
    static func mapListMealResponseToModel(
        input mealsResponse: [ListMealsResponse]
    ) -> [MealsModel] {
        return mealsResponse.map { result in
            return MealsModel(
                id: result.id ?? "",
                title: result.title ?? "",
                imageMeal: result.imageMeal ?? "")
        }
    }
    
    static func mapIngredientResponseToModel(
      by idMeal: String,
      input mealResponse: MealDataResponse
    ) -> [IngredientModel] {
      var ingredientDomains: [IngredientModel] = []
      var ingredients = [
        mealResponse.ingredient1, mealResponse.ingredient2,
        mealResponse.ingredient3, mealResponse.ingredient4,
        mealResponse.ingredient5, mealResponse.ingredient6,
        mealResponse.ingredient7, mealResponse.ingredient8,
        mealResponse.ingredient9, mealResponse.ingredient10,
        mealResponse.ingredient11, mealResponse.ingredient12,
        mealResponse.ingredient13, mealResponse.ingredient14,
        mealResponse.ingredient15, mealResponse.ingredient16,
        mealResponse.ingredient17, mealResponse.ingredient18,
        mealResponse.ingredient19, mealResponse.ingredient20
      ].compactMap { $0 }
      ingredients = ingredients.filter({ $0 != ""})

      var measures = [
        mealResponse.measure1, mealResponse.measure2,
        mealResponse.measure3, mealResponse.measure4,
        mealResponse.measure5, mealResponse.measure6,
        mealResponse.measure7, mealResponse.measure8,
        mealResponse.measure9, mealResponse.measure10,
        mealResponse.measure11, mealResponse.measure12,
        mealResponse.measure13, mealResponse.measure14,
        mealResponse.measure15, mealResponse.measure16,
        mealResponse.measure17, mealResponse.measure18,
        mealResponse.measure19, mealResponse.measure20
      ].compactMap { $0 }
      measures = measures.filter({ $0 != ""})

      let ingredientStrings = zip(ingredients, measures)
        .map { "\($0) \($1)" }

      for (index, ingredient) in ingredientStrings.enumerated() {
        let ingredientDomain = IngredientModel(
          id: "\(index+1)",
          title: "\(index+1). \(ingredient)",
          idMeal: idMeal
        )
        ingredientDomains.append(ingredientDomain)
      }
      return ingredientDomains
    }
    
    var category: String = ""
    var area: String = ""
    var instructions: String = ""
    var tag: String = ""
    var youtube: String = ""
    var source: String = ""
    var ingredients: [IngredientModel] = []
    var favorite: Bool = false

    
    static func mapMealResponsesToModel(by idMeal: String, input mealResponses: MealDataResponse) -> MealModel {
        
        let ingredients = MealMapper.mapIngredientResponseToModel(
          by: idMeal,
          input: mealResponses
        )
        let mealModel = MealModel(
            id: mealResponses.id ?? "",
            title: mealResponses.title ?? "",
            image: mealResponses.image ?? "",
            category: mealResponses.category ?? "",
            area: mealResponses.area ?? "",
            instructions: mealResponses.instructions ?? "",
            tag: mealResponses.tag ?? "",
            youtube: mealResponses.youtube ?? "",
            source: mealResponses.source ?? "",
            ingredients: ingredients,
            favorite: false)
        return mealModel
    }
    
}

