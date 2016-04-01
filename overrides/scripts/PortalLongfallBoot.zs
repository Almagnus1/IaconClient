// rebalance of the Long Fall Boot, so they aren't as obvious of a boot choice
val longfallBoot = <PortalGun:LongFallBoot>;

val ardite = <ore:ingotArdite>;
val obsidian = <ore:blockObsidian>;
val diamond = <ore:gemDiamond>;
val invar = <ore:ingotInvar>;

recipes.remove(longfallBoot);
recipes.addShaped(
	<PortalGun:LongFallBoot>,
	[
		[ardite,	obsidian,	ardite],
		[invar,		diamond,	invar],
		[invar,		diamond,	invar]
	]);