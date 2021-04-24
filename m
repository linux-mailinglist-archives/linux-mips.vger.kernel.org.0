Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88CD536A34F
	for <lists+linux-mips@lfdr.de>; Sat, 24 Apr 2021 23:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbhDXV5D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Apr 2021 17:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231911AbhDXV5C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Apr 2021 17:57:02 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162CBC061574;
        Sat, 24 Apr 2021 14:56:22 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id s22so16497844pgk.6;
        Sat, 24 Apr 2021 14:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7btaIOfsoPEdYOBosrv9eDASHGVgDcN6WbpmphUXOvk=;
        b=k89O1Qz8tYZgqoSxfukBAp9c/NFk/UPy4AAwdCny6AoQuAPxFnRgrhWa1wwnFMT+gi
         Ciu09uR4jh8Srr76faLqtCPJRwSGGK18MOd+kEOBKGec56B17BmbuXrVJcLL13tXICxO
         eW5cZ+yFXWS20LeZqlw8nnCCv3m4PUDK2P+IxrWrIRhu48QoVOJIYiFwHWkmUXQtkhEQ
         CXxmA8Zms1UeEWimZLjMJX2LdYsIpNL90+Ay+DUvhO8LJeVVwqSfQkG3AGbASBvWphwf
         B5SkemqmTyiikvuQKsGnE9eHt3c6/bz+kePG/52BdUoDnPknQZSeyCLmBsNyxBEKofc6
         DJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7btaIOfsoPEdYOBosrv9eDASHGVgDcN6WbpmphUXOvk=;
        b=gBzhraixmbfWLIkpbgPA3K1cPwrOZCsUA7LdNkfbC2ueHcA/533Mul9lBa6qRgdeRS
         FV9n6PctX4/31xs9H991FPeI5nYZVqFbWEYFYT6Bas9TzD8MCUfzQG/dvG7YeLk3OkRG
         2+J1znPx1nLrvaqegxDAdBUaFsj5e6zIHgNVst7vWnul+YUdjCnH236FjnDAlzVF3h4r
         Y8ZsAOTgNWoKk8bLZvU2N38ERhCxKX9P1h3myrLqu4pujPsP4jixjNOkK8tJreacCGw0
         g2Lr75i+aRPVP35w11fGIJ/qH2vR1jtYUppss1rVOtHMsGcUlhv1UId0n2sVB8QZDCTY
         7BKg==
X-Gm-Message-State: AOAM5317WQgO2OkNl4Y0vuuTnxgDALP9hF4xoQIC5ce5123xFODUDAwD
        Z+iJY4JP8ZDSHR1Rbap9Ewk=
X-Google-Smtp-Source: ABdhPJzaztiKjaedfsJROxFqa76sqKoHykv3QPvJFfr8Bwc0162J5nvaUlv7fniMC4Bhlw4RAxTDmw==
X-Received: by 2002:aa7:9108:0:b029:251:7caf:cec with SMTP id 8-20020aa791080000b02902517caf0cecmr10101138pfh.13.1619301380947;
        Sat, 24 Apr 2021 14:56:20 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id y10sm10344112pjt.22.2021.04.24.14.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 14:56:20 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] MIPS: kernel: proc: fix trivial style errors
Date:   Sat, 24 Apr 2021 14:56:16 -0700
Message-Id: <20210424215618.1017539-2-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210424215618.1017539-1-ilya.lipnitskiy@gmail.com>
References: <20210424215618.1017539-1-ilya.lipnitskiy@gmail.com>
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

