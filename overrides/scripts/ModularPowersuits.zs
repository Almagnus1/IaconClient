// Reworks the recipes for Modula Power Suits to condense the recipes down to one for each item

val powerArmorTinkerTable = <powersuits:tile.tinkerTable>;

val wiring = <powersuits:powerArmorComponent>;
val solenoid = <powersuits:powerArmorComponent:1>;
val servoMotor = <powersuits:powerArmorComponent:2>;
val gliderWing = <powersuits:powerArmorComponent:3>;
val ionThruster = <powersuits:powerArmorComponent:4>;
val LVCapacitor = <powersuits:powerArmorComponent:5>;
val MVCapacitor = <powersuits:powerArmorComponent:6>;
val HVCapacitor = <powersuits:powerArmorComponent:7>;
val parachute = <powersuits:powerArmorComponent:8>;
val basicPlating = <powersuits:powerArmorComponent:9>;
val advPlating = <powersuits:powerArmorComponent:10>;
val FFEmitter = <powersuits:powerArmorComponent:11>;
val holoEmitter = <powersuits:powerArmorComponent:12>;
val controlCircuit = <powersuits:powerArmorComponent:14>;
val solarCell = <powersuits:powerArmorComponent:17>;
val magnet = <powersuits:powerArmorComponent:18>;
val computerChip = <powersuits:powerArmorComponent:19>;
val rubberHose = <powersuits:powerArmorComponent:20>;

val powerArmorHelmet = <powersuits:item.powerArmorHelmet>;
val powerArmorChestplate = <powersuits:item.powerArmorChestplate>;
val powerArmorLeggings = <powersuits:item.powerArmorLeggings>;
val powerArmorBoots = <powersuits:item.powerArmorBoots>;
val powerGlove = <powersuits:item.powerFist>;

val aluminumIngot = <ore:ingotAluminum>;
val darkSteelIngot = <ore:ingotDarkSteel>;
val electricalSteel = <ore:ingotElectricalSteel>;
val energeticAlloy = <ore:ingotEnergeticAlloy>;
val invarIngot = <ore:ingotInvar>;
val ironIngot = <ore:ingotIron>;
val lumiumIngot = <ore:ingotLumium>;
val manyullyn = <ore:ingotManyullyn>;
val platinumIngot = <ore:ingotPlatinum>;
val pulsatingIronIngot = <ore:ingotPhasedIron>;
val vibrantAlloy = <ore:ingotPhasedGold>;

val diamond = <ore:gemDiamond>;
val diamondBlock = <minecraft:diamond_block>;
val emerald = <ore:gemEmerald>;
val enderPearl = <ore:pearlEnder>;
val glassBlock = <ore:blockGlassColorless>;
val glowstoneBucket = <ore:bucketGlowstone>;
val greenDye = <ore:dyeGreen>;
val hardenedGlass = <ore:blockGlassHardened>;
val lapis = <ore:gemLapis>;
val NQuartz = <minecraft:quartz>;
val redstone = <ore:dustRedstone>;
val rubberBar = <ore:itemRubber>;
val stringy = <minecraft:string>;
val wool = <ore:blockWool>;

val logicProc = <appliedenergistics2:item.ItemMultiMaterial:22>;
val calcProc = <appliedenergistics2:item.ItemMultiMaterial:23>;
val engrProc = <appliedenergistics2:item.ItemMultiMaterial:24>;

val TEhardenedMachineFamre = <ThermalExpansion:Frame:1>;
val pneumaticServo = <ThermalExpansion:material>;
val RSreceptCoil = <ThermalExpansion:material:3>;
val leadCapacitor = <ThermalExpansion:capacitor:2>;
val invarCapacitor = <ThermalExpansion:capacitor:3>;
val enderCapacitor = <ThermalExpansion:capacitor:5>;

val basicCapacitor = <EnderIO:itemBasicCapacitor>;
val doulbeCapacitor = <EnderIO:itemBasicCapacitor:2>;

val copperCoil = <ProjRed|Core:projectred.core.part:16>;
val blueIllumar = <ProjRed|Core:projectred.core.part:30>;
val greenIllumar = <ProjRed|Core:projectred.core.part:32>;
val limeIllumar = <ProjRed|Core:projectred.core.part:24>;
val redIllumar = <ProjRed|Core:projectred.core.part:33>;

//////////////////////// Blocks /////////////////////////////////////


// Power Armor Tinker Table
recipes.remove(powerArmorTinkerTable);
recipes.addShaped(
	powerArmorTinkerTable,
	[
		[limeIllumar,		emerald,				limeIllumar],
		[darkSteelIngot,	TEhardenedMachineFamre,	darkSteelIngot],
		[null,				darkSteelIngot,			null]
	]);

//////////////////////// Components /////////////////////////////////////
// wiring
recipes.remove(wiring);
recipes.addShaped(
	wiring * 8,
	[
		[rubberBar,		rubberBar,	rubberBar],
		[copperCoil,	copperCoil,	copperCoil],
		[rubberBar,		rubberBar,	rubberBar]
	]);
recipes.addShaped(
	wiring * 8,
	[
		[rubberBar,	copperCoil,	rubberBar],
		[rubberBar,	copperCoil,	rubberBar],
		[rubberBar,	copperCoil,	rubberBar]
	]);

// solenoid
recipes.remove(solenoid);
recipes.addShaped(
	solenoid,
	[
		[wiring,	invarIngot,	wiring],
		[wiring,	invarIngot,	wiring],
		[wiring,	invarIngot,	wiring]
	]);

// servo motor
recipes.remove(servoMotor);
recipes.addShaped(
	servoMotor,
	[
		[null,		solenoid,		null],
		[wiring,	pneumaticServo,	wiring],
		[null,		solenoid,		null]
	]);

