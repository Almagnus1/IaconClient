// nerfs the buildcraft quarry recipe, as the ender quarry (or a frame quarry) should be used instead
val quarry = <BuildCraft|Builders:machineBlock>;
val rsReceptCoil = <ThermalExpansion:material:1>;
val invarGear = <ore:gearInvar>;
val signalumGear = <ore:gearSignalum>;
val enderiumGear = <ore:gearEnderium>;
val platPickaxe = <ThermalFoundation:tool.pickaxePlatinum>;

recipes.remove(quarry);
recipes.addShaped(quarry, [[invarGear, rsReceptCoil, invarGear], [signalumGear, invarGear, signalumGear], [enderiumGear, platPickaxe, enderiumGear]]);
