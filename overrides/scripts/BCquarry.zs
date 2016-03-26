// nerfs the buildcraft quarry recipe
val quarry = <BuildCraft|Builders:machineBlock>;
val rsReceptCoil = <ThermalExpansion:material:1>;
val signalumGear = <ore:gearSignalum>;
val enderiumGear = <ore:gearEnderium>;
val diamondGear = <ore:gearDiamond>;
val platinumGear = <ore:gearPlatinum>;
val platPickaxe = <ThermalFoundation:tool.pickaxePlatinum>;

recipes.remove(quarry);
recipes.addShaped(
	quarry,
	[
		[platinumGear, rsReceptCoil, platinumGear],
		[signalumGear, enderiumGear, signalumGear],
		[diamondGear, platPickaxe, diamondGear]
	]);
