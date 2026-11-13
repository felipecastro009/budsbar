// BudsBar — application entry point
// SPDX-License-Identifier: MIT

import SwiftUI
import BudsCore
import BudsUI

@main
struct BudsBarApp: App {
    @StateObject private var controller = DeviceController()
    @State private var didConnect = false

    var body: some Scene {
        MenuBarExtra {
            ControlPanel(controller: controller)
                .onAppear {
                    guard !didConnect else { return }
                    didConnect = true
                    Task { await controller.connect() }
                }
        } label: {
            Image(nsImage: BudsBarIcon.image)
                .accessibilityLabel("BudsBar")
        }
        .menuBarExtraStyle(.window)
    }
}
