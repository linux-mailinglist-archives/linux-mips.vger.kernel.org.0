Return-Path: <linux-mips+bounces-3460-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CA18D83A0
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jun 2024 15:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90E9C1F20FE8
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jun 2024 13:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE89B12D744;
	Mon,  3 Jun 2024 13:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqwCPCKX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1D012C550;
	Mon,  3 Jun 2024 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717420401; cv=none; b=GCbW8/SzSwsb+GWcDdtujw8q8bB/PLTL7IGPVEWJHekcjY3KhCDs9nJsggizVyoa8SYHqksJ6TCORrPKhMlDoeOZkQX54uofM/ia/9E8bkf8O4OamTx65vlfB52CAf8ZlxnX9AJ0RrC6XaGZyz5+YhYHxYVhTjfuL0B99qVH/2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717420401; c=relaxed/simple;
	bh=o1YRPJ6qJEZ1CMAFtxumb6TtfEE5pv+lHDiHuw1PFEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZUcAhtOqSa3FJOrLN3wRBrJzN0e1bcxx9mfhDt8AvcYhGZb4Hz4wadMt3wlp0S0Dcqt8KDcIjUcCyGsWW5vKDfubHXu0KabX7YjuhPdmZjR9tP8NisEKBo3jOuYc7nircCnAe31vF7O2VWzoAlqq72q9oPzL2rQgrZDZS/gViYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqwCPCKX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14E1C2BD10;
	Mon,  3 Jun 2024 13:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717420400;
	bh=o1YRPJ6qJEZ1CMAFtxumb6TtfEE5pv+lHDiHuw1PFEk=;
	h=From:To:Cc:Subject:Date:From;
	b=XqwCPCKX92S0V0n2hk8gqca7Q80siGY7IyYeqsDcDKplKoaLuETUnF5Eb4+hIp8Se
	 EMjE4Wv98oEVq25AEPIcNhc5Rv4Vp5amzbDKBsi8kieRM2j5opYqvBiRJiJuJ7Gebi
	 6BrU0o5zCEeM5G73fgw1BHNTLM5dwUoFBXQZILY7sxz6kaSSGiWmWzy2d/rD/xoHEZ
	 4GQBZp+JvQzEHI+EYhEcTEInAclvA+3A4Qpr9vLKDAqw26NX9kXyo/khVV8ubT6NHr
	 Uvj+fRvVcl+CtQkpQYsdFC8u1KhyQNUFuBuc4JkOnW5zoUyxBPZygzXtmts3QyjDdk
	 64SG8oh+K3S8g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lee Jones <lee@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] dt-bindings: mfd: syscon: Add more simple compatibles
Date: Mon,  3 Jun 2024 08:12:27 -0500
Message-ID: <20240603131230.136196-2-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add another batch of various "simple" syscon compatibles which were
undocumented or still documented with old text bindings. Remove the old
text binding docs for the ones which were documented.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com> # mtd
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
- Rebase on mfd next branch

 .../bindings/arm/amlogic/analog-top.txt       | 20 -------------
 .../bindings/arm/amlogic/assist.txt           | 17 -----------
 .../bindings/arm/amlogic/bootrom.txt          | 17 -----------
 .../devicetree/bindings/arm/amlogic/pmu.txt   | 18 ------------
 .../devicetree/bindings/arm/atmel-sysregs.txt | 29 -------------------
 .../devicetree/bindings/arm/axis.txt          | 16 ----------
 .../arm/cpu-enable-method/al,alpine-smp       | 10 -------
 .../arm/freescale/fsl,vf610-mscm-cpucfg.txt   | 14 ---------
 .../bindings/arm/marvell/marvell,dove.txt     | 15 ----------
 .../devicetree/bindings/arm/spear-misc.txt    |  9 ------
 .../bindings/clock/ti-keystone-pllctrl.txt    | 20 -------------
 .../devicetree/bindings/mfd/syscon.yaml       | 29 +++++++++++++++++++
 .../devicetree/bindings/mips/mscc.txt         | 17 -----------
 .../devicetree/bindings/mtd/atmel-nand.txt    |  9 ------
 .../bindings/net/hisilicon-hip04-net.txt      | 10 -------
 15 files changed, 29 insertions(+), 221 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/analog-top.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/assist.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/bootrom.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/pmu.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-cpucfg.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/spear-misc.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/ti-keystone-pllctrl.txt

