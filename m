Return-Path: <linux-mips+bounces-14059-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNjLJAfv0ml/cQcAu9opvQ
	(envelope-from <linux-mips+bounces-14059-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 01:23:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE4B3A02DE
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 01:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F020730048DA
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 23:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DC0383C99;
	Sun,  5 Apr 2026 23:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="KsmNnFhC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D915353EDF
	for <linux-mips@vger.kernel.org>; Sun,  5 Apr 2026 23:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775431429; cv=none; b=kQgE4Ptfekoed+dCeRLZ0eD2F/tZxtq/ydL3sN0+KJSo6NNgPQso1POlorLczdN4ojB6de0dTd32raUijyO7U8BVIsi7XFJfZKnz0ojSjBCoZZrd16hs9EbtukIHiNBVilSohMQ6Gcai8mrL4BuJ9owVlXh697LNJLWKkIiKuQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775431429; c=relaxed/simple;
	bh=jBxD7jMieVbzDkx4pFj1UN+Jpnu7weNdA5kLihkrQwc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=g7kVAUye7pvoeyndV0jJHsko0d4cnWE0bd/aW/+5BKsABZgAkj/51z1PB6OvAcPvZNjz8w3WNQxJoZaw579HBDOnmnW5nPq6A2QbrSD2TfuptJ/h7iyunly0u2Z71FtvGnUnjB6DIHiI0en1kH2MfU9iQQY1EuhbytqN17oyLVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=KsmNnFhC; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4fppS35mbpzDqQb;
	Sun,  5 Apr 2026 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1775431427; bh=kABDGNZiFagWWsqz4xVZy6jKnj4PRa/UQbPGZ7bEDZI=;
	h=Date:From:Subject:To:Cc:From;
	b=KsmNnFhCjsq96bxb4Gq7p9BJCIqzRn5mtMWvxJwlUAX2I84TzI+OWtfQGoO5n6Dxe
	 2S+YqEB/qxcYZOxV8dG8zlrEoqr0sLeagH504YjJKOYXXQjNm3KBk+fq94/FwrYku/
	 h1m8/26vRN9m5EJxt6biKxkxeUkTSAVy8JPIQOlw=
X-Riseup-User-ID: E333039AE83F200FD434F097FA4942EAE507C83D4A9F127D8AFD7A15CDFC5F7F
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4fppS24Qd3z22Wk;
	Sun,  5 Apr 2026 23:23:46 +0000 (UTC)
Message-ID: <8d68af79-98d0-4c62-9cb7-5c6c721348a3@riseup.net>
Date: Mon, 6 Apr 2026 02:23:44 +0300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rany Hany <rany_hany@riseup.net>
Subject: [PATCH 3/3] MIPS: SMP: Properly stop secondary CPUs for restart
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[riseup.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[riseup.net:s=squak];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[riseup.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14059-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rany_hany@riseup.net,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0BE4B3A02DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some MT7621 devices deadlock in the platform restart callback unless
the other CPUs are stopped by clocking them off.

This fixes restart deadlocks on those MT7621, although the exact
reason why this is required is still unclear.

Signed-off-by: Rany Hany <rany_hany@riseup.net>
---
 arch/mips/kernel/smp.c | 58 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 8d2932e81..e50208c4a 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -32,6 +32,7 @@
 #include <asm/processor.h>
 #include <asm/idle.h>
 #include <asm/r4k-timer.h>
+#include <asm/r4kcache.h>
 #include <asm/mips-cps.h>
 #include <asm/mmu_context.h>
 #include <asm/time.h>
@@ -413,6 +414,8 @@ asmlinkage void start_secondary(void)
 	cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
 }
 
+static atomic_t core_stop_count[NR_CPUS];
+
 static void stop_this_cpu(void *dummy)
 {
 	/*
@@ -422,13 +425,66 @@ static void stop_this_cpu(void *dummy)
 	set_cpu_online(smp_processor_id(), false);
 	calculate_cpu_foreign_map();
 	local_irq_disable();
-	while (1);
+
+	if (mips_cm_present() && r4k_blast_dcache) {
+		unsigned int core = cpu_core(&current_cpu_data);
+
+		if (atomic_dec_and_test(&core_stop_count[core])) {
+			/* Flush data cache */
+			r4k_blast_dcache();
+			__sync();
+
+			if (mips_cm_revision() < CM_REV_CM3) {
+				/* Restrict coherence to own core first */
+				write_gcr_cl_coherence(1 << core);
+				read_gcr_cl_coherence();
+				__sync();
+			}
+
+			/* Disable coherence */
+			write_gcr_cl_coherence(0);
+			read_gcr_cl_coherence();
+
+			/* Gate the core clock */
+			if (mips_cpc_present())
+				write_cpc_cl_cmd(CPC_Cx_CMD_CLOCKOFF);
+		}
+	}
+
+	if (cpu_has_mipsmt) {
+		/* The last active VPE on the core will gate the core clock
+		 * and all other remaining VPEs will halt this TC instead.
+		 *
+		 * Note that on systems without CPC, this will be the
+		 * only way to shutdown the CPU.
+		 */
+		write_c0_tchalt(TCHALT_H);
+		instruction_hazard();
+	}
+
+	while (1)
+		cpu_relax();
 }
 
 void smp_send_stop(void)
 {
+	static unsigned long stop_in_progress;
 	unsigned long timeout;
 
+	if (test_and_set_bit(0, &stop_in_progress))
+		return;
+
+	if (mips_cm_present()) {
+		unsigned int cpu;
+
+		for_each_online_cpu(cpu) {
+			unsigned int core;
+
+			core = cpu_core(&cpu_data[cpu]);
+			atomic_inc(&core_stop_count[core]);
+		}
+	}
+
 	smp_call_function(stop_this_cpu, NULL, 0);
 
 	/* Wait up to 1s for other CPUs to stop */
-- 
2.53.0


