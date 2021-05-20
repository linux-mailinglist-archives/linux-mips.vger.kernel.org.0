Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C11B38B059
	for <lists+linux-mips@lfdr.de>; Thu, 20 May 2021 15:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236571AbhETNtx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 May 2021 09:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236846AbhETNtv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 May 2021 09:49:51 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA3DC061574;
        Thu, 20 May 2021 06:48:28 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id c17so12402107pfn.6;
        Thu, 20 May 2021 06:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jSviSkHyrGMFbzFJ20Y6mJ+z2w/lKcoIrG5pt7LN5uo=;
        b=HRfhfRYI/z41ZOmtimTQVFLvKwmiMKwB9ytM1W0u9NnaS9JxjLBbaOjQhC6TSqEB72
         2F0acoG8E86AS0zjpyxI8zIKSDw89V6EqDDW2iLrvmfbSjQvVWU2ZtSbVlmB/vvvIfhg
         7XOJ3qQHu++MInq7Ej0P67ZtZkG0jKdhmwLn4aNMXfmc812mFA134zbJ9Z4aO/k7w8rn
         RP9+s5tW2kAgk2+KliPI9amblo48DEBrbYoIpY7GmHtG7v2GjeIUGg6Wk0NTVWOVDuFi
         8hfJDJzP5DE6kSyRG5oupbi5CMft0RkKti9bcr7nMqPNo4qt9csDLokooR+h3+DQPxiU
         wHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jSviSkHyrGMFbzFJ20Y6mJ+z2w/lKcoIrG5pt7LN5uo=;
        b=m6WFf9VNoak9Oi0VeYbo0v2iujW+R5doUsojIFn41vMEM4iXNrgUCrjrWWx5YddvDa
         eWY0sq9MOcThTM6Egt4MLFXEZK6GOWQuGqyszDSMUZaLoXDKyvmWp+cnyrZUwfrzioBw
         rKM3Y6r/JQeILJK7QWsC0SkkrF8UxFnngE+59VtTtBsGIY69a7KfoLAM+sg1mqeYE/+H
         bL7e/fiB1ZF4J9minZGXLeoZYJ+/en5Q1Bv7o/rBkW8eLtamcmRhljFMW9r0bwCUXFjD
         sCwkTGFXwysHsJ0LnjhXqpXwVFpF9Sk0MxIKjE+In9yrrilwp4WUDNTaXSRzbVMxM2A7
         qEMw==
X-Gm-Message-State: AOAM532nx+DJkFHvor+x3hGM5j3QGSO/a3Q4/QIElIrdCQZ/Uqn/JW2J
        nG3W3DEwkrG4TRAW/mLDTfuEC+8xPTYAdg==
X-Google-Smtp-Source: ABdhPJwiSpld/9NCsgPD6JbQ9oRLwnODRZ0Id+3dbtBsQl87DQBAjeOwzr/ge7nam7zeKGucZEOGng==
X-Received: by 2002:a63:5c04:: with SMTP id q4mr4664602pgb.127.1621518507458;
        Thu, 20 May 2021 06:48:27 -0700 (PDT)
Received: from kelvin-System-Product-Name.lan ([117.173.226.141])
        by smtp.gmail.com with ESMTPSA id t14sm1954025pfg.168.2021.05.20.06.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 06:48:27 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Keguang Zhang <keguang.zhang@unisoc.com>
Subject: [PATCH 2/3] MIPS: Loongson1B: Add Loongson1 dmaengine device
Date:   Thu, 20 May 2021 21:48:08 +0800
Message-Id: <20210520134809.27143-3-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520134809.27143-1-keguang.zhang@gmail.com>
References: <20210520134809.27143-1-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Keguang Zhang <keguang.zhang@unisoc.com>

This patch adds DMA Engine device its platform data for Loongson1B.

Signed-off-by: Keguang Zhang <keguang.zhang@unisoc.com>
---
 .../include/asm/mach-loongson32/platform.h    |  2 ++
 arch/mips/loongson32/common/platform.c        | 36 +++++++++++++++++++
 arch/mips/loongson32/ls1b/board.c             | 15 +++++++-
 3 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-loongson32/platform.h b/arch/mips/include/asm/mach-loongson32/platform.h
index eb83e2741887..d4d2a9baacdb 100644
--- a/arch/mips/include/asm/mach-loongson32/platform.h
+++ b/arch/mips/include/asm/mach-loongson32/platform.h
@@ -13,6 +13,7 @@
 
 extern struct platform_device ls1x_uart_pdev;
 extern struct platform_device ls1x_cpufreq_pdev;
