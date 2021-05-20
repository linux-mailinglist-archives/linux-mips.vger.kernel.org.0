Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72EDD38B05B
	for <lists+linux-mips@lfdr.de>; Thu, 20 May 2021 15:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236592AbhETNtz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 May 2021 09:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237057AbhETNty (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 May 2021 09:49:54 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30721C061574;
        Thu, 20 May 2021 06:48:32 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id t193so11914193pgb.4;
        Thu, 20 May 2021 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5MamIp7PZGVhgWJnWNhA+A/xgbg9bu8rRNXQhAtg6wI=;
        b=fpNu6NIyHvTank++gp8/bGPqB3MFKrCJfoUNsyA3rRLaGpIbV2goXc3PzrOECwTtRd
         S4XVsOqlUgGJnoOeA5qcQFkaffUA5JXleZ7nh9pnrCZWe7oZiwElqAbmcvSclkhQVHqz
         yW7vudQ18Gi392vp0RMI2hUd/JujMwfsf2yhLOQpqAdhVfgP8x79/9TXc71EG5yCoiNO
         O/lznvYG9uDOxdTTw0twM7nCgMnzphWdbz+OF2s+DVS93vxlRNwnrns2ls4UgBlrD3dG
         23yitraE25Pv28B6rGQo3V1+wcls8co2cgiUEqIypWgbx8EuKuhiQgIZ4GFNDlNKecn+
         RIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5MamIp7PZGVhgWJnWNhA+A/xgbg9bu8rRNXQhAtg6wI=;
        b=HbY14fzw0jdYdydAGXm27xFmo6vrWTRUHKUfKdRxd82H8b1AXAq97K+05caIpPdUfb
         QExsdnbyG+nhJJFc/Rq8OfQ+2J5LATa8d2BkitQRt6c+EMVCQXCAXVa2iKukL3bkUFoQ
         vTAJJSTuCufspG2e92CuVqMAol/T3/BzMOhpUJk3iiuGEqivN0kM5ICMk6RzidYEeKNG
         MtHudZZjuBRlyfwD6FXMnbHMWWIy1dvn3UTk6RuczkCQIyjyoAqevR18xiqSsYJcyKo4
         /m7v6Q2YHqxb0IC9DcyAiTARB9d2liSigQA/MydrSyKzU/WqcAJ7vizM9OUGbt1wafu1
         Gv/A==
X-Gm-Message-State: AOAM530hqfXrpE0xl5KcP93VrWSa76oXuqq60a6AGlCGLiGsV5K1+gQ6
        aqoWhYk58kcSJn42slv8dZJfpv2PjorYTA==
X-Google-Smtp-Source: ABdhPJy5cc7QdiEfdhN2ETnUTrA4+AAJTTBYsWw1kXay6ZmdC+SwzrqZbTQ8PkKaTU5I6cqY3MlccQ==
X-Received: by 2002:a63:5503:: with SMTP id j3mr4777321pgb.256.1621518511299;
        Thu, 20 May 2021 06:48:31 -0700 (PDT)
Received: from kelvin-System-Product-Name.lan ([117.173.226.141])
        by smtp.gmail.com with ESMTPSA id t14sm1954025pfg.168.2021.05.20.06.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 06:48:30 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Keguang Zhang <keguang.zhang@unisoc.com>
Subject: [PATCH 3/3] MIPS: Loongson1B: Add Loongson1 NAND device
Date:   Thu, 20 May 2021 21:48:09 +0800
Message-Id: <20210520134809.27143-4-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520134809.27143-1-keguang.zhang@gmail.com>
References: <20210520134809.27143-1-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Keguang Zhang <keguang.zhang@unisoc.com>

This patch adds NAND device and its platform data for Loongson1B.

Signed-off-by: Keguang Zhang <keguang.zhang@unisoc.com>
---
 .../include/asm/mach-loongson32/platform.h    |  2 ++
 arch/mips/loongson32/common/platform.c        | 27 +++++++++++++++++++
 arch/mips/loongson32/ls1b/board.c             | 22 +++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/arch/mips/include/asm/mach-loongson32/platform.h b/arch/mips/include/asm/mach-loongson32/platform.h
index d4d2a9baacdb..daf02b5c83a7 100644
--- a/arch/mips/include/asm/mach-loongson32/platform.h
+++ b/arch/mips/include/asm/mach-loongson32/platform.h
@@ -19,11 +19,13 @@ extern struct platform_device ls1x_eth1_pdev;
 extern struct platform_device ls1x_ehci_pdev;
 extern struct platform_device ls1x_gpio0_pdev;
 extern struct platform_device ls1x_gpio1_pdev;
+extern struct platform_device ls1x_nand_pdev;
 extern struct platform_device ls1x_rtc_pdev;
 extern struct platform_device ls1x_wdt_pdev;
 
 void __init ls1x_clk_init(void);
 void __init ls1x_dma_set_platdata(struct plat_ls1x_dma *pdata);
+void __init ls1x_nand_set_platdata(struct plat_ls1x_nand *pdata);
 void __init ls1x_rtc_set_extclk(struct platform_device *pdev);
 void __init ls1x_serial_set_uartclk(struct platform_device *pdev);
 
diff --git a/arch/mips/loongson32/common/platform.c b/arch/mips/loongson32/common/platform.c
index 2092a7ff32e0..d47a84ecf193 100644
--- a/arch/mips/loongson32/common/platform.c
+++ b/arch/mips/loongson32/common/platform.c
@@ -287,6 +287,33 @@ struct platform_device ls1x_gpio1_pdev = {
 	.resource	= ls1x_gpio1_resources,
 };
 
+/* NAND Flash */
+static struct resource ls1x_nand_resources[] = {
+	[0] = {
+		.start	= LS1X_NAND_BASE,
+		.end	= LS1X_NAND_BASE + SZ_32 - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.name	= "dmachan0",
+		.start	= LS1X_DMA_CHANNEL0,
+		.end	= LS1X_DMA_CHANNEL0,
+		.flags	= IORESOURCE_DMA,
+	},
+};
+
+struct platform_device ls1x_nand_pdev = {
+	.name		= "ls1x-nand",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(ls1x_nand_resources),
+	.resource	= ls1x_nand_resources,
+};
+
+void __init ls1x_nand_set_platdata(struct plat_ls1x_nand *pdata)
+{
+	ls1x_nand_pdev.dev.platform_data = pdata;
+}
+
 /* USB EHCI */
 static u64 ls1x_ehci_dmamask = DMA_BIT_MASK(32);
 
diff --git a/arch/mips/loongson32/ls1b/board.c b/arch/mips/loongson32/ls1b/board.c
index 2be4d8544444..dd5a0ce9e4fb 100644
--- a/arch/mips/loongson32/ls1b/board.c
+++ b/arch/mips/loongson32/ls1b/board.c
@@ -23,6 +23,26 @@ struct plat_ls1x_dma ls1x_dma_pdata = {
 	.slavecnt = ARRAY_SIZE(ls1x_dma_slave_map),
 };
 
+static struct mtd_partition ls1x_nand_parts[] = {
+	{
+		.name        = "kernel",
+		.offset      = 0,
+		.size        = SZ_16M,
+	},
+	{
+		.name        = "rootfs",
+		.offset      = MTDPART_OFS_APPEND,
+		.size        = MTDPART_SIZ_FULL,
+	},
+};
+
+struct plat_ls1x_nand ls1x_nand_pdata = {
+	.parts		= ls1x_nand_parts,
+	.nr_parts	= ARRAY_SIZE(ls1x_nand_parts),
+	.hold_cycle	= 0x2,
+	.wait_cycle	= 0xc,
+};
+
 static const struct gpio_led ls1x_gpio_leds[] __initconst = {
 	{
 		.name			= "LED9",
@@ -53,6 +73,7 @@ static struct platform_device *ls1b_platform_devices[] __initdata = {
 	&ls1x_ehci_pdev,
 	&ls1x_gpio0_pdev,
 	&ls1x_gpio1_pdev,
+	&ls1x_nand_pdev,
 	&ls1x_rtc_pdev,
 	&ls1x_wdt_pdev,
 };
@@ -61,6 +82,7 @@ static int __init ls1b_platform_init(void)
 {
 	ls1x_serial_set_uartclk(&ls1x_uart_pdev);
 	ls1x_dma_set_platdata(&ls1x_dma_pdata);
+	ls1x_nand_set_platdata(&ls1x_nand_pdata);
 
 	gpio_led_register_device(-1, &ls1x_led_pdata);
 
-- 
2.25.1

