//
//  PhotoToggle.swift
//  World
//
//  Created by A59833 on 2/22/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct PhotoToggle: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        @Bindable var model = model

        Toggle(Module.photo.callToAction, isOn: $model.isShowingPhoto)
            .onChange(of: model.isShowingPhoto) { _, isShowing in
                if isShowing {
                    openWindow(id: Module.photo.name)
                } else {
                    dismissWindow(id: Module.photo.name)
                }
            }
            .toggleStyle(.button)
    }
}

#Preview {
    PhotoToggle()
        .environment(ViewModel())
}
