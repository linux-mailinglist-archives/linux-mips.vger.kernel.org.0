Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFE282BC4DD
	for <lists+linux-mips@lfdr.de>; Sun, 22 Nov 2020 10:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgKVJ4M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Nov 2020 04:56:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727634AbgKVJ4H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Nov 2020 04:56:07 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3AA8C0613D2;
        Sun, 22 Nov 2020 01:56:06 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id w24so14480657wmi.0;
        Sun, 22 Nov 2020 01:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pH4YiFa3zIrW5cBsHONER3WL/ieQbB97y8DpDIKkWFI=;
        b=Iov1hSHiHu+XHsVKC76tIQefz8RyYifIOEPd+qZhGln//cGkhaG4HeNg+ML6ooWvC4
         GdJRSC9fCzRSCqQFjx6/34cUs8EfZxHTJwBgLNfuNViUHX8oj+4zUVh6d+hrth78Rpv1
         VwkXBFSSuY8wif+tZ0jZcH0r2+de4S0vhtFs6pIsjOjZn9vKezpWvaZ8VBqt+ZQYd0hW
         FIxepQaF2Wn+usjPOxgAoIfWecbkxOYBpt+uahdcjO55e2StrmeUuYEiQY7xaxBoX0mw
         SEbo0CGuv6ei/JwfzGKtgtnz8TliR+IsCWbyd7QGkqrMy8l4YFNzWn6iLlPDQhB4SySV
         801g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pH4YiFa3zIrW5cBsHONER3WL/ieQbB97y8DpDIKkWFI=;
        b=p+vHb1pdyn8FQYVEuqWrQ9ij/NN+7UQuEuc/fbtKGjZS3N0bJRaXLpcyYy/eruOJ+k
         YlF++w4JP8QQKon0GpQwIrE30QWbnoL82KC8u8SbQMfzUJKXIJ+I61bGUMQdhETAzEu4
         66HNwFGE2SHQVLCbGztBt2c6Ejs09B/77jWiBHmtK2I6LgLi73gavPy2Pe6raT6jecW3
         dysROR6TwmkDIH9r+6/v4l0DYRix0ZTDMdjlmCdb27deQoXADba3Qdxy8htRehagNsyf
         moM3I/VDth4cE87NGqZMQ+PuGBJoTtMkmT6x7KAOBbN/3PBSDU3fycnCOfiJmskrfr2h
         2hwQ==
X-Gm-Message-State: AOAM531r1ZNz2YpgejuGo2JG9XcxtTcl5a+tPBAoNRS3evVxpap9jk9U
        9DV4lRHJZJ70qB5wt+0uP5Y=
X-Google-Smtp-Source: ABdhPJwBIQt/L/k/aduacdDbcS7Xsuy1ptvmYy41XoYrrgkAcVfE/zDgbGKj6Ms235bc75jyiZRoow==
X-Received: by 2002:a1c:63d7:: with SMTP id x206mr18804956wmb.34.1606038965656;
        Sun, 22 Nov 2020 01:56:05 -0800 (PST)
Received: from localhost.localdomain (196.red-83-40-48.dynamicip.rima-tde.net. [83.40.48.196])
        by smtp.gmail.com with ESMTPSA id p21sm10593570wma.41.2020.11.22.01.56.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2020 01:56:05 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, john@phrozen.org,
        tsbogend@alpha.franken.de, gregkh@linuxfoundation.org,
        gch981213@gmail.com, hackpascal@gmail.com,
        linux-clk@vger.kernel.org, evicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name
Subject: [PATCH v4 5/6] staging: mt7621-dts: use valid vendor 'mediatek' instead of invalid 'mtk'
Date:   Sun, 22 Nov 2020 10:55:55 +0100
Message-Id: <20201122095556.21597-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201122095556.21597-1-sergio.paracuellos@gmail.com>
References: <20201122095556.21597-1-sergio.paracuellos@gmail.com>
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
index 35cfda8f6faf..8fc311703beb 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -56,7 +56,7 @@ palmbus: palmbus@1E000000 {
 		#size-cells = <1>;
 
 		sysc: sysc@0 {
-			compatible = "mtk,mt7621-sysc", "syscon";
+			compatible = "mediatek,mt7621-sysc", "syscon";
 			reg = <0x0 0x100>;
 
 			pll: pll {
@@ -69,7 +69,7 @@ pll: pll {
 		};
 
 		wdt: wdt@100 {
-			compatible = "mtk,mt7621-wdt";
+			compatible = "mediatek,mt7621-wdt";
 			reg = <0x100 0x100>;
 		};
 
@@ -125,17 +125,17 @@ i2s: i2s@a00 {
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
 
@@ -368,7 +368,7 @@ timer {
 	nand: nand@1e003000 {
 		status = "disabled";
 
-		compatible = "mtk,mt7621-nand";
+		compatible = "mediatek,mt7621-nand";
 		bank-width = <2>;
 		reg = <0x1e003000 0x800
 			0x1e003800 0x800>;
-- 
2.25.1

