package
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Shader;
	import flash.display.ShaderPrecision;
	import flash.display.ShaderJob;
	import flash.display.StageScaleMode;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.utils.getTimer;
	import flash.filters.DisplacementMapFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.display.Bitmap;
	
	[SWF( backgroundColor='0', frameRate='1000', width='480', height='300')]
	
	public class wet_julia extends Sprite
	{
		[Embed(source="wave.pbj", mimeType="application/octet-stream")]
		internal var wavec:Class;
		[Embed(source="water.pbj", mimeType="application/octet-stream")]
		internal var waterc:Class;
		[Embed(source="julia.pbj", mimeType="application/octet-stream")]
		internal var juliac:Class;

		internal var wave:Shader;
		internal var water:Shader;
		internal var julia:Shader;
		internal var sj:ShaderJob;
		
		internal var maxw:int;
		internal var maxh:int;
		
		internal var wave0:BitmapData;
		internal var wave1:BitmapData;
		internal var output:BitmapData;
		internal var source:BitmapData;
		
		public function wet_julia()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.showDefaultContextMenu = false;			
			wave = new Shader(new wavec());
			water = new Shader(new waterc());
			julia = new Shader(new juliac());
			wave.precisionHint = ShaderPrecision.FAST;
			water.precisionHint = ShaderPrecision.FAST;
			julia.precisionHint = ShaderPrecision.FAST;
			maxw = stage.stageWidth;
			maxh = stage.stageHeight;
			wave0 = new BitmapData(maxw >> 1, maxh >> 1, true, 0xFF808080);
			wave1 = new BitmapData(maxw >> 1, maxh >> 1, true, 0xFF808080);
			output = new BitmapData(maxw, maxh, true);
			addChild(new Bitmap(output));
			source = new BitmapData(maxw, maxh, true);
			source.perlinNoise(maxw >> 2, maxh >> 2, 4, 0, false, false);
			source.applyFilter(source,new Rectangle(0,0,maxw,maxh),new Point(),new DisplacementMapFilter(source,new Point(),1,2,128,128,'clamp'));
			source.colorTransform(new Rectangle(0,0,maxw,maxh),new ColorTransform(0,0.72,1.0));
			stage.addEventListener('enterFrame', waver);
			stage.addEventListener('click', fsmode);
		}
		
		internal function fsmode(e:Event):void
		{
			stage.fullScreenSourceRect = new Rectangle(0,0,maxw,maxh);
			stage.displayState = StageDisplayState.FULL_SCREEN;
		}
		
		internal function waver(e:Event):void
		{
			julia.data.wave0.input = wave0;
			julia.data.scale.value = [1/Number(maxw >> 3), 1/Number(maxh >> 3)];
			julia.data.c.value = [Math.sin(getTimer()/1222),Math.cos(getTimer()/1444)];
			sj = new ShaderJob(julia,wave0);
			sj.start(true);
			wave.data.wave0.input = wave0;
			wave.data.wave1.input = wave1;
			sj = new ShaderJob(wave,wave1);
			sj.start(true);
			water.data.wave1.input = wave1;
			water.data.source.input = source;
			sj = new ShaderJob(water,output);
			sj.start(true);
			var tmpw:BitmapData = wave0;
			wave0 = wave1;
			wave1 = tmpw;
		}
	}
}
