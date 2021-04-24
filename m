Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1900F36A34E
	for <lists+linux-mips@lfdr.de>; Sat, 24 Apr 2021 23:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbhDXV5D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Apr 2021 17:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbhDXV5B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Apr 2021 17:57:01 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 287DBC06174A;
        Sat, 24 Apr 2021 14:56:23 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id t2-20020a17090a0242b0290155433387beso635115pje.1;
        Sat, 24 Apr 2021 14:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WASe9IVleNHoTuHFQ06QLc47F6dKlHkPAdLHZHPpp8Q=;
        b=czdEG4fxVfbcXV9VYQk/P6QpBcClaEJOzJbtSiNBYGkITxVKPNg2r5qhsr8kMKPZ1m
         QMOYQWWw0BjcLpciPcILmC7ntoGqBVd15I58CEJ0MjmjPERyWaIIKzVbFYZBkzL7Vf57
         ySOWsOiNoPR4kRtLefYuh9r2ddqTiH16iwM5nQgau0ulnDxrZwM9Ng5alHKx805AIkOJ
         8vIh0/A2VXFMfR+nTuIfLv6/UExTtFTGT6uw1Al/dbVmeFMDDNit9NMtYJZq9GOjwcs3
         2333DuvIi5UlTDNtLrNRUpVFTyyd/e/L9zr7CQ4DzZdlS9sCAVGK2CTdSv5efKQoBdRN
         xwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WASe9IVleNHoTuHFQ06QLc47F6dKlHkPAdLHZHPpp8Q=;
        b=lNg1is/fnoRmZBjH7pXcHgEoQwikPv85xk71rKtWf8nwhmcQdRNqVaUJxyW4HTRuGY
         UNnMonUDFmjaVcQk/l/zwiVcHq9IULSWwwDSfzCCwwGR41iZPa51UkFTylvsV80S3swd
         9EW5xlLgFvibmlYmd5jmkkySP/BOKpq8rJ47Mzj5XW5uMZ9a16WKuffSCHhnSZ1av5NZ
         /ruxcE/TX5SrQA9F25jJ88mu5Uts1o+3nmYoYz6AAf8v0ByCz3dYW8Y/8Zdzki8f10wc
         YZyPqpspcLQ2KOM4Vmc3mxN5Fsq1f6tKaBmx5dRxuJTjsSjdh1ozfQ3ven51FuF2Hoj3
         sAMA==
X-Gm-Message-State: AOAM533bRaiEGOX/j4fxMMrHm91r2VNuSr9mniAUDu2e4nXKJ+K2e6QM
        ht3FCTU8tj2s5S8TMh7j7GI=
X-Google-Smtp-Source: ABdhPJz6N34z4BSFzGkeC8GCbPxLl/aMnYPwY2g7QVk/ndudPVjuDXJMCLhYFt6qxPXc5oG0rfTbVw==
X-Received: by 2002:a17:90a:94ca:: with SMTP id j10mr11847301pjw.126.1619301382745;
        Sat, 24 Apr 2021 14:56:22 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id y10sm10344112pjt.22.2021.04.24.14.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 14:56:22 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] MIPS: kernel: proc: add CPU option reporting
Date:   Sat, 24 Apr 2021 14:56:18 -0700
Message-Id: <20210424215618.1017539-4-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210424215618.1017539-1-ilya.lipnitskiy@gmail.com>
References: <20210424215618.1017539-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Hauke Mehrtens <hauke@hauke-m.de>

Many MIPS CPUs have optional CPU features which are not activated for
all CPU cores. Print the CPU options, which are implemented in the core,
in /proc/cpuinfo. This makes it possible to see which features are
supported and which are not supported. This should cover all standard
MIPS extensions. Before, it only printed information about the main MIPS
ASEs.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Changes from original patch[0]:
- Remove cpu_has_6k_cache and cpu_has_8k_cache due to commit 6ce91ba8589a
  ("MIPS: Remove cpu_has_6k_cache and cpu_has_8k_cache in cpu_cache_init()")
- Add new options: mac2008_only, ftlbparex, gsexcex, mmid, mm_sysad,
  mm_full
- Use seq_puts instead of seq_printf as suggested by checkpatch
- Minor commit message reword

[0]: https://lore.kernel.org/linux-mips/20181223225224.23042-1-hauke@hauke-m.de/
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/kernel/proc.c | 122 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 7d8481d9acc3..376a6e2676e9 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -157,6 +157,128 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_printf(m, "micromips kernel\t: %s\n",
 		      (read_c0_config3() & MIPS_CONF3_ISA_OE) ?  "yes" : "no");
 	}
