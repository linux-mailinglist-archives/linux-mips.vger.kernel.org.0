Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D7B42D1E4
	for <lists+linux-mips@lfdr.de>; Thu, 14 Oct 2021 07:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhJNFmc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Oct 2021 01:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhJNFmc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Oct 2021 01:42:32 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D6BC061570;
        Wed, 13 Oct 2021 22:40:28 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id y4so3408457plb.0;
        Wed, 13 Oct 2021 22:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tRybA6aId5iNq0MGMlrDWo3uq4MpQvC3KSkwvufnPuA=;
        b=iWYWA1G4CfrruYeVMT5I0p1wjUfVSk1afoiq4TyC2nTS+VlycdSR8QDhvARtnkCVbt
         tGgtjtcVDvrLn6WmSUxDbd+k61uJK8kgjI6QPNiWgG/MAnrOwgPdrFBDSGrWfSZipRKu
         PyNLQsmfQ4hQTs8YJDFQl5qV+8cQejM7dUa7nhM75iYf116PxHaRrxR6wWNXHERK8hK0
         8gW59vKtoqwjvXfVJxNsNLwW2Mp6UkzL8T7J/aFuSOBof5i3ugDmVpFpCkzHv8TN7g+u
         rQLGI2Cz902pQB/D9yenoBcFKVmunwM8fpiyIIhBBe3TX/gJ4CXmKinnDO/bYQthEnW2
         vlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tRybA6aId5iNq0MGMlrDWo3uq4MpQvC3KSkwvufnPuA=;
        b=DExRmpjGiq5yy0SH31FB/l4ymtACHscjJrQ1r/klLXpkZbNm4gcxvSDXpKrIBFtRi9
         pEPJ6jcCA/SoMo/Ho+3BjWTbOIWz+Nq/Ip+72I60gW62NhJC1hV3oJFwopOd9Wm01IEh
         /U0hNuHV4a1Bhp813DaEgkJsNaVdtb+tbVv3ZpFJhUCyRSriLttrUNNZ46hAwELfevtg
         wamNlnfIoKLkXMnHL4u+3B8mFt8KtGGvxHzwjcVjYQo21t60vprvO7Du8WJZLMl9pjT5
         Q0z8S+svW3bzgW61fzbet4TU4JPle46zOZuVGAcmzPRjHrUQ0JFo5TkcT/hefeBgTz/z
         fPgg==
X-Gm-Message-State: AOAM533v48yKDnBYXBvuAeHPcoyu3MVbTbPXxsw/d/fHjT84KyQVhvlY
        vKo5htQYbE423tZusJKZS36QXhxuCYg=
X-Google-Smtp-Source: ABdhPJwqBSUQ12Is4GplflwpUZc2rkDb8BsDPwJbI8qLmhzE5SFC2GIc1tb8+L354f8bH0Qz2s0+Ug==
X-Received: by 2002:a17:90a:51:: with SMTP id 17mr4038189pjb.185.1634190027483;
        Wed, 13 Oct 2021 22:40:27 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7360:b000::9d4])
        by smtp.gmail.com with ESMTPSA id mu7sm1257318pjb.12.2021.10.13.22.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 22:40:27 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH v3 2/3] MIPS: kernel: proc: use seq_puts instead of seq_printf
Date:   Wed, 13 Oct 2021 22:40:17 -0700
Message-Id: <20211014054018.6179-3-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211014054018.6179-1-ilya.lipnitskiy@gmail.com>
References: <20211014054018.6179-1-ilya.lipnitskiy@gmail.com>
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
2.33.0

