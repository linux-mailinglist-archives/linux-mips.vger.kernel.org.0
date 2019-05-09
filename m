Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6496519035
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2019 20:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfEISbO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 May 2019 14:31:14 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37713 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbfEISbN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 May 2019 14:31:13 -0400
Received: by mail-pl1-f193.google.com with SMTP id p15so1551182pll.4;
        Thu, 09 May 2019 11:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HY7QqQ+KmdhIvYZmzOKSEVw2UJ4Gq2EwakuHOnYtbiI=;
        b=rp8AADpk9oUNmzlxS94cQgGnte7s1XsOiRwhDqHH32hGZmFGi2OLkjbePvK8GPiHq+
         BfwhNCq12fW/kq0FDboIEAqr/maLhZpggH0//y/Tf13p1upuBt/IE0118CkVbx+faNni
         vZE1dQhBowAtSzC5TR23SrlN6w5/LFS/3jhvsVIgBk6hF/67xoF/yoRo7ujED+aatkjU
         P48b+WAnLwDysNXjnE6eablfJfr7HgKZoOLq/hugWiJg08FPJik++V5O6jdsGQOHQg7A
         6fnkFVeOx3VeZLVK8yW2d24ogh2GUK1yDwxo1j+xjPGmX5bwFiaYKk+Lr/xQI8/X81b/
         bszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HY7QqQ+KmdhIvYZmzOKSEVw2UJ4Gq2EwakuHOnYtbiI=;
        b=iARETYFVC4Xg9SRqS2InWdszZhGG/g/f6/ZdzEY3lpgply2ct1F5HdYNvH2XSbEzZW
         Lc/FF42zUauTkU2AdryZ7elcGetgbm/RQlqZch7WVbamGlCbHWKNJgs6vm8ZfJqfQJoi
         idRtPfzpP39/gjFaSckMgIwqpUMWHLalPkldUErqsGYKAA58o2bfmrjvseqNIKyaLY/u
         WE0BWWSoN14IiYDJ86JgVSJFC3uoYnMnY2EmvHDoQocdjHtOq1XeTjfOxz0jum0S0tM/
         uOVsQvwtiozIbGzVnQLcn1+b2mlut64vA6MQgQ5V/IjcRq/RoU82arsJmRrjhS8VieS1
         bZ6g==
X-Gm-Message-State: APjAAAXgw0WRi/Kknacp23zzoBZAi8yn9WOmVLN+VP77ERpBYnZpwsOP
        oUMFml0UyO85A3arvWk/+/c=
X-Google-Smtp-Source: APXvYqzY1MtJHt2pGMbNqOiIin0+nvanfBc2iIiVPVtsZnIR1xr6UKQ03jMZVcyD22S9ZOpXEDOmnQ==
X-Received: by 2002:a17:902:9343:: with SMTP id g3mr7176534plp.260.1557426672527;
        Thu, 09 May 2019 11:31:12 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.250])
        by smtp.gmail.com with ESMTPSA id v6sm3635090pgk.77.2019.05.09.11.31.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 11:31:11 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@linux-mips.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        linux-kernel@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM),
        linux-mips@vger.kernel.org (open list:MIPS)
Subject: [PATCH fixes v2] MIPS: perf: Fix build with CONFIG_CPU_BMIPS5000 enabled
Date:   Thu,  9 May 2019 11:30:47 -0700
Message-Id: <20190509183047.18408-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

arch/mips/kernel/perf_event_mipsxx.c: In function 'mipsxx_pmu_enable_event':
arch/mips/kernel/perf_event_mipsxx.c:326:21: error: unused variable 'event' [-Werror=unused-variable]
  struct perf_event *event = container_of(evt, struct perf_event, hw);
                     ^~~~~

Fix this by making use of IS_ENABLED() to simplify the code and avoid
unnecessary ifdefery.

Fixes: 84002c88599d ("MIPS: perf: Fix perf with MT counting other threads")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/kernel/perf_event_mipsxx.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 413863508f6f..d67fb64e908c 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -64,17 +64,11 @@ struct mips_perf_event {
 	#define CNTR_EVEN	0x55555555
 	#define CNTR_ODD	0xaaaaaaaa
 	#define CNTR_ALL	0xffffffff
-#ifdef CONFIG_MIPS_MT_SMP
 	enum {
 		T  = 0,
 		V  = 1,
 		P  = 2,
 	} range;
-#else
-	#define T
-	#define V
-	#define P
-#endif
 };
 
 static struct mips_perf_event raw_event;
@@ -325,9 +319,7 @@ static void mipsxx_pmu_enable_event(struct hw_perf_event *evt, int idx)
 {
 	struct perf_event *event = container_of(evt, struct perf_event, hw);
 	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
-#ifdef CONFIG_MIPS_MT_SMP
 	unsigned int range = evt->event_base >> 24;
-#endif /* CONFIG_MIPS_MT_SMP */
 
 	WARN_ON(idx < 0 || idx >= mipspmu.num_counters);
 
@@ -336,21 +328,15 @@ static void mipsxx_pmu_enable_event(struct hw_perf_event *evt, int idx)
 		/* Make sure interrupt enabled. */
 		MIPS_PERFCTRL_IE;
 
-#ifdef CONFIG_CPU_BMIPS5000
-	{
+	if (IS_ENABLED(CONFIG_CPU_BMIPS5000)) {
 		/* enable the counter for the calling thread */
 		cpuc->saved_ctrl[idx] |=
 			(1 << (12 + vpe_id())) | BRCM_PERFCTRL_TC;
-	}
-#else
-#ifdef CONFIG_MIPS_MT_SMP
-	if (range > V) {
+	} else if (IS_ENABLED(CONFIG_MIPS_MT_SMP) && range > V) {
 		/* The counter is processor wide. Set it up to count all TCs. */
 		pr_debug("Enabling perf counter for all TCs\n");
 		cpuc->saved_ctrl[idx] |= M_TC_EN_ALL;
-	} else
-#endif /* CONFIG_MIPS_MT_SMP */
-	{
+	} else {
 		unsigned int cpu, ctrl;
 
 		/*
@@ -365,7 +351,6 @@ static void mipsxx_pmu_enable_event(struct hw_perf_event *evt, int idx)
 		cpuc->saved_ctrl[idx] |= ctrl;
 		pr_debug("Enabling perf counter for CPU%d\n", cpu);
 	}
-#endif /* CONFIG_CPU_BMIPS5000 */
 	/*
 	 * We do not actually let the counter run. Leave it until start().
 	 */
-- 
2.17.1

