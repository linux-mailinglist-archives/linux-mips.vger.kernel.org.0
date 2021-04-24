Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF4C36A308
	for <lists+linux-mips@lfdr.de>; Sat, 24 Apr 2021 22:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235872AbhDXUw2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Apr 2021 16:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233485AbhDXUw2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Apr 2021 16:52:28 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B59C06174A;
        Sat, 24 Apr 2021 13:51:49 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id f29so428316pgm.8;
        Sat, 24 Apr 2021 13:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7btaIOfsoPEdYOBosrv9eDASHGVgDcN6WbpmphUXOvk=;
        b=JtX3VxayhXXYHKH7K5xpU/XvccJioa4farjJv2Oy4dFep7ZCOIwsk8iFdRRKfXfoTO
         L23kj3NZKgWBrOna78Jdp2a6JWjQ0AkRLBPmeEvB022MHlvbPMRZPrZ2b2eKoDadNe5a
         //b3TXcO/l015lhb7Wej+zhJVgDrcCOl/5ohIVSCTGWKwlMQ1rLhbyPEvQT++i8y38EN
         FvLVnnbsHlRyUMM+s/uiCkMmBZDoODqt1upalhEC6uVqLYTetsQ28EQ9iNy+ASyq2u2Q
         Hlnh9wE6ZzxEM3UPXswFqbjMumaCF8pOIFkBcBjTT8L2a5OlEC/bjtFcMOUM6M/69LNF
         VwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7btaIOfsoPEdYOBosrv9eDASHGVgDcN6WbpmphUXOvk=;
        b=cUjtMZGv/szUr4z2xSojWGRdWu430kyZtmCdPIDyhD4yG1MlMgcLBpsJXsLl5jKBf6
         q2VF5cXikB7DT8+V/0Tta6ssPB6a1tFI+alAQCN/oz/vC/dsCwt9qDI6WUXq853RtPKC
         COWS2eftzvTXg8DhCyr6d8Uv/twYA9vJkfRIpc1dcq3NJwGHneOkN8hS6cwnDkHioKFw
         0atCkr0kU/lxXKiozKB73uDShOB6LI/E2NGpwo8qfc0NWhlbsaGoJjDHvFWdSV4FArqP
         xJf+LP8nfQn4Sxo6bx4Tj5jFvkMvTz3s7H7eIs40cZJHtQpiT1vqFptmDIYBI4Thv/Ok
         91pg==
X-Gm-Message-State: AOAM532vAFNOAQfc4/lsmAtsiQNHe4CMGu0Lh2ZwB7/ZGyc5SR+HoCfy
        gCyLXwy5kEmak40xxcplDA1/snmekvfqP2Dj
X-Google-Smtp-Source: ABdhPJy2hLtZchvAod3QBxvsOX0rxdvNteJx33NDV1iMxUSd7E/LM3MPyF5J+tj6qgHeE/VNiTqO/Q==
X-Received: by 2002:a62:7f84:0:b029:25f:b701:38e5 with SMTP id a126-20020a627f840000b029025fb70138e5mr10240375pfd.5.1619297508862;
        Sat, 24 Apr 2021 13:51:48 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id w9sm7584489pfn.213.2021.04.24.13.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 13:51:48 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] MIPS: kernel: proc: fix trivial style errors
Date:   Sat, 24 Apr 2021 13:51:25 -0700
Message-Id: <20210424205127.396630-2-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210424205127.396630-1-ilya.lipnitskiy@gmail.com>
References: <20210424205127.396630-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the following checkpatch errors - no logic changes:

