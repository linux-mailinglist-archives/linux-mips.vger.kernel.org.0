Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88E4692694
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2019 16:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfHSOXx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Aug 2019 10:23:53 -0400
Received: from forward106o.mail.yandex.net ([37.140.190.187]:52179 "EHLO
        forward106o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726186AbfHSOXx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Aug 2019 10:23:53 -0400
Received: from mxback17g.mail.yandex.net (mxback17g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:317])
        by forward106o.mail.yandex.net (Yandex) with ESMTP id 5F972506162C;
        Mon, 19 Aug 2019 17:23:49 +0300 (MSK)
Received: from smtp1o.mail.yandex.net (smtp1o.mail.yandex.net [2a02:6b8:0:1a2d::25])
        by mxback17g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id QAGcm41eUj-Nmsi3vO9;
        Mon, 19 Aug 2019 17:23:49 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566224629;
        bh=RD2IhL3BrYGzCAr6axycGzaPSG5p9eTKRnNu7suNtxE=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=OdnHYT+4xdwjcdJIc4mrg8OMEhA8h6gr6bMx+J5xKGvSWoD62m7iLfWM8M2pfAytP
         DKARaDcgR5bmCx9huropwenDsfOrFLhNeHn5owNEFPhAFwFxK4BCMy3n/TBUoz/OMn
         sKGGTHNC4dJFQSPnQVprDFr40J8L1T8g2Zwi7f68=
Authentication-Results: mxback17g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id StE3L42zOl-NiUmGD2L;
        Mon, 19 Aug 2019 17:23:47 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paul.burton@mips.com, yasha.che3@gmail.com, aurelien@aurel32.net,
        sfr@canb.auug.org.au, fancer.lancer@gmail.com,
        matt.redfearn@mips.com, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 4/8] MIPS: msp: Record prom memory
Date:   Mon, 19 Aug 2019 22:23:09 +0800
Message-Id: <20190819142313.3535-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
References: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

boot_mem_map is nolonger exist so we need to maintain a list
of prom memory by ourselves

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/pmcs-msp71xx/msp_prom.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/mips/pmcs-msp71xx/msp_prom.c b/arch/mips/pmcs-msp71xx/msp_prom.c
index 6fdcb3d6fbb5..0c5e5384b1d7 100644
--- a/arch/mips/pmcs-msp71xx/msp_prom.c
+++ b/arch/mips/pmcs-msp71xx/msp_prom.c
@@ -61,6 +61,10 @@ int init_debug = 1;
 /* memory blocks */
 struct prom_pmemblock mdesc[PROM_MAX_PMEMBLOCKS];
 
+static phys_addr_t prom_mem_base[MAX_PROM_MEM] __initdata;
+static phys_addr_t prom_mem_size[MAX_PROM_MEM] __initdata;
+static unsigned int nr_prom_mem __initdata;
+
 /* default feature sets */
 static char msp_default_features[] =
 #if defined(CONFIG_PMC_MSP4200_EVAL) \
@@ -352,6 +356,16 @@ void __init prom_meminit(void)
 
 		add_memory_region(base, size, type);
 		p++;
+
+		if (type == BOOT_MEM_ROM_DATA) {
+			if (nr_prom_mem >= 5) {
+				pr_err("Too many ROM DATA regions");
+				continue;
+			}
+			prom_mem_base[nr_prom_mem] = base;
+			prom_mem_size[nr_prom_mem] = size;
+			nr_prom_mem++;
+		}
 	}
 }
 
@@ -407,13 +421,9 @@ void __init prom_free_prom_memory(void)
 	envp[i] = NULL;			/* end array with null pointer */
 	prom_envp = envp;
 
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		if (boot_mem_map.map[i].type != BOOT_MEM_ROM_DATA)
-			continue;
-
-		addr = boot_mem_map.map[i].addr;
+	for (i = 0; i < nr_prom_mem; i++) {
 		free_init_pages("prom memory",
-				addr, addr + boot_mem_map.map[i].size);
+			prom_mem_base[i], prom_mem_base[i] + prom_mem_size[i]);
 	}
 }
 
-- 
2.22.0

