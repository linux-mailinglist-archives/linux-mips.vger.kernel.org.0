Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 404F534B482
	for <lists+linux-mips@lfdr.de>; Sat, 27 Mar 2021 06:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhC0FjS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Mar 2021 01:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbhC0Fiu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Mar 2021 01:38:50 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06204C0613AA;
        Fri, 26 Mar 2021 22:38:50 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id x126so6236029pfc.13;
        Fri, 26 Mar 2021 22:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6elHr9wS3U+eOcpmBW2sX0scmKlp2BHQ2gfORMO1D9I=;
        b=Hx9qKJF2vlXl+JLiMrwH8TEugZ/+bawo8E1VhTfuOIAnl2SgJu9bmDvCTpBpLjjMF3
         iK7AVxvwn6djDc9oU9WA2OaxfvIIoiFFhNW07Ayeh7mwvywHkO57XYZebmYoc8rEfNDr
         nNNjQZiBXxYjEIUfXNpyRHegljFo+WKl1FTk1xYo3yJ2CYCUFvfSwTkaXrYU4P70Inku
         gX1iqlMficNvLuNr5sQFtXQcUJF9M7XXhkP0UOzNJ4Gy4894imHXMsbxc/YqU7C2pe1I
         XHJoOPy8wQoeWrvuU/aMaD/O2E838PoCiGYJB1IeO2w2NCj7klZsirsrQYiylAb4dLw0
         QCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6elHr9wS3U+eOcpmBW2sX0scmKlp2BHQ2gfORMO1D9I=;
        b=PBdTFTLt3RBHI0O68rU6i3dOrJ3FBqYzavC/zc3+1AWh4wznEx/ASFM46B7Xx5DJdp
         dlHrtG1d5v8zkxQtBE1nL/mtxf8nqZXieLQfzZNVmMn1H3+npagPvmhOdZvMGSaYrmav
         EtzVmn7QWEEAaH49+PrxWtIuOJRilTs3mMldW85UenDPPyFv8h86Bh0/TrbpskE7H0UN
         pJaQuQjJ9mVsv1FSjtwRFIwGDV3u75s9SiB5gcVG7FNfEUSFv+s6y/LKd6UTpJfHp3XC
         bruNsPYfuLgObdgZkLP1XGtKSMFwyvXSHZNmkIQGOHNFYgTxPLOmtioCcEo+grEOpi+s
         L+IQ==
X-Gm-Message-State: AOAM5309Jw3drrBcxiiwl+qZ48xT0PLzEOkUG6lwJ6eVt63xp46niFJ5
        wR/Q9eCmqfAkekUis0G31HE=
X-Google-Smtp-Source: ABdhPJzU5qXpd/hIC+jISW+cbPtDA42XgPMp+ggAA33zGl/07esw8SwP/gORLOkJCLZI8jzpfaYASw==
X-Received: by 2002:a63:4c4:: with SMTP id 187mr15291676pge.187.1616823529541;
        Fri, 26 Mar 2021 22:38:49 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id k128sm10701933pfd.137.2021.03.26.22.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 22:38:48 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH 1/2] MIPS: ralink: annotate prom_soc_init() with __init
Date:   Fri, 26 Mar 2021 22:38:39 -0700
Message-Id: <20210327053840.471155-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

prom_soc_init is only called from prom_init in arch/mips/ralink/prom.c,
which is already annotated with __init, so annotate prom_soc_init with
__init too.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/ralink/common.h | 2 +-
 arch/mips/ralink/mt7620.c | 2 +-
 arch/mips/ralink/mt7621.c | 2 +-
 arch/mips/ralink/rt288x.c | 2 +-
 arch/mips/ralink/rt305x.c | 2 +-
 arch/mips/ralink/rt3883.c | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/ralink/common.h b/arch/mips/ralink/common.h
index 4bc65b7a3241..49ae370d023d 100644
--- a/arch/mips/ralink/common.h
+++ b/arch/mips/ralink/common.h
@@ -27,7 +27,7 @@ extern void ralink_clk_add(const char *dev, unsigned long rate);
 
 extern void ralink_rst_init(void);
 
-extern void prom_soc_init(struct ralink_soc_info *soc_info);
+extern void __init prom_soc_init(struct ralink_soc_info *soc_info);
 
 __iomem void *plat_of_remap_node(const char *node);
 
diff --git a/arch/mips/ralink/mt7620.c b/arch/mips/ralink/mt7620.c
index fcf010038054..53a5969e61af 100644
--- a/arch/mips/ralink/mt7620.c
+++ b/arch/mips/ralink/mt7620.c
@@ -639,7 +639,7 @@ mt7628_dram_init(struct ralink_soc_info *soc_info)
 	}
 }
 
-void prom_soc_init(struct ralink_soc_info *soc_info)
+void __init prom_soc_init(struct ralink_soc_info *soc_info)
 {
 	void __iomem *sysc = (void __iomem *) KSEG1ADDR(MT7620_SYSC_BASE);
 	unsigned char *name = NULL;
diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index ca0ac607b0f3..ec87ce561049 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -146,7 +146,7 @@ static void soc_dev_init(struct ralink_soc_info *soc_info, u32 rev)
 	}
 }
 
-void prom_soc_init(struct ralink_soc_info *soc_info)
+void __init prom_soc_init(struct ralink_soc_info *soc_info)
 {
 	void __iomem *sysc = (void __iomem *) KSEG1ADDR(MT7621_SYSC_BASE);
 	unsigned char *name = NULL;
diff --git a/arch/mips/ralink/rt288x.c b/arch/mips/ralink/rt288x.c
index 3f096897858c..34083c70ec68 100644
--- a/arch/mips/ralink/rt288x.c
+++ b/arch/mips/ralink/rt288x.c
@@ -77,7 +77,7 @@ void __init ralink_of_remap(void)
 		panic("Failed to remap core resources");
 }
 
-void prom_soc_init(struct ralink_soc_info *soc_info)
+void __init prom_soc_init(struct ralink_soc_info *soc_info)
 {
 	void __iomem *sysc = (void __iomem *) KSEG1ADDR(RT2880_SYSC_BASE);
 	const char *name;
diff --git a/arch/mips/ralink/rt305x.c b/arch/mips/ralink/rt305x.c
index 496f966c05f9..c5b63c142705 100644
--- a/arch/mips/ralink/rt305x.c
+++ b/arch/mips/ralink/rt305x.c
@@ -214,7 +214,7 @@ void __init ralink_of_remap(void)
 		panic("Failed to remap core resources");
 }
 
-void prom_soc_init(struct ralink_soc_info *soc_info)
+void __init prom_soc_init(struct ralink_soc_info *soc_info)
 {
 	void __iomem *sysc = (void __iomem *) KSEG1ADDR(RT305X_SYSC_BASE);
 	unsigned char *name;
diff --git a/arch/mips/ralink/rt3883.c b/arch/mips/ralink/rt3883.c
index 8f3fe3106708..ff91f3531ad0 100644
--- a/arch/mips/ralink/rt3883.c
+++ b/arch/mips/ralink/rt3883.c
@@ -113,7 +113,7 @@ void __init ralink_of_remap(void)
 		panic("Failed to remap core resources");
 }
 
-void prom_soc_init(struct ralink_soc_info *soc_info)
+void __init prom_soc_init(struct ralink_soc_info *soc_info)
 {
 	void __iomem *sysc = (void __iomem *) KSEG1ADDR(RT3883_SYSC_BASE);
 	const char *name;
-- 
2.31.0

