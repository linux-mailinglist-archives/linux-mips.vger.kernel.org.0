Return-Path: <linux-mips+bounces-8664-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FA4A942D3
	for <lists+linux-mips@lfdr.de>; Sat, 19 Apr 2025 12:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC9AE3BD95E
	for <lists+linux-mips@lfdr.de>; Sat, 19 Apr 2025 10:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695452AE96;
	Sat, 19 Apr 2025 10:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sIjdktkK"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC9115665C
	for <linux-mips@vger.kernel.org>; Sat, 19 Apr 2025 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745058501; cv=none; b=C6ko1b0gXkamWd1rs2rndDzMLGVEoJdqRNBTnfXe/o0W2JNkXuelYZPaHql+1AoLbwAvcZX4rIV4vhujQAjUHs8b1JOqyL3yHLP4rZ8j2XjOm5iubOJG+Fm4s4rUegARQ9Zuu1bfGlnrWCZD6SLG/Ae736s0FmWM6+IKXnzPpAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745058501; c=relaxed/simple;
	bh=9Rmc66b3icwUSbgrf1N49U2I8w1YVzo3g/msDARYbl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nv4uiGpNGG39sPsmxyiWMXduqwaHJHkhsu/bSaLeM7e/csHAGkQDh1bPSfxCKH7rJaHqhRO8YU3TqZ4yudsGp0V55zt0vrFzRJPnTsBj2lU2RlBciQIFLcS/TmEB+cSZbH5ODW/7y38bfg5XH58quXrR+HkpafM+Y/OWigjRXHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sIjdktkK; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745058486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AMI7aAyD18/iQIerrFizi1wCmFIzWeT7GRw35BjWCcs=;
	b=sIjdktkKz/1mhzLdSOvFIikYp3mAxLs6SVih6jEs8ampxRkm4TkSkS0QLPI/kHVOdrdVrZ
	P9MEdveewDkYaeBjJyPNM7UXhrASzApRWa5W0v8Iol/pLT9t+pUVWCdfSsYTtjn5FjpEeN
	epuVcx3+bMFQCmSEUr5xAz8kReI+7bM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Oleg Nesterov <oleg@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mips: ptrace: Improve code formatting and indentation
Date: Sat, 19 Apr 2025 12:27:44 +0200
Message-ID: <20250419102744.136697-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use tabs instead of spaces in regs_query_register_offset() and
syscall_trace_leave(), and properly indent multiple getters.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/mips/kernel/ptrace.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index f7107479c7fa..b890d64d352c 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -922,11 +922,13 @@ static const struct pt_regs_offset regoffset_table[] = {
  */
 int regs_query_register_offset(const char *name)
 {
-        const struct pt_regs_offset *roff;
-        for (roff = regoffset_table; roff->name != NULL; roff++)
-                if (!strcmp(roff->name, name))
-                        return roff->offset;
-        return -EINVAL;
+	const struct pt_regs_offset *roff;
+
+	for (roff = regoffset_table; roff->name != NULL; roff++)
+		if (!strcmp(roff->name, name))
+			return roff->offset;
+
+	return -EINVAL;
 }
 
 #if defined(CONFIG_32BIT) || defined(CONFIG_MIPS32_O32)
@@ -937,7 +939,7 @@ static const struct user_regset mips_regsets[] = {
 		.n		= ELF_NGREG,
 		.size		= sizeof(unsigned int),
 		.align		= sizeof(unsigned int),
-		.regset_get		= gpr32_get,
+		.regset_get	= gpr32_get,
 		.set		= gpr32_set,
 	},
 	[REGSET_DSP] = {
@@ -945,7 +947,7 @@ static const struct user_regset mips_regsets[] = {
 		.n		= NUM_DSP_REGS + 1,
 		.size		= sizeof(u32),
 		.align		= sizeof(u32),
-		.regset_get		= dsp32_get,
+		.regset_get	= dsp32_get,
 		.set		= dsp32_set,
 		.active		= dsp_active,
 	},
@@ -955,7 +957,7 @@ static const struct user_regset mips_regsets[] = {
 		.n		= ELF_NFPREG,
 		.size		= sizeof(elf_fpreg_t),
 		.align		= sizeof(elf_fpreg_t),
-		.regset_get		= fpr_get,
+		.regset_get	= fpr_get,
 		.set		= fpr_set,
 	},
 	[REGSET_FP_MODE] = {
@@ -963,7 +965,7 @@ static const struct user_regset mips_regsets[] = {
 		.n		= 1,
 		.size		= sizeof(int),
 		.align		= sizeof(int),
-		.regset_get		= fp_mode_get,
+		.regset_get	= fp_mode_get,
 		.set		= fp_mode_set,
 	},
 #endif
@@ -973,7 +975,7 @@ static const struct user_regset mips_regsets[] = {
 		.n		= NUM_FPU_REGS + 1,
 		.size		= 16,
 		.align		= 16,
-		.regset_get		= msa_get,
+		.regset_get	= msa_get,
 		.set		= msa_set,
 	},
 #endif
@@ -997,7 +999,7 @@ static const struct user_regset mips64_regsets[] = {
 		.n		= ELF_NGREG,
 		.size		= sizeof(unsigned long),
 		.align		= sizeof(unsigned long),
-		.regset_get		= gpr64_get,
+		.regset_get	= gpr64_get,
 		.set		= gpr64_set,
 	},
 	[REGSET_DSP] = {
@@ -1005,7 +1007,7 @@ static const struct user_regset mips64_regsets[] = {
 		.n		= NUM_DSP_REGS + 1,
 		.size		= sizeof(u64),
 		.align		= sizeof(u64),
-		.regset_get		= dsp64_get,
+		.regset_get	= dsp64_get,
 		.set		= dsp64_set,
 		.active		= dsp_active,
 	},
@@ -1015,7 +1017,7 @@ static const struct user_regset mips64_regsets[] = {
 		.n		= 1,
 		.size		= sizeof(int),
 		.align		= sizeof(int),
-		.regset_get		= fp_mode_get,
+		.regset_get	= fp_mode_get,
 		.set		= fp_mode_set,
 	},
 	[REGSET_FPR] = {
@@ -1023,7 +1025,7 @@ static const struct user_regset mips64_regsets[] = {
 		.n		= ELF_NFPREG,
 		.size		= sizeof(elf_fpreg_t),
 		.align		= sizeof(elf_fpreg_t),
-		.regset_get		= fpr_get,
+		.regset_get	= fpr_get,
 		.set		= fpr_set,
 	},
 #endif
@@ -1033,7 +1035,7 @@ static const struct user_regset mips64_regsets[] = {
 		.n		= NUM_FPU_REGS + 1,
 		.size		= 16,
 		.align		= 16,
-		.regset_get		= msa_get,
+		.regset_get	= msa_get,
 		.set		= msa_set,
 	},
 #endif
@@ -1351,7 +1353,7 @@ asmlinkage long syscall_trace_enter(struct pt_regs *regs)
  */
 asmlinkage void syscall_trace_leave(struct pt_regs *regs)
 {
-        /*
+	/*
 	 * We may come here right after calling schedule_user()
 	 * or do_notify_resume(), in which case we can be in RCU
 	 * user mode.
-- 
2.49.0


