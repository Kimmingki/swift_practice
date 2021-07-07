import UIKit


// Queue - Main, Global, Custom


// - Main
DispatchQueue.main.async {
    // UI update
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
}



// - Global
DispatchQueue.global(qos: .userInteractive).async {
    // 매우 중요도 높은 것, 당장 해야 하는 것
}

DispatchQueue.global(qos: .userInitiated).async {
    // 거의 바로 해줘야 할 것 ,사용자가 결과를 기다린다.
}

DispatchQueue.global(qos: .default).async {
    // 굳이...
}

DispatchQueue.global().async {
    // 차라리 default를 쓴다면 이렇게 쓰는게 좋음
}

DispatchQueue.global(qos: .utility).async {
    // 시간이 좀 걸리는 일들, 사용자가 당장 기다리지 않는 것, 네트워킹, 큰 파일 불러올 때
}

DispatchQueue.global(qos: .background).async {
    // 사용자한테 당장 인식될 필요가 없는 것들, 뉴스데이터 미리 받기, 위치 업데이트, 영상 다운로드
}



// - Custom (그다지 많이 사용되지 않음)
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)



// 복합적인 상황
func downloadImageFromServer() -> UIImage {
    // Heavy Task
    return UIImage()
}

func updateUI(image: UIImage) {
    
}

DispatchQueue.global(qos: .background).async {
    // Download Image
    let image = downloadImageFromServer()
    
    DispatchQueue.main.async {
        // Update UI
        updateUI(image: image)
    }
}



// Sync(동기), Async(비동기)

// Async
//DispatchQueue.global(qos: .background).async {
//    for i in 0...5 {
//        print("😈 \(i)")
//    }
//}
//
//DispatchQueue.global(qos: .userInteractive).async {
//    for i in 0...5 {
//        print("😢 \(i)")
//    }
//}

// Sync
DispatchQueue.global(qos: .background).sync {
    for i in 0...5 {
        print("😈 \(i)")
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("😢 \(i)")
    }
}

