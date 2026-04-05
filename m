Return-Path: <linux-mips+bounces-14064-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOA9KUz50mkXcwcAu9opvQ
	(envelope-from <linux-mips+bounces-14064-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 02:07:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 348A73A0C5B
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 02:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78BB23011854
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2026 00:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28061519B4;
	Mon,  6 Apr 2026 00:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="Ph+j2x6Q"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FA32C859
	for <linux-mips@vger.kernel.org>; Mon,  6 Apr 2026 00:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433636; cv=none; b=WjU5M2nk6I4NvUYAlBi/OV7fmgPWWMx6uu0Pfbxl0MoihIeyLmciotmKtXJ/ZRwsEX2Nl52WOPMZGiMRKiSeXvj4YtA8O0uRf/HrMGvcLne0CsXfxFOUPCYHQZT559SBeS573gRPG0Rf+jHW6HLECWpVi074MOSFrrSRtHXXIdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433636; c=relaxed/simple;
	bh=Ev0wzDNggUYwaIuWTMtfcoi/ZZw8q/+ceZp3RcSAVUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+bbtWbrwa6F4fUrDTTCZf7bK5KOQwYBSJlg61CHSgFrNWtUKPzCFrQAbLP0hS8ErNOLYoK0IdOcOn5Sc3CVdTCvuI+aPXFEuFSBYDRaWGz6N4PsZtzIbJHaF50+omXRDejQCjL4l7ta7oIw4jWtO83MuSQ07Qcg042YzZ5cTa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=Ph+j2x6Q; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews03-sea.riseup.net (fews03-sea-pn.riseup.net [10.0.1.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4fpqGW1z5Jz9s1x;
	Mon,  6 Apr 2026 00:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1775433635; bh=8zygWxUZONhpmC7YPbo6CH/mEsCorQm1otpth9dO5n8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ph+j2x6QldCyrSQR07QvKvdGtsuVCJo2hjBeLWAwQyEWML2uuCMzCSviTxD0fPNhS
	 akJRT4solmwGVMFcVx7VnaaVazZQf8AVP48tW9LBmH21/weLQ4qvcKPS8RyPxMDrB5
	 wBXmwmdji+pTL+Or5BLUv2c0O0qNiCozZSJybxJs=
X-Riseup-User-ID: 246E720B762D0BC7885F7BC6EC7323095DC17A35D9E4AAD5B6C4568CF3162901
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews03-sea.riseup.net (Postfix) with ESMTPSA id 4fpqGS6ffRz20Q5;
	Mon,  6 Apr 2026 00:00:32 +0000 (UTC)
From: Rany Hany <rany_hany@riseup.net>
To: linux-mips@vger.kernel.org
Cc: Rany Hany <rany_hany@riseup.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH 3/3] MIPS: SMP: Properly stop secondary CPUs for restart
Date: Mon,  6 Apr 2026 02:59:55 +0300
Message-ID: <20260405235956.79535-4-rany_hany@riseup.net>
In-Reply-To: <20260405235956.79535-1-rany_hany@riseup.net>
References: <20260405235956.79535-1-rany_hany@riseup.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[riseup.net,none];
	R_DKIM_ALLOW(-0.20)[riseup.net:s=squak];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14064-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[riseup.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rany_hany@riseup.net,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riseup.net:dkim,riseup.net:email,riseup.net:mid]
X-Rspamd-Queue-Id: 348A73A0C5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some MT7621 devices deadlock in the platform restart callback unless
the other CPUs are stopped by clocking them off. Initially only
flushing d-cache and using TCHalt was attempted but ClkOff appears
to be necessary to fix this issue.

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


