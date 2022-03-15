Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBB14D9C91
	for <lists+linux-mips@lfdr.de>; Tue, 15 Mar 2022 14:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239682AbiCONpt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Mar 2022 09:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234139AbiCONpt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Mar 2022 09:45:49 -0400
X-Greylist: delayed 908 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Mar 2022 06:44:37 PDT
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A1E27B28
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 06:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647350942; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=ScvkKBtXG0qdn0mauPdahMW+RjSCyD8vzYY6IXSzGqrqJ0uRruKCYGR41Phb8QjJ3aKV407ZfFYB/fdejI1d+Q9WhdJNfqLekkGWdwpX74l/4A6GPHQ8M7cAtY8BgGMMBZeSuDfDyh28+j39irhywl0CwAM9r4yyXCUgDBM/864=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1647350942; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=sNhaXvyi8YDqFUl3xFmq63+uF4zWI49tDG+hI38O0eo=; 
        b=cZkUgC/+yvgvb6xdpejJgIhXcJ0icbm4QZBl43GFyfjjHJe2s/lWPErhyd3srDRHlftFTnit3JSyk1SV2vuX7F1hcYifx2FoKb2QaP9nRFiogIwGj9aW4ySMyCJquQT14xGWIGirbcAzCQsZIpMtSawujo40Youomt8fmmFFhyA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=arinc9.com;
        spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
        dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1647350942;
        s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
        h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
        bh=sNhaXvyi8YDqFUl3xFmq63+uF4zWI49tDG+hI38O0eo=;
        b=D+jcP5Krmiwo62ABhcPFRY+6OpnpNyDOG+KbsVeLbpDbsejFzqAYhFKWJrdYWJu+
        pSi5encngtrTTNnxOIDUgmeuObiPVwZxAzyMpy1rWKP5bqwNiX31nh/D3hP/VQIFNFC
        esqARFZtTZM0sdQAryi7ci+JxklShiqeVSVTFSaY=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
        with SMTPS id 1647350940373463.6171585371825; Tue, 15 Mar 2022 06:29:00 -0700 (PDT)
From:   =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        NeilBrown <neil@brown.name>, DENG Qingfang <dqfext@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        erkin.bozoglu@xeront.com
Cc:     linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH] mips: dts: ralink: add MT7621 SoC
Date:   Tue, 15 Mar 2022 16:28:36 +0300
Message-Id: <20220315132836.1062-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The MT7621 system-on-a-chip includes a 880 MHz MIPS1004Kc dual-core CPU,
a 5-port 10/100/1000 switch/PHY and one RGMII.

Add the devicetrees for GB-PC1 and GB-PC2 devices which use MT7621 SoC.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
I'm not sure which repository/branch this patch is supposed to be applied
to. This patch does changes on top of commit dcd520af4eac ("staging:
mt7621-dts: fix cpuintc and fixedregulator dtc warnings, fix xhci") which
is currently applied on gregkh/staging.git staging-next branch.

Arınç

---
 MAINTAINERS                                           |  7 +++++++
 arch/mips/boot/dts/ralink/Makefile                    |  4 ++++
 .../mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts     |  0
 .../mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts     |  0
 .../mips/boot/dts/ralink}/mt7621.dtsi                 |  0
 arch/mips/ralink/Kconfig                              |  5 +++++
 drivers/staging/Kconfig                               |  2 --
 drivers/staging/Makefile                              |  1 -
 drivers/staging/mt7621-dts/Kconfig                    | 11 -----------
 drivers/staging/mt7621-dts/Makefile                   |  5 -----
 drivers/staging/mt7621-dts/TODO                       |  5 -----
 11 files changed, 16 insertions(+), 24 deletions(-)
 rename drivers/staging/mt7621-dts/gbpc1.dts => arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts (100%)
 rename drivers/staging/mt7621-dts/gbpc2.dts => arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts (100%)
 rename {drivers/staging/mt7621-dts => arch/mips/boot/dts/ralink}/mt7621.dtsi (100%)
 delete mode 100644 drivers/staging/mt7621-dts/Kconfig
 delete mode 100644 drivers/staging/mt7621-dts/Makefile
 delete mode 100644 drivers/staging/mt7621-dts/TODO

diff --git a/MAINTAINERS b/MAINTAINERS
index 62d6758bf8c4..92eda5adca44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16181,6 +16181,13 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/ralink
 
+RALINK MT7621 MIPS ARCHITECTURE
+M:	Arınç ÜNAL <arinc.unal@arinc9.com>
+M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
+L:	linux-mips@vger.kernel.org
+S:	Maintained
+F:	arch/mips/boot/dts/ralink/mt7621*
+
 RALINK RT2X00 WIRELESS LAN DRIVER
 M:	Stanislaw Gruszka <stf_xl@wp.pl>
 M:	Helmut Schaa <helmut.schaa@googlemail.com>
