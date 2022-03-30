Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3F64EB834
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 04:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238754AbiC3CJj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Mar 2022 22:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiC3CJi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 29 Mar 2022 22:09:38 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D98182DBA
        for <linux-mips@vger.kernel.org>; Tue, 29 Mar 2022 19:07:53 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1648606072;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=viccxKEpinYtJeOyKzkYbGygGrkWrP3v3Ix5LWauHsw=;
        b=jDY56XjR72E579rluY4GncwNd6QnxAYFC19vtkDAEb/JaYDJpNBOJ3dlAqXeE20Re9TKKn
        iaAGNo/VJ4u+BT/T0W9XNUpC7J7cAUQ7otrAZ+fxbFS41OF8xKnoNmq5ez4W2d8sslmjUX
        7i+m/LTI3YjJvpKuF8AnkguL6uFLhuE=
From:   Jackie Liu <liu.yun@linux.dev>
To:     linus.walleij@linaro.org, ralf@linux-mips.org,
        tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, jic23@kernel.org,
        andy.shevchenko@gmail.com
Subject: [PATCH v3] MIPS: rb532: move GPIOD definition into C-files
Date:   Wed, 30 Mar 2022 10:07:27 +0800
Message-Id: <20220330020727.3303088-1-liu.yun@linux.dev>
In-Reply-To: <CAHp75VcAL6avNxMSVo9nWbxXOnKmXAiuGMV=uWwAx0BdHnf-+Q@mail.gmail.com>
References: <CAHp75VcAL6avNxMSVo9nWbxXOnKmXAiuGMV=uWwAx0BdHnf-+Q@mail.gmail.com>
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

We define GPIOD in rb.h, in fact it should only be used in gpio.c, but
it affects the driver da9150-gpadc.c which goes against the original
intention of the design, just move it to his scope.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 v1->v2:
    Keep GPIONMIEN and IMASK6 as hardware document.
 v2->v3:
    he to it.

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

