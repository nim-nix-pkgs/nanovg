{
  description = ''Nim wrapper for the C NanoVG antialiased vector graphics rendering library for OpenGL'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nanovg-v0_3_0.flake = false;
  inputs.src-nanovg-v0_3_0.owner = "johnnovak";
  inputs.src-nanovg-v0_3_0.ref   = "refs/tags/v0.3.0";
  inputs.src-nanovg-v0_3_0.repo  = "nim-nanovg";
  inputs.src-nanovg-v0_3_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nanovg-v0_3_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-nanovg-v0_3_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}