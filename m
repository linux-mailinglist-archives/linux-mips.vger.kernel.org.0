Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0A5219F1B
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2020 13:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgGILcm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 07:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgGILcm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 07:32:42 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8AF7C061A0B
        for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2020 04:32:42 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k4so712787pld.12
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2020 04:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nRvbX2wpI0NkR4jXHGGBOCw+/miRyhJLyTL740Mt/bc=;
        b=fjfVmFpHljOt+QXV80gxmpnGURiJZnLZBpoyMnQOdyyzvu4hcgGffuAPNC0FdJiChx
         4/pUOqknbjrZQfz0X3USljprtEqKu6mrnm4k7kD7PeU9DmkMtMLcpS6VKXgioCAFE25N
         Z2ZMVJdvDTEBsLZ8/o3zVQPLd+RrhBAtmuceL1XvsFdQN8qesOwCgnY9nMzPOr29ENil
         +XKBaNPCHk2pr66pqvM7BmBI+Pjw0Awp7di3/CvUojweAS4YHgx36HDhzS4Wk4S9RsPd
         E4KK0sC3Z+/9eRrPsGIGHKrB4JY7FqPHM3Ze4wvThhaVYlhGfBdOlLR9uZfh3OU8wqDP
         BVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=nRvbX2wpI0NkR4jXHGGBOCw+/miRyhJLyTL740Mt/bc=;
        b=Cl4sQsMtf9YwykEOAOZ6UBCdJJVT8Sdrx1i7Ww7S8nOotr2JafIiv7ojViDZcuyjVW
         CeY4coTmL85tLxkUmE+RAg0h7QNnZai2VzuFCZOZ3Slj6Od8ynJG6XmYmk3GutL/C+/h
         xG+dxsvGNOwIYoKfSo7qoWowYX0dj5yr/oYqmRJe+UL2+sFP4uItaFsJWJfx2Eu6ZZRP
         Bef1xUBF6WUVsjleUZL9t0yhBCW6T7XSSo/gCQgLWq30hXOB0FrD00MyQsf1vq76rwpl
         s2HHckGOkCBMTA9y6jmW1OMJstBD+xcuIEnnYj/dyX1Y6c6pNFPU+TZlqMZFyWX4SDWj
         r8BA==
X-Gm-Message-State: AOAM533qFbuz+3DqFYIhVRdjhBANzVL3Or6i5Yk10qqP67ii1WQJz+Td
        8Y6djbL87KPB19V4K7CVuE2JuygYr36QjA==
X-Google-Smtp-Source: ABdhPJzqlkoGfyVqmOcJKFZ0SEE/xAcYJ+4a18iaMqFMhKe3LbjJxnFRR3ns0S4HrRyBKQP7ZDnzLw==
X-Received: by 2002:a17:90b:388d:: with SMTP id mu13mr13830590pjb.187.1594294362297;
        Thu, 09 Jul 2020 04:32:42 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id w4sm2612507pfd.39.2020.07.09.04.32.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 04:32:41 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 3/4] MIPS: Loongson64: Load LS7A dtbs
Date:   Thu,  9 Jul 2020 19:33:43 +0800
Message-Id: <1594294424-26218-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1594294424-26218-1-git-send-email-chenhc@lemote.com>
References: <1594294424-26218-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Load correct devicetree according to PRID and PCH type.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/env.c | 56 ++++++++++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 3e7caba..2cb9573 100644
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
-			loongson_fdt_blob = __dtb_loongson64c_4core_rs780e_begin;
-			break;
-		case PRID_REV_LOONGSON3B_R1:
-		case PRID_REV_LOONGSON3B_R2:
-			loongson_fdt_blob = __dtb_loongson64c_8core_rs780e_begin;
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
+			case LS7A:
+				loongson_fdt_blob = __dtb_loongson64c_4core_ls7a_begin;
+				break;
+			case RS780E:
+				loongson_fdt_blob = __dtb_loongson64c_4core_rs780e_begin;
+				break;
+			default:
+				break;
+			}
+			break;
+		case PRID_REV_LOONGSON3B_R1:
+		case PRID_REV_LOONGSON3B_R2:
+			if (loongson_sysconf.bridgetype == RS780E)
+				loongson_fdt_blob = __dtb_loongson64c_8core_rs780e_begin;
+			break;
+		default:
+			break;
+		}
+	} else if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64G) {
+		if (loongson_sysconf.bridgetype == LS7A)
+			loongson_fdt_blob = __dtb_loongson64g_4core_ls7a_begin;
+	}
+
+	if (!loongson_fdt_blob)
+		pr_err("Failed to determine built-in Loongson64 dtb\n");
 }
-- 
2.7.0

