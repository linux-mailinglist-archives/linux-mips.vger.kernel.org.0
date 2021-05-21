Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5932038BAAA
	for <lists+linux-mips@lfdr.de>; Fri, 21 May 2021 02:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234808AbhEUAGS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 May 2021 20:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234821AbhEUAGR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 May 2021 20:06:17 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646D4C061574;
        Thu, 20 May 2021 17:04:55 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d78so12722493pfd.10;
        Thu, 20 May 2021 17:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VOb8c6DZ7VIZrD+3PTSNQOJnewy5P64QbYyctDZQTrE=;
        b=uaQ+eWVqskRrc2U6AMLDHjLUw6NhUlTTXoatJaJB9NRMrJNDngSJQQNCsWivgHstu+
         95Yf75yp+EB1VRElEEID7eIQP28OgfDYzOLg0h9PiuzZdsbUPLl+zIZDWxz2/AcDrU7q
         AucY2MFxWCn7pU9TW4D5kuYARdT5NbSC+uuyXOJlDTYB+QoGPSGsiYtC5XK3N8taoB5h
         Auk8C/uqqc3pQ9nZIMLXbJzLxCYFkkK9oQTyJo0AytT6GB61DcuU1twu1nRrcBmT0DRa
         nBWxgNHOs4Wgn81jsuZxCSiSTSPaMwphnS3bwfeESFDjvL03e25xXZ7MESFCUiEgaTRE
         TUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VOb8c6DZ7VIZrD+3PTSNQOJnewy5P64QbYyctDZQTrE=;
        b=PKlRAI4E2qgOHFtBeVtJYteSuFlT3w24V0lOn0ggd+2gK38VDfF06m9xQekSrr45Wi
         PJQKu5BwzEEBMQlh6WOORLp4lIhZ1cIUweLcVKM7XIPJIjFn/AqPBAlISFUYRk3pjErR
         65tdSqrFItQ9zxj3+cJiZ7lQnB2KVgi1luUIKKNwwfJ164TUY5NyF4cYE7utc3e8igoa
         okVi/9hgnLwH+YhXOCLiH9EN+UWvZgzCeOQzIsHTNJz7fjgaGk7+n7x6k7BXH3Ryzcoj
         ZShhXqHQCcaqRACDhkqwLcoJnxz7fA3iibKtIWBWoMuYHzaUrPgdEQCnXyQxTDbiKcbi
         jRGA==
X-Gm-Message-State: AOAM532As8tZnxPtqYrzpNLCZxAokQkezjJPoVyDzjsjGNUtHumFfilS
        WN6rnePl8FGmH71ZUyNv5H+GNOjHoGeF1Q==
X-Google-Smtp-Source: ABdhPJyLrLKfrmzXg8EPLHlFdEDRs+BVVt4V/ZEYOX4Ys+pBL+p6ZwI8lCKG0H3xudaTf5aHiObkKA==
X-Received: by 2002:aa7:9f8f:0:b029:2dc:76bc:edce with SMTP id z15-20020aa79f8f0000b02902dc76bcedcemr7085511pfr.29.1621555494430;
        Thu, 20 May 2021 17:04:54 -0700 (PDT)
Received: from kelvin-System-Product-Name.lan ([117.173.227.56])
        by smtp.gmail.com with ESMTPSA id t22sm2736016pfl.50.2021.05.20.17.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 17:04:53 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH 1/3] MIPS: Loongson1B: Add dma_slave_map to DMA platform data
Date:   Fri, 21 May 2021 08:04:03 +0800
Message-Id: <20210521000405.4387-2-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210521000405.4387-1-keguang.zhang@gmail.com>
References: <20210521000405.4387-1-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Kelvin Cheung <keguang.zhang@gmail.com>

This patch add dma_slave_map to DMA platform data,
and remove unnecessary DMA filter declaration.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
 arch/mips/include/asm/mach-loongson32/dma.h  | 7 ++++---
 arch/mips/include/asm/mach-loongson32/nand.h | 4 ----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson32/dma.h b/arch/mips/include/asm/mach-loongson32/dma.h
index e917b3ccb2c2..1bcf1eb8fe3d 100644
--- a/arch/mips/include/asm/mach-loongson32/dma.h
+++ b/arch/mips/include/asm/mach-loongson32/dma.h
@@ -8,14 +8,15 @@
 #ifndef __ASM_MACH_LOONGSON32_DMA_H
 #define __ASM_MACH_LOONGSON32_DMA_H
 
+#include <linux/dmaengine.h>
+
 #define LS1X_DMA_CHANNEL0	0
 #define LS1X_DMA_CHANNEL1	1
 #define LS1X_DMA_CHANNEL2	2
 
 struct plat_ls1x_dma {
-	int nr_channels;
+	const struct dma_slave_map *slave_map;
+	int slavecnt;
 };
 
-extern struct plat_ls1x_dma ls1b_dma_pdata;
-
 #endif /* __ASM_MACH_LOONGSON32_DMA_H */
diff --git a/arch/mips/include/asm/mach-loongson32/nand.h b/arch/mips/include/asm/mach-loongson32/nand.h
index aaf5ed19d78d..d6eff2fadca2 100644
--- a/arch/mips/include/asm/mach-loongson32/nand.h
+++ b/arch/mips/include/asm/mach-loongson32/nand.h
@@ -19,8 +19,4 @@ struct plat_ls1x_nand {
 	int wait_cycle;
 };
 
-extern struct plat_ls1x_nand ls1b_nand_pdata;
-
-bool ls1x_dma_filter_fn(struct dma_chan *chan, void *param);
-
 #endif /* __ASM_MACH_LOONGSON32_NAND_H */
-- 
2.30.2

