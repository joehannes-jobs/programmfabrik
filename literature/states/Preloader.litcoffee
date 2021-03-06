Load Assets and display a splash-screen

	import { modeAssets } from '../assets'

	export default class Preloader extends Phaser.State
		preload: () ->
			@showSplashScreen()
			@load.pack 'modeAssets', null, { modeAssets }

		create: () ->
			setTimeout @state.start.bind(@state, 'Mode'), 2000

		showSplashScreen: () ->
			@add.image @world.centerX - 320, @world.centerY - 320 , 'splash-screen'

			loaderani = @add.tileSprite 320, 340, 100, 100, 'progress-bar'
			loaderani.animations.add 'spin'
			loaderani.animations.play 'spin', 32, true

			@font = @add.retroFont 'knight3', 31, 25, Phaser.RetroFont.TEXT_SET6, 10, 1, 1
			@font.text = 'TIC TAC TOE'
			@title = @add.image @world.centerX, 490, @font
			@title.tint = Math.random() * 0xFFFFFF
			@title.anchor.set 0.5, 1

		update: () ->
			@title.tint = Math.random() * 0xFFFFFF
