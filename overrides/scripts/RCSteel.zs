// Adds in the recipe removed when the railcraft steel ingot was disabled

val steelIngot = <TConstruct:materials:16>;
val steelBlock = <Railcraft:cube:2>;

recipes.addShapeless(steelIngot * 9, [steelBlock]);
