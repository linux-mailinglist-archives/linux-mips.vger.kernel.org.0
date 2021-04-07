Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE46F357583
	for <lists+linux-mips@lfdr.de>; Wed,  7 Apr 2021 22:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349068AbhDGUIN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Apr 2021 16:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355924AbhDGUIM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Apr 2021 16:08:12 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC60AC06175F;
        Wed,  7 Apr 2021 13:08:01 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id t140so13863009pgb.13;
        Wed, 07 Apr 2021 13:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9beUCmdHnVH4oDxMABfGZMKoJI0jBOWYhdg4Jzv5plY=;
        b=Kekabc8cFdaew4zlLRFUDvnYEN/mSWJ+SoBFuuedrE5DTiBWsIpiZ7UDDEO8vGcX3e
         35MZv7xoi+JWV8F4rXClk2jd3NrOSWdbp0BEd+IeoHcwOEpj8Zpnzt7YaKBLpjROZ/B6
         wp7P7dP4NX5zCXZu3DPcyafNuysJdvOozu+3f1R9S3bVbx0WeycKgB4YSCVGCAEGBItD
         fH2wq17QleV2mI0DY6PAkTQP1YcPlKvKayDvfJgkP7BcF9W3IDvRnjJxr23clHPlhUdQ
         Nc/Spn8Mznlt5G1gL8jotsoEB6cnPHvASC41kHntZDceZS2gUSCReW27C3cX5hiC2PR5
         0n+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9beUCmdHnVH4oDxMABfGZMKoJI0jBOWYhdg4Jzv5plY=;
        b=AbWWVChMgFRdhODE3CTp5nG6OFlZovO1OvTXJp1Zn3EV8zHahhAKbgX2n4CUNNs6Th
         jE4Z5hjbWmIVmLPQ68jwARsqAJHJ3olzVc0cxmnxwhHQKDOB/HSqOvChOT3ZI6J7AboX
         T1XCAXSRVYv706/RxVCXW+C/Hzd0ANaw87VCWyqUU0vMFKgqcl4rzHCRlpuhAOCgaYIT
         tckQNQMERhsMyJPNV4LIdTZqjtEjJeHT+YzoGHvEHO20MBnxjUviZhBsALit6gALu5He
         xiVjbfzFDTJV1Jdb2HCgjrQP9z9jVy75P1fu2QhfZo58a7qZdPI91GMm6vjHm9MEbNbH
         ndmg==
X-Gm-Message-State: AOAM532fgtBBPoEFB0S83RR3En9L8XKSIklPPqSwPl7GYnCr5xfKew4w
        2IPR2iunFYHIV6hEwUs8ye20jWCxhagA47EH
X-Google-Smtp-Source: ABdhPJz5UeJaGZ0abUlKweGH8mMfqvbzpxlNLAHH3gDHjBFbSj3UGDIYnNS1uiatPM/3cNK0mgEthQ==
X-Received: by 2002:a63:6a41:: with SMTP id f62mr4725348pgc.428.1617826081279;
        Wed, 07 Apr 2021 13:08:01 -0700 (PDT)
Received: from ilya-fury.lan ([2602:61:7344:f100::b87])
        by smtp.gmail.com with ESMTPSA id l25sm24093566pgu.72.2021.04.07.13.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 13:08:00 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     macro@orcam.me.uk
Cc:     ilya.lipnitskiy@gmail.com, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, liwei391@huawei.com, nbd@nbd.name,
        tsbogend@alpha.franken.de, yangtiezhu@loongson.cn
Subject: [PATCH v3] MIPS: add support for buggy MT7621S core detection
Date:   Wed,  7 Apr 2021 13:07:38 -0700
Message-Id: <20210407200738.149207-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <alpine.DEB.2.21.2104071549560.65251@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2104071549560.65251@angie.orcam.me.uk>
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
 arch/mips/include/asm/mips-cps.h | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-cps.h
index fd43d876892e..35fb8ee6dd33 100644
--- a/arch/mips/include/asm/mips-cps.h
+++ b/arch/mips/include/asm/mips-cps.h
@@ -10,6 +10,8 @@
 #include <linux/io.h>
 #include <linux/types.h>
 
+#include <asm/mips-boards/launch.h>
+
 extern unsigned long __cps_access_bad_size(void)
 	__compiletime_error("Bad size for CPS accessor");
 
@@ -165,11 +167,30 @@ static inline uint64_t mips_cps_cluster_config(unsigned int cluster)
  */
 static inline unsigned int mips_cps_numcores(unsigned int cluster)
 {
+	unsigned int ncores;
+
 	if (!mips_cm_present())
 		return 0;
 
 	/* Add one before masking to handle 0xff indicating no cores */
-	return (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
+	ncores = (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
+
+	if (IS_ENABLED(CONFIG_SOC_MT7621)) {
+		struct cpulaunch *launch;
+
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

