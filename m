Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F4E331E65
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 06:23:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhCIFXI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 00:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbhCIFWh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Mar 2021 00:22:37 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCFE7C06174A;
        Mon,  8 Mar 2021 21:22:36 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id j2so13801545wrx.9;
        Mon, 08 Mar 2021 21:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pc2UQSj4gs1c19Ejfzc+HuXWHgveERW6w2HWG8Qczho=;
        b=A1UiGdIvQN+97YQs9YMazSNRo9L34houYAMpJfrIKUXdddXv+kMm/VjtA/nDfiW7KI
         UBRolt2MpgKAIumtsb58A2T6uTUdDMI4wcuY8wtCPIH36Qe9mNwmm69jMFCsB93HI60G
         pGkK4qA+TrDlOMtzy1CKJzojhu+ztQIIOtQgLp9sdriixTaTuWDgd62HjUcF27sW+1+E
         YImq/bWoJDVMLQb43pGm13ac9He7NBj+4itVr1wng+WAcF5oZuKWyLroFTXkZkNOPQT/
         +3KMg3qIBREVtmpwVVE+v5pYn9sjsdAze3l0KdF6zBsi95KiQSqNwvhu3Ej/eyNc+r68
         bAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pc2UQSj4gs1c19Ejfzc+HuXWHgveERW6w2HWG8Qczho=;
        b=Fpn+LJP7fl9Z6NVa48W3DXaqnONtL+o0bMH0p7Dn9tcQSOtEzzjOiVYnRSnhEHY2wN
         qX4tVC63Z2dDdc9MKtxBTVjXmM2Cf5XGhGCgrGc9w8AOmTsCetmWF3usqhBRbpTeAKJj
         8j8rGT2JC6wd64zukZIbqaknLgv3l8hmY8IYSugNfb7nhP17gQ9xLyv8TbE3GCh7uLg/
         lNz0e4HMbFj8eSieKamBP/xxI3Bj9m3QR1zJb5Aor3zb7rky/ljLmVn1Je37WCeyDgvE
         qah/ur1riPBIugVI7qfFC2axB341ldv8SH+WCRg1EVtKr+FQJwouF0uN+pWEh2oV3FKL
         rfGw==
X-Gm-Message-State: AOAM530I2oPzVDrwCmmtvdKawSqV5+3mD/XBAmcjY5wmL7biApG63gJS
        ry3zIj9VbuT+wo9XLrdCzJs=
X-Google-Smtp-Source: ABdhPJwd6IQF13mWiyE8B1qGBSQDgRUAlxKU5mC8mVz15aGWL6liju2rPYgcCLr6QmTk+NXxnGPiXg==
X-Received: by 2002:a05:6000:1819:: with SMTP id m25mr26022656wrh.169.1615267355661;
        Mon, 08 Mar 2021 21:22:35 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id c11sm23450743wrm.67.2021.03.08.21.22.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Mar 2021 21:22:35 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v11 5/6] staging: mt7621-dts: use valid vendor 'mediatek' instead of invalid 'mtk'
Date:   Tue,  9 Mar 2021 06:22:25 +0100
Message-Id: <20210309052226.29531-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309052226.29531-1-sergio.paracuellos@gmail.com>
References: <20210309052226.29531-1-sergio.paracuellos@gmail.com>
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

