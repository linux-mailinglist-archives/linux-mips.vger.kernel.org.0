Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCABB38B058
	for <lists+linux-mips@lfdr.de>; Thu, 20 May 2021 15:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236981AbhETNts (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 May 2021 09:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236592AbhETNtr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 May 2021 09:49:47 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E16CC061760;
        Thu, 20 May 2021 06:48:24 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id k15so11889012pgb.10;
        Thu, 20 May 2021 06:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=72s6c6EcdlMIZMwgXcJgm4iKdxHr+h9j9N+5N1yhI6M=;
        b=bODgCssctx+pCb7LX0d+Bj/TYWd5cooZLaOPRLI4HLFDPD9prqjvQ7frRg6ipOLhX0
         L+E97o8Vz0Fz9Vu9dOrAhopdFNPKLECBCVrE0VErERDNVap5OeLQqrkGbsuVnnxvMXkf
         nYk6ND01GfIg1dSzSHZjvkdsRpqAZLFqQBFV4pg6UAAuHLjZYsdW6YSqnytWjh44ynwQ
         4op3tQvzfXGWZIpbEDs77TLNLVb92RnNzlaWtcvWd2uuVHVBahlcE5gPuSJmPu7HKL7p
         yFIrMc3s9y9tBHGXJAKcWzmXGYm0wn+sqGNFwnQnJ7qQUv+qWO4cV3e4bEeZ/Wx6Zpiy
         meJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=72s6c6EcdlMIZMwgXcJgm4iKdxHr+h9j9N+5N1yhI6M=;
        b=BcotlnohgQ2MewJObJ6VMxDouEGOED9Wd8fq+8wLaAoYBqAUoq2/0narR63DffgiU/
         3pR4ae8E81AarNNZFqtKxNwfaz/TkDzjIkGbg0MI0Y2yYQ0CJ0VgkGqk/zW5Zc7S03Qm
         72bXqWEO+XKDDU3qpCWsPb0syFIW0cJ/ssUkYNaKQjxgNbe7vhv7HxsdVT3eRBQUFv4V
         MEq4Wl0WuvKh7fES8QH0xv3xztS2WhzliU36JGe/ZmMqFWKJ9eWmQZvglpQQwND/7Jw7
         S6e3CQWGjXzKILnzAgG07jTyu/BRrUDQqrX2swvz4KOjQjBPmRNYjyYc87faQuLdjrW1
         Hbjw==
X-Gm-Message-State: AOAM5309ZNFxsMO8NgDP8JUVUoQ8sGxBBfveepixJPvUk8Lpr16xBgwX
        5OC1/xOy2DG+3M29CMmuCZ9cCCEr2ces9w==
X-Google-Smtp-Source: ABdhPJxeLfeZNSHECtxmHenD8UvyDSC63OoKr+q6cLtOXtzh8nljWzEB4jxyXIiVlPsPs4eapLYO8w==
X-Received: by 2002:a62:6481:0:b029:249:ecee:a05d with SMTP id y123-20020a6264810000b0290249eceea05dmr4647793pfb.9.1621518503556;
        Thu, 20 May 2021 06:48:23 -0700 (PDT)
Received: from kelvin-System-Product-Name.lan ([117.173.226.141])
        by smtp.gmail.com with ESMTPSA id t14sm1954025pfg.168.2021.05.20.06.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 06:48:23 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Keguang Zhang <keguang.zhang@unisoc.com>
Subject: [PATCH 1/3] MIPS: Loongson1B: Add dma_slave_map to DMA platform data
Date:   Thu, 20 May 2021 21:48:07 +0800
Message-Id: <20210520134809.27143-2-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520134809.27143-1-keguang.zhang@gmail.com>
References: <20210520134809.27143-1-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Keguang Zhang <keguang.zhang@unisoc.com>

This patch add dma_slave_map to DMA platform data,
and remove unnecessary DMA filter declaration.

Signed-off-by: Keguang Zhang <keguang.zhang@unisoc.com>
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
2.25.1

