Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0344C31DB36
	for <lists+linux-mips@lfdr.de>; Wed, 17 Feb 2021 15:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbhBQOJk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Feb 2021 09:09:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233355AbhBQOJS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Feb 2021 09:09:18 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3780EC06178A;
        Wed, 17 Feb 2021 06:08:02 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id a132so2237184wmc.0;
        Wed, 17 Feb 2021 06:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LHPolF/4+qgvhOCrefG8j8poOWD/AjdPdfrmSOA9PFI=;
        b=PbipZZLXixo4YE2tEb3f0c9EfuD8RHFIFaZt1SWKqWHJAs9ja8Y7Xcsu0hzGDH4abi
         iJI8Ikt1p1S/0M79hFChNx/oof57AmwU7v1Ei3aH9qH+4fXmhmQ3HuW0UNBAYR/HoeQS
         GJQeVbRxpZg+2Q3VTPEjgGi3eYV0Z+eASxdVZEFLkeMwBSCJ6bDZaASp9BvxqoLQ41c2
         ZQBj3El/OjSVUGZPO1mSsnEJHfTusDQql/2ul6FJF8I+JsKZhG9FIZ+mPlnmABW6v2tH
         eSTRVZbkJjgOiJfy2/PCEYPYg4AzTc6I5zMRKDIUSF4YENKM3695ZUIwMRUhnQk4BBIM
         BiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LHPolF/4+qgvhOCrefG8j8poOWD/AjdPdfrmSOA9PFI=;
        b=V4bApDPTu2AZ/2Sa8DiwUBTgEyPOy9frPbYLnY8nZJ28pLPn8kzkPpAKGKqNbUCti5
         VEH35yFkaGvfZ0jFpMQVQb9l79GmoJcF2ns+IZ+BXy2bj7PTkdBNlgiQe4kKR4t62HR9
         AVOkilwSHpV/XvSj2Xa4d1n1WYF9trZY/fPdODU7w+utOueAUfcmVlO5P/jxGUPAmF5o
         LbhPwGU3AtwJztVadu2CLEg4Q6pWe54pn+9nB6ZyY1LWsiA9TZRErJXwvpJldz/dfBDa
         g5H1/1ov5GDtKgSQARSvY+lfCyBJMom7cs2MNUySM1Pyrkdwb98DnC0JRWm3MGoWO9od
         BDDg==
X-Gm-Message-State: AOAM532qACjflLz0rt2KNypkaMZBXX9KQ5RqGeU1WeBf6/+4ZmkDgnPw
        7A360eyBtEJNKO9O5wbCxNowY85pikiasQ==
X-Google-Smtp-Source: ABdhPJxdmketUngi5epX69jHP3N4KtMGy++Kjhrp1LdxDjFicnIzn64uq2rjqF8FUc7sqfB+04HvgQ==
X-Received: by 2002:a05:600c:2ca:: with SMTP id 10mr7400946wmn.151.1613570880845;
        Wed, 17 Feb 2021 06:08:00 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id n66sm3274099wmn.25.2021.02.17.06.07.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2021 06:08:00 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 5/6] staging: mt7621-dts: use valid vendor 'mediatek' instead of invalid 'mtk'
Date:   Wed, 17 Feb 2021 15:07:51 +0100
Message-Id: <20210217140752.15712-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217140752.15712-1-sergio.paracuellos@gmail.com>
References: <20210217140752.15712-1-sergio.paracuellos@gmail.com>
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
index 11d1670d4339..55784dd48dc5 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -56,7 +56,7 @@ palmbus: palmbus@1E000000 {
 		#size-cells = <1>;
 
 		sysc: sysc@0 {
-			compatible = "mtk,mt7621-sysc", "syscon";
+			compatible = "mediatek,mt7621-sysc", "syscon";
 			reg = <0x0 0x100>;
 		};
 
@@ -71,7 +71,7 @@ pll: pll {
 		};
 
 		wdt: wdt@100 {
-			compatible = "mtk,mt7621-wdt";
+			compatible = "mediatek,mt7621-wdt";
 			reg = <0x100 0x100>;
 		};
 
@@ -128,17 +128,17 @@ i2s: i2s@a00 {
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
 
@@ -366,7 +366,7 @@ timer {
 	nand: nand@1e003000 {
 		status = "disabled";
 
-		compatible = "mtk,mt7621-nand";
+		compatible = "mediatek,mt7621-nand";
 		bank-width = <2>;
 		reg = <0x1e003000 0x800
 			0x1e003800 0x800>;
-- 
2.25.1

