//
//  LifestylesRepresentable.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//

import SwiftUI

struct LifestylesRepresentable: UIViewControllerRepresentable {
    
    let onSelection: ([String]) -> Void
    
    func makeUIViewController(context: Context) -> LifestylesViewController {
        let vc = LifestylesViewController()
        vc.delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: LifestylesViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(onSelection: onSelection)
    }
    
    class Coordinator: NSObject, LifestylesViewControllerDelegate {
        let onSelection: ([String]) -> Void
        
        init(onSelection: @escaping ([String]) -> Void) {
            self.onSelection = onSelection
        }
        
        func didSelectLifestyles(_ lifestyles: [String]) {
            onSelection(lifestyles)
        }
    }
}
