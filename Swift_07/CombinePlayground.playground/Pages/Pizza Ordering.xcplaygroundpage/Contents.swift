import Foundation
import Combine

let pizzaOrder = Order() // 주문 상태를 저장하는 객체

// 만약 pizzaOrderPublisher 게시가 되면 어떻게 동작할 것인지에 대한 설계 -----------------------
let pizzaOrderPublisher = NotificationCenter.default.publisher(for: .didUpdateOrderStatus,
                                                               object: pizzaOrder)

pizzaOrderPublisher.sink { notification in
    Task {
        try? await Task.sleep(for: .seconds(2))
        print("----- notification start --------------------------------------------------")
        dump(pizzaOrder)
        print("----- notification end ----------------------------------------------------")
    }
}

pizzaOrderPublisher.map { notification in
    notification.userInfo?["status"] as? OrderStatus ?? OrderStatus.placing
}
.sink { orderStatus in
    print("Order status [\(orderStatus)]")
}
// 설계 종료 -----------------------------------------------------------------------------

pizzaOrderPublisher.compactMap { notification in
    notification.userInfo?["status"] as? OrderStatus
}
.assign(to: \.status, on: pizzaOrder) // 위의 status가 있으면, pizzaOrder의 status로 할당

print("Order: \(pizzaOrder.status)") // 아직까지는 초기값 출력: 값을 추가하지 않았으니까

// pizzaOrderPublisher 게시 -------------------------------------------------------------
NotificationCenter.default.post(name: .didUpdateOrderStatus,
                                object: pizzaOrder,
                                userInfo: ["status": OrderStatus.processing])
