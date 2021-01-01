Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF772E8361
	for <lists+linux-mips@lfdr.de>; Fri,  1 Jan 2021 10:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbhAAJeP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Jan 2021 04:34:15 -0500
Received: from mail-m975.mail.163.com ([123.126.97.5]:56388 "EHLO
        mail-m975.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbhAAJeO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Jan 2021 04:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=v0AeG
        o774EIjO30V0ZTxETZer7ppinFfBDjBCAy5nKo=; b=cXSev2iCJHzpAuoIbsho5
        pks/WkIccGkdIKR1ZhnT8zYXNUTWwz7uSux/daVbWr1nhfdqT7SDGbY1DP30MXlf
        1MejQfwsHMKxqWpnlWyxW5Wfn5QBCrUfZCG0xAE2hfIgh8DHPwFMpruBKgC0l6Dl
        zACzFDWLLkBiNxWb8xJI1g=
Received: from JiadeiMac-Pro.lan (unknown [112.64.60.201])
        by smtp5 (Coremail) with SMTP id HdxpCgCHzRES7O5fl9DgAg--.23S2;
        Fri, 01 Jan 2021 17:32:11 +0800 (CST)
From:   jiaqingtong97@163.com
To:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jia Qingtong <jiaqingtong97@163.com>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: perf: Add support for OCTEON III perf events.
Date:   Fri,  1 Jan 2021 17:32:00 +0800
Message-Id: <20210101093201.9201-1-jiaqingtong97@163.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HdxpCgCHzRES7O5fl9DgAg--.23S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cry5KFy3XFW3XFWDKF45KFg_yoW8ZFW5pr
        4DCFn0vr48tr9Iqay3Ja1qg345Jr92q39FgrW3tw4xXw45ur93XFW3tFnxCrn8ArW0yF9x
        K34jgr47GryUAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jinY7UUUUU=
X-Originating-IP: [112.64.60.201]
X-CM-SenderInfo: 5mld1xpqjw00rjzxqiywtou0bp/xtbBohwNb1aD+Rnn5QAAsr
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jia Qingtong <jiaqingtong97@163.com>

According to Hardware Reference Manual, OCTEON III
are mostly same as previous OCTEON models. So just
enable them and extend supported event code.
0x3e and 0x3f still reserved.

Signed-off-by: Jia Qingtong <jiaqingtong97@163.com>
---
 arch/mips/kernel/perf_event_mipsxx.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 011eb6bbf81a..22e22c2de1c9 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -1919,19 +1919,22 @@ static const struct mips_perf_event *mipsxx_pmu_map_raw_event(u64 config)
 
 static const struct mips_perf_event *octeon_pmu_map_raw_event(u64 config)
 {
-	unsigned int raw_id = config & 0xff;
-	unsigned int base_id = raw_id & 0x7f;
+	unsigned int base_id = config & 0x7f;
+	unsigned int event_max;
 
 
 	raw_event.cntr_mask = CNTR_ALL;
 	raw_event.event_id = base_id;
 
-	if (current_cpu_type() == CPU_CAVIUM_OCTEON2) {
-		if (base_id > 0x42)
-			return ERR_PTR(-EOPNOTSUPP);
-	} else {
-		if (base_id > 0x3a)
-			return ERR_PTR(-EOPNOTSUPP);
+	if (current_cpu_type() == CPU_CAVIUM_OCTEON3)
+		event_max = 0x5f;
+	else if (current_cpu_type() == CPU_CAVIUM_OCTEON2)
+		event_max = 0x42;
+	else
+		event_max = 0x3a;
+
+	if (base_id > event_max) {
+		return ERR_PTR(-EOPNOTSUPP);
 	}
 
 	switch (base_id) {
@@ -1941,7 +1944,7 @@ static const struct mips_perf_event *octeon_pmu_map_raw_event(u64 config)
 	case 0x1f:
 	case 0x2f:
 	case 0x34:
-	case 0x3b ... 0x3f:
+	case 0x3e ... 0x3f:
 		return ERR_PTR(-EOPNOTSUPP);
 	default:
 		break;
@@ -2077,6 +2080,7 @@ init_hw_perf_events(void)
 	case CPU_CAVIUM_OCTEON:
 	case CPU_CAVIUM_OCTEON_PLUS:
 	case CPU_CAVIUM_OCTEON2:
+	case CPU_CAVIUM_OCTEON3:
 		mipspmu.name = "octeon";
 		mipspmu.general_event_map = &octeon_event_map;
 		mipspmu.cache_event_map = &octeon_cache_map;
-- 
2.28.0

