Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E19216FF5FC
	for <lists+linux-mips@lfdr.de>; Thu, 11 May 2023 17:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237901AbjEKPaS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 May 2023 11:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238204AbjEKPaR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 May 2023 11:30:17 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B24449D
        for <linux-mips@vger.kernel.org>; Thu, 11 May 2023 08:30:15 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-965d73eb65fso1412765766b.2
        for <linux-mips@vger.kernel.org>; Thu, 11 May 2023 08:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683819013; x=1686411013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kgIFUk+vXeUI9BAbeUq64IlNhH4VjesPga6NqozR3o=;
        b=B/K2WO/U4LMI2CoSQh737kIQR9GbwuriF8esawO7IjKNjBpF0sWREdjCgO7/MI/AGg
         i+3g2FVLl0n3tOIz5pxaJKLIPhCBIu/lM1U4BtLOGeD/VdUctT3anQpXDktrN5rdkUC1
         iI10SP/mhKm6lMzMUgYLapnSnw+JZ9kIwJaPKbydoeMOUqvPFrUOlN8nak0hYMbmpM+1
         YXuspbZN3WIpiiBsMWSdRstCvGA9MfOzUDXF4uGKV++zWNgYzAA/4plewNprRA+sSXCS
         qxan9IOCCSIMioAw1DWMTm4NtHS+yKWIT5wuairbnn2f+l/h8eueI2ppXCQOd1CXGOtv
         doUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683819013; x=1686411013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kgIFUk+vXeUI9BAbeUq64IlNhH4VjesPga6NqozR3o=;
        b=b8KTTGgSZmEhJt8Eskv4Geb2gZxhyHHypPC9+0pNKBPr0QoHC5UQ2FoXDKl40jAssH
         32f8YoU07wTeb39WFqFIB00sP4rWDqMcO/SNd9puik/sobTmjI2/6Z+6q1hqA7KJ5JKR
         3x7d+xSNi3U98olIpDQNs+oA8qeAB2EtQ4hjOBTsSl/wonNZkvPFLKh1DPJ6accz59MD
         /h0/15ONYmLq0N55lmE8d4JEn2/9Z3Oe9c/jLQ5/DyXMSMqZ7Tf6wBX2/W6QIr4DJ3Ap
         4UtEmsPy2Spa04Uod/g1EkkK6ElaQhVv5+dlpZb9wrE93oEGsbyU0U8cz2wsIMHZcdgy
         Tw/g==
X-Gm-Message-State: AC+VfDy2YC8t+4o6rcACGFwPQ+zoOx1YESXgenaSCIrk+Jn4C45c9/v6
        GOSlZhfRSbow3BE040gScKsZg+xEwSS9MA==
X-Google-Smtp-Source: ACHHUZ4zz6r08RN8CMUThTpBE/6+nj31pyr5vFT5aSglA/syAnlokPGdJmKxrKud1M9yDc1ijC+TQg==
X-Received: by 2002:a17:906:58cd:b0:966:350f:f42d with SMTP id e13-20020a17090658cd00b00966350ff42dmr17972626ejs.23.1683819013504;
        Thu, 11 May 2023 08:30:13 -0700 (PDT)
Received: from flagship2.deu.mlau.at (p200300c02712e50000000000000002af.dip0.t-ipconnect.de. [2003:c0:2712:e500::2af])
        by smtp.gmail.com with ESMTPSA id ml18-20020a170906cc1200b0094f124a37c4sm4202727ejb.18.2023.05.11.08.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 08:30:13 -0700 (PDT)
From:   Manuel Lauss <manuel.lauss@gmail.com>
To:     Linux-MIPS <linux-mips@vger.kernel.org>
Cc:     Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH] MIPS: Alchemy: fix dbdma2
Date:   Thu, 11 May 2023 17:30:10 +0200
Message-Id: <20230511153010.651283-1-manuel.lauss@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Various fixes for the Au1200/Au1550/Au1300 DBDMA2 code:

