Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52CB35A6E9
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 21:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234999AbhDITUs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 15:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234991AbhDITUp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Apr 2021 15:20:45 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A7BC061763;
        Fri,  9 Apr 2021 12:20:30 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id p22so3450820wmc.3;
        Fri, 09 Apr 2021 12:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gp0+KZ2PzpF/j4W+LeqajIV0BfIQKayTYA5hoYYZ9tE=;
        b=VHgWTVKPZV/lN+sAe3ZQP0l2+JyWbS70mBfD1X1VX7+zREmSAzV5kQwdpK8fM1VyvJ
         1+OsOq7GgRb7qhICO97P17j01bqdyouzUdrnZjScSjO2mW+eB/woejOFAhvJHkwai+WB
         wbTz3TlRs8VPW7YRdLNU1NNnDLCt1MeI23b+V+i9U5B3LKYCCfKNOxlZ/gUDXN68xicr
         HaD+NCSwYFSipK+ECNU/LmZdAcWQFaW7dMEGwBx4ESAGQbQr9YfKVXRSpywceGF56woC
         b2SGLuGe/zrXOIWIOuxhYs3bA/R2ecuHB7rhHdVClGFi95Y1qLl9TOPcwfacUuaMZeAD
         CTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gp0+KZ2PzpF/j4W+LeqajIV0BfIQKayTYA5hoYYZ9tE=;
        b=cqO/69lZlJKgK8DhlWGhH8wPcrlPKrYaJ28Qxim1TPT5gA08rMDDxh1KJitKPcTemY
         y5DkDUzqabGCgYSlRMHBIwoo5fz9iYi2YiFMHBXLvGwkZhWRnIDU1Ygro746362duD63
         a8yG16FZ+NZL2JXKnkJ16uXGMAGAGF0cD6aXushtezgqXYdj8MzAYP6kcKFy+NDkvA9T
         MzDJ+4pn7V7s7BVxZE1LBpS7tbVJsK/LUi+OQn4pqRRHTbmBR3URI/TGprfWrmh02NMa
         cdCY0aVgal1PdcEMaKNHES3JvpoEduVTXn+mawoQuDvlPNPFHvFKEQmKjsK4BlBuq2E8
         yoHg==
X-Gm-Message-State: AOAM530+EAFU/uRCMXpVfGg+csheWCjiw8IekAxks3jJyX0OLUTKpl0V
        hdC+3v4VRp/nlYCBCGqAC7M=
X-Google-Smtp-Source: ABdhPJylpEd1yMNirJp5+9xls3bI/IoHuZBgzz6VNqBlZDSs4Ii3ET7sg8s+fjnm/yGf9D58dv6vkA==
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr15520985wmi.153.1617996029027;
        Fri, 09 Apr 2021 12:20:29 -0700 (PDT)
Received: from localhost.localdomain (225.red-83-57-119.dynamicip.rima-tde.net. [83.57.119.225])
        by smtp.gmail.com with ESMTPSA id l9sm734259wrz.7.2021.04.09.12.20.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Apr 2021 12:20:28 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v12 3/4] staging: mt7621-dts: use valid vendor 'mediatek' instead of invalid 'mtk'
Date:   Fri,  9 Apr 2021 21:20:23 +0200
Message-Id: <20210409192024.10024-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409192024.10024-1-sergio.paracuellos@gmail.com>
References: <20210409192024.10024-1-sergio.paracuellos@gmail.com>
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

