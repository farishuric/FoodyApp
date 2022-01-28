// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let receipt = try? newJSONDecoder().decode(Receipt.self, from: jsonData)

import Foundation

// MARK: - Receipt
struct Receipt: Decodable {
//    let from, to, count: Int
//    let links: ReceiptLinks
    let hits: [Hit]

    enum CodingKeys: String, CodingKey {
//        case from, to, count
//        case links = "_links"
        case hits
    }
}

// MARK: - Hit
struct Hit: Codable {
    let recipe: Recipe
//    let bookmarked, bought: Bool
//    let links: HitLinks
//
//    enum CodingKeys: String, CodingKey {
//        case recipe, bookmarked, bought
//        case links = "_links"
//    }
//}
//
//// MARK: - HitLinks
//struct HitLinks: Codable {
//    let linksSelf: Next
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf = "self"
//    }
//}

//// MARK: - Next
//struct Next: Codable {
//    let href: String
//    let title: Title
//}
//
//enum Title: String, Codable {
//    case nextPage = "Next page"
//    case titleSelf = "Self"
}

// MARK: - Recipe
struct Recipe: Codable {
    let uri: String
    let label: String
    let image: String
//    let images: Images
    let source: String
//    let url: String
//    let shareAs: String
//    let yield: Int
//    let dietLabels: [String]
//    let healthLabels: [HealthLabel]
    let cautions, ingredientLines: [String]
//    let ingredients: [Ingredient]
//    let calories, totalWeight: Double
//    let cuisineType: [String]
//    let mealType: [MealType]
//    let dishType: [DishType]
//    let totalNutrients, totalDaily: [String: Total]
//    let digest: [Digest]
}

// MARK: - Digest
//struct Digest: Codable {
//    let label, tag: String
//    let schemaOrgTag: SchemaOrgTag?
//    let total: Double
//    let hasRDI: Bool
//    let daily: Double
//    let unit: Unit
//    let sub: [Digest]?
//}
//
//enum SchemaOrgTag: String, Codable {
//    case carbohydrateContent = "carbohydrateContent"
//    case cholesterolContent = "cholesterolContent"
//    case fatContent = "fatContent"
//    case fiberContent = "fiberContent"
//    case proteinContent = "proteinContent"
//    case saturatedFatContent = "saturatedFatContent"
//    case sodiumContent = "sodiumContent"
//    case sugarContent = "sugarContent"
//    case transFatContent = "transFatContent"
//}
//
//enum Unit: String, Codable {
//    case empty = "%"
//    case g = "g"
//    case kcal = "kcal"
//    case mg = "mg"
//    case µg = "µg"
//}
//
//enum DishType: String, Codable {
//    case sandwiches = "sandwiches"
//}
//
//enum HealthLabel: String, Codable {
//    case dairyFree = "Dairy-Free"
//    case eggFree = "Egg-Free"
//    case fishFree = "Fish-Free"
//    case glutenFree = "Gluten-Free"
//    case peanutFree = "Peanut-Free"
//    case shellfishFree = "Shellfish-Free"
//    case soyFree = "Soy-Free"
//    case treeNutFree = "Tree-Nut-Free"
//    case vegan = "Vegan"
//    case vegetarian = "Vegetarian"
//}
//
//// MARK: - Images
//struct Images: Codable {
//    let thumbnail, small: Large
//    let regular, large: Large?
//
//    enum CodingKeys: String, CodingKey {
//        case thumbnail = "THUMBNAIL"
//        case small = "SMALL"
//        case regular = "REGULAR"
//        case large = "LARGE"
//    }
//}
//
//// MARK: - Large
//struct Large: Codable {
//    let url: String
//    let width, height: Int
//}
//
//// MARK: - Ingredient
//struct Ingredient: Codable {
//    let text: String
//    let quantity: Double
//    let measure: String?
//    let food: String
//    let weight: Double
//}
//
//enum MealType: String, Codable {
//    case brunch = "brunch"
//    case lunchDinner = "lunch/dinner"
//}
//
//// MARK: - Total
//struct Total: Codable {
//    let label: String
//    let quantity: Double
//    let unit: Unit
//}
//
//// MARK: - ReceiptLinks
//struct ReceiptLinks: Codable {
//    let next: Next
//}

