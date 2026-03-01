Return-Path: <linux-mips+bounces-13293-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBcEKaKYo2neHgUAu9opvQ
	(envelope-from <linux-mips+bounces-13293-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 01 Mar 2026 02:38:42 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4526B1CB368
	for <lists+linux-mips@lfdr.de>; Sun, 01 Mar 2026 02:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C259730244DD
	for <lists+linux-mips@lfdr.de>; Sun,  1 Mar 2026 01:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999AD2848BA;
	Sun,  1 Mar 2026 01:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feVXWRbQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763F172631;
	Sun,  1 Mar 2026 01:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328443; cv=none; b=Ukgak7MES+leYmlZ49KVlfvTzJ/2kB5uRSRUx4PlrRgZs6M0UTjodbjoJNHhC4Y3MvlBjw5v1+d65hYS8pZ8oc/kqZiBGh4Xf7SQwuAPYlxYbaCBq/EOv9X5NZG/08zL5Ier9T25TzBGj79VkkXjkwPGPqizy4gXnuZi4RiZmrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328443; c=relaxed/simple;
	bh=vHlfXKP4STHsyltdJ0BcHQuWVBexJc45oEKsBZ+V0Ko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IaOFcnmmNyvpJZONO8jq2cUll3qxBdKfayRZLv43shkfyg90RHHVy22i0zvFJ00mMSFWdkMO2Sw6zGlmON/Kh4a3sCl9vRGq3Gkm8+d0hnm2kc7SY+9zV3EruimtrXUnOoHxJcT6s3ggSivZojsRe43nTp1aj5c9xME/OdFEZxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feVXWRbQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550B7C19421;
	Sun,  1 Mar 2026 01:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328443;
	bh=vHlfXKP4STHsyltdJ0BcHQuWVBexJc45oEKsBZ+V0Ko=;
	h=From:To:Cc:Subject:Date:From;
	b=feVXWRbQnY9gWosBXubSw6Tu6IVySBLbfXrT0LfUyLPvPS8gSuuXd/B57pRgQq8Nb
	 M8iEXC1vqyiAILj+l1zprBy7pw2LXnYFL/fG4gITiB4lwm4QO1HzRhmOrtu2BhWnG1
	 Joj/DhMr8mXnXb7Z0LvQF9ech+BSRmIX0beYOTBl30MJ+7oqtlJwnD7VwihFVnZrXa
	 WaEydvxPN2V5xqEbsodHwh6MxI5Cp88EfencnObtPHZS0JSt42/8+R31SzA1yVRsh6
	 EOYMHFB16VMDZ0Alk5YaMQYIOh0u2VOVuvsrEaBXKSl6QZ3uBf+6JIkFMmj3Klu1PP
	 Ism7rfH5UnDbA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	me@ziyao.cc
Cc: Nathan Chancellor <nathan@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	llvm@lists.linux.dev
Subject: FAILED: Patch "MIPS: Work around LLVM bug when gp is used as global register variable" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:27:20 -0500
Message-ID: <20260301012721.1684830-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [8.84 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:email];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13293-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-mips@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.964];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4526B1CB368
X-Rspamd-Action: add header
X-Spam: Yes

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 30bfc2d6a1132a89a5f1c3b96c59cf3e4d076ea3 Mon Sep 17 00:00:00 2001
From: Yao Zi <me@ziyao.cc>
Date: Thu, 5 Feb 2026 15:56:44 +0000
Subject: [PATCH] MIPS: Work around LLVM bug when gp is used as global register
 variable

On MIPS, __current_thread_info is defined as global register variable
locating in $gp, and is simply assigned with new address during kernel
relocation.

This however is broken with LLVM, which always restores $gp if it finds
$gp is clobbered in any form, including when intentionally through a
global register variable. This is against GCC's documentation[1], which
requires a callee-saved register used as global register variable not to
be restored if it's clobbered.

As a result, $gp will continue to point to the unrelocated kernel after
the epilog of relocate_kernel(), leading to an early crash in init_idle,

