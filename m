Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACF610A928
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2019 04:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbfK0DfU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 22:35:20 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25832 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbfK0DfT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 22:35:19 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574825666; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=c723msFTwwst+/jaUbMyDXYSuJYXxa9G+8m3uqFqr96I6twi5wOskMXLg3AvEFOrWPSp3+aZ/DR0dkXoJxCCIiEJy8bi/khozU21DJKae1NSiy/ZRa//SAPRLneGoP7WJCaVxli/XdTdCY0EvzgvWwGuuOXMZ1tZOnYy0ge6gck=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574825666; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=ZhfHT3Yd767Vb+SIOILoB057P7hth83ChUL4Ha7Q7oY=; 
        b=I6Hjx2zvXCD5+Z8812104++IB2JTz1oWqcNiP8rdJDK2RPX9saWDk0IBcmuwKJ/6+GYqsyJyWkRsg2GaYGxZbKnoFNP5V1+D0COR4b+Gul/6Cg8oKUTPY1UvICrtseLO5JkAQX5bfLYDbTTK3izYI6Xu2iNqSRvXNJF3jzdG2Fg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=mX8UXWeeHW7W8IlEdGOBz49zep1b+WTjhoKO46Z0aZlIW9lx7J4FD1Y+S4nUPTkFX2xpPlX/bpqY
    YKaJuqS4exl5UD7Zx4LQsOUb32KLwWXCIyxIul8NhOy1glNZ7FWX  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574825666;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=ZhfHT3Yd767Vb+SIOILoB057P7hth83ChUL4Ha7Q7oY=;
        b=IClZZjitK/mFLBH+sTP+pke8e5GeCUyDxonqT8Z9D7BSo73/j6ee3NUA58ggZYYd
        qhaM8M1nZX5qndU6rPRRp/nqtiM5xMfVJM8lgUYoojsZqLzK0y7pzd2bqMwzBJYVSfb
        O0kvjzP107gQLVPUYWl/yv1CT7exvhviiMw6RkbY=
Received: from zhouyanjie-virtual-machine.localdomain (139.207.174.158 [139.207.174.158]) by mx.zohomail.com
        with SMTPS id 1574825665180493.9393258207798; Tue, 26 Nov 2019 19:34:25 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        syq@debian.org, paul@crapouillou.net, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH 5/5] clk: Ingenic: Add USB OTG clock for X1000.
Date:   Wed, 27 Nov 2019 11:32:56 +0800
Message-Id: <1574825576-91028-6-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
References: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add the USB OTC clock driver for the X1000 Soc from Ingenic.
2.Use the "CLK_OF_DECLARE_DRIVER" instead "CLK_OF_DECLARE" like
  the other CGU drivers.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/clk/ingenic/x1000-cgu.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ingenic/x1000-cgu.c b/drivers/clk/ingenic/x1000-cgu.c
index 7179b9f..7da7c69 100644
--- a/drivers/clk/ingenic/x1000-cgu.c
+++ b/drivers/clk/ingenic/x1000-cgu.c
@@ -18,6 +18,11 @@
 #define CGU_REG_CLKGR		0x20
 #define CGU_REG_OPCR		0x24
 #define CGU_REG_DDRCDR		0x2c
+#define CGU_REG_USBPCR		0x3c
+#define CGU_REG_USBRDT		0x40
+#define CGU_REG_USBVBFIL	0x44
+#define CGU_REG_USBPCR1		0x48
+#define CGU_REG_USBCDR		0x50
 #define CGU_REG_MACCDR		0x54
 #define CGU_REG_I2SCDR		0x60
 #define CGU_REG_LPCDR		0x64
@@ -184,6 +189,15 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		.gate = { CGU_REG_CLKGR, 5 },
 	},
 
+	[X1000_CLK_OTG] = {
+		"otg", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
+		.parents = { X1000_CLK_EXCLK, -1,
+					 X1000_CLK_APLL, X1000_CLK_MPLL },
+		.mux = { CGU_REG_USBCDR, 30, 2 },
+		.div = { CGU_REG_USBCDR, 0, 1, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 3 },
+	},
+
 	[X1000_CLK_SSIPLL] = {
 		"ssi_pll", CGU_CLK_MUX | CGU_CLK_DIV,
 		.parents = { X1000_CLK_SCLKA, X1000_CLK_MPLL, -1, -1 },
@@ -273,4 +287,4 @@ static void __init x1000_cgu_init(struct device_node *np)
 
 	ingenic_cgu_register_syscore_ops(cgu);
 }
-CLK_OF_DECLARE(x1000_cgu, "ingenic,x1000-cgu", x1000_cgu_init);
+CLK_OF_DECLARE_DRIVER(x1000_cgu, "ingenic,x1000-cgu", x1000_cgu_init);
-- 
2.7.4


