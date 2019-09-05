Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03042AA65F
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 16:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389972AbfIEOr3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 10:47:29 -0400
Received: from forward106p.mail.yandex.net ([77.88.28.109]:45006 "EHLO
        forward106p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728590AbfIEOr2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 10:47:28 -0400
Received: from mxback3g.mail.yandex.net (mxback3g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:164])
        by forward106p.mail.yandex.net (Yandex) with ESMTP id 461481C80BA6;
        Thu,  5 Sep 2019 17:47:26 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback3g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id jF8j1gy6kH-lPGWJKAW;
        Thu, 05 Sep 2019 17:47:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567694845;
        bh=SfMtEcHfeKEDljsBBAvvXPUV0zjJeOT3v+JtIWcqrPs=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=ungROxotw3eTIFkhsCzbn2HzE+h5ZF9liFTqtcq5Rak8Uf747tM2W5oAPsbrgypA8
         pJvtyL8xYrUNzQpXd1RHHVL2/N14Tz51AFcw+/r3B4ZfW5XtiMz9ur8y3hNyppOyEn
         Zxcs5sUgDemR2vPxUMNC2zc8YbCCSVtww23sEmK0=
Authentication-Results: mxback3g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id zkoybIaMjG-lJxWPG66;
        Thu, 05 Sep 2019 17:47:24 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 16/19] GPIO: loongson: Drop Loongson-3A/3B support
Date:   Thu,  5 Sep 2019 22:43:13 +0800
Message-Id: <20190905144316.12527-17-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

GPIOs on Loongson-3A/B should never be touched by user,
it may damage hardware.
And nobody is using this driver in realworld.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/gpio/Kconfig         | 6 +++---
 drivers/gpio/gpio-loongson.c | 9 +--------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 6ed3f380a45e..95e75b2a5392 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -297,10 +297,10 @@ config GPIO_IXP4XX
 	  If unsure, say N.
 
 config GPIO_LOONGSON
-	bool "Loongson-2/3 GPIO support"
-	depends on CPU_LOONGSON2EF || CPU_LOONGSON64
+	bool "Loongson-2F GPIO support"
+	depends on CPU_LOONGSON2EF
 	help
-	  driver for GPIO functionality on Loongson-2F/3A/3B processors.
+	  driver for GPIO functionality on Loongson-2F processors.
 
 config GPIO_LPC18XX
 	tristate "NXP LPC18XX/43XX GPIO support"
diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
index 7b72846a6dc7..1d65b9a3607a 100644
--- a/drivers/gpio/gpio-loongson.c
+++ b/drivers/gpio/gpio-loongson.c
@@ -19,14 +19,7 @@
 #include <asm/types.h>
 #include <loongson2ef.h>
 
-#define STLS2F_N_GPIO		4
-#define STLS3A_N_GPIO		16
-
-#ifdef CONFIG_CPU_LOONGSON64
-#define LOONGSON_N_GPIO	STLS3A_N_GPIO
-#else
-#define LOONGSON_N_GPIO	STLS2F_N_GPIO
-#endif
+#define LOONGSON_N_GPIO	4
 
 /*
  * Offset into the register where we read lines, we write them from offset 0.
-- 
2.22.0