diff --git a/arch/mips/boot/dts/ralink/Makefile b/arch/mips/boot/dts/ralink/Makefile
index 6c26dfa0a903..11732b8c8163 100644
--- a/arch/mips/boot/dts/ralink/Makefile
+++ b/arch/mips/boot/dts/ralink/Makefile
@@ -6,4 +6,8 @@ dtb-$(CONFIG_DTB_MT7620A_EVAL)	+= mt7620a_eval.dtb
 dtb-$(CONFIG_DTB_OMEGA2P)	+= omega2p.dtb
 dtb-$(CONFIG_DTB_VOCORE2)	+= vocore2.dtb
 
+dtb-$(CONFIG_SOC_MT7621) += \
+	mt7621-gnubee-gb-pc1.dtb \
+	mt7621-gnubee-gb-pc2.dtb
+
 obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/drivers/staging/mt7621-dts/gbpc1.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
similarity index 100%
rename from drivers/staging/mt7621-dts/gbpc1.dts
rename to arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
diff --git a/drivers/staging/mt7621-dts/gbpc2.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
similarity index 100%
rename from drivers/staging/mt7621-dts/gbpc2.dts
rename to arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
similarity index 100%
rename from drivers/staging/mt7621-dts/mt7621.dtsi
rename to arch/mips/boot/dts/ralink/mt7621.dtsi
diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index 120adad51d6a..841c0f69a3bf 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -54,10 +54,15 @@ choice
 		select HAVE_PCI
 		select PCI_DRIVERS_GENERIC
 		select SOC_BUS
+
+		help
+		  The MT7621 system-on-a-chip includes a 880 MHz MIPS1004Kc dual-core CPU,
+		  a 5-port 10/100/1000 switch/PHY and one RGMII.
 endchoice
 
 choice
 	prompt "Devicetree selection"
+	depends on !SOC_MT7621
 	default DTB_RT_NONE
 	help
 	  Select the devicetree.
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index d1ce500c0319..efa194ec12fb 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -82,8 +82,6 @@ source "drivers/staging/vc04_services/Kconfig"
 
 source "drivers/staging/pi433/Kconfig"
 
-source "drivers/staging/mt7621-dts/Kconfig"
-
 source "drivers/staging/axis-fifo/Kconfig"
 
 source "drivers/staging/fieldbus/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 82e912a7586f..db876663a1e3 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -31,7 +31,6 @@ obj-$(CONFIG_KS7010)		+= ks7010/
 obj-$(CONFIG_GREYBUS)		+= greybus/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= vc04_services/
 obj-$(CONFIG_PI433)		+= pi433/
-obj-$(CONFIG_SOC_MT7621)	+= mt7621-dts/
 obj-$(CONFIG_XIL_AXIS_FIFO)	+= axis-fifo/
 obj-$(CONFIG_FIELDBUS_DEV)     += fieldbus/
 obj-$(CONFIG_QLGE)		+= qlge/
diff --git a/drivers/staging/mt7621-dts/Kconfig b/drivers/staging/mt7621-dts/Kconfig
deleted file mode 100644
index 6932ab7acadf..000000000000
--- a/drivers/staging/mt7621-dts/Kconfig
+++ /dev/null
@@ -1,11 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config DTB_GNUBEE1
-	bool "GnuBee1 2.5inch NAS"
-	depends on SOC_MT7621 && DTB_RT_NONE
-	select BUILTIN_DTB
-
-config DTB_GNUBEE2
-	bool "GnuBee2 3.5inch NAS"
-	depends on SOC_MT7621 && DTB_RT_NONE
-	select BUILTIN_DTB
-
diff --git a/drivers/staging/mt7621-dts/Makefile b/drivers/staging/mt7621-dts/Makefile
deleted file mode 100644
index b4ab99fed932..000000000000
--- a/drivers/staging/mt7621-dts/Makefile
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_DTB_GNUBEE1)      += gbpc1.dtb
-dtb-$(CONFIG_DTB_GNUBEE2)      += gbpc2.dtb
-
-obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
diff --git a/drivers/staging/mt7621-dts/TODO b/drivers/staging/mt7621-dts/TODO
deleted file mode 100644
index 1b758e5c84e0..000000000000
--- a/drivers/staging/mt7621-dts/TODO
+++ /dev/null
@@ -1,5 +0,0 @@
-
-- ensure all usage matches code
-- ensure all features used are documented
-
-Cc: NeilBrown <neil@brown.name>
-- 
2.25.1

