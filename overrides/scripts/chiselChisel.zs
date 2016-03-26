// Adjusting Chisel's iron chisel recipe so it doesn't conflict with Pam's Harvest Craft
val stick = <ore:stickWood>;
val ironIngot = <ore:ingotIron>;

recipes.remove(<chisel:chisel>);
recipes.addShaped(<chisel:chisel>, [[null, ironIngot], [stick, null]]);
