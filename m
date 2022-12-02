Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A502640B1A
	for <lists+linux-mips@lfdr.de>; Fri,  2 Dec 2022 17:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234113AbiLBQuJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Dec 2022 11:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233995AbiLBQuE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Dec 2022 11:50:04 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D65CD9BD
        for <linux-mips@vger.kernel.org>; Fri,  2 Dec 2022 08:50:01 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2d07:19c5:4d8b:89d9])
        by albert.telenet-ops.be with bizsmtp
        id rUpV2800J0ys3B706UpVBw; Fri, 02 Dec 2022 17:49:59 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p19E8-002K5t-LE; Fri, 02 Dec 2022 17:49:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p19E8-006WZw-7R; Fri, 02 Dec 2022 17:49:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Subject: [PATCH 00/11] Fix pca954x i2c-mux node names
Date:   Fri,  2 Dec 2022 17:49:15 +0100
Message-Id: <cover.1669999298.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

	Hi all,

According to the I2C bus multiplexer/switch DT bindings, i2c-mux nodes
should be named "i2c-mux" (or something similar).
This patch series renames nodes for pca954x i2c-muxes that are flagged
by

    make dtbs_checK DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml

Please apply where appropriate.
Thanks!

Geert Uytterhoeven (11):
  ARM: dts: ti: Fix pca954x i2c-mux node names
  ARM: dts: aspeed: Fix pca954x i2c-mux node names
  ARM: dts: imx: Fix pca9547 i2c-mux node name
  ARM: dts: nuvoton: Fix pca954x i2c-mux node names
  ARM: dts: socfpga: Fix pca9548 i2c-mux node name
  ARM: dts: vf610: Fix pca9548 i2c-mux node names
  arm64: dts: freescale: Fix pca954x i2c-mux node names
  arm64: dts: marvell: Fix pca954x i2c-mux node names
  arm64: dts: renesas: ulcb-kf: Fix pca9548 i2c-mux node names
  MIPS: mscc: jaguar2: Fix pca9545 i2c-mux node names
  powerpc: dts: fsl: Fix pca954x i2c-mux node names

 arch/arm/boot/dts/am3874-iceboard.dts         |  4 +-
 .../boot/dts/aspeed-bmc-bytedance-g220a.dts   | 18 ++++----
 .../dts/aspeed-bmc-facebook-cloudripper.dts   | 10 ++--
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts | 46 +++++++++----------
 .../boot/dts/aspeed-bmc-facebook-elbert.dts   |  4 +-
 .../arm/boot/dts/aspeed-bmc-facebook-fuji.dts | 30 ++++++------
 .../boot/dts/aspeed-bmc-facebook-minipack.dts | 32 ++++++-------
 .../dts/aspeed-bmc-facebook-tiogapass.dts     |  8 ++--
 .../boot/dts/aspeed-bmc-facebook-wedge100.dts |  2 +-
 .../boot/dts/aspeed-bmc-facebook-wedge400.dts |  6 +--
 .../arm/boot/dts/aspeed-bmc-facebook-yamp.dts |  2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  | 18 ++++----
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |  8 ++--
 .../boot/dts/aspeed-bmc-inspur-fp5280g2.dts   |  4 +-
 .../boot/dts/aspeed-bmc-inspur-nf5280m6.dts   | 12 ++---
 .../dts/aspeed-bmc-inventec-transformers.dts  |  6 +--
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts |  4 +-
 .../boot/dts/aspeed-bmc-lenovo-hr855xg2.dts   |  4 +-
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts    |  4 +-
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts  |  6 +--
 arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts   | 10 ++--
 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts  | 14 +++---
 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts  | 10 ++--
 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts  | 14 +++---
 arch/arm/boot/dts/imx53-ppd.dts               |  2 +-
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts     | 16 +++----
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts     |  2 +-
 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts    |  8 ++--
 .../dts/nuvoton-npcm750-runbmc-olympus.dts    |  4 +-
 .../boot/dts/socfpga_cyclone5_vining_fpga.dts |  2 +-
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts     |  2 +-
 arch/arm/boot/dts/vf610-zii-dev-rev-c.dts     |  2 +-
 .../boot/dts/freescale/fsl-ls1012a-qds.dts    |  2 +-
 .../boot/dts/freescale/fsl-ls1043a-qds.dts    |  2 +-
 .../boot/dts/freescale/fsl-ls1046a-qds.dts    |  2 +-
 .../boot/dts/freescale/fsl-ls1088a-qds.dts    |  2 +-
 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  2 +-
 .../boot/dts/freescale/fsl-ls1088a-ten64.dts  |  2 +-
 .../boot/dts/freescale/fsl-ls208xa-qds.dtsi   |  2 +-
 .../boot/dts/freescale/fsl-ls208xa-rdb.dtsi   |  2 +-
 .../boot/dts/freescale/fsl-lx2160a-cex7.dtsi  |  2 +-
 .../boot/dts/freescale/imx8mm-nitrogen-r2.dts |  2 +-
 .../boot/dts/freescale/imx8mq-nitrogen.dts    |  4 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  2 +-
 .../boot/dts/marvell/armada-8040-mcbin.dtsi   |  2 +-
 .../dts/marvell/armada-8040-puzzle-m801.dts   |  2 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |  4 +-
 arch/mips/boot/dts/mscc/jaguar2_pcb110.dts    |  4 +-
 arch/powerpc/boot/dts/fsl/t1024qds.dts        |  2 +-
 arch/powerpc/boot/dts/fsl/t1024rdb.dts        |  2 +-
 arch/powerpc/boot/dts/fsl/t104xqds.dtsi       |  2 +-
 arch/powerpc/boot/dts/fsl/t104xrdb.dtsi       |  2 +-
 arch/powerpc/boot/dts/fsl/t208xqds.dtsi       |  2 +-
 arch/powerpc/boot/dts/fsl/t208xrdb.dtsi       |  2 +-
 54 files changed, 182 insertions(+), 182 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
