Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70E236A309
	for <lists+linux-mips@lfdr.de>; Sat, 24 Apr 2021 22:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237218AbhDXUwa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Apr 2021 16:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236079AbhDXUw3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Apr 2021 16:52:29 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20D9C061574;
        Sat, 24 Apr 2021 13:51:50 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id j7so28134512pgi.3;
        Sat, 24 Apr 2021 13:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZjW3M6GLV1esZzWWKH0UBe7Iv/tLpQnyLXXfX6pBaeQ=;
        b=GANoyKYGpQBVWqhsqKSNkMP9vwmWirODAIy5Up7Gh1Fxm1xmd43k5zJutwEWOJVzoN
         7Sfj9kTSn/QOjybu4mwoFohW/OEQMj+cu/CEnEmMt5ZDV/LEwWJxl/ziKgZmHT6Ai/Ho
         3egoPWszrhrZS6oByqeUinyMIcHOZKac3nhPaIZYobPV6l86hprVQZcE5HVb76d3yK2A
         87acaKn8M1cwW9+32p4V+dG1AVVrz34xVP7TLJKydFmLPyu0hXX05OWtaweWewIY932L
         QCkQO4gXBa0iiIxlIQakpXBMtUx0H7HKzAfZpUDMnqK3tmByISm/bXixFzBBSSLEofQg
         rgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZjW3M6GLV1esZzWWKH0UBe7Iv/tLpQnyLXXfX6pBaeQ=;
        b=IV/pRqbiSGgE8g02HBQcz5WuQkOeACuD66YlMaZf0UYW61cNpKW0t9wumGnMg20tFx
         YoLklXtT5CYeiXRlpjoc7yodxQBffv5tahMUTosXLlm2lVJ35dW379KhGZxhsEW5srQ8
         06OQpWWzu5uSyahiQ3sz6zMEWoldMNE6UCBCIGesOjWLkj073vXkQ1PxdCuDEv4PEZ+k
         joSIWT2QL1liECINQo/20kC3Kli5BJim1oi85b8EVvdsgJJLFhu9552ZKlcc+uOeLiUc
         GWhql7i+oFz4VIZ5XJp0rOkWWsiwvPiFO8q05PA+u8+a30Zbh3nNSjYk3mrA0C7jV9z0
         dTcA==
X-Gm-Message-State: AOAM532L1lMbJni/DI9RNJHXGPvKHs+nT40arvwP+eL+apc7pPiGyuEc
        er5RuBvrS9Xq6dHnA+8aeKQ=
X-Google-Smtp-Source: ABdhPJz3GNNWW729K4FibpwsnpzftBvaCQ5+kCIczvA5UZ+rbRmWzS9uAUquHzpgTsadbFkBkcy59g==
X-Received: by 2002:a63:4f50:: with SMTP id p16mr9904107pgl.40.1619297510379;
        Sat, 24 Apr 2021 13:51:50 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id w9sm7584489pfn.213.2021.04.24.13.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 13:51:49 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] MIPS: kernel: proc: add CPU option reporting
Date:   Sat, 24 Apr 2021 13:51:27 -0700
Message-Id: <20210424205127.396630-4-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210424205127.396630-1-ilya.lipnitskiy@gmail.com>
References: <20210424205127.396630-1-ilya.lipnitskiy@gmail.com>
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
- Use seq_puts instead of seq_printf as suggested by checkpatch.
- Minor commit message reword

[0]: https://lore.kernel.org/linux-mips/20181223225224.23042-1-hauke@hauke-m.de/
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/kernel/proc.c | 110 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 7d8481d9acc3..68ad09cc6516 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -157,6 +157,116 @@ static int show_cpuinfo(struct seq_file *m, void *v)
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
+	if (cpu_has_shared_ftlb_ram)
+		seq_puts(m, " shared_ftlb_ram");
+	if (cpu_has_shared_ftlb_entries)
+		seq_puts(m, " shared_ftlb_entries");
+	if (cpu_has_mipsmt_pertccounters)
+		seq_puts(m, " mipsmt_pertccounters");
+	seq_puts(m, "\n");
+
 	seq_printf(m, "shadow register sets\t: %d\n",
 		      cpu_data[n].srsets);
 	seq_printf(m, "kscratch registers\t: %d\n",
-- 
2.31.1

