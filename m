Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89DBC196384
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2020 05:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgC1EQ1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 Mar 2020 00:16:27 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41644 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgC1EQ1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 28 Mar 2020 00:16:27 -0400
Received: by mail-pl1-f194.google.com with SMTP id d24so433817pll.8;
        Fri, 27 Mar 2020 21:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sVWn43NqLR3tLEZh5Y98iaDMlPEIz/1h2UHcds3kBXg=;
        b=QGbyYModlVyJIfWRsIVy3qc0JDBrMzhVfgj81f2hF+ehgXDrGVkeNWDUnZBgd37qVH
         S88oblXh+y+y19+93qDCbpwLtBT8Dehx2HKaBAcATYNq5Ow9x2lU7HNbvMSE3lVtD0xY
         ht0Q4DUfegGtQ14gGSSQSY2h5MdSStYnJG9q2WHZ9+nFgyBqQ0UoIo05I+LoZvxC/wUS
         CsT/cvY2oXTZLEvHUr1dExCgI2g4IxuIgeudQaNR/eRNO5ahWAhI85B2MuADh2eVaKNN
         D7UEM29ybfc7zv/wlan4FYnXo+18uRlYV6efq/ROk1rXsMJtjVhnm/DNtlGmmtlsz5tA
         IFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sVWn43NqLR3tLEZh5Y98iaDMlPEIz/1h2UHcds3kBXg=;
        b=M12ZZJraYV0hZCTlV+m6MUE5IofK1aJ3wMfw/ckyeJwTpqFcgirwmru4TUGO3xOPNC
         p3h+FxyOWgnJIjgHHNG2kfRsb1Y8QABq8MIjtnsRX0ieH9CedOzowaNvM3FuKN6849u8
         A6R+A0Vl0VokSEF/rGqD8ZllgVRwhKbDTOgTnaXzmsyfeSPLaw1l1L7CCgrp0XM1BLYY
         kURvKwc7tbQjkNbWMjsauZsg875XycLaMheSgH82SZFsZNC1DVoK8agmi+Xyazyr3SNG
         mZspXn4XCWP69oEDhuyBcM0O+W/JHAXjAmpP49Ld1TR2LbI/5pSSjKf5kht3RHNSm7kx
         UXxg==
X-Gm-Message-State: ANhLgQ0tXp7Zdjj845Is3PZNVCcPkvimINNv7D2Mq05Jhiw0ihR+Sy9i
        HqSHJySpcmHzPPzufcHNFlEw//Qi7jM=
X-Google-Smtp-Source: ADFU+vs3Ce1yOll+zcwspdvoRrWuF4MokGCPI9kd7oMAXqYASz45vLAlrXMaw0wcl2frQjxLG/SpOA==
X-Received: by 2002:a17:90a:db02:: with SMTP id g2mr2895113pjv.15.1585368985725;
        Fri, 27 Mar 2020 21:16:25 -0700 (PDT)
Received: from guoguo-omen.lan ([240e:379:97d:e970:8934:6f24:2a5f:6e75])
        by smtp.gmail.com with ESMTPSA id v123sm5174578pfb.85.2020.03.27.21.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 21:16:25 -0700 (PDT)
From:   Chuanhong Guo <gch981213@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     Chuanhong Guo <gch981213@gmail.com>,
        John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: ralink: drop ralink_clk_init for mt7621
Date:   Sat, 28 Mar 2020 12:14:57 +0800
Message-Id: <20200328041523.81229-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ralink_clk_init is only called in arch/mips/ralink/clk.c which isn't
compiled for mt7621. And it doesn't export a proper cpu clock.
Drop this unused function.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/mips/ralink/mt7621.c | 43 ---------------------------------------
 1 file changed, 43 deletions(-)

diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index 905460aeeb1f..e309a79b18e4 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -20,11 +20,6 @@
 
 #include "common.h"
 
-#define SYSC_REG_SYSCFG		0x10
-#define SYSC_REG_CPLL_CLKCFG0	0x2c
-#define SYSC_REG_CUR_CLK_STS	0x44
-#define CPU_CLK_SEL		(BIT(30) | BIT(31))
-
 #define MT7621_GPIO_MODE_UART1		1
 #define MT7621_GPIO_MODE_I2C		2
 #define MT7621_GPIO_MODE_UART3_MASK	0x3
@@ -115,44 +110,6 @@ phys_addr_t mips_cpc_default_phys_base(void)
 	panic("Cannot detect cpc address");
 }
 
-void __init ralink_clk_init(void)
-{
-	int cpu_fdiv = 0;
-	int cpu_ffrac = 0;
-	int fbdiv = 0;
-	u32 clk_sts, syscfg;
-	u8 clk_sel = 0, xtal_mode;
-	u32 cpu_clk;
-
-	if ((rt_sysc_r32(SYSC_REG_CPLL_CLKCFG0) & CPU_CLK_SEL) != 0)
-		clk_sel = 1;
-
-	switch (clk_sel) {
-	case 0:
-		clk_sts = rt_sysc_r32(SYSC_REG_CUR_CLK_STS);
-		cpu_fdiv = ((clk_sts >> 8) & 0x1F);
-		cpu_ffrac = (clk_sts & 0x1F);
-		cpu_clk = (500 * cpu_ffrac / cpu_fdiv) * 1000 * 1000;
-		break;
-
-	case 1:
-		fbdiv = ((rt_sysc_r32(0x648) >> 4) & 0x7F) + 1;
-		syscfg = rt_sysc_r32(SYSC_REG_SYSCFG);
-		xtal_mode = (syscfg >> 6) & 0x7;
-		if (xtal_mode >= 6) {
-			/* 25Mhz Xtal */
-			cpu_clk = 25 * fbdiv * 1000 * 1000;
-		} else if (xtal_mode >= 3) {
-			/* 40Mhz Xtal */
-			cpu_clk = 40 * fbdiv * 1000 * 1000;
-		} else {
-			/* 20Mhz Xtal */
-			cpu_clk = 20 * fbdiv * 1000 * 1000;
-		}
-		break;
-	}
-}
-
 void __init ralink_of_remap(void)
 {
 	rt_sysc_membase = plat_of_remap_node("mtk,mt7621-sysc");
-- 
2.25.1

