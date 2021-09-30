Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A32E41DFA4
	for <lists+linux-mips@lfdr.de>; Thu, 30 Sep 2021 18:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352436AbhI3Q7t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Sep 2021 12:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344261AbhI3Q7t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Sep 2021 12:59:49 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE81C06176A;
        Thu, 30 Sep 2021 09:58:06 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id u7so5508453pfg.13;
        Thu, 30 Sep 2021 09:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2iXAlr5vsEQu3iMPBNV/eYnzlVsEAMgE+P6kwYZMas0=;
        b=iU667m31jVVyrsbmRMnIe7Wm8ThBMjaKH/cihBFG8i3fQebrkZLnx7Hb3eKo9NCPnM
         8sX5sA7j2nuQyFl6Ii92etVVEo5zG9xJXLaF5Zg7rZf/aJH1XBS/xaFT6fi7WTaVffZr
         kxRtjvM/21/oiCPSgPo+UKPUF2JHEbIsjXOPRWdL8rzefuXRN8n6gTYFTuL/oyh9D0R4
         TUSQCW7deSL3lALL1UyWPOHZTxjxxMYzgCXmZdIkOkitfYnPL7DBP0hDZm03g9jMg5PR
         3i4rNzvFZsdmzxpzvd8e0GNtMTnG3jPcCbLQoq+6obwCTTxNalTfTA3q4YKw4bqOTRKx
         Gcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2iXAlr5vsEQu3iMPBNV/eYnzlVsEAMgE+P6kwYZMas0=;
        b=Vl+ZI+veCkDIW/pD0Bg67ajjDO9Pc5hzxNUmef0wXbIC7CDjLQlCKnTCHyL4jMrGKG
         HzTOXXQoDkxLUIpUHFD8w8CO7VgLD36HtKlGxG5QHIns/RvU8t59weC8CU8nVm3HhHkV
         5EMT8LagqZbWroeKNSPXG8+NVClfekuU8fuVhaZZyUbP84cxEtnOs3B+Hene1j/FRSgU
         jJmNF13Rxo6Ps30y1YLI63bS7vaWRBPJ/b4COUtbBvJKPaMhhXnwYxdyrncwKFICUFbL
         gwrkZN5wE8F1s1i2Fm7Rm3uU0KsKdmKD2tvVJAQ0eXLc5uyHbTOZdqvZFGMtALGyxEva
         5kUQ==
X-Gm-Message-State: AOAM533eCYmvbgKq4GyEw2cAvKEFlkzTzQCMqdOzbWMbqBgdHT1cZ5as
        iw8VrVqDb0qXpz7faYfR9O8=
X-Google-Smtp-Source: ABdhPJwpxiS1KnfPGNovs0OrG20RIbfBky7X0bYKn9z//HybBu9PnmkXte7geU3fetRkUeZGutSHTg==
X-Received: by 2002:a05:6a00:9a:b0:44b:b8f9:1d72 with SMTP id c26-20020a056a00009a00b0044bb8f91d72mr5429360pfj.21.1633021085925;
        Thu, 30 Sep 2021 09:58:05 -0700 (PDT)
Received: from ilya-fury.hpicorp.net (S0106ac202e1e48e3.vs.shawcable.net. [96.55.136.179])
        by smtp.gmail.com with ESMTPSA id h24sm3765952pfn.180.2021.09.30.09.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 09:58:04 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Greg Ungerer <gerg@kernel.org>,
        Strontium <strntydog@gmail.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Felix Fietkau <nbd@nbd.name>
Subject: [PATCH] MIPS: Revert "add support for buggy MT7621S core detection"
Date:   Thu, 30 Sep 2021 09:57:41 -0700
Message-Id: <20210930165741.9662-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This reverts commit 6decd1aad15f56b169217789630a0098b496de0e. CPULAUNCH
register is not set properly by some bootloaders, causing a regression
until a bootloader change is made, which is hard if not impossible on
some embedded devices. Revert the change until a more robust core
detection mechanism that works on MT7621S routers such as Netgear R6220
as well as platforms like Digi EX15 can be made.

Link: https://lore.kernel.org/lkml/4d9e3b39-7caa-d372-5d7b-42dcec36fec7@kernel.org
Fixes: 6decd1aad15f ("MIPS: add support for buggy MT7621S core detection")
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/include/asm/mips-cps.h | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-cps.h
index 35fb8ee6dd33..fd43d876892e 100644
--- a/arch/mips/include/asm/mips-cps.h
+++ b/arch/mips/include/asm/mips-cps.h
@@ -10,8 +10,6 @@
 #include <linux/io.h>
 #include <linux/types.h>
 
-#include <asm/mips-boards/launch.h>
-
 extern unsigned long __cps_access_bad_size(void)
 	__compiletime_error("Bad size for CPS accessor");
 
@@ -167,30 +165,11 @@ static inline uint64_t mips_cps_cluster_config(unsigned int cluster)
  */
 static inline unsigned int mips_cps_numcores(unsigned int cluster)
 {
-	unsigned int ncores;
-
 	if (!mips_cm_present())
 		return 0;
 
 	/* Add one before masking to handle 0xff indicating no cores */
-	ncores = (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
-
-	if (IS_ENABLED(CONFIG_SOC_MT7621)) {
-		struct cpulaunch *launch;
-
-		/*
-		 * Ralink MT7621S SoC is single core, but the GCR_CONFIG method
-		 * always reports 2 cores. Check the second core's LAUNCH_FREADY
-		 * flag to detect if the second core is missing. This method
-		 * only works before the core has been started.
-		 */
-		launch = (struct cpulaunch *)CKSEG0ADDR(CPULAUNCH);
-		launch += 2; /* MT7621 has 2 VPEs per core */
-		if (!(launch->flags & LAUNCH_FREADY))
-			ncores = 1;
-	}
-
-	return ncores;
+	return (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
 }
 
 /**
-- 
2.33.0

