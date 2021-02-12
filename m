Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA86319AD1
	for <lists+linux-mips@lfdr.de>; Fri, 12 Feb 2021 08:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhBLHpQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Feb 2021 02:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhBLHoi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Feb 2021 02:44:38 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522A0C06178B;
        Thu, 11 Feb 2021 23:43:37 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id u14so2044wmq.4;
        Thu, 11 Feb 2021 23:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nmBdTpjz9wyfDCBLaCOK+MVTcCIjG0wuVatvuQrHLh0=;
        b=sB1lzyT5Zr/jkAEhS3R6B5B1q0K26TjeqWHJmVw2KStoqjP1r+y7SHQ3D6yo6IQcrt
         SRZhRsXiKO/+pw7ntZrZktb3/H8vj3N1KA5db8qulHROmJOKpsrsuwU+kyYPLSOSPyvm
         tG5Ectw27+0cyfC9XlrK+LWjcv5K49PJ4BF5PttT0XdvCvCt2fmEZrYGR3jYz8iyHuBr
         JeB5Tkk77CSOqbVfznaw8sH0DcA37ZyMsZ1iCUYdLRruTTUTvMHDYz9EZLiIHBdArH5a
         0OLPeVfMqkEXb3ahv2BeGddmCc8NJnU4s0hEOKnYGFg2NI9ZQFFJ6+FOQgFp1D/Qv0yw
         xOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nmBdTpjz9wyfDCBLaCOK+MVTcCIjG0wuVatvuQrHLh0=;
        b=RdFkW86GufmcfEZdkTAqOLw3lSlsrYCET59BSG5DQlYJF3Zcd90Kh3JceELKozFzgd
         eZMtTHiFFV26KpfmNYhhl98FNayy5cCjbKBLsGTy1ebbTTbcwI1TDnG7i3BEX55vXeJ/
         nSJMzCsGll1ljeE3t41XS0zE5lX1gPKAY+1YZzS/OZ8Qz9hhqiAAxlwhsNkULWHEVt1g
         AzqX7Oy0Jw3GBu2YXjJyok/R6tVQqSIH9bBYo7agb4xdfBtcZRwXGPTdYgj3kOQzjiiR
         ijZFXCit50iDNYTImgHCwm+CuPCYdKVT0x1tmDqYbsVYS3iiDASklYYiV9a/11bz9/oN
         Gl4Q==
X-Gm-Message-State: AOAM5322kvjJLNkNq60GJlt5K9fyJDEW1+s50Ln1+jJnuFRxn9Xz+VWK
        r/loHmiGGXN3pPtlT+b2U0g=
X-Google-Smtp-Source: ABdhPJx/kUkORetR1vkDRcUgRn5xwtK4M7GJCrELov6ssUxoR06/6IbKKRdd22ZniEr6mPl1l6/8Eg==
X-Received: by 2002:a05:600c:33a7:: with SMTP id o39mr1490650wmp.10.1613115816063;
        Thu, 11 Feb 2021 23:43:36 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id a17sm9663858wrx.63.2021.02.11.23.43.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Feb 2021 23:43:35 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [RESEND PATCH v5 5/6] staging: mt7621-dts: use valid vendor 'mediatek' instead of invalid 'mtk'
Date:   Fri, 12 Feb 2021 08:43:29 +0100
Message-Id: <20210212074330.4650-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212074330.4650-1-sergio.paracuellos@gmail.com>
References: <20210212074330.4650-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Vendor listed for mediatek in kernel vendor file 'vendor-prefixes.yaml'
contains 'mediatek' as a valid vendor string. Some nodes in the device
tree are using an invalid vendor string vfor 'mtk' instead. Fix all of
them in dts file. Update also ralink mt7621 related code to properly
match new strings. Even there are used in the device tree there are
some strings that are not referred anywhere but have been also updated
with new vendor name. These are 'mtk,mt7621-wdt', 'mtk,mt7621-nand',
'mtk,mt7621-mc', and 'mtk,mt7621-cpc'.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/ralink/mt7621.c              |  6 +++---
 drivers/staging/mt7621-dts/mt7621.dtsi | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index ca0ac607b0f3..5d74fc1c96ac 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -112,8 +112,8 @@ phys_addr_t mips_cpc_default_phys_base(void)
 
 void __init ralink_of_remap(void)
 {
-	rt_sysc_membase = plat_of_remap_node("mtk,mt7621-sysc");
-	rt_memc_membase = plat_of_remap_node("mtk,mt7621-memc");
+	rt_sysc_membase = plat_of_remap_node("mediatek,mt7621-sysc");
+	rt_memc_membase = plat_of_remap_node("mediatek,mt7621-memc");
 
 	if (!rt_sysc_membase || !rt_memc_membase)
 		panic("Failed to remap core resources");
@@ -181,7 +181,7 @@ void prom_soc_init(struct ralink_soc_info *soc_info)
 
 	if (n0 == MT7621_CHIP_NAME0 && n1 == MT7621_CHIP_NAME1) {
 		name = "MT7621";
-		soc_info->compatible = "mtk,mt7621-soc";
+		soc_info->compatible = "mediatek,mt7621-soc";
 	} else {
 		panic("mt7621: unknown SoC, n0:%08x n1:%08x\n", n0, n1);
 	}
diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 51d83cb3b4ee..ba113e5ced51 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -56,7 +56,7 @@ palmbus: palmbus@1E000000 {
 		#size-cells = <1>;
 
 		sysc: sysc@0 {
-			compatible = "mtk,mt7621-sysc";
+			compatible = "mediatek,mt7621-sysc";
 			reg = <0x0 0x100>;
 		};
 
@@ -69,7 +69,7 @@ pll: pll {
 		};
 
 		wdt: wdt@100 {
-			compatible = "mtk,mt7621-wdt";
+			compatible = "mediatek,mt7621-wdt";
 			reg = <0x100 0x100>;
 		};
 
@@ -126,17 +126,17 @@ i2s: i2s@a00 {
 		};
 
 		memc: memc@5000 {
-			compatible = "mtk,mt7621-memc";
+			compatible = "mediatek,mt7621-memc";
 			reg = <0x5000 0x1000>;
 		};
 
 		cpc: cpc@1fbf0000 {
-			     compatible = "mtk,mt7621-cpc";
+			     compatible = "mediatek,mt7621-cpc";
 			     reg = <0x1fbf0000 0x8000>;
 		};
 
 		mc: mc@1fbf8000 {
-			    compatible = "mtk,mt7621-mc";
+			    compatible = "mediatek,mt7621-mc";
 			    reg = <0x1fbf8000 0x8000>;
 		};
 
@@ -369,7 +369,7 @@ timer {
 	nand: nand@1e003000 {
 		status = "disabled";
 
-		compatible = "mtk,mt7621-nand";
+		compatible = "mediatek,mt7621-nand";
 		bank-width = <2>;
 		reg = <0x1e003000 0x800
 			0x1e003800 0x800>;
-- 
2.25.1

