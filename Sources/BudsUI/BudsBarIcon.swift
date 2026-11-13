// BudsBar — shared template icon
// SPDX-License-Identifier: MIT

import AppKit

@MainActor
public enum BudsBarIcon {
    public static let image: NSImage = {
        guard let url = Bundle.module.url(forResource: "MenuBarMonogram", withExtension: "png"),
              let image = NSImage(contentsOf: url) else {
            preconditionFailure("The menu bar icon resource is missing or invalid.")
        }
        image.size = NSSize(width: 22, height: 22)
        image.isTemplate = true
        image.accessibilityDescription = "BudsBar"
        return image
    }()
}
