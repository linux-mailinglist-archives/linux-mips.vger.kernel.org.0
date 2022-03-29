Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C92434EA4BD
	for <lists+linux-mips@lfdr.de>; Tue, 29 Mar 2022 03:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiC2Br7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Mar 2022 21:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiC2Brv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Mar 2022 21:47:51 -0400
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9921CCAD9
        for <linux-mips@vger.kernel.org>; Mon, 28 Mar 2022 18:46:05 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1648518363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=mzzwEJFVlfhVrSEyRVWxpetdTlhTag7bSJsOqkPYJC0=;
        b=UoUNSoFcsAp4ej9vYwyXwYekqjo0mGN/KPeGGR9xitYBA70nlkdzxvBjfvgK/2A3dCFkQ7
        kxCpbtRaIWCvLpofcEVRt9N7cug/1UfdqESCicF9zR10x2735KuISUEpW1Z3xRXOncoRZZ
        TFVhtb4w7Wxaw4dSDaA2o2cm39P0EJQ=
From:   Jackie Liu <liu.yun@linux.dev>
To:     linus.walleij@linaro.org, ralf@linux-mips.org,
        tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, jic23@kernel.org,
        andy.shevchenko@gmail.com
Subject: [PATCH] MIPS: rb532: move GPIOD definition into C-files
Date:   Tue, 29 Mar 2022 09:45:37 +0800
Message-Id: <20220329014537.4180966-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jackie Liu <liuyun01@kylinos.cn>

My kernel robot report build error from drivers/iio/adc/da9150-gpadc.c,

We define GPIOD in rb.h, in fact he should only be used in gpio.c, but
it affects the driver da9150-gpadc.c which goes against the original
intention of the design, just move it to his scope.

At the same time, GPIONMIEN and IMASK6 are not used anywhere, just delete
them.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 arch/mips/include/asm/mach-rc32434/rb.h | 9 ---------
 arch/mips/rb532/gpio.c                  | 8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/mips/include/asm/mach-rc32434/rb.h b/arch/mips/include/asm/mach-rc32434/rb.h
index 34d179ca020b..dd9d4b026e62 100644
--- a/arch/mips/include/asm/mach-rc32434/rb.h
+++ b/arch/mips/include/asm/mach-rc32434/rb.h
@@ -29,15 +29,6 @@
 #define DEV3TC		0x01003C
 #define BTCS		0x010040
 #define BTCOMPARE	0x010044
-#define GPIOBASE	0x050000
-/* Offsets relative to GPIOBASE */
-#define GPIOFUNC	0x00
-#define GPIOCFG		0x04
-#define GPIOD		0x08
-#define GPIOILEVEL	0x0C
-#define GPIOISTAT	0x10
-#define GPIONMIEN	0x14
-#define IMASK6		0x38
 #define LO_WPX		(1 << 0)
 #define LO_ALE		(1 << 1)
 #define LO_CLE		(1 << 2)
diff --git a/arch/mips/rb532/gpio.c b/arch/mips/rb532/gpio.c
index 94f02ada4082..43e188d53a49 100644
--- a/arch/mips/rb532/gpio.c
+++ b/arch/mips/rb532/gpio.c
@@ -37,6 +37,14 @@
 #include <asm/mach-rc32434/rb.h>
 #include <asm/mach-rc32434/gpio.h>
 
+#define GPIOBASE	0x050000
+/* Offsets relative to GPIOBASE */
+#define GPIOFUNC	0x00
+#define GPIOCFG		0x04
+#define GPIOD		0x08
+#define GPIOILEVEL	0x0C
+#define GPIOISTAT	0x10
+
 struct rb532_gpio_chip {
 	struct gpio_chip chip;
 	void __iomem	 *regbase;
-- 
2.25.1

