Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D157B2DF4D3
	for <lists+linux-mips@lfdr.de>; Sun, 20 Dec 2020 10:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbgLTJi5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Dec 2020 04:38:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbgLTJi5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Dec 2020 04:38:57 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24422C061257;
        Sun, 20 Dec 2020 01:37:35 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id n16so8408633wmc.0;
        Sun, 20 Dec 2020 01:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nmBdTpjz9wyfDCBLaCOK+MVTcCIjG0wuVatvuQrHLh0=;
        b=hHxTqzTZtdDDisKS42/bNVJrE79sguhbyvtueMjgufTH/aQhzSv63iNDkN+61FuTuC
         H13c1Lak0LCp4QBPOfHBjkEpeV6WoAGua5k+mojV02fAu0wWd/EecKAteWf0ySkBpCIZ
         Gd4vvg5IG7qRmzI8lM+Fs87V5r8SgaE8rr8FdIF90xuhB5xqNxDG9vx95pc7xGq2eMZX
         XEG068qVHXDvdBScQstNurNYq425pBpae8cG0hxQrGFT3Ds+gyPv3w2TPPG7RWoFMMQ6
         SQseNoUb/054brzDFb07gjSTRireZiuCbELUf1ZbPioNkvBlpnI41NdbsEDcQJuzZU8n
         vl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nmBdTpjz9wyfDCBLaCOK+MVTcCIjG0wuVatvuQrHLh0=;
        b=J5X5KfenuNMaPoNn+jvR+ZDCXFzL7prHt/9QEwqnWJSS0i9eVCZsLUKU5RgoeXm5So
         K0U1kzLzmGlrUNMAqdm4zi3NMKtbVb5JEBZmgFNa2Vbsv5QxtqymV+rZz2EKt4JTFYQG
         yEnSgW/jr6QHRT8R2z4Hka2cpvf3VoQ1mFWS8b1jFHKLfv/XupPxlVUFykK79YOPou9c
         VDfoPOdOf17GUx91lD0BeHod+7D2KkMcLIGeqv0IRaB2RyLnBDsaa1jf6fHigf0kxoxJ
         VU3z+ZLl+jjf7iNcU0rhlJgEqw2bw2sbU3re1E7IagLjCZEjrkahCwXkIe4g6KmqPF2F
         ch9A==
X-Gm-Message-State: AOAM530aatCPd177hXIV2vOGHr/jFgk3hDegF9IeCVvOXBf8VJtmcnM8
        SMS6zCMxpke17UELV5pOuZc=
X-Google-Smtp-Source: ABdhPJzXNSbGyyxH2QUCsydgEVzSAIoD95iLKqaAEBXA7Fg21klbRnfWVC4RsVh4Vw2y21yXrFY7WA==
X-Received: by 2002:a1c:4184:: with SMTP id o126mr11051268wma.107.1608457053803;
        Sun, 20 Dec 2020 01:37:33 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id o8sm21288819wrm.17.2020.12.20.01.37.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Dec 2020 01:37:33 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, devel@driverdev.osuosl.org,
        neil@brown.name
Subject: [PATCH v5 5/6] staging: mt7621-dts: use valid vendor 'mediatek' instead of invalid 'mtk'
Date:   Sun, 20 Dec 2020 10:37:23 +0100
Message-Id: <20201220093724.4906-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201220093724.4906-1-sergio.paracuellos@gmail.com>
References: <20201220093724.4906-1-sergio.paracuellos@gmail.com>
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

