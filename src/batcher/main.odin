package main

import "core:fmt"
import foster "olib:foster"

batcher: foster.Batcher

startup :: proc(app: ^foster.App) {
	foster.BatcherInit(&batcher, &app.GraphicsDevice, "BatcherExample")
	fmt.println("Batcher ready")
}

shutdown :: proc(app: ^foster.App) {
	_ = app
	foster.BatcherDispose(&batcher)
}

update :: proc(app: ^foster.App) {
	_ = app
}

render :: proc(app: ^foster.App) {
	target := foster.DrawableTargetFromWindow(&app.Window)
	foster.GraphicsDeviceClear(&app.GraphicsDevice, target, foster.Color{24, 28, 36, 255})

	foster.BatcherClear(&batcher)
	foster.BatcherRect(&batcher, foster.Rect{80, 60, 220, 140}, foster.Color{220, 80, 70, 255})
	foster.BatcherCircle(&batcher, foster.Vec2{430, 130}, 70, 32, foster.Color{70, 170, 235, 255})
	foster.BatcherLine(&batcher, foster.Vec2{80, 260}, foster.Vec2{560, 300}, 8, foster.Color{245, 205, 70, 255})
	foster.BatcherRender(&batcher, target)
}

main :: proc() {
	config := foster.DefaultAppConfig("BatcherExample", 1280, 720)
	config.WindowTitle = "Foster Odin Batcher"

	app: foster.App
	foster.InitApp(&app, config)
	defer foster.Dispose(&app)

	app.StartupProc = startup
	app.ShutdownProc = shutdown
	app.UpdateProc = update
	app.RenderProc = render
	foster.Run(&app)
}
