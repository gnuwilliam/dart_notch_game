library dartnotchgame;

import 'dart:html';
import 'dart:math' as Math;
import 'dart:web_gl' as WebGL;

part 'shader.dart';

WebGL.RenderingContext gl;

class Game {
  CanvasElement canvas;
  Math.Random random;
  
  void start() {
    random = new Math.Random();
    canvas = querySelector("#game_canvas");
    gl = canvas.getContext("webgl");
    if (gl == null) {
      gl = canvas.getContext("experimental-webgl");
    }
    if (gl != null) {
      window.requestAnimationFrame(render); 
    }
  }
  
  void render(double time) {
    gl.viewport(0, 0, canvas.width, canvas.height);
    gl.clearColor(random.nextDouble(), random.nextDouble(), random.nextDouble(), 1.0);
    gl.clear(WebGL.COLOR_BUFFER_BIT);
    window.requestAnimationFrame(render);
  }
  
}

void main() {
  new Game().start();
}
