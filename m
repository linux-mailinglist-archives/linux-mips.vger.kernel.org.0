Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 615407600B7
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jul 2023 22:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbjGXUzL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jul 2023 16:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbjGXUzI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Jul 2023 16:55:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98ED01993;
        Mon, 24 Jul 2023 13:55:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 049D0613EA;
        Mon, 24 Jul 2023 20:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E68C433C7;
        Mon, 24 Jul 2023 20:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690232102;
        bh=A8VV04hZFGARzYXaorqPchLa3txkbwjn0jFkVvUjSbM=;
        h=From:To:Cc:Subject:Date:From;
        b=ZqAC+fcTUPM6w5OzGEOFPyg8asPmpgwf4q34EfDeQkOoMvgTUeSJiUNZGmO1YBt5x
         CzqY4+u27xjELWUkP7Fjk0Uqe06g2Ki4R/oCdxVZirsXtWtV29F0A/wz9PAMq5i9Kp
         d1bi6y4yjIk0xGIFuwP0hQbNv1ahTCvAyeZEu1VRsw+0WFgEGj9PRmE6BYJ9Kdd1sp
         id+c0SWLCal20yF/87NSNZTekyCkJ9im9dLmYRoiyVwVKwCvOm03+hdbjk0GPNq5Tz
         pIDp+kEkFLvneie0Lsem/Y5b4D+xnqymLEzFvG18uXldOtD1hTLtkDh8gyYB+fpWcp
         bZYf1qdzNzUdQ==
Received: (nullmailer pid 767567 invoked by uid 1000);
        Mon, 24 Jul 2023 20:54:58 -0000
From:   Rob Herring <robh@kernel.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
Subject: [PATCH v2] rtc: Explicitly include correct DT includes
Date:   Mon, 24 Jul 2023 14:54:54 -0600
Message-Id: <20230724205456.767430-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
- Add rtc-mpc5121.c
---
 drivers/rtc/rtc-abx80x.c        | 2 +-
 drivers/rtc/rtc-armada38x.c     | 1 -
 drivers/rtc/rtc-at91rm9200.c    | 1 -
 drivers/rtc/rtc-ds1742.c        | 1 -
 drivers/rtc/rtc-fsl-ftm-alarm.c | 5 +----
 drivers/rtc/rtc-isl12026.c      | 1 -
 drivers/rtc/rtc-isl1208.c       | 2 +-
 drivers/rtc/rtc-jz4740.c        | 2 +-
 drivers/rtc/rtc-lpc24xx.c       | 3 +--
 drivers/rtc/rtc-m41t80.c        | 2 +-
 drivers/rtc/rtc-mpc5121.c       | 4 +---
 drivers/rtc/rtc-mt6397.c        | 2 +-
 drivers/rtc/rtc-mt7622.c        | 4 ++--
 drivers/rtc/rtc-mxc.c           | 1 -
 drivers/rtc/rtc-pcf85063.c      | 2 +-
 drivers/rtc/rtc-pcf85363.c      | 1 -
 drivers/rtc/rtc-pxa.c           | 1 -
 drivers/rtc/rtc-rs5c372.c       | 2 +-
 drivers/rtc/rtc-rv3028.c        | 2 +-
 drivers/rtc/rtc-rv3032.c        | 2 +-
 drivers/rtc/rtc-rv8803.c        | 2 +-
 drivers/rtc/rtc-rx6110.c        | 1 -
 drivers/rtc/rtc-rx8581.c        | 1 -
 drivers/rtc/rtc-rzn1.c          | 2 +-
 drivers/rtc/rtc-s3c.c           | 1 -
 drivers/rtc/rtc-stm32.c         | 3 ++-
 drivers/rtc/rtc-stmp3xxx.c      | 1 -
 drivers/rtc/rtc-sun6i.c         | 1 -
 drivers/rtc/rtc-sunxi.c         | 2 --
 drivers/rtc/rtc-ti-k3.c         | 2 +-
 30 files changed, 19 insertions(+), 38 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index e08d3181bd2a..fde2b8054c2e 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -15,7 +15,7 @@
 #include <linux/i2c.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/rtc.h>
 #include <linux/watchdog.h>
 
diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
index b4139c200676..8abcad38b10c 100644
--- a/drivers/rtc/rtc-armada38x.c
+++ b/drivers/rtc/rtc-armada38x.c
@@ -11,7 +11,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
 
diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index e9d17232d0a8..245588a7b417 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -22,7 +22,6 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
diff --git a/drivers/rtc/rtc-ds1742.c b/drivers/rtc/rtc-ds1742.c
index a5026b0514e7..6ae8b9a294fe 100644
--- a/drivers/rtc/rtc-ds1742.c
+++ b/drivers/rtc/rtc-ds1742.c
@@ -16,7 +16,6 @@
 #include <linux/jiffies.h>
 #include <linux/rtc.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/module.h>
diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 3d7c4077fe1c..a72c4ad0cec6 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -11,11 +11,8 @@
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/fsl/ftm.h>
 #include <linux/rtc.h>
diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
index 5abff5d348ac..8b00659fc955 100644
--- a/drivers/rtc/rtc-isl12026.c
+++ b/drivers/rtc/rtc-isl12026.c
@@ -11,7 +11,6 @@
 #include <linux/mutex.h>
 #include <linux/nvmem-provider.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/rtc.h>
 #include <linux/slab.h>
 
diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index b0712b4e3648..57e65e1b11f0 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -9,7 +9,7 @@
 #include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/rtc.h>
 
diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 36453b008139..6ba889d7d4c4 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -11,7 +11,7 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/property.h>
diff --git a/drivers/rtc/rtc-lpc24xx.c b/drivers/rtc/rtc-lpc24xx.c
index a4612e543f35..df17c48ff086 100644
--- a/drivers/rtc/rtc-lpc24xx.c
+++ b/drivers/rtc/rtc-lpc24xx.c
@@ -9,9 +9,8 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
 
diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 3cc5151e0986..866489ad56d6 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -17,7 +17,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/rtc.h>
 #include <linux/slab.h>
 #include <linux/mutex.h>
diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
index 07df43e4c4d0..28858fcaea8f 100644
--- a/drivers/rtc/rtc-mpc5121.c
+++ b/drivers/rtc/rtc-mpc5121.c
@@ -11,10 +11,8 @@
 #include <linux/module.h>
 #include <linux/rtc.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/slab.h>
 
diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 1d297af80f87..1617063669cc 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -9,7 +9,7 @@
 #include <linux/mfd/mt6397/core.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
diff --git a/drivers/rtc/rtc-mt7622.c b/drivers/rtc/rtc-mt7622.c
index 81857a457c32..094c649fc137 100644
--- a/drivers/rtc/rtc-mt7622.c
+++ b/drivers/rtc/rtc-mt7622.c
@@ -7,9 +7,9 @@
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
 
diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
index 762cf03345f1..dbb935dbbd8a 100644
--- a/drivers/rtc/rtc-mxc.c
+++ b/drivers/rtc/rtc-mxc.c
@@ -11,7 +11,6 @@
 #include <linux/pm_wakeirq.h>
 #include <linux/clk.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 
 #define RTC_INPUT_CLK_32768HZ	(0x00 << 5)
 #define RTC_INPUT_CLK_32000HZ	(0x01 << 5)
diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index e517abfaee2a..073977d71b18 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -14,7 +14,7 @@
 #include <linux/bcd.h>
 #include <linux/rtc.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index 65b8b1338dbb..569c79bac0ee 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -15,7 +15,6 @@
 #include <linux/errno.h>
 #include <linux/bcd.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/regmap.h>
 
 /*
diff --git a/drivers/rtc/rtc-pxa.c b/drivers/rtc/rtc-pxa.c
index eeacf480cf36..e400c78252e8 100644
--- a/drivers/rtc/rtc-pxa.c
+++ b/drivers/rtc/rtc-pxa.c
@@ -14,7 +14,6 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 
 #include "rtc-sa1100.h"
 
diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index a5a6c8772ecd..ecabeef09196 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -12,7 +12,7 @@
 #include <linux/bcd.h>
 #include <linux/slab.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 /*
  * Ricoh has a family of I2C based RTCs, which differ only slightly from
diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 076e56f4e01a..68d86d06c3c3 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -17,7 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/log2.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
 
diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index 6b8eb2039a33..35b2e36b426a 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -19,7 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/log2.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
 
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 98679cae13e8..fd8ab0b2f731 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -15,7 +15,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/rtc.h>
 
 #define RV8803_I2C_TRY_COUNT		4
diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index 8702db6096ba..834274db8c3f 100644
--- a/drivers/rtc/rtc-rx6110.c
+++ b/drivers/rtc/rtc-rx6110.c
@@ -13,7 +13,6 @@
 #include <linux/regmap.h>
 #include <linux/rtc.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/spi/spi.h>
 #include <linux/i2c.h>
 
diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
index 82881fd2e14a..48efd61a114d 100644
--- a/drivers/rtc/rtc-rx8581.c
+++ b/drivers/rtc/rtc-rx8581.c
@@ -13,7 +13,6 @@
 #include <linux/i2c.h>
 #include <linux/bcd.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
 #include <linux/log2.h>
diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index dca736caba85..6f98969eedca 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -15,7 +15,7 @@
 #include <linux/init.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 70e1a18e5efd..282238818f63 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -23,7 +23,6 @@
 #include <linux/log2.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
 
diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 3d36e11cff80..2c114e3b0f66 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -10,7 +10,8 @@
 #include <linux/ioport.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index 6f11b745f34d..7566d0a44af8 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -18,7 +18,6 @@
 #include <linux/delay.h>
 #include <linux/rtc.h>
 #include <linux/slab.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/stmp_device.h>
 #include <linux/stmp3xxx_rtc_wdt.h>
diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 71548dd59a3a..753a2d9c8a17 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -24,7 +24,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
 #include <linux/slab.h>
diff --git a/drivers/rtc/rtc-sunxi.c b/drivers/rtc/rtc-sunxi.c
index 5d019e3a835a..5cab9953c44f 100644
--- a/drivers/rtc/rtc-sunxi.c
+++ b/drivers/rtc/rtc-sunxi.c
@@ -14,8 +14,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
 #include <linux/types.h>
diff --git a/drivers/rtc/rtc-ti-k3.c b/drivers/rtc/rtc-ti-k3.c
index 0d90fe923355..ec759d8f7023 100644
--- a/drivers/rtc/rtc-ti-k3.c
+++ b/drivers/rtc/rtc-ti-k3.c
@@ -9,7 +9,7 @@
 #include <linux/delay.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/sys_soc.h>
 #include <linux/property.h>
-- 
2.40.1

