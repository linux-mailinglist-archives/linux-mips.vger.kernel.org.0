Return-Path: <linux-mips+bounces-6674-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA26A9BD394
	for <lists+linux-mips@lfdr.de>; Tue,  5 Nov 2024 18:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B1EC1F234DB
	for <lists+linux-mips@lfdr.de>; Tue,  5 Nov 2024 17:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6335B1E285D;
	Tue,  5 Nov 2024 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NCcSwXi9"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3458B57333
	for <linux-mips@vger.kernel.org>; Tue,  5 Nov 2024 17:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828365; cv=none; b=EGUWowN7yyyZWbwAbRteHJS+tgBqoiinIH4MEDqkCT5ox1/pr/LI+tpON8ympMq7wUYxIKYQdAZplGscKOM1XylpsjfKkPRcelZ2ZThoQCvXRln6ugFKxRaaCrvPBp39MXWRwvodb9+GmnqO15F3lcaAXJvxk2jZ6wbINomm68s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828365; c=relaxed/simple;
	bh=Ih5/45PICVTZNOUnCnrztsfUYpIArwHahAI+MRiUYIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUOZzMg4knFYQUeUTcslSm8Z8x2WJW/yJ3uQSwDhDCEY1WJjWUBaWYEFy3raDLE4YCLWFQft83+2oyntyF1zj2ZPGdOt+39RGyjkVSTDChIa91Wwn3zgiCi9RRKg1FJ37qMUwH0wEry/c/Q06Oi1urXDVKohxzi5YE8ROdXzSl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NCcSwXi9; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730828359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ne1FGLiY1HNBdb1T7D8UB1J1N4ofnbBwHx1+cd/J/9E=;
	b=NCcSwXi97E1CaZjCI2OGcm6yT44QTYVsrimmTgEIIUNF0f2RCfLz9jhXIp1e3Vlyf2OqHy
	KiBupSfHNmFyJzONrJAjZ9NDyK9H1tBjAbhHy9kCT6yvUceVhxJ+ZNxxrDcWRLtKy3e97Y
	+AV5nGetoVmzpnlMp7Y8sujoHNr7VTQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: kernel: proc: Use str_yes_no() helper function
Date: Tue,  5 Nov 2024 18:38:36 +0100
Message-ID: <20241105173837.37756-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_yes_no() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/mips/kernel/proc.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 8eba5a1ed664..8f0a0001540c 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -66,24 +66,23 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_printf(m, "BogoMIPS\t\t: %u.%02u\n",
 		      cpu_data[n].udelay_val / (500000/HZ),
 		      (cpu_data[n].udelay_val / (5000/HZ)) % 100);
-	seq_printf(m, "wait instruction\t: %s\n", cpu_wait ? "yes" : "no");
+	seq_printf(m, "wait instruction\t: %s\n", str_yes_no(cpu_wait));
 	seq_printf(m, "microsecond timers\t: %s\n",
-		      cpu_has_counter ? "yes" : "no");
+		      str_yes_no(cpu_has_counter));
 	seq_printf(m, "tlb_entries\t\t: %d\n", cpu_data[n].tlbsize);
 	seq_printf(m, "extra interrupt vector\t: %s\n",
-		      cpu_has_divec ? "yes" : "no");
-	seq_printf(m, "hardware watchpoint\t: %s",
-		      cpu_has_watch ? "yes, " : "no\n");
+		      str_yes_no(cpu_has_divec));
+	seq_printf(m, "hardware watchpoint\t: %s", str_yes_no(cpu_has_watch));
 	if (cpu_has_watch) {
-		seq_printf(m, "count: %d, address/irw mask: [",
+		seq_printf(m, ", count: %d, address/irw mask: [",
 		      cpu_data[n].watch_reg_count);
 		for (i = 0; i < cpu_data[n].watch_reg_count; i++)
 			seq_printf(m, "%s0x%04x", i ? ", " : "",
 				cpu_data[n].watch_reg_masks[i]);
-		seq_puts(m, "]\n");
+		seq_puts(m, "]");
 	}
 
-	seq_puts(m, "isa\t\t\t:");
+	seq_puts(m, "\nisa\t\t\t:");
 	if (cpu_has_mips_1)
 		seq_puts(m, " mips1");
 	if (cpu_has_mips_2)
@@ -155,7 +154,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 
 	if (cpu_has_mmips) {
 		seq_printf(m, "micromips kernel\t: %s\n",
-		      (read_c0_config3() & MIPS_CONF3_ISA_OE) ?  "yes" : "no");
+		      str_yes_no(read_c0_config3() & MIPS_CONF3_ISA_OE));
 	}
 
 	seq_puts(m, "Options implemented\t:");
-- 
2.47.0


