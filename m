Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24A936A34D
	for <lists+linux-mips@lfdr.de>; Sat, 24 Apr 2021 23:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbhDXV5B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Apr 2021 17:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbhDXV5A (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Apr 2021 17:57:00 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4224DC06174A;
        Sat, 24 Apr 2021 14:56:22 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id nk8so11721005pjb.3;
        Sat, 24 Apr 2021 14:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tZ6MnjBW//QPNmlqP0nmZIAzxWK0w5bhWYAOyoIZMEc=;
        b=MUsxhYk6DwW6a6JPgFHWAxTWHPwsyaSX+eMnKWq3EdLipWICVImSdNGMuTcHpDqdsB
         T2609PT7Agynn7KrS85YsNYJazUJgF/WjqST+xcQN1wi+t/ERD1au+lrpN3s0lZQe51o
         JZBYMEVQbZLYqtBvZRBv4epg3cF/XjW2mUA+Vxzi7IEZIbED7DqP2uUFpz2RcC13tTW8
         cRca9JDcJbh6wtfIjkTMI6oHGAEyVffqMV3VxePVFtG21TduX9E0FGK3P/mJVb8PftLC
         FICpGYYhN3LLuygkUMM42vRexgfKVvqXDnCiBhE4gsPg1XgCxfQssXjitnezSBm0/Y9D
         m6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tZ6MnjBW//QPNmlqP0nmZIAzxWK0w5bhWYAOyoIZMEc=;
        b=NwBglB2tpRpqNxcgWufkXAUnSZXgJosdIfgUqU8/mCBFjxk/IKuhH+EZufwf5EsgEt
         8sGaQw1YBmOWYfpZV3/TU3plT/Ale6NhlTicM4Oy6DmU7cfMTP9hL87l07tvgsYVOBv+
         BTCMwgModpsq2CMyswhzuYhxQB1sw7j+XxQxPHX+dzQlQPzV7yrFFqTQAIWjMfz2geeZ
         JMmT9aJJjoKtunRMTx+k7c9BH4QNkGILoCAHBXeb/zDJTtMXAjiV+2h+kfCVp7dYdQ6d
         BBaZ5oMbyTuyQn7xrr0Rq7yfcztcCHpikyV53T+81BjBHMMqS28IUsJ/vk5+n4SkivCm
         Esgw==
X-Gm-Message-State: AOAM533rAALEeS/HXmznk5AHRmUihAImCdttXYT3kYw6eW8sl9RVuGql
        xD+IZgRhu45jwcdyLacGd4VnbfhJ1l2VoB/D
X-Google-Smtp-Source: ABdhPJwc8XP++ge9XQYepHmyNIRplC3VAHtuaEl7hnbtVUjmQeSquBS5+ncrHCdaVksf0L/rypJTjw==
X-Received: by 2002:a17:90a:6582:: with SMTP id k2mr13113858pjj.11.1619301381840;
        Sat, 24 Apr 2021 14:56:21 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id y10sm10344112pjt.22.2021.04.24.14.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 14:56:21 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] MIPS: kernel: proc: use seq_puts instead of seq_printf
Date:   Sat, 24 Apr 2021 14:56:17 -0700
Message-Id: <20210424215618.1017539-3-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210424215618.1017539-1-ilya.lipnitskiy@gmail.com>
References: <20210424215618.1017539-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix checkpatch WARNING: Prefer seq_puts to seq_printf

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/kernel/proc.c | 76 ++++++++++++++++++++---------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 053847c0d4cd..7d8481d9acc3 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -80,78 +80,78 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		for (i = 0; i < cpu_data[n].watch_reg_count; i++)
 			seq_printf(m, "%s0x%04x", i ? ", " : "",
 				cpu_data[n].watch_reg_masks[i]);
-		seq_printf(m, "]\n");
+		seq_puts(m, "]\n");
 	}
 
-	seq_printf(m, "isa\t\t\t:");
+	seq_puts(m, "isa\t\t\t:");
 	if (cpu_has_mips_1)
-		seq_printf(m, " mips1");
+		seq_puts(m, " mips1");
 	if (cpu_has_mips_2)
-		seq_printf(m, "%s", " mips2");
+		seq_puts(m, " mips2");
 	if (cpu_has_mips_3)
-		seq_printf(m, "%s", " mips3");
+		seq_puts(m, " mips3");
 	if (cpu_has_mips_4)
-		seq_printf(m, "%s", " mips4");
+		seq_puts(m, " mips4");
 	if (cpu_has_mips_5)