[    0.000000] CPU 0 Unable to handle kernel paging request at virtual address 0000000000000000, epc == ffffffff81afada8, ra == ffffffff81afad90
[    0.000000] Oops[#1]:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G        W           6.19.0-rc5-00262-gd3eeb99bbc99-dirty #188 VOLUNTARY
[    0.000000] Tainted: [W]=WARN
[    0.000000] Hardware name: loongson,loongson64v-4core-virtio
[    0.000000] $ 0   : 0000000000000000 0000000000000000 0000000000000001 0000000000000000
[    0.000000] $ 4   : ffffffff80b80ec0 ffffffff80b53d48 0000000000000000 00000000000f4240
[    0.000000] $ 8   : 0000000000000100 ffffffff81d82f80 ffffffff81d82f80 0000000000000001
[    0.000000] $12   : 0000000000000000 ffffffff81776f58 00000000000005da 0000000000000002
[    0.000000] $16   : ffffffff80b80e40 0000000000000000 ffffffff80b81614 9800000005dfbe80
[    0.000000] $20   : 00000000540000e0 ffffffff81980000 0000000000000000 ffffffff80f81c80
[    0.000000] $24   : 0000000000000a26 ffffffff8114fb90
[    0.000000] $28   : ffffffff80b50000 ffffffff80b53d40 0000000000000000 ffffffff81afad90
[    0.000000] Hi    : 0000000000000000
[    0.000000] Lo    : 0000000000000000
[    0.000000] epc   : ffffffff81afada8 init_idle+0x130/0x270
[    0.000000] ra    : ffffffff81afad90 init_idle+0x118/0x270
[    0.000000] Status: 540000e2	KX SX UX KERNEL EXL
[    0.000000] Cause : 00000008 (ExcCode 02)
[    0.000000] BadVA : 0000000000000000
[    0.000000] PrId  : 00006305 (ICT Loongson-3)
[    0.000000] Process swapper (pid: 0, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
[    0.000000] Stack : 9800000005dfbf00 ffffffff8178e950 0000000000000000 0000000000000000
[    0.000000]         0000000000000000 ffffffff81970000 000000000000003f ffffffff810a6528
[    0.000000]         0000000000000001 9800000005dfbe80 9800000005dfbf00 ffffffff81980000
[    0.000000]         ffffffff810a6450 ffffffff81afb6c0 0000000000000000 ffffffff810a2258
[    0.000000]         ffffffff81d82ec8 ffffffff8198d010 ffffffff81b67e80 ffffffff8197dd98
[    0.000000]         ffffffff81d81c80 ffffffff81930000 0000000000000040 0000000000000000
[    0.000000]         0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.000000]         0000000000000000 000000000000009e ffffffff9fc01000 0000000000000000
[    0.000000]         0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.000000]         0000000000000000 ffffffff81ae86dc ffffffff81b3c741 0000000000000002
[    0.000000]         ...
[    0.000000] Call Trace:
[    0.000000] [<ffffffff81afada8>] init_idle+0x130/0x270
[    0.000000] [<ffffffff81afb6c0>] sched_init+0x5c8/0x6c0
[    0.000000] [<ffffffff81ae86dc>] start_kernel+0x27c/0x7a8

This bug has been reported to LLVM[2] and affects version from (at
least) 18 to 21. Let's work around this by using inline assembly to
assign $gp before a fix is widely available.

Cc: stable@vger.kernel.org
Link: https://gcc.gnu.org/onlinedocs/gcc-15.2.0/gcc/Global-Register-Variables.html # [1]
Link: https://github.com/llvm/llvm-project/issues/176546 # [2]
Signed-off-by: Yao Zi <me@ziyao.cc>
Acked-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/kernel/relocate.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 7f1c136ad8506..59833210542ff 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -420,7 +420,20 @@ void *__init relocate_kernel(void)
 			goto out;
 
 		/* The current thread is now within the relocated image */
+#ifndef CONFIG_CC_IS_CLANG
 		__current_thread_info = RELOCATED(&init_thread_union);
+#else
+		/*
+		 * LLVM may wrongly restore $gp ($28) in epilog even if it's
+		 * intentionally modified. Work around this by using inline
+		 * assembly to assign $gp. $gp couldn't be listed as output or
+		 * clobber, or LLVM will still restore its original value.
+		 * See also LLVM upstream issue
+		 * https://github.com/llvm/llvm-project/issues/176546
+		 */
+		asm volatile("move $28, %0" : :
+			     "r" (RELOCATED(&init_thread_union)));
+#endif
 
 		/* Return the new kernel's entry point */
 		kernel_entry = RELOCATED(start_kernel);
-- 
2.51.0





