//: [Previous](@previous)

import Foundation
import Combine

// 기본 마르게리타 피자 설정
let margheritaOrder = Order(toppings: [
    Topping("tomatoes", isVegan: true),
    Topping("vegan mozzarella", isVegan: true),
    Topping("basil", isVegan: true)
])

// 기본 피자 상태 변경을 위한 게시
let margheritaOrderPublisher = NotificationCenter.default.publisher(for: .didUpdateOrderStatus, object: margheritaOrder)
margheritaOrderPublisher
    .compactMap { notification in
        notification.userInfo?["status"] as? OrderStatus
    }
    .assign(to: \.status, on: margheritaOrder)

// 토핑을 추가할 때를 위한 게시
let extraToppingPublisher = NotificationCenter.default.publisher(for: .addTopping, object: margheritaOrder)

extraToppingPublisher
    .compactMap { notification in
        notification.userInfo?["extra"] as? Topping
    }
    .filter{ topping in
        topping.isVegan
    }
    .filter { $0.isVegan } // 위와 동일, 비건인것만 걸러내기
    .prefix(3) // 걸러낸 결과 중 3개만 선택
    .prefix(while: { topping in
        margheritaOrder.status == .placing // 주문 단계가 placing인 상태에서만 토핑 추가 가능
    })
    // 위에서 걸러진 토핑들을 append로 배열에 추가
    .sink { value in
        if margheritaOrder.toppings != nil {
            margheritaOrder.toppings!.append(value)
            print("Adding \(value.name)")
            print("Your order now contains \(margheritaOrder.toppings!.count) toppings")
        }
    }

NotificationCenter.default.post(name: .addTopping, object: margheritaOrder, userInfo: ["extra": Topping("salami", isVegan: false)])
NotificationCenter.default.post(name: .addTopping, object: margheritaOrder, userInfo: ["extra": Topping("olives", isVegan: true)])
NotificationCenter.default.post(name: .addTopping, object: margheritaOrder, userInfo: ["extra": Topping("pepperoni", isVegan: true)])
NotificationCenter.default.post(name: .addTopping, object: margheritaOrder, userInfo: ["extra": Topping("capers", isVegan: true)])

NotificationCenter.default.post(name: .didUpdateOrderStatus, object: margheritaOrder, userInfo: ["status": OrderStatus.processing])
NotificationCenter.default.post(name: .addTopping, object: margheritaOrder, userInfo: ["extra": Topping("olives", isVegan: true)])
NotificationCenter.default.post(name: .didUpdateOrderStatus, object: margheritaOrder, userInfo: ["status": OrderStatus.delivered])
