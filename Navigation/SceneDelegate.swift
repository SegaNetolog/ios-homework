//
//  SceneDelegate.swift
//  Navigation
//
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    
    
    
    
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        func createTabBarController() -> UITabBarController {
            let tabBarController = UITabBarController()
            UITabBar.appearance().backgroundColor = .white
            UITabBar.appearance().unselectedItemTintColor = .black
            tabBarController.viewControllers = [createFeedViewController(), createProfileViewController()]
            return tabBarController
        }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = UITabBarController()
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
        
        func createFeedViewController() -> UINavigationController {
            let feedViewController = FeedViewController()
            feedViewController.title = "User feed"
            feedViewController.tabBarItem = UITabBarItem(title: "User feed", image: UIImage(systemName: "doc.richtext"), tag: 0)
            return UINavigationController(rootViewController: feedViewController)
        }
        
        func createProfileViewController() -> UINavigationController {
            let profileViewController = ProfileViewController()
            profileViewController.title = "Profile"
            profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle.fill"), tag: 1)
            return UINavigationController(rootViewController: profileViewController)
        }
    }
    
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

