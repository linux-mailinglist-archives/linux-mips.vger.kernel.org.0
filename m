Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0433F85C4F
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2019 10:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731813AbfHHIAw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Aug 2019 04:00:52 -0400
Received: from forward103p.mail.yandex.net ([77.88.28.106]:52301 "EHLO
        forward103p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726721AbfHHIAw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Aug 2019 04:00:52 -0400
Received: from mxback18g.mail.yandex.net (mxback18g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:318])
        by forward103p.mail.yandex.net (Yandex) with ESMTP id 8CA1018C101E;
        Thu,  8 Aug 2019 10:51:54 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback18g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id awCwUKQV30-prsuWenO;
        Thu, 08 Aug 2019 10:51:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1565250714;
        bh=tUe7e1pFn9qwzTNyvSSL9IBZ6SX6JX1ww1W9O9vtRTk=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=udoHlsadx7ZwhoQJ0Ulnmok2gwVxneB7ql3UQCMjBRSxRXpY0GyLKcGZYAQs5kkzN
         qlvuLsPglFJSRZHMC8KpuWoeNU2ryykrFm2qSzOP4Z7T5cDFAeePqLbF2yLQ/VozX8
         XKJYVeauXdg/y2FVjH1uzxAbPaQ9PtmWKHD2oNag=
Authentication-Results: mxback18g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id 03dF3Y2ufp-pfguDV9F;
        Thu, 08 Aug 2019 10:51:50 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paul.burton@mips.com, yasha.che3@gmail.com, aurelien@aurel32.net,
        sfr@canb.auug.org.au, fancer.lancer@gmail.com,
        matt.redfearn@mips.com, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 5/7] MIPS: msp: Record prom memory
Date:   Thu,  8 Aug 2019 15:50:11 +0800
Message-Id: <20190808075013.4852-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
References: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
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
 arch/mips/pmcs-msp71xx/msp_prom.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/mips/pmcs-msp71xx/msp_prom.c b/arch/mips/pmcs-msp71xx/msp_prom.c
index 6fdcb3d6fbb5..13a5eb47af94 100644
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
@@ -352,6 +356,12 @@ void __init prom_meminit(void)
 
 		add_memory_region(base, size, type);
 		p++;
+
+		if (type == BOOT_MEM_ROM_DATA) {
+			prom_mem_base[nr_prom_mem] = base;
+			prom_mem_size[nr_prom_mem] = size;
+			nr_prom_mem++;
+		}
 	}
 }
 
@@ -407,13 +417,9 @@ void __init prom_free_prom_memory(void)
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

