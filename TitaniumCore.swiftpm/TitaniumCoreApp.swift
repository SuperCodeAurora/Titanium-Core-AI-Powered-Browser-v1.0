import SwiftUI

@main
struct TitaniumCoreApp: App {
    @StateObject private var tabManager = TabManager()
    @StateObject private var themeManager = ThemeManager() // 🆕 Booting the Theme Engine

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tabManager)
                .environmentObject(themeManager) // 🆕 Injecting into the app
                // The UI will now dynamically switch based on the ThemeManager
                .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
        }
    }
}