-		seq_printf(m, "%s", " mips5");
+		seq_puts(m, " mips5");
 	if (cpu_has_mips32r1)
-		seq_printf(m, "%s", " mips32r1");
+		seq_puts(m, " mips32r1");
 	if (cpu_has_mips32r2)
-		seq_printf(m, "%s", " mips32r2");
+		seq_puts(m, " mips32r2");
 	if (cpu_has_mips32r5)
-		seq_printf(m, "%s", " mips32r5");
+		seq_puts(m, " mips32r5");
 	if (cpu_has_mips32r6)
-		seq_printf(m, "%s", " mips32r6");
+		seq_puts(m, " mips32r6");
 	if (cpu_has_mips64r1)
-		seq_printf(m, "%s", " mips64r1");
+		seq_puts(m, " mips64r1");
 	if (cpu_has_mips64r2)
-		seq_printf(m, "%s", " mips64r2");
+		seq_puts(m, " mips64r2");
 	if (cpu_has_mips64r5)
-		seq_printf(m, "%s", " mips64r5");
+		seq_puts(m, " mips64r5");
 	if (cpu_has_mips64r6)
-		seq_printf(m, "%s", " mips64r6");
-	seq_printf(m, "\n");
+		seq_puts(m, " mips64r6");
+	seq_puts(m, "\n");
 
-	seq_printf(m, "ASEs implemented\t:");
+	seq_puts(m, "ASEs implemented\t:");
 	if (cpu_has_mips16)
-		seq_printf(m, "%s", " mips16");
+		seq_puts(m, " mips16");
 	if (cpu_has_mips16e2)
-		seq_printf(m, "%s", " mips16e2");
+		seq_puts(m, " mips16e2");
 	if (cpu_has_mdmx)
-		seq_printf(m, "%s", " mdmx");
+		seq_puts(m, " mdmx");
 	if (cpu_has_mips3d)
-		seq_printf(m, "%s", " mips3d");
+		seq_puts(m, " mips3d");
 	if (cpu_has_smartmips)
-		seq_printf(m, "%s", " smartmips");
+		seq_puts(m, " smartmips");
 	if (cpu_has_dsp)
-		seq_printf(m, "%s", " dsp");
+		seq_puts(m, " dsp");
 	if (cpu_has_dsp2)
-		seq_printf(m, "%s", " dsp2");
+		seq_puts(m, " dsp2");
 	if (cpu_has_dsp3)
-		seq_printf(m, "%s", " dsp3");
+		seq_puts(m, " dsp3");
 	if (cpu_has_mipsmt)
-		seq_printf(m, "%s", " mt");
+		seq_puts(m, " mt");
 	if (cpu_has_mmips)
-		seq_printf(m, "%s", " micromips");
+		seq_puts(m, " micromips");
 	if (cpu_has_vz)
-		seq_printf(m, "%s", " vz");
+		seq_puts(m, " vz");
 	if (cpu_has_msa)
-		seq_printf(m, "%s", " msa");
+		seq_puts(m, " msa");
 	if (cpu_has_eva)
-		seq_printf(m, "%s", " eva");
+		seq_puts(m, " eva");
 	if (cpu_has_htw)
-		seq_printf(m, "%s", " htw");
+		seq_puts(m, " htw");
 	if (cpu_has_xpa)
-		seq_printf(m, "%s", " xpa");
+		seq_puts(m, " xpa");
 	if (cpu_has_loongson_mmi)
-		seq_printf(m, "%s", " loongson-mmi");
+		seq_puts(m, " loongson-mmi");
 	if (cpu_has_loongson_cam)
-		seq_printf(m, "%s", " loongson-cam");
+		seq_puts(m, " loongson-cam");
 	if (cpu_has_loongson_ext)
-		seq_printf(m, "%s", " loongson-ext");
+		seq_puts(m, " loongson-ext");
 	if (cpu_has_loongson_ext2)
-		seq_printf(m, "%s", " loongson-ext2");
-	seq_printf(m, "\n");
+		seq_puts(m, " loongson-ext2");
+	seq_puts(m, "\n");
 
 	if (cpu_has_mmips) {
 		seq_printf(m, "micromips kernel\t: %s\n",
@@ -182,7 +182,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	raw_notifier_call_chain(&proc_cpuinfo_chain, 0,
 				&proc_cpuinfo_notifier_args);
 
-	seq_printf(m, "\n");
+	seq_puts(m, "\n");
 
 	return 0;
 }
-- 
2.31.1