// glider wing
recipes.remove(gliderWing);
recipes.addShaped(
	gliderWing,
	[
		[null,			null,			aluminumIngot],
		[null,			aluminumIngot,	energeticAlloy],
		[aluminumIngot,	aluminumIngot,	servoMotor]
	]);

// ion thruster
recipes.remove(ionThruster);
recipes.addShaped(
	ionThruster,
	[
		[null,			FFEmitter,			solenoid],
		[vibrantAlloy,	glowstoneBucket,	null],
		[wiring,		FFEmitter,			solenoid]
	]);

// LV Capacitor
recipes.remove(LVCapacitor);
recipes.addShaped(
	LVCapacitor,
	[
		[wiring,	leadCapacitor,	wiring],
		[wiring,	basicCapacitor,	wiring],
		[wiring,	leadCapacitor,	wiring]
	]);

// MV Capacitor
recipes.remove(MVCapacitor);
recipes.addShaped(
	MVCapacitor,
	[
		[wiring,	LVCapacitor,	wiring],
		[wiring,	invarCapacitor,	wiring],
		[wiring,	LVCapacitor,	wiring]
	]);

// HV Capacitor
recipes.remove(HVCapacitor);
recipes.addShaped(
	HVCapacitor,
	[
		[wiring, MVCapacitor,		wiring],
		[wiring, enderCapacitor,	wiring],
		[wiring, MVCapacitor,		wiring]
	]);

// parachute
recipes.remove(parachute);
recipes.addShaped(
	parachute,
	[
		[wool,				wool,	wool],
		[stringy,			null,	stringy],
		[electricalSteel,	null,	electricalSteel]
	]);

// basic plating
recipes.remove(basicPlating);
recipes.addShaped(
	basicPlating,
	[
		[aluminumIngot, invarIngot, aluminumIngot],
		[invarIngot, aluminumIngot, invarIngot],
		[aluminumIngot, invarIngot, aluminumIngot]
	]);

// advanced plating
recipes.remove(advPlating);
recipes.addShaped(
	advPlating,
	[
		[platinumIngot,		darkSteelIngot,	platinumIngot],
		[darkSteelIngot,	manyullyn,		darkSteelIngot],
		[platinumIngot,		darkSteelIngot,	platinumIngot]
	]);

// force field emitter
recipes.remove(FFEmitter);
recipes.addShaped(
	FFEmitter,
	[
		[solenoid,		enderPearl,			solenoid],
		[enderPearl,	doulbeCapacitor,	enderPearl],
		[solenoid,		enderPearl,			solenoid]
	]);

// hologram Emitter
recipes.remove(holoEmitter);
recipes.addShaped(
	holoEmitter,
	[
		[glassBlock,	diamond,		glassBlock],
		[redIllumar,	greenIllumar,	blueIllumar],
		[lumiumIngot,	RSreceptCoil,	lumiumIngot]
	]);

// control circuit
recipes.remove(controlCircuit);
recipes.addShaped(
	controlCircuit,
	[
		[wiring,			greenDye,		electricalSteel],
		[redstone,			calcProc,		redstone],
		[electricalSteel,	RSreceptCoil,	wiring]
	]);

// solar cell:
recipes.remove(solarCell);
recipes.addShaped(
	solarCell,
	[
		[lapis,				NQuartz,		lapis],
		[NQuartz,			diamondBlock,	NQuartz],
		[electricalSteel,	RSreceptCoil,	electricalSteel]
	]);

// magnet
recipes.remove(magnet);
recipes.addShaped(
	magnet,
	[
		[invarIngot,	ironIngot,		invarIngot],
		[solenoid,		solenoid,		solenoid],
		[invarIngot,	RSreceptCoil,	invarIngot]
	]);

// computer chip
recipes.remove(computerChip);
recipes.addShaped(
	computerChip,
	[
		[wiring,	greenDye,		solenoid],
		[engrProc,	calcProc,		logicProc],
		[solenoid,	RSreceptCoil,	wiring]
	]);

// rubber hose
recipes.remove(rubberHose);
recipes.addShaped(
	rubberHose,
	[
		[wool,		wool,		wool],
		[rubberBar,	rubberBar,	rubberBar],
		[wool,		wool,		wool]
	]);


//////////////////////// Armor /////////////////////////////////////
// Helmet
recipes.remove(powerArmorHelmet);
recipes.addShaped(
	powerArmorHelmet,
	[
		[aluminumIngot,	aluminumIngot,	aluminumIngot],
		[wiring,		hardenedGlass,	wiring]
	]);
	
// Chestplate
recipes.remove(powerArmorChestplate);
recipes.addShaped(
	powerArmorChestplate,
	[
		[aluminumIngot,	null,			aluminumIngot],
		[wiring,		aluminumIngot,	wiring],
		[aluminumIngot,	aluminumIngot,	aluminumIngot]
	]);

// Leggings
recipes.remove(powerArmorLeggings);
recipes.addShaped(
	powerArmorLeggings,
	[
		[aluminumIngot,	aluminumIngot,	aluminumIngot],
		[wiring,		null,			wiring],
		[aluminumIngot,	null,			aluminumIngot]
	]);

// Boots
recipes.remove(powerArmorBoots);
recipes.addShaped(
	powerArmorBoots,
	[
		[wiring,		null,	wiring],
		[aluminumIngot,	null,	aluminumIngot]
	]);

// Power Glove
recipes.remove(powerGlove);
recipes.addShaped(
	powerGlove,
	[
		[null,		wiring,				null],
		[wiring,	pulsatingIronIngot,	null],
		[null,		RSreceptCoil,		wiring]
	]);
