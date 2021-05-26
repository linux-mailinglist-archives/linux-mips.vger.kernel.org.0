Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1914A3918DD
	for <lists+linux-mips@lfdr.de>; Wed, 26 May 2021 15:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234028AbhEZNdW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 May 2021 09:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234049AbhEZNdV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 May 2021 09:33:21 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CB6C061574;
        Wed, 26 May 2021 06:31:48 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id x188so923839pfd.7;
        Wed, 26 May 2021 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VOb8c6DZ7VIZrD+3PTSNQOJnewy5P64QbYyctDZQTrE=;
        b=RQceYVMkKKH7MQC4Bw60L0anVpYCZT2yew9FcP84FibqTmCD6lOmRrldpei/dy6sph
         62t7nc/ZFl0BB+4anGSk8fOSSYbJVk7dWhrtBYBMJam6kNBLNkR9TfV7karPgzRUSL1/
         RzUWbwdjtDmzzF4Y4fVTUriZq9eKzthV2wgV/cVGRcR1QmYKehFzFIrsGQS4blZJwt/j
         eDO+UrODFX7/kOduptTstHDzQXVhCKmlw5UfNvEAsk+f7B0KNZrkAbTSTlU2jipSQSU6
         fpM39bPeV7FK4S6DOugh8rWFSJM9sQogAHqxEbQHoZnAH+D0BDPbaFgnco1yuz5MMP90
         S3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VOb8c6DZ7VIZrD+3PTSNQOJnewy5P64QbYyctDZQTrE=;
        b=JNXpLPu+fxLASGGZ0JSvoZEJdkPsfhjHAoWnsbpx0MwcV9+w144JlV2OV2vGuFwqGR
         6CNW/2UuOfOpSOi1SumifLFyutHv6TrRG+no84j/lJ4GS7ceJ0CRzWV3fUdbn8Ki/4DR
         5VGEwobHjLsDtrkje0dj9X0VoxbgO50dVynWgPViy5thr2kuHVfvCNQ5oxpC+GY4JFyk
         fMuRxpzT++lbNep0pA3DoMQLd6JoekvLxF9AO3itAHQLysyamtLzx1+Yva1hHjLez1V1
         VAjs43yViwxjRdtKZKY0Cla2XyF3kWjFwpJOtTWLxl7SDX3BkphwCxKsIhZkWSlrp9vS
         3ltw==
X-Gm-Message-State: AOAM530PxUXZe5Znfc07p888gVG2P+4nKJSXiu42tQHBGEB4ilMAh1Mx
        6nnM4AX8hQ2W+qCAWXorm4xg2Jt8Tv5i3A==
X-Google-Smtp-Source: ABdhPJykvtNFnVXHvZs6X6OS+x60cEND79jJO3OuI8R+LSm0KjlqiiiFua7+qJ3hlXTByGA7wpdjRg==
X-Received: by 2002:a05:6a00:1992:b029:2df:b93b:49a with SMTP id d18-20020a056a001992b02902dfb93b049amr35341578pfl.11.1622035907864;
        Wed, 26 May 2021 06:31:47 -0700 (PDT)
Received: from kelvin-System-Product-Name.lan ([112.45.97.46])
        by smtp.gmail.com with ESMTPSA id a15sm15223088pff.128.2021.05.26.06.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:31:47 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH V1 1/4] MIPS: Loongson1B: Add dma_slave_map to DMA platform data
Date:   Wed, 26 May 2021 21:30:57 +0800
Message-Id: <20210526133100.436048-2-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526133100.436048-1-keguang.zhang@gmail.com>
References: <20210526133100.436048-1-keguang.zhang@gmail.com>
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

