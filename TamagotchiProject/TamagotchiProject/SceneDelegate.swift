//
//  SceneDelegate.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/4/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        // window란? : 뷰 밑에 큰 도화지
        window = UIWindow(windowScene: scene)

        // UserDefaults에서 "isFirstLaunch" 키를 확인하여 첫 실행 여부를 판단합니다.
        var isFirstLaunch: Bool = UserDefaults.standard.bool(forKey: "isFirstLaunch")
        // 디버깅
        // isFirstLaunch = false

        print(isFirstLaunch)

        if isFirstLaunch == false {

            // 첫 실행 여부를 true로 설정하여 다음에 앱이 실행될 때 첫 실행이 아닌 것으로 표시합니다.
            //UserDefaults.standard.set(true, forKey: "isFirstLaunch")
            isFirstLaunch = true

            // 첫 실행인 경우 다른 화면을 보여주기 위해 초기화면 대신 새로운 화면을 표시합니다.
            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: "ChoiceViewController") as? ChoiceViewController else {
                return
            }
            
            let nav = UINavigationController(rootViewController: vc)

            window?.rootViewController = nav
            
        } else if isFirstLaunch == true {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: "GrowViewController") as? GrowViewController else {
                return
            }
            
            let nav = UINavigationController(rootViewController: vc)
            
            window?.rootViewController = nav
        }

        window?.makeKeyAndVisible()

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

