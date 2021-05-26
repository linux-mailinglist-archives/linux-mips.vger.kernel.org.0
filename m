Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAFD23918DF
	for <lists+linux-mips@lfdr.de>; Wed, 26 May 2021 15:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbhEZNdY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 May 2021 09:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234096AbhEZNdY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 May 2021 09:33:24 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD49C061574;
        Wed, 26 May 2021 06:31:52 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso3602820pjx.1;
        Wed, 26 May 2021 06:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v7TpLTV4vsoKBG/fnm3hLhrh2W548ux1D/aVpANdFpI=;
        b=kTtSNsCdqgSNPS81E9g/lcQlbTvF39hOgrq42kl26sC/8sNu5ky4OXG0wtVNZ3QP3O
         /+NaPIJDLHCrMLP6zS+1KBVROQCzm4l4U0NkwmqzvHJUobEGencYaWHjD5f82zaIBD8p
         7U8UqJtDNojHt+I/cT3X4BYuq4Tv/jvmfLx5EIqEOHOcHSFN1+byDmj+11MWhVEpT69h
         xR+X1Nt4muDJBzxxVlNmKRJlYsM6omdRdpPTd8KEujT4XvjHA1+Py9ioArZajOuSIjUh
         tculJT+1H/Da10ph048ysvJE+sJVxr81jLqh+ch2NHgnJAlGHbE6+pAxNEGToffoYvyq
         rW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v7TpLTV4vsoKBG/fnm3hLhrh2W548ux1D/aVpANdFpI=;
        b=VPNGOQ6LKmRFiexGf3IHlo1X51mhFKa5bCHF8h1AHPeTpPxB9IxU1XkSN5zWmlXgC6
         /t8xeW0aJw5JJlzsBe4e0AUeDqyQX3iambFl4lsXyS+gvr5KRioZwfFfuxEHS0lB4mlk
         MT3RiKhWBnorMAIkzfszMk2Q0j6AgXlc6ebelbhuu5ZxLCx3iDvR6p4+nFLE71ylxLkQ
         w9gX7TNlDD31PXEqbxbTikNy4jK/WNrVidRMFkCgKJAVLQe6MxYbfrN/OuMnydjic1wP
         2XP5cZairx2BDtqDJ7AsJEH13JYT9TjROm7A2/apYfliS4vIVmp2Ow7cAbEvcM1MDCEW
         xd+Q==
X-Gm-Message-State: AOAM532wCGF+Po49WMNJqDnMLKb6ItL7t5I8LFEMRjK4Xhu/yavDVtXx
        M26cj0SafY7nhrx1q80xI7wzMyiUYAzk/g==
X-Google-Smtp-Source: ABdhPJzemktT1qvrhoX/ug6bPUTRNblBh3Z0NqgNT5wrTtF/cjczm8VHYSHTpc+hPLMOPBsyrLTO3g==
X-Received: by 2002:a17:90a:8809:: with SMTP id s9mr3928394pjn.189.1622035911813;
        Wed, 26 May 2021 06:31:51 -0700 (PDT)
Received: from kelvin-System-Product-Name.lan ([112.45.97.46])
        by smtp.gmail.com with ESMTPSA id a15sm15223088pff.128.2021.05.26.06.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:31:51 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH V1 2/4] MIPS: Loongson1B: Add Loongson1 dmaengine device
Date:   Wed, 26 May 2021 21:30:58 +0800
Message-Id: <20210526133100.436048-3-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526133100.436048-1-keguang.zhang@gmail.com>
References: <20210526133100.436048-1-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Kelvin Cheung <keguang.zhang@gmail.com>

This patch adds DMA Engine device its platform data for Loongson1B.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
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
2.30.2

