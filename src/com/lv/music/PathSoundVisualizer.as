package com.lv.music {
	import mx.core.mx_internal;

	import flash.display.GraphicsPathCommand;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.SoundMixer;
	import flash.utils.ByteArray;

	/**
	 * @author stevenlv
	 */
	public class PathSoundVisualizer extends Sprite {
		// 边框：颜色，透明度，宽度
		public var strokeColor : uint = 0x000000;
		public var strokeAlpha : Number = 1.0;
		public var strokeWeight : Number = 6;
		// 填充：颜色，透明度，块
		public var fillColor : uint = 0x333333;
		public var fillAlpha : Number = 1.0;
		public var bar : Boolean = true;
		// 光谱
		public var spectrum : ByteArray = new ByteArray();
		public const SPECTRUM_LENGTH : int = 512;
		private var _steps : int = 64;
		private var _stepWidth : Number;
		private var _stepIncrement : int = SPECTRUM_LENGTH / steps;
		private var _height : Number = 100;
		private var _waveOffset : Number = 1.0;
		private var _baseY : Number = _height;

		public function PathSoundVisualizer() {
		}

		public function get steps() : Number {
			return _steps;
		}

		public function set steps(value : Number) : void {
			if (value > 0 && value <= SPECTRUM_LENGTH) {
				_steps = value;
			} else {
				// use full spectrum
				_steps = SPECTRUM_LENGTH;
			}

			_stepIncrement = SPECTRUM_LENGTH / _steps;

			updateStepWidth();
		}

		public function get waveOffset() : Number {
			return _waveOffset;
		}

		public function set waveOffset(offset : Number) : void {
			if (offset >= 0 && offset <= 1.0) {
				_waveOffset = 1 - offset;
			}
			updateBaseY();
		}

		private function updateBaseY() : void {
			_baseY = _waveOffset * _height;
		}

		private function updateStepWidth() : void {
			_stepWidth = this.width / steps;
		}

		private function visualize(event : Event) : void {
			var n : Number = 0;
			var x : Number = 0;
			var y : Number = this.height;
			var commands : Vector.<int> = new Vector.<int>();
			var data : Vector.<Number> = new Vector.<Number>();

			try {
				SoundMixer.computeSpectrum(spectrum);
			} catch(error : Error) {
				return;
			}

			// NOTE: Flex SDK Beta 1 allowed public access
			// to Path Segements and segment types

			// See related Path Segments issue and vote for it:
			// http://bugs.adobe.com/jira/browse/SDK-25843

			// path.segments = new Array();
			// path.segments.push(new MoveSegment(0, _baseY));
			commands.push(GraphicsPathCommand.MOVE_TO);
			data.push(0, _baseY);
			for (var i : int = 0; i < SPECTRUM_LENGTH; i++) {
				n = spectrum.readFloat();
				if (i % _stepIncrement != 0) {
					continue;
				}

				y = (_height - n * _height) / 2;
				// path.segments.push(new LineSegment(x, y));
				commands.push(GraphicsPathCommand.LINE_TO);
				data.push(x, y);

				x += _stepWidth;
				if (bar) {
					// path.segments.push(new LineSegment(x, y));
					// path.segments.push(new LineSegment(x, _baseY));
					commands.push(GraphicsPathCommand.LINE_TO);
					commands.push(GraphicsPathCommand.LINE_TO);
					data.push(x, y);
					data.push(x, _baseY);
				}
			}

			if (!bar) {
				// path.segments.push(new LineSegment(x-_stepWidth, _baseY));
				commands.push(GraphicsPathCommand.LINE_TO);
				data.push(x - _stepWidth, _baseY);
			}

			// update graphics path display
			// path.mx_internal::graphicsPath.commands = commands;
			// path.mx_internal::graphicsPath.data = data;
			// path.invalidateDisplayList();
		}
	}
}