+
+	seq_puts(m, "Options implemented\t:");
+	if (cpu_has_tlb)
+		seq_puts(m, " tlb");
+	if (cpu_has_ftlb)
+		seq_puts(m, " ftlb");
+	if (cpu_has_tlbinv)
+		seq_puts(m, " tlbinv");
+	if (cpu_has_segments)
+		seq_puts(m, " segments");
+	if (cpu_has_rixiex)
+		seq_puts(m, " rixiex");
+	if (cpu_has_ldpte)
+		seq_puts(m, " ldpte");
+	if (cpu_has_maar)
+		seq_puts(m, " maar");
+	if (cpu_has_rw_llb)
+		seq_puts(m, " rw_llb");
+	if (cpu_has_4kex)
+		seq_puts(m, " 4kex");
+	if (cpu_has_3k_cache)
+		seq_puts(m, " 3k_cache");
+	if (cpu_has_4k_cache)
+		seq_puts(m, " 4k_cache");
+	if (cpu_has_tx39_cache)
+		seq_puts(m, " tx39_cache");
+	if (cpu_has_octeon_cache)
+		seq_puts(m, " octeon_cache");
+	if (cpu_has_fpu)
+		seq_puts(m, " fpu");
+	if (cpu_has_32fpr)
+		seq_puts(m, " 32fpr");
+	if (cpu_has_cache_cdex_p)
+		seq_puts(m, " cache_cdex_p");
+	if (cpu_has_cache_cdex_s)
+		seq_puts(m, " cache_cdex_s");
+	if (cpu_has_prefetch)
+		seq_puts(m, " prefetch");
+	if (cpu_has_mcheck)
+		seq_puts(m, " mcheck");
+	if (cpu_has_ejtag)
+		seq_puts(m, " ejtag");
+	if (cpu_has_llsc)
+		seq_puts(m, " llsc");
+	if (cpu_has_guestctl0ext)
+		seq_puts(m, " guestctl0ext");
+	if (cpu_has_guestctl1)
+		seq_puts(m, " guestctl1");
+	if (cpu_has_guestctl2)
+		seq_puts(m, " guestctl2");
+	if (cpu_has_guestid)
+		seq_puts(m, " guestid");
+	if (cpu_has_drg)
+		seq_puts(m, " drg");
+	if (cpu_has_rixi)
+		seq_puts(m, " rixi");
+	if (cpu_has_lpa)
+		seq_puts(m, " lpa");
+	if (cpu_has_mvh)
+		seq_puts(m, " mvh");
+	if (cpu_has_vtag_icache)
+		seq_puts(m, " vtag_icache");
+	if (cpu_has_dc_aliases)
+		seq_puts(m, " dc_aliases");
+	if (cpu_has_ic_fills_f_dc)
+		seq_puts(m, " ic_fills_f_dc");
+	if (cpu_has_pindexed_dcache)
+		seq_puts(m, " pindexed_dcache");
+	if (cpu_has_userlocal)
+		seq_puts(m, " userlocal");
+	if (cpu_has_nofpuex)
+		seq_puts(m, " nofpuex");
+	if (cpu_has_vint)
+		seq_puts(m, " vint");
+	if (cpu_has_veic)
+		seq_puts(m, " veic");
+	if (cpu_has_inclusive_pcaches)
+		seq_puts(m, " inclusive_pcaches");
+	if (cpu_has_perf_cntr_intr_bit)
+		seq_puts(m, " perf_cntr_intr_bit");
+	if (cpu_has_ufr)
+		seq_puts(m, " ufr");
+	if (cpu_has_fre)
+		seq_puts(m, " fre");
+	if (cpu_has_cdmm)
+		seq_puts(m, " cdmm");
+	if (cpu_has_small_pages)
+		seq_puts(m, " small_pages");
+	if (cpu_has_nan_legacy)
+		seq_puts(m, " nan_legacy");
+	if (cpu_has_nan_2008)
+		seq_puts(m, " nan_2008");
+	if (cpu_has_ebase_wg)
+		seq_puts(m, " ebase_wg");
+	if (cpu_has_badinstr)
+		seq_puts(m, " badinstr");
+	if (cpu_has_badinstrp)
+		seq_puts(m, " badinstrp");
+	if (cpu_has_contextconfig)
+		seq_puts(m, " contextconfig");
+	if (cpu_has_perf)
+		seq_puts(m, " perf");
+	if (cpu_has_mac2008_only)
+		seq_puts(m, " mac2008_only");
+	if (cpu_has_ftlbparex)
+		seq_puts(m, " ftlbparex");
+	if (cpu_has_gsexcex)
+		seq_puts(m, " gsexcex");
+	if (cpu_has_shared_ftlb_ram)
+		seq_puts(m, " shared_ftlb_ram");
+	if (cpu_has_shared_ftlb_entries)
+		seq_puts(m, " shared_ftlb_entries");
+	if (cpu_has_mipsmt_pertccounters)
+		seq_puts(m, " mipsmt_pertccounters");
+	if (cpu_has_mmid)
+		seq_puts(m, " mmid");
+	if (cpu_has_mm_sysad)
+		seq_puts(m, " mm_sysad");
+	if (cpu_has_mm_full)
+		seq_puts(m, " mm_full");
+	seq_puts(m, "\n");
+
 	seq_printf(m, "shadow register sets\t: %d\n",
 		      cpu_data[n].srsets);
 	seq_printf(m, "kscratch registers\t: %d\n",
-- 
2.31.1