- skip cache invalidation if chip has working coherency circuitry.
- invalidate KSEG0-portion of the (physical) data address.
- force the dma channel doorbell write out to bus immediately with
  a sync.

--
 This fixes Audio and SD/MMC on the DB1300 board.

Signed-off-by: Manuel Lauss <manuel.lauss@gmail.com>
---
 arch/mips/alchemy/common/dbdma.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/mips/alchemy/common/dbdma.c b/arch/mips/alchemy/common/dbdma.c
index 5ab043000409..6a3c890f7bbf 100644
--- a/arch/mips/alchemy/common/dbdma.c
+++ b/arch/mips/alchemy/common/dbdma.c
@@ -30,6 +30,7 @@
  *
  */
 
+#include <linux/dma-map-ops.h> /* for dma_default_coherent */
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
@@ -623,17 +624,18 @@ u32 au1xxx_dbdma_put_source(u32 chanid, dma_addr_t buf, int nbytes, u32 flags)
 		dp->dscr_cmd0 &= ~DSCR_CMD0_IE;
 
 	/*
-	 * There is an errata on the Au1200/Au1550 parts that could result
-	 * in "stale" data being DMA'ed. It has to do with the snoop logic on
-	 * the cache eviction buffer.  DMA_NONCOHERENT is on by default for
-	 * these parts. If it is fixed in the future, these dma_cache_inv will
-	 * just be nothing more than empty macros. See io.h.
+	 * There is an erratum on certain Au1200/Au1550 revisions that could
+	 * result in "stale" data being DMA'ed. It has to do with the snoop
+	 * logic on the cache eviction buffer.  dma_default_coherent is set
+	 * to false on these parts.
 	 */
-	dma_cache_wback_inv((unsigned long)buf, nbytes);
+	if (!dma_default_coherent)
+		dma_cache_wback_inv(KSEG0ADDR(buf), nbytes);
 	dp->dscr_cmd0 |= DSCR_CMD0_V;	/* Let it rip */
 	wmb(); /* drain writebuffer */
 	dma_cache_wback_inv((unsigned long)dp, sizeof(*dp));
 	ctp->chan_ptr->ddma_dbell = 0;
+	wmb(); /* force doorbell write out to dma engine */
 
 	/* Get next descriptor pointer. */
 	ctp->put_ptr = phys_to_virt(DSCR_GET_NXTPTR(dp->dscr_nxtptr));
@@ -685,17 +687,18 @@ u32 au1xxx_dbdma_put_dest(u32 chanid, dma_addr_t buf, int nbytes, u32 flags)
 			  dp->dscr_source1, dp->dscr_dest0, dp->dscr_dest1);
 #endif
 	/*
-	 * There is an errata on the Au1200/Au1550 parts that could result in
-	 * "stale" data being DMA'ed. It has to do with the snoop logic on the
-	 * cache eviction buffer.  DMA_NONCOHERENT is on by default for these
-	 * parts. If it is fixed in the future, these dma_cache_inv will just
-	 * be nothing more than empty macros. See io.h.
+	 * There is an erratum on certain Au1200/Au1550 revisions that could
+	 * result in "stale" data being DMA'ed. It has to do with the snoop
+	 * logic on the cache eviction buffer.  dma_default_coherent is set
+	 * to false on these parts.
 	 */
-	dma_cache_inv((unsigned long)buf, nbytes);
+	if (!dma_default_coherent)
+		dma_cache_inv(KSEG0ADDR(buf), nbytes);
 	dp->dscr_cmd0 |= DSCR_CMD0_V;	/* Let it rip */
 	wmb(); /* drain writebuffer */
 	dma_cache_wback_inv((unsigned long)dp, sizeof(*dp));
 	ctp->chan_ptr->ddma_dbell = 0;
+	wmb(); /* force doorbell write out to dma engine */
 
 	/* Get next descriptor pointer. */
 	ctp->put_ptr = phys_to_virt(DSCR_GET_NXTPTR(dp->dscr_nxtptr));
-- 
2.40.1

