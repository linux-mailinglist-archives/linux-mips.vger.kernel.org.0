Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D05ED42D1E7
	for <lists+linux-mips@lfdr.de>; Thu, 14 Oct 2021 07:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhJNFmf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Oct 2021 01:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhJNFmd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Oct 2021 01:42:33 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35C2C061570;
        Wed, 13 Oct 2021 22:40:29 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id t11so3356527plq.11;
        Wed, 13 Oct 2021 22:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=26b6FMCylFMAHNcIhKc1n3VoY7qFK9eJmJZLWnz6s2s=;
        b=SjqOnWFqaU9bGUwBtffMnwVit5BgMw05zs4f0tDwYpgfeAFjUrN+ApyoDLDE6swfPs
         iS+kRui4EuW7tMOC6vz6jm9/OBq78JkJqfFBaw/4gbA+/F7zkPUV4SXOf1PALtHhtsUu
         37pn7DSJIHyQs0SuQBqVSxOYwVHQ+2RM7zhp3/f+CIckInBHNErxC1pyYKg53i2Vv5vD
         rsPZYNCUtKxqqPAy7bznM9758ge76xdfV+0vUf2KAvWpRiXQjsYjREcEQY7TJldMDi/6
         I6Mv/FxSQj4yZ+VZgeWboqtRsApyzsDj/OCQi5F67K1Tv1oBf8NcXkKnn1CSYQcbYXDl
         xuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=26b6FMCylFMAHNcIhKc1n3VoY7qFK9eJmJZLWnz6s2s=;
        b=IYFfvB3lEw7+IoPnI55sOp4U0ktndrnRd7J11kbqeOnhU4ALJgcCzuRtYk0icv2cBR
         xtV5nHUZm6aMZVceSgK3WbVj/PXs8swjCm3zY+80HlPsXS7PXQ5ls05UzjS7g1vevdVl
         eQuvFg3wz426fSWk3dl4wFqJmHIlsuZtouY77IGl1R88xOh4J2sQIYVeCDHt2HtG+kbA
         HNoOxUphSyiIZY2r+uua/jscOlZQ259VPirg2NToJxv/qe3b25K4JBXQBTVlRpZWKnbo
         7h9NPb/hmdoiqgREw9mNP+5t69DTxjyfwRwQZn/w3oVqjVrgGZdZxeipLbOE35cu/9Bn
         niMg==
X-Gm-Message-State: AOAM532YABkBN1BC20pCLhYe4OMJWzj7MFLVC2pKYCpxP7MlQHwC1n/5
        NQiCbFG3NCBqbrQqNUYQGgo=
X-Google-Smtp-Source: ABdhPJwzlmfipjFihxRwPrutD8CKSOXQ0wm4l6xlowx5jEArWpSTNB3nJMkchhLs5pQq2Wv8lpA7GQ==
X-Received: by 2002:a17:902:b691:b029:12d:2b6:d116 with SMTP id c17-20020a170902b691b029012d02b6d116mr3124863pls.71.1634190029137;
        Wed, 13 Oct 2021 22:40:29 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7360:b000::9d4])
        by smtp.gmail.com with ESMTPSA id mu7sm1257318pjb.12.2021.10.13.22.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 22:40:28 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH v3 3/3] MIPS: kernel: proc: add CPU option reporting
Date:   Wed, 13 Oct 2021 22:40:18 -0700
Message-Id: <20211014054018.6179-4-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211014054018.6179-1-ilya.lipnitskiy@gmail.com>
References: <20211014054018.6179-1-ilya.lipnitskiy@gmail.com>
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
Acked-by: Hauke Mehrtens <hauke@hauke-m.de>
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
2.33.0

