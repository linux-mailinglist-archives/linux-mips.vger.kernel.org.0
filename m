Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E55E1E73D6
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 05:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388235AbgE2Dp0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 23:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388037AbgE2DpZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 23:45:25 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75430C08C5C6;
        Thu, 28 May 2020 20:45:25 -0700 (PDT)
Received: from localhost.localdomain (unknown [142.147.94.151])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 8F97E20CD9;
        Fri, 29 May 2020 03:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590723925; bh=6/KuaceX+/j+g+1dcwRKN0arBJJEMAYjWfUJAYKj/1g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LteoWN63oyCtpyCqQOWc2NaEW43aff24Q8BC313rBIEefQS1agOsPJIai3SC7ovmG
         57eERUXjX8dyPiP3/9Kcreezc8uCU3iX4RrKbWhWcn7+vdEJckeuF1uZdoqUtrfGrq
         +b9VnO+S+rxuh2MupGnOW5DFqO4UPsujGiRiukW/6LDNXnH3v4PaFwBZuxAUJFzFN7
         B0+epzJPBdUlKhgnwg1F7fkZBPTO2wQ3mzvX2dTdnBT1/f1WL7TPqQCEXZmvDNmS1y
         ACArJfezrAP46ks9W8wlQ7C8z8jrcn5xm47nuZGLXJKmZ5O9Sg0zRcvigTc8iyxSha
         Uhx7/bWkgBDjg==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] MIPS: Loongson64:Load LS7A dtbs
Date:   Fri, 29 May 2020 11:43:20 +0800
Message-Id: <20200529034338.1137776-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200529034338.1137776-1-jiaxun.yang@flygoat.com>
References: <20200529034338.1137776-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Load correct devicetree according to PRID and PCH type.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/env.c | 56 +++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index d11bc346bbca..9b56f4a80b62 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -126,28 +126,6 @@ void __init prom_init_env(void)
 		loongson_sysconf.cores_per_node - 1) /
 		loongson_sysconf.cores_per_node;
 
-	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64C) {
-		switch (read_c0_prid() & PRID_REV_MASK) {
-		case PRID_REV_LOONGSON3A_R1:
-		case PRID_REV_LOONGSON3A_R2_0:
-		case PRID_REV_LOONGSON3A_R2_1:
-		case PRID_REV_LOONGSON3A_R3_0:
-		case PRID_REV_LOONGSON3A_R3_1:
-			loongson_fdt_blob = __dtb_loongson3_4core_rs780e_begin;
-			break;
-		case PRID_REV_LOONGSON3B_R1:
-		case PRID_REV_LOONGSON3B_R2:
-			loongson_fdt_blob = __dtb_loongson3_8core_rs780e_begin;
-			break;
-		default:
-			break;
-		}
-	}
-
-
-	if (!loongson_fdt_blob)
-		pr_err("Failed to determine built-in Loongson64 dtb\n");
-
 	loongson_sysconf.pci_mem_start_addr = eirq_source->pci_mem_start_addr;
 	loongson_sysconf.pci_mem_end_addr = eirq_source->pci_mem_end_addr;
 	loongson_sysconf.pci_io_base = eirq_source->pci_io_start_addr;
@@ -198,4 +176,38 @@ void __init prom_init_env(void)
 		loongson_sysconf.bridgetype = RS780E;
 		loongson_sysconf.early_config = rs780e_early_config;
 	}
+
+	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64C) {
+		switch (read_c0_prid() & PRID_REV_MASK) {
+		case PRID_REV_LOONGSON3A_R1:
+		case PRID_REV_LOONGSON3A_R2_0:
+		case PRID_REV_LOONGSON3A_R2_1:
+		case PRID_REV_LOONGSON3A_R3_0:
+		case PRID_REV_LOONGSON3A_R3_1:
+			switch (loongson_sysconf.bridgetype) {
+			case RS780E:
+				loongson_fdt_blob = __dtb_loongson3_4core_rs780e_begin;
+				break;
+			case LS7A:
+				loongson_fdt_blob = __dtb_loongson3_4core_ls7a_begin;
+				break;
+			default:
+				break;
+			}
+			break;
+		case PRID_REV_LOONGSON3B_R1:
+		case PRID_REV_LOONGSON3B_R2:
+			if (loongson_sysconf.bridgetype == RS780E)
+				loongson_fdt_blob = __dtb_loongson3_8core_rs780e_begin;
+			break;
+		default:
+			break;
+		}
+	} else if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64G) {
+		if (loongson_sysconf.bridgetype == LS7A)
+			loongson_fdt_blob = __dtb_loongson3_r4_ls7a_begin;
+	}
+
+	if (!loongson_fdt_blob)
+		pr_err("Failed to determine built-in Loongson64 dtb\n");
 }
-- 
2.27.0.rc0

