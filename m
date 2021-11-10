Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29C6744CDC7
	for <lists+linux-mips@lfdr.de>; Thu, 11 Nov 2021 00:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234167AbhKJX2b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Nov 2021 18:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbhKJX23 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Nov 2021 18:28:29 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C75C061766;
        Wed, 10 Nov 2021 15:25:41 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id i5so6757192wrb.2;
        Wed, 10 Nov 2021 15:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v/V7ixtvM0wJB1Jk1MWAaJATghrtxgTP4T3O07Mrdu8=;
        b=LILZhyChTSUnQFuhxiecQFf7BFCwtIEeMMhAGYGeU3TiqOPt2MBkeFcD2biuRKK/s2
         nmKapnBpB3NFuRxSWLC/OOtIZhF1jiUxgqTXeHPhD1IUTTxEBFvuyizRc8P/I8CoTZmJ
         41FSIgvVFJelikXD8K2GXOGQ0QTnza5onqn2b3rc0uzFIPoYf2VfDePflmLgLl6/i7bz
         3ikCGyCrQU4WnWwXBSnsD9kc3Od2H8TueEJAVgsphQl4ji5VIpxYz4PFqgrkNU9njHxq
         F1eIvXU/h9ijIzRI0aA8Fev3QTv82aEAY6BFSRACuSZKaoZsU97vIpYtGW1JhvpXb1hh
         mjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v/V7ixtvM0wJB1Jk1MWAaJATghrtxgTP4T3O07Mrdu8=;
        b=HjOYzIjAOthQIezFC9ECKxYbo4XAfUlGxBz/KZKkPynGHtKrS7THFMWfjWgbLdnLAZ
         3zLC5YFNMOvn8Rt1rGux2OtqKm1qDcQSN6HWwnKcBo/UUcsuPjhSQ6sK6+SZbHn7a4nU
         c+WMoJCEUouTYgJ/V6F3X5vFYAY5o5iE2WiFtOfAmxBBE3kUFQGI0s3lY/xBMAZ2bvzi
         CwcTkov6XYrz9q61kwSWjWQSGHIxGYj2F25SgjSxs0qiD6L+IGBKo5v3E1VFi1Y40hd/
         g22DjSAcYpUCd5q2BYoboH6nOgAvM/6/PvRBBp30DSh/w5r9p4PflbbYCkwmB6UoxoHN
         Kt9g==
X-Gm-Message-State: AOAM533tivCCB6lE9GouNCPk3bcje4c/bbnOvEar/Av0Txvwb3WztRQf
        iextg8xpekG32w==
X-Google-Smtp-Source: ABdhPJyn1HgNoM2PuLTIIsBKun1kehkVMuJbkmEmNTpqdSvwCz/414bbsmxAE/9bo0LnPKqrDbA0Gg==
X-Received: by 2002:a5d:4107:: with SMTP id l7mr3355393wrp.209.1636586740056;
        Wed, 10 Nov 2021 15:25:40 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id l4sm1118662wrv.94.2021.11.10.15.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 15:25:39 -0800 (PST)
From:   Colin Ian King <colin.i.king@googlemail.com>
X-Google-Original-From: Colin Ian King <colin.i.king@gmail.com>
To:     Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: generic/yamon-dt: fix uninitialized variable error
Date:   Wed, 10 Nov 2021 23:25:38 +0000
Message-Id: <20211110232538.1372250-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where fw_getenv returns an error when fetching values
for ememsizea and memsize then variable phys_memsize is not assigned
a variable and will be uninitialized on a zero check of phys_memsize.
Fix this by initializing phys_memsize to zero.

Cleans up cppcheck error:
arch/mips/generic/yamon-dt.c:100:7: error: Uninitialized variable: phys_memsize [uninitvar]

Fixes: f41d2430bbd6 ("MIPS: generic/yamon-dt: Support > 256MB of RAM")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/mips/generic/yamon-dt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/generic/yamon-dt.c b/arch/mips/generic/yamon-dt.c
index a3aa22c77cad..a07a5edbcda7 100644
--- a/arch/mips/generic/yamon-dt.c
+++ b/arch/mips/generic/yamon-dt.c
@@ -75,7 +75,7 @@ static unsigned int __init gen_fdt_mem_array(
 __init int yamon_dt_append_memory(void *fdt,
 				  const struct yamon_mem_region *regions)
 {
-	unsigned long phys_memsize, memsize;
+	unsigned long phys_memsize = 0, memsize;
 	__be32 mem_array[2 * MAX_MEM_ARRAY_ENTRIES];
 	unsigned int mem_entries;
 	int i, err, mem_off;
-- 
2.32.0

