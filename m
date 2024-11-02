Return-Path: <linux-mips+bounces-6621-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B707C9BA2AA
	for <lists+linux-mips@lfdr.de>; Sat,  2 Nov 2024 23:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E35491C208ED
	for <lists+linux-mips@lfdr.de>; Sat,  2 Nov 2024 22:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60772166F26;
	Sat,  2 Nov 2024 22:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UiyrWGxT"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB715623A
	for <linux-mips@vger.kernel.org>; Sat,  2 Nov 2024 22:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730585157; cv=none; b=C2Rv1LrjUd6fltQuvrj3YTQ5SRW75T87FeWESfaUtFsIFE12iD+OTWDXl/oEvAAhMai4KelVCLx1xlK+7TOwVcJOy7hVo4wQxk4xYEShGjAAFKMoMqsZ8liU/1xstNaII5hJE+maDzP4YP7nJsgiXC7lrQ4JzQN4KWXqMXVCbEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730585157; c=relaxed/simple;
	bh=DGxW/3gzFbMl2TxUO+gjIwebkur7SBvooTQl/SXJEVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iQ3Dl/HMRz0oOxs/93QxwoaEB1aFzDpmCrwWpLr7s5IDUcfq4tPzamHl4/uANXKm3GRtqibYUKCmfYck/T8ayP5Ro0waI/bd9zNPxQ76JdCxZg5h1/z3hUK6dieUtGzzeVkV9MtEh0ClOa9fZQrm2Z2Y+k4sxjN+bx1oa6j0s/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UiyrWGxT; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730585151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dhBNX0iKymGDAluv25dKc2iiAQq1RLm6UtTorT0C7Ik=;
	b=UiyrWGxTcqUsI/Q8lsMegWOdmnFIWO+sNHUYo1to0E3cOhVdi+Co4l1bNEdHhqXivvH92J
	uimnYt3RRqct0w1QjR0yxRn3q4lsyAy9PteKJwHAgUmvUnPvOBhxDD3j2vZF+Sdu56ZnP8
	sG+ExnridvfwDL/BJV+jpGhFUxiLWhw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: kernel: proc: Use str_yes_no() helper function
Date: Sat,  2 Nov 2024 23:04:36 +0100
Message-ID: <20241102220437.22480-2-thorsten.blum@linux.dev>
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
 arch/mips/kernel/proc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 8eba5a1ed664..3e4be48bab02 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -66,12 +66,12 @@ static int show_cpuinfo(struct seq_file *m, void *v)
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
+		      str_yes_no(cpu_has_divec));
 	seq_printf(m, "hardware watchpoint\t: %s",
 		      cpu_has_watch ? "yes, " : "no\n");
 	if (cpu_has_watch) {
@@ -155,7 +155,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 
 	if (cpu_has_mmips) {
 		seq_printf(m, "micromips kernel\t: %s\n",
-		      (read_c0_config3() & MIPS_CONF3_ISA_OE) ?  "yes" : "no");
+		      str_yes_no(read_c0_config3() & MIPS_CONF3_ISA_OE));
 	}
 
 	seq_puts(m, "Options implemented\t:");
-- 
2.47.0