diff --git a/Documentation/devicetree/bindings/arm/amlogic/analog-top.txt b/Documentation/devicetree/bindings/arm/amlogic/analog-top.txt
deleted file mode 100644
index 101dc21014ec..000000000000
--- a/Documentation/devicetree/bindings/arm/amlogic/analog-top.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Amlogic Meson8 and Meson8b "analog top" registers:
---------------------------------------------------
-
-The analog top registers contain information about the so-called
-"metal revision" (which encodes the "minor version") of the SoC.
-
-Required properties:
-- reg: the register range of the analog top registers
-- compatible: depending on the SoC this should be one of:
-		- "amlogic,meson8-analog-top"
-		- "amlogic,meson8b-analog-top"
-		along with "syscon"
-
-
-Example:
-
-	analog_top: analog-top@81a8 {
-		compatible = "amlogic,meson8-analog-top", "syscon";
-		reg = <0x81a8 0x14>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/amlogic/assist.txt b/Documentation/devicetree/bindings/arm/amlogic/assist.txt
deleted file mode 100644
index 7656812b67b9..000000000000
--- a/Documentation/devicetree/bindings/arm/amlogic/assist.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Amlogic Meson6/Meson8/Meson8b assist registers:
------------------------------------------------
-
-The assist registers contain basic information about the SoC,
-for example the encoded SoC part number.
-
-Required properties:
-- reg: the register range of the assist registers
-- compatible: should be "amlogic,meson-mx-assist" along with "syscon"
-
-
-Example:
-
-	assist: assist@7c00 {
-		compatible = "amlogic,meson-mx-assist", "syscon";
-		reg = <0x7c00 0x200>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/amlogic/bootrom.txt b/Documentation/devicetree/bindings/arm/amlogic/bootrom.txt
deleted file mode 100644
index 407e27f230ab..000000000000
--- a/Documentation/devicetree/bindings/arm/amlogic/bootrom.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Amlogic Meson6/Meson8/Meson8b bootrom:
---------------------------------------
-
-The bootrom register area can be used to access SoC specific
-information, such as the "misc version".
-
-Required properties:
-- reg: the register range of the bootrom registers
-- compatible: should be "amlogic,meson-mx-bootrom" along with "syscon"
-
-
-Example:
-
-	bootrom: bootrom@d9040000 {
-		compatible = "amlogic,meson-mx-bootrom", "syscon";
-		reg = <0xd9040000 0x10000>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/amlogic/pmu.txt b/Documentation/devicetree/bindings/arm/amlogic/pmu.txt
deleted file mode 100644
index 72f8d08198b6..000000000000
--- a/Documentation/devicetree/bindings/arm/amlogic/pmu.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Amlogic Meson8 and Meson8b power-management-unit:
--------------------------------------------------
-
-The pmu is used to turn off and on different power domains of the SoCs
-This includes the power to the CPU cores.
-
-Required node properties:
-- compatible value : depending on the SoC this should be one of:
-			"amlogic,meson8-pmu"
-			"amlogic,meson8b-pmu"
-- reg : physical base address and the size of the registers window
-
-Example:
-
-	pmu@c81000e4 {
-		compatible = "amlogic,meson8b-pmu", "syscon";
-		reg = <0xc81000e0 0x18>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index 67a66bf74895..7374beb5a613 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -41,35 +41,6 @@ Examples:
 		reg = <0xffffe800 0x200>;
 	};
 
-RAMC PHY Controller required properties:
-- compatible: Should be "microchip,sama7g5-ddr3phy", "syscon"
-- reg: Should contain registers location and length
-
-Example:
-
-	ddr3phy: ddr3phy@e3804000 {
-		compatible = "microchip,sama7g5-ddr3phy", "syscon";
-		reg = <0xe3804000 0x1000>;
-};
-
-Special Function Registers (SFR)
-
-Special Function Registers (SFR) manage specific aspects of the integrated
-memory, bridge implementations, processor and other functionality not controlled
-elsewhere.
-
-required properties:
-- compatible: Should be "atmel,<chip>-sfr", "syscon" or
-	"atmel,<chip>-sfrbu", "syscon"
-  <chip> can be "sama5d3", "sama5d4" or "sama5d2".
-  It also can be "microchip,sam9x60-sfr", "syscon".
-- reg: Should contain registers location and length
-
-	sfr@f0038000 {
-		compatible = "atmel,sama5d3-sfr", "syscon";
-		reg = <0xf0038000 0x60>;
-	};
-
 Security Module (SECUMOD)
 
 The Security Module macrocell provides all necessary secure functions to avoid
diff --git a/Documentation/devicetree/bindings/arm/axis.txt b/Documentation/devicetree/bindings/arm/axis.txt
index ae345e1c8d2b..ebd33a88776f 100644
--- a/Documentation/devicetree/bindings/arm/axis.txt
+++ b/Documentation/devicetree/bindings/arm/axis.txt
@@ -7,22 +7,6 @@ ARTPEC-6 ARM SoC
 Required root node properties:
 - compatible = "axis,artpec6";
 
-ARTPEC-6 System Controller
---------------------------
-
-The ARTPEC-6 has a system controller with mixed functions controlling DMA, PCIe
-and resets.
-
-Required properties:
-- compatible: "axis,artpec6-syscon", "syscon"
-- reg: Address and length of the register bank.
-
-Example:
-	syscon {
-		compatible = "axis,artpec6-syscon", "syscon";
-		reg = <0xf8000000 0x48>;
-	};
-
 ARTPEC-6 Development board:
 ---------------------------
 Required root node properties:
diff --git a/Documentation/devicetree/bindings/arm/cpu-enable-method/al,alpine-smp b/Documentation/devicetree/bindings/arm/cpu-enable-method/al,alpine-smp
index 35e5afb6d9ad..cc7b1402a31f 100644
--- a/Documentation/devicetree/bindings/arm/cpu-enable-method/al,alpine-smp
+++ b/Documentation/devicetree/bindings/arm/cpu-enable-method/al,alpine-smp
@@ -27,16 +27,6 @@ Properties:
 - reg : Offset and length of the register set for the device
 
 
-* Alpine System-Fabric Service Registers
-
-The System-Fabric Service Registers allow various operation on CPU and
-system fabric, like powering CPUs off.
-
-Properties:
-- compatible : Should contain "al,alpine-sysfabric-service" and "syscon".
-- reg : Offset and length of the register set for the device
-
-
 Example:
 
 cpus {
diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-cpucfg.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-cpucfg.txt
deleted file mode 100644
index 44aa3c451ccf..000000000000
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-cpucfg.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Freescale Vybrid Miscellaneous System Control - CPU Configuration
-
-The MSCM IP contains multiple sub modules, this binding describes the first
-block of registers which contains CPU configuration information.
-
-Required properties:
-- compatible:	"fsl,vf610-mscm-cpucfg", "syscon"
-- reg:		the register range of the MSCM CPU configuration registers
-
-Example:
-	mscm_cpucfg: cpucfg@40001000 {
-		compatible = "fsl,vf610-mscm-cpucfg", "syscon";
-		reg = <0x40001000 0x800>;
-	}
diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,dove.txt b/Documentation/devicetree/bindings/arm/marvell/marvell,dove.txt
index aaaf64c56e44..e10e8525eabd 100644
--- a/Documentation/devicetree/bindings/arm/marvell/marvell,dove.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/marvell,dove.txt
@@ -5,18 +5,3 @@ Boards with a Marvell Dove SoC shall have the following properties:
 
 Required root node property:
 - compatible: must contain "marvell,dove";
-
-* Global Configuration registers
-
-Global Configuration registers of Dove SoC are shared by a syscon node.
-
-Required properties:
-- compatible: must contain "marvell,dove-global-config" and "syscon".
-- reg: base address and size of the Global Configuration registers.
-
-Example:
-
-gconf: global-config@e802c {
-	compatible = "marvell,dove-global-config", "syscon";
-	reg = <0xe802c 0x14>;
-};
diff --git a/Documentation/devicetree/bindings/arm/spear-misc.txt b/Documentation/devicetree/bindings/arm/spear-misc.txt
deleted file mode 100644
index e404e2556b4a..000000000000
--- a/Documentation/devicetree/bindings/arm/spear-misc.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-SPEAr Misc configuration
-===========================
-SPEAr SOCs have some miscellaneous registers which are used to configure
-few properties of different peripheral controllers.
-
-misc node required properties:
-
-- compatible Should be	"st,spear1340-misc", "syscon".
-- reg: Address range of misc space up to 8K
diff --git a/Documentation/devicetree/bindings/clock/ti-keystone-pllctrl.txt b/Documentation/devicetree/bindings/clock/ti-keystone-pllctrl.txt
deleted file mode 100644
index c35cb6c4af4d..000000000000
--- a/Documentation/devicetree/bindings/clock/ti-keystone-pllctrl.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* Device tree bindings for Texas Instruments keystone pll controller
-
-The main pll controller used to drive theC66x CorePacs, the switch fabric,
-and a majority of the peripheral clocks (all but the ARM CorePacs, DDR3 and
-the NETCP modules) requires a PLL Controller to manage the various clock
-divisions, gating, and synchronization.
-
-Required properties:
-
-- compatible:		"ti,keystone-pllctrl", "syscon"
-
-- reg:			contains offset/length value for pll controller
-			registers space.
-
-Example:
-
-pllctrl: pll-controller@02310000 {
-	compatible = "ti,keystone-pllctrl", "syscon";
-	reg = <0x02310000 0x200>;
-};
diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 6a5834b11a35..79830dd51ac3 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -34,36 +34,59 @@ properties:
     anyOf:
       - items:
           - enum:
+              - al,alpine-sysfabric-service
               - allwinner,sun8i-a83t-system-controller
               - allwinner,sun8i-h3-system-controller
               - allwinner,sun8i-v3s-system-controller
               - allwinner,sun50i-a64-system-controller
+              - altr,l3regs
               - altr,sdr-ctl
               - amd,pensando-elba-syscon
+              - amlogic,meson-mx-assist
+              - amlogic,meson-mx-bootrom
+              - amlogic,meson8-analog-top
+              - amlogic,meson8b-analog-top
+              - amlogic,meson8-pmu
+              - amlogic,meson8b-pmu
               - apm,xgene-csw
               - apm,xgene-efuse
               - apm,xgene-mcb
               - apm,xgene-rb
               - apm,xgene-scu
+              - atmel,sama5d2-sfrbu
+              - atmel,sama5d3-nfc-io
+              - atmel,sama5d3-sfrbu
+              - atmel,sama5d4-sfrbu
+              - axis,artpec6-syscon
               - brcm,cru-clkset
               - brcm,sr-cdru
               - brcm,sr-mhb
+              - cirrus,ep7209-syscon1
+              - cirrus,ep7209-syscon2
+              - cirrus,ep7209-syscon3
+              - cnxt,cx92755-uc
               - freecom,fsg-cs2-system-controller
               - fsl,imx93-aonmix-ns-syscfg
               - fsl,imx93-wakeupmix-syscfg
               - fsl,ls1088a-reset
+              - fsl,vf610-anatop
+              - fsl,vf610-mscm-cpucfg
               - hisilicon,dsa-subctrl
               - hisilicon,hi6220-sramctrl
+              - hisilicon,hip04-ppe
               - hisilicon,pcie-sas-subctrl
               - hisilicon,peri-subctrl
               - hpe,gxp-sysreg
               - intel,lgm-syscon
               - loongson,ls1b-syscon
               - loongson,ls1c-syscon
+              - lsi,axxia-syscon
               - marvell,armada-3700-cpu-misc
               - marvell,armada-3700-nb-pm
               - marvell,armada-3700-avs
               - marvell,armada-3700-usb2-host-misc
+              - marvell,dove-global-config
+              - mediatek,mt2701-pctl-a-syscfg
               - mediatek,mt2712-pctl-a-syscfg
               - mediatek,mt6397-pctl-pmic-syscfg
               - mediatek,mt8135-pctl-a-syscfg
@@ -71,7 +94,10 @@ properties:
               - mediatek,mt8173-pctl-a-syscfg
               - mediatek,mt8365-syscfg
               - microchip,lan966x-cpu-syscon
+              - microchip,sam9x60-sfr
+              - microchip,sama7g5-ddr3phy
               - microchip,sparx5-cpu-syscon
+              - mscc,ocelot-cpu-syscon
               - mstar,msc313-pmsleep
               - nuvoton,ma35d1-sys
               - nuvoton,wpcm450-shm
@@ -86,6 +112,8 @@ properties:
               - rockchip,rk3568-qos
               - rockchip,rk3588-qos
               - rockchip,rv1126-qos
+              - st,spear1340-misc
+              - stericsson,nomadik-pmu
               - starfive,jh7100-sysmain
               - ti,am62-usb-phy-ctrl
               - ti,am625-dss-oldi-io-ctrl
@@ -93,6 +121,7 @@ properties:
               - ti,am654-dss-oldi-io-ctrl
               - ti,am654-serdes-ctrl
               - ti,j784s4-pcie-ctrl
+              - ti,keystone-pllctrl
 
           - const: syscon
 
diff --git a/Documentation/devicetree/bindings/mips/mscc.txt b/Documentation/devicetree/bindings/mips/mscc.txt
index cc916eaeed0a..e74165696b76 100644
--- a/Documentation/devicetree/bindings/mips/mscc.txt
+++ b/Documentation/devicetree/bindings/mips/mscc.txt
@@ -25,23 +25,6 @@ Example:
 		reg = <0x71070000 0x1c>;
 	};
 
-
-o CPU system control:
-
-The SoC has a few registers (ICPU_CFG:CPU_SYSTEM_CTRL) handling configuration of
-the CPU: 8 general purpose registers, reset control, CPU en/disabling, CPU
-endianness, CPU bus control, CPU status.
-
-Required properties:
-- compatible: Should be "mscc,ocelot-cpu-syscon", "syscon"
-- reg : Should contain registers location and length
-
-Example:
-	syscon@70000000 {
-		compatible = "mscc,ocelot-cpu-syscon", "syscon";
-		reg = <0x70000000 0x2c>;
-	};
-
 o HSIO regs:
 
 The SoC has a few registers (HSIO) handling miscellaneous functionalities:
diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index 4598930851d9..e36c35b17873 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -60,15 +60,6 @@ Required properties:
 - reg: should contain 2 register ranges. The first one is pointing to the PMECC
        block, and the second one to the PMECC_ERRLOC block.
 
-* SAMA5 NFC I/O bindings:
-
-SAMA5 SoCs embed an advanced NAND controller logic to automate READ/WRITE page
-operations. This interface to this logic is placed in a separate I/O range and
-should thus have its own DT node.
-
-- compatible: should be "atmel,sama5d3-nfc-io", "syscon".
-- reg: should contain the I/O range used to interact with the NFC logic.
-
 Example:
 
 	nfc_io: nfc-io@70000000 {
diff --git a/Documentation/devicetree/bindings/net/hisilicon-hip04-net.txt b/Documentation/devicetree/bindings/net/hisilicon-hip04-net.txt
index 464c0dafc617..c09eec6422ac 100644
--- a/Documentation/devicetree/bindings/net/hisilicon-hip04-net.txt
+++ b/Documentation/devicetree/bindings/net/hisilicon-hip04-net.txt
@@ -19,16 +19,6 @@ Optional properties:
 [1] Documentation/devicetree/bindings/net/ethernet.txt
 
 
-* Ethernet ppe node:
-Control rx & tx fifos of all ethernet controllers.
-Have 2048 recv channels shared by all ethernet controllers, only if no overlap.
-Each controller's recv channel start from channel * number (RX_DESC_NUM).
-
-Required properties:
-- compatible: "hisilicon,hip04-ppe", "syscon".
-- reg: address and length of the register set for the device.
-
-
 * MDIO bus node:
 
 Required properties:
-- 
2.43.0