+extern struct platform_device ls1x_dma_pdev;
 extern struct platform_device ls1x_eth0_pdev;
 extern struct platform_device ls1x_eth1_pdev;
 extern struct platform_device ls1x_ehci_pdev;
@@ -22,6 +23,7 @@ extern struct platform_device ls1x_rtc_pdev;
 extern struct platform_device ls1x_wdt_pdev;
 
 void __init ls1x_clk_init(void);
+void __init ls1x_dma_set_platdata(struct plat_ls1x_dma *pdata);
 void __init ls1x_rtc_set_extclk(struct platform_device *pdev);
 void __init ls1x_serial_set_uartclk(struct platform_device *pdev);
 
diff --git a/arch/mips/loongson32/common/platform.c b/arch/mips/loongson32/common/platform.c
index 794c96c2a4cd..2092a7ff32e0 100644
--- a/arch/mips/loongson32/common/platform.c
+++ b/arch/mips/loongson32/common/platform.c
@@ -77,6 +77,42 @@ struct platform_device ls1x_cpufreq_pdev = {
 	},
 };
 
+/* DMA */
+static struct resource ls1x_dma_resources[] = {
+	[0] = {
+		.start = LS1X_DMAC_BASE,
+		.end = LS1X_DMAC_BASE + SZ_4 - 1,
+		.flags = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start = LS1X_DMA0_IRQ,
+		.end = LS1X_DMA0_IRQ,
+		.flags = IORESOURCE_IRQ,
+	},
+	[2] = {
+		.start = LS1X_DMA1_IRQ,
+		.end = LS1X_DMA1_IRQ,
+		.flags = IORESOURCE_IRQ,
+	},
+	[3] = {
+		.start = LS1X_DMA2_IRQ,
+		.end = LS1X_DMA2_IRQ,
+		.flags = IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device ls1x_dma_pdev = {
+	.name		= "ls1x-dma",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(ls1x_dma_resources),
+	.resource	= ls1x_dma_resources,
+};
+
+void __init ls1x_dma_set_platdata(struct plat_ls1x_dma *pdata)
+{
+	ls1x_dma_pdev.dev.platform_data = pdata;
+}
+
 /* Synopsys Ethernet GMAC */
 static struct stmmac_mdio_bus_data ls1x_mdio_bus_data = {
 	.phy_mask	= 0,
diff --git a/arch/mips/loongson32/ls1b/board.c b/arch/mips/loongson32/ls1b/board.c
index 727e06718dab..2be4d8544444 100644
--- a/arch/mips/loongson32/ls1b/board.c
+++ b/arch/mips/loongson32/ls1b/board.c
@@ -12,6 +12,17 @@
 #include <nand.h>
 #include <platform.h>
 
+static const struct dma_slave_map ls1x_dma_slave_map[] = {
+	{ "ls1x-nand", "dmachan0", (void *)LS1X_DMA_CHANNEL0 },
+	{ "ls1x-ac97", "dmachan1", (void *)LS1X_DMA_CHANNEL1 },
+	{ "ls1x-ac97", "dmachan2", (void *)LS1X_DMA_CHANNEL2 },
+};
+
+struct plat_ls1x_dma ls1x_dma_pdata = {
+	.slave_map = ls1x_dma_slave_map,
+	.slavecnt = ARRAY_SIZE(ls1x_dma_slave_map),
+};
+
 static const struct gpio_led ls1x_gpio_leds[] __initconst = {
 	{
 		.name			= "LED9",
@@ -36,6 +47,7 @@ static const struct gpio_led_platform_data ls1x_led_pdata __initconst = {
 static struct platform_device *ls1b_platform_devices[] __initdata = {
 	&ls1x_uart_pdev,
 	&ls1x_cpufreq_pdev,
+	&ls1x_dma_pdev,
 	&ls1x_eth0_pdev,
 	&ls1x_eth1_pdev,
 	&ls1x_ehci_pdev,
@@ -48,11 +60,12 @@ static struct platform_device *ls1b_platform_devices[] __initdata = {
 static int __init ls1b_platform_init(void)
 {
 	ls1x_serial_set_uartclk(&ls1x_uart_pdev);
+	ls1x_dma_set_platdata(&ls1x_dma_pdata);
 
 	gpio_led_register_device(-1, &ls1x_led_pdata);
 
 	return platform_add_devices(ls1b_platform_devices,
-				   ARRAY_SIZE(ls1b_platform_devices));
+				    ARRAY_SIZE(ls1b_platform_devices));
 }
 
 arch_initcall(ls1b_platform_init);
-- 
2.25.1

