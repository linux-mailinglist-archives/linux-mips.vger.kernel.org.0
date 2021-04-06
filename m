Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28234354B8D
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 06:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhDFEY3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 00:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhDFEY1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Apr 2021 00:24:27 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB097C061574;
        Mon,  5 Apr 2021 21:24:18 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id a6so3447775pls.1;
        Mon, 05 Apr 2021 21:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kMaK9FLQatdBC7FgzUhWGBs1r4HqpNhpIqi+DcTR6MM=;
        b=jZn8LLu7DPKEbtlZAYAyNdQXuxRAFck83sejaV067NxpySfyoUe8ouqm5TFDjzGghO
         O+d0ReQbUx2MsBkD7yUqHrEDZtg38y7/b3nyTgZcgY4Q8H4/mCS5IZ0oGV0abboLoAi9
         XzA2snzBhkvV8vAiisFPevO3eBr63gV+MoxyJDPKJPazpwg/WcBXHMsE1T9/oh+sKJ2K
         zwDvvMiS6DbTq6PB1+vLpyzoP07LJwoiolktCnwZMYwUp+vO3tJngixmVPsq5wZObGPL
         0UQk/mIXhuRkF85+aErN8ByZp9vVPUWD8+KL2obzWCcNwkTrm/weMjRKe/I6vCizKrxM
         4Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kMaK9FLQatdBC7FgzUhWGBs1r4HqpNhpIqi+DcTR6MM=;
        b=S843MitLoMLWpwgr7HniL9uCTXfpnzViVD8yzfSHgS2TZVcTWZwDaDJmpAwitAnoMr
         9bpdataBn8OQJau8GGp+xAGbhqu0eSiaKCCiOwXuBuOY2hqzsQchXT9Z6XS0M9XulK54
         DOUGELLQ0n77UGsY6WZa7gseiAn1kufSaCctw1gz1MxcvXLvxYNDtR8tQmCH4MKd/smc
         z2YwLY/faq917lHQKopgoHAT44x9ZLbk4tv9w90K93n7f1fI7nqYvX+OlND6sS/izQOK
         dqtKNufz2VGl+n5M6nmEPFasbdW3BsEvrnNYzQVnvIPWwenmXvcUVQXdRVZVhbQ9V+GB
         jqKQ==
X-Gm-Message-State: AOAM530jMMfKfleT128jumCoiXu5X0Ed5jBY0X0mJUMkm4WwC7HC0XO6
        gQVpDt/EfFR9K1KB5oZrJGc=
X-Google-Smtp-Source: ABdhPJyEXz5KTL3XwawQAWjTAPBKxDVYPkt7gunsDadqAUXDoQHRMTET+z09whGzGH9r0BDQPOAsDg==
X-Received: by 2002:a17:90a:5998:: with SMTP id l24mr2457013pji.76.1617683058442;
        Mon, 05 Apr 2021 21:24:18 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id c26sm17374968pfo.97.2021.04.05.21.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 21:24:17 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     macro@orcam.me.uk
Cc:     ilya.lipnitskiy@gmail.com, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, liwei391@huawei.com, nbd@nbd.name,
        tsbogend@alpha.franken.de, yangtiezhu@loongson.cn
Subject: [PATCH v2] MIPS: add support for buggy MT7621S core detection
Date:   Mon,  5 Apr 2021 21:23:34 -0700
Message-Id: <20210406042334.1318117-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <alpine.DEB.2.21.2104060311490.65251@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2104060311490.65251@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Most MT7621 SoCs have 2 cores, which is detected and supported properly
by CPS.

Unfortunately, MT7621 SoC has a less common S variant with only one core.
On MT7621S, GCR_CONFIG still reports 2 cores, which leads to hangs when
starting SMP. CPULAUNCH registers can be used in that case to detect the
absence of the second core and override the GCR_CONFIG PCORES field.

Rework a long-standing OpenWrt patch to override the value of
mips_cps_numcores on single-core MT7621 systems.

Tested on a dual-core MT7621 device (Ubiquiti ER-X) and a single-core
MT7621 device (Netgear R6220).

Original 4.14 OpenWrt patch:
Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=4cdbc90a376dd0555201c1434a2081e055e9ceb7
Current 5.10 OpenWrt patch:
Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/ramips/patches-5.10/320-mt7621-core-detect-hack.patch;h=c63f0f4c1ec742e24d8480e80553863744b58f6a;hb=10267e17299806f9885d086147878f6c492cb904

Suggested-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/include/asm/mips-cps.h | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-cps.h
index fd43d876892e..9f495ffef2b7 100644
--- a/arch/mips/include/asm/mips-cps.h
+++ b/arch/mips/include/asm/mips-cps.h
@@ -10,6 +10,8 @@
 #include <linux/io.h>
 #include <linux/types.h>
 
+#include <asm/mips-boards/launch.h>
+
 extern unsigned long __cps_access_bad_size(void)
 	__compiletime_error("Bad size for CPS accessor");
 
@@ -165,11 +167,29 @@ static inline uint64_t mips_cps_cluster_config(unsigned int cluster)
  */
 static inline unsigned int mips_cps_numcores(unsigned int cluster)
 {
+	struct cpulaunch *launch;
+	unsigned int ncores;
+
 	if (!mips_cm_present())
 		return 0;
 
 	/* Add one before masking to handle 0xff indicating no cores */
-	return (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
+	ncores = (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
+
+	if (IS_ENABLED(CONFIG_SOC_MT7621)) {
+		/*
+		 * Ralink MT7621S SoC is single core, but the GCR_CONFIG method
+		 * always reports 2 cores. Check the second core's LAUNCH_FREADY
+		 * flag to detect if the second core is missing. This method
+		 * only works before the core has been started.
+		 */
+		launch = (struct cpulaunch *)CKSEG0ADDR(CPULAUNCH);
+		launch += 2; /* MT7621 has 2 VPEs per core */
+		if (!(launch->flags & LAUNCH_FREADY))
+			ncores = 1;
+	}
+
+	return ncores;
 }
 
 /**
-- 
2.31.1