WARNING: Block comments use a trailing */ on a separate line
+ *   */
ERROR: space prohibited before open square bracket '['
+	char fmt [64];
ERROR: space prohibited before that ',' (ctx:WxE)
+			seq_printf(m, "%s0x%04x", i ? ", " : "" ,
ERROR: trailing whitespace
+^Iseq_printf(m, "isa\t\t\t:"); $
ERROR: trailing statements should be on next line

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/kernel/proc.c | 67 ++++++++++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 24 deletions(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 4184d641f05e..053847c0d4cd 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -19,8 +19,8 @@
 unsigned int vced_count, vcei_count;
 
 /*
- *  * No lock; only written during early bootup by CPU 0.
- *   */
+ * No lock; only written during early bootup by CPU 0.
+ */
 static RAW_NOTIFIER_HEAD(proc_cpuinfo_chain);
 
 int __ref register_proc_cpuinfo_notifier(struct notifier_block *nb)
@@ -39,7 +39,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	unsigned long n = (unsigned long) v - 1;
 	unsigned int version = cpu_data[n].processor_id;
 	unsigned int fp_vers = cpu_data[n].fpu_id;
-	char fmt [64];
+	char fmt[64];
 	int i;
 
 #ifdef CONFIG_SMP
@@ -78,12 +78,12 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_printf(m, "count: %d, address/irw mask: [",
 		      cpu_data[n].watch_reg_count);
 		for (i = 0; i < cpu_data[n].watch_reg_count; i++)
-			seq_printf(m, "%s0x%04x", i ? ", " : "" ,
+			seq_printf(m, "%s0x%04x", i ? ", " : "",
 				cpu_data[n].watch_reg_masks[i]);
 		seq_printf(m, "]\n");
 	}
 
-	seq_printf(m, "isa\t\t\t:"); 
+	seq_printf(m, "isa\t\t\t:");
 	if (cpu_has_mips_1)
 		seq_printf(m, " mips1");
 	if (cpu_has_mips_2)
@@ -113,25 +113,44 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_printf(m, "\n");
 
 	seq_printf(m, "ASEs implemented\t:");
-	if (cpu_has_mips16)	seq_printf(m, "%s", " mips16");
-	if (cpu_has_mips16e2)	seq_printf(m, "%s", " mips16e2");
-	if (cpu_has_mdmx)	seq_printf(m, "%s", " mdmx");
-	if (cpu_has_mips3d)	seq_printf(m, "%s", " mips3d");
-	if (cpu_has_smartmips)	seq_printf(m, "%s", " smartmips");
-	if (cpu_has_dsp)	seq_printf(m, "%s", " dsp");
-	if (cpu_has_dsp2)	seq_printf(m, "%s", " dsp2");
-	if (cpu_has_dsp3)	seq_printf(m, "%s", " dsp3");
-	if (cpu_has_mipsmt)	seq_printf(m, "%s", " mt");
-	if (cpu_has_mmips)	seq_printf(m, "%s", " micromips");
-	if (cpu_has_vz)		seq_printf(m, "%s", " vz");
-	if (cpu_has_msa)	seq_printf(m, "%s", " msa");
-	if (cpu_has_eva)	seq_printf(m, "%s", " eva");
-	if (cpu_has_htw)	seq_printf(m, "%s", " htw");
-	if (cpu_has_xpa)	seq_printf(m, "%s", " xpa");
-	if (cpu_has_loongson_mmi)	seq_printf(m, "%s", " loongson-mmi");
-	if (cpu_has_loongson_cam)	seq_printf(m, "%s", " loongson-cam");
-	if (cpu_has_loongson_ext)	seq_printf(m, "%s", " loongson-ext");
-	if (cpu_has_loongson_ext2)	seq_printf(m, "%s", " loongson-ext2");
+	if (cpu_has_mips16)
+		seq_printf(m, "%s", " mips16");
+	if (cpu_has_mips16e2)
+		seq_printf(m, "%s", " mips16e2");
+	if (cpu_has_mdmx)
+		seq_printf(m, "%s", " mdmx");
+	if (cpu_has_mips3d)
+		seq_printf(m, "%s", " mips3d");
+	if (cpu_has_smartmips)
+		seq_printf(m, "%s", " smartmips");
+	if (cpu_has_dsp)
+		seq_printf(m, "%s", " dsp");
+	if (cpu_has_dsp2)
+		seq_printf(m, "%s", " dsp2");
+	if (cpu_has_dsp3)
+		seq_printf(m, "%s", " dsp3");
+	if (cpu_has_mipsmt)
+		seq_printf(m, "%s", " mt");
+	if (cpu_has_mmips)
+		seq_printf(m, "%s", " micromips");
+	if (cpu_has_vz)
+		seq_printf(m, "%s", " vz");
+	if (cpu_has_msa)
+		seq_printf(m, "%s", " msa");
+	if (cpu_has_eva)
+		seq_printf(m, "%s", " eva");
+	if (cpu_has_htw)
+		seq_printf(m, "%s", " htw");
+	if (cpu_has_xpa)
+		seq_printf(m, "%s", " xpa");
+	if (cpu_has_loongson_mmi)
+		seq_printf(m, "%s", " loongson-mmi");
+	if (cpu_has_loongson_cam)
+		seq_printf(m, "%s", " loongson-cam");
+	if (cpu_has_loongson_ext)
+		seq_printf(m, "%s", " loongson-ext");
+	if (cpu_has_loongson_ext2)
+		seq_printf(m, "%s", " loongson-ext2");
 	seq_printf(m, "\n");
 
 	if (cpu_has_mmips) {
-- 
2.31.1

