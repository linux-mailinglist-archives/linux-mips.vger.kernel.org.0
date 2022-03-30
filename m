Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA5784EC3FE
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 14:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234807AbiC3M37 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 08:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346346AbiC3MXR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 08:23:17 -0400
Received: from out1.migadu.com (out1.migadu.com [IPv6:2001:41d0:2:863f::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E10A29EE02
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 05:09:45 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1648642182;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=oCxFaMTEXV7tOHotZ8HirDBqY5mnMWXp+mUY/8HQN4s=;
        b=XIOcrZURF8VbRVBNRo3oQAqhWlewoNofTloMfDKDsVZnGBEzcLMo/95L0IOZjj57mgFqQB
        BcOZjdjspksYyK4RDxKttMAJR3stJ9NMFZpXJ6JXgvchXgm77RSI/ke5MpcmNOsWRbDZEx
        IJU4hQya7lZ0xvOB70T3H9wA5aG84Yw=
From:   Jackie Liu <liu.yun@linux.dev>
To:     linus.walleij@linaro.org, ralf@linux-mips.org,
        tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, jic23@kernel.org,
        andy.shevchenko@gmail.com, sergei.shtylyov@gmail.com,
        liu.yun@linux.dev
Subject: [PATCH v4] MIPS: rb532: move GPIOD definition into C-files
Date:   Wed, 30 Mar 2022 20:09:21 +0800
Message-Id: <20220330120921.1920941-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jackie Liu <liuyun01@kylinos.cn>

My kernel robot reports build error from drivers/iio/adc/da9150-gpadc.c,

  drivers/iio/adc/da9150-gpadc.c:254:13: error: ‘DA9150_GPADC_CHAN_0x08’
  undeclared here (not in a function); did you mean ‘DA9150_GPADC_CHAN_TBAT’?
     254 |  .channel = DA9150_GPADC_CHAN_##_id,

We define GPIOD in rb.h, in fact it should only be used in gpio.c, but
it affects the driver da9150-gpadc.c which goes against the original
intention of the design, just move it to its scope.

Fixes: 1b432840d0a4 ("MIPS: RB532: GPIO register offsets are relative to GPIOBASE")
Suggested-by: Jonathan Cameron <jic23@kernel.org>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 v1->v2:
   Keep GPIONMIEN and IMASK6 as hardware document.

 v2->v3:
   s/he/it/.

 v3->v4:
   s/his/its/.

 arch/mips/include/asm/mach-rc32434/rb.h |  9 ---------
 arch/mips/rb532/gpio.c                  | 10 ++++++++++
 2 files changed, 10 insertions(+), 9 deletions(-)

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
index 94f02ada4082..29c21b9d42da 100644
--- a/arch/mips/rb532/gpio.c
+++ b/arch/mips/rb532/gpio.c
@@ -37,6 +37,16 @@
 #include <asm/mach-rc32434/rb.h>
 #include <asm/mach-rc32434/gpio.h>
 
+#define GPIOBASE	0x050000
+/* Offsets relative to GPIOBASE */
+#define GPIOFUNC	0x00
+#define GPIOCFG		0x04
+#define GPIOD		0x08
+#define GPIOILEVEL	0x0C
+#define GPIOISTAT	0x10
+#define GPIONMIEN	0x14
+#define IMASK6		0x38
+
 struct rb532_gpio_chip {
 	struct gpio_chip chip;
 	void __iomem	 *regbase;
-- 
2.25.1

