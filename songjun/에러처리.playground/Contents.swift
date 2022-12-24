import UIKit

var budget: Int = 3000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

enum buyError: Error {
    case noProduct
    case overBudget
    case soldOut
}

func checkNoProduct(productNumber: Int) throws {
    if productNumber > productsList.count {
        throw buyError.noProduct
    }
}

func checkOverBudget(budget: Int) throws {
    if budget <= 0 {
        throw buyError.overBudget
    }
}

func checkSoldOut(product: String?) throws {
    if product == nil {
        throw buyError.soldOut
    }
}

func buy(productNumber: Int) {

    do {
        try checkNoProduct(productNumber: productNumber)
    } catch buyError.noProduct {
        print("없는 상품번호 입니다.")
        return
    } catch {
    }

    do {
        try checkOverBudget(budget: budget)
    } catch buyError.overBudget {
        print("예산을 초과하였습니다.")
        return
    } catch {
    }

    do {
        try checkSoldOut(product: productsList[productNumber])
    } catch buyError.soldOut {
        print("품절되었습니다.")
        return
    } catch {
    }
    
    
    if let product = productsList[productNumber] {
        print("\(product)를 구매했습니다")
    } else {
        return
    }
    
    productsList[productNumber] = nil
    budget -= 1000
    print("예산 : \(budget)")
}

buy(productNumber: 0)
buy(productNumber: 3)
buy(productNumber: 3)
buy(productNumber: 3)
buy(productNumber: 7)

