Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B8742D1E3
	for <lists+linux-mips@lfdr.de>; Thu, 14 Oct 2021 07:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbhJNFmb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Oct 2021 01:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbhJNFma (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Oct 2021 01:42:30 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917C0C061570;
        Wed, 13 Oct 2021 22:40:26 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id na16-20020a17090b4c1000b0019f5bb661f9so4005790pjb.0;
        Wed, 13 Oct 2021 22:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JrL+FNc3+RxCWmT97CU54lI2MPsiUcOLy1VZMHpHKr4=;
        b=AJfBdhPMo5ez+gkYbywNk+TfQM3iHDv4mJ161RoI1nADOZAN+N+44AridU9MoApVwO
         dRPDoT+5FQEXNTu28ETkrPHNibH3k9pn9gsENmnlY6fnBkrcgjSuYO2kFXCb9CbwnoEa
         hUeDz30L9OsESpsh2bho89br/Ww+dx2RPuVYKULf+MhOaLbGsHvvmzcAJ0V1T9fJDZ4i
         trHLpiNR49zi/6H6UeUSYBkpARaMwCkmOeteEqKRMj4r6zFsCH9Ji/eBB+zQRuOAE6w/
         ooIPrT0cJ9BOOxtCDA3rzMSrDgki/QiCKaBcLOBq3WBLoRW94v/LSspq06fD80QjXiaq
         8IFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JrL+FNc3+RxCWmT97CU54lI2MPsiUcOLy1VZMHpHKr4=;
        b=bexgdMnQYh2Sxcb0X0zYX7+2pG1oxqBmoeQ8w2dtcYEyquhHP6F9eXwTOFHF8CLC+W
         4PVhnGnp25/Fd/MllX/nyIeB0v7eeUF8Mm0Bvn5WjpKowUAnUObXtLoyxsICrBiQwghW
         HiWG5O/EJ63x5d4FyEx/BCEFvchtetd/yfU7+JzUl9awbkmhQCIRWhsY0mzSIEC6p4g4
         TOa0NxR9xh8FqIBTb68fKIjh6m8hsyAA/BtWDPlVoljLCBqTvOSwqSGySH7G8BAuVyBS
         QgJcy1pPwJtusX5IXW/SC5WoBJ8cUS5DJqVoeIlWTXTgAI3yB381i8V6JrO0Z1CyYF18
         wdgA==
X-Gm-Message-State: AOAM531JUPx9z+4O4aW08GUEGbd97oy3k5PyjXG1PfQfh7KPw2t1A8x3
        RnXu7mgl0bP+I66pwD6iYQM=
X-Google-Smtp-Source: ABdhPJy+9UrX9TQ0wF37RB60bWf3OMLIVKdSS1pJjlFUIF9WkX1v8wQwgmaBF08FPq/Wn1D82YLstw==
X-Received: by 2002:a17:903:244c:b0:13e:c46e:a353 with SMTP id l12-20020a170903244c00b0013ec46ea353mr3274212pls.10.1634190025908;
        Wed, 13 Oct 2021 22:40:25 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7360:b000::9d4])
        by smtp.gmail.com with ESMTPSA id mu7sm1257318pjb.12.2021.10.13.22.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 22:40:25 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH v3 1/3] MIPS: kernel: proc: fix trivial style errors
Date:   Wed, 13 Oct 2021 22:40:16 -0700
Message-Id: <20211014054018.6179-2-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211014054018.6179-1-ilya.lipnitskiy@gmail.com>
References: <20211014054018.6179-1-ilya.lipnitskiy@gmail.com>
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
2.33.0

