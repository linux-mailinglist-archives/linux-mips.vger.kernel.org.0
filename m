Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A08235AB33
	for <lists+linux-mips@lfdr.de>; Sat, 10 Apr 2021 07:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234364AbhDJFv3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 10 Apr 2021 01:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234327AbhDJFvW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 10 Apr 2021 01:51:22 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E1AC061764;
        Fri,  9 Apr 2021 22:51:06 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id k128so3914495wmk.4;
        Fri, 09 Apr 2021 22:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p/+xyni/YCGnKs32N9UtSLDiZXGL8+kotlNAwV9L5+c=;
        b=NfvK5567HYt28UkCipC06OgWMXPv7Xs9pNRCvykTRcAx00BjWzfFEEWJrOxksUatKW
         2S6pPl424KJmgjkuSQKibYoX53aeHq480QN+onSdVaokc/YY/JgCIFP3Huzopt3gegXw
         wvl59Pvp7FIH5pHL9hI3eKy2D4IdSzD0UAdivVAniXC79uFka4smA7mFrZUKSV5LzZok
         v94MeQJhw5GeqR64FbhauTZv1c41UvLJkSsaqRFWnmtq5Xn11CvN+Amf3NRNo0w3efeT
         PWIWzm+ufZw+StStCPPL+sLsGokA9V2dDUay0KgscK5/vtDrMzDuGvzRh9wTM1zcl7nD
         8Rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p/+xyni/YCGnKs32N9UtSLDiZXGL8+kotlNAwV9L5+c=;
        b=c28EFo9gKXlqd+KckX03IZehfIxhCjWqsEM0eyGl8Satw2MrJN4ULq4lm9JJeE8fgp
         Us/ZO7g4yPOwAgIZZfQWMdYKOh+NGR1CxbTDTyS6dHkWgIGI/yzZMLbae5tjIXxdb5EK
         Sn8wRhBAvGtbjbA1QlV+qIf5kBTW/0L/fMi5au6vpWCo5s+3qsuUBfNFmtFFybwyqli5
         p2+1yZuZFicvZZ8SBWzMvT4pgxMjK3CqkQbt8novLvRqxU7EsfcVUVsvK7NJpkYEPFkS
         gujRhgka7EeSjLGjfrsW2Ik+mZDeybdkFntvl9RqsEEL31ChWamOdWKkwR6j4W0M2CZR
         f9kA==
X-Gm-Message-State: AOAM532PcoOWV+98WQznqMgNw5CzmO5r4J8V3tHLp5zPOA+RtshmRW7h
        bNGvzAZyr2xYmKfJedwKlik=
X-Google-Smtp-Source: ABdhPJz25GEZhbs/h2JpGSa5AGxf7gRmHLyLhu2qvbYdZpuKoymAD7tbn7xeXclHbozOjtpqTeTEgw==
X-Received: by 2002:a05:600c:2ca:: with SMTP id 10mr16977918wmn.40.1618033865267;
        Fri, 09 Apr 2021 22:51:05 -0700 (PDT)
Received: from localhost.localdomain (225.red-83-57-119.dynamicip.rima-tde.net. [83.57.119.225])
        by smtp.gmail.com with ESMTPSA id o2sm6376518wmc.23.2021.04.09.22.51.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Apr 2021 22:51:04 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v13 3/4] staging: mt7621-dts: use valid vendor 'mediatek' instead of invalid 'mtk'
Date:   Sat, 10 Apr 2021 07:50:58 +0200
Message-Id: <20210410055059.13518-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210410055059.13518-1-sergio.paracuellos@gmail.com>
References: <20210410055059.13518-1-sergio.paracuellos@gmail.com>
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

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/ralink/mt7621.c              |  6 +++---
 drivers/staging/mt7621-dts/mt7621.dtsi | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index 6b3db98894cb..f82ad2a621f6 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -136,8 +136,8 @@ static void __init mt7621_memory_detect(void)
 
 void __init ralink_of_remap(void)
 {
-	rt_sysc_membase = plat_of_remap_node("mtk,mt7621-sysc");
-	rt_memc_membase = plat_of_remap_node("mtk,mt7621-memc");
+	rt_sysc_membase = plat_of_remap_node("mediatek,mt7621-sysc");
+	rt_memc_membase = plat_of_remap_node("mediatek,mt7621-memc");
 
 	if (!rt_sysc_membase || !rt_memc_membase)
 		panic("Failed to remap core resources");
@@ -205,7 +205,7 @@ void __init prom_soc_init(struct ralink_soc_info *soc_info)
 
 	if (n0 == MT7621_CHIP_NAME0 && n1 == MT7621_CHIP_NAME1) {
 		name = "MT7621";
-		soc_info->compatible = "mtk,mt7621-soc";
+		soc_info->compatible = "mediatek,mt7621-soc";
 	} else {
 		panic("mt7621: unknown SoC, n0:%08x n1:%08x\n", n0, n1);
 	}
diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index b68183e7e6ad..f0c9ae757bcd 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -56,7 +56,7 @@ palmbus: palmbus@1E000000 {
 		#size-cells = <1>;
 
 		sysc: sysc@0 {
-			compatible = "mtk,mt7621-sysc", "syscon";
+			compatible = "mediatek,mt7621-sysc", "syscon";
 			reg = <0x0 0x100>;
 			#clock-cells = <1>;
 			ralink,memctl = <&memc>;
@@ -66,7 +66,7 @@ sysc: sysc@0 {
 		};
 
 		wdt: wdt@100 {
-			compatible = "mtk,mt7621-wdt";
+			compatible = "mediatek,mt7621-wdt";
 			reg = <0x100 0x100>;
 		};
 
@@ -123,17 +123,17 @@ i2s: i2s@a00 {
 		};
 
 		memc: memc@5000 {
-			compatible = "mtk,mt7621-memc", "syscon";
+			compatible = "mediatek,mt7621-memc", "syscon";
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
 
@@ -361,7 +361,7 @@ timer {
 	nand: nand@1e003000 {
 		status = "disabled";
 
-		compatible = "mtk,mt7621-nand";
+		compatible = "mediatek,mt7621-nand";
 		bank-width = <2>;
 		reg = <0x1e003000 0x800
 			0x1e003800 0x800>;
-- 
2.25.1

