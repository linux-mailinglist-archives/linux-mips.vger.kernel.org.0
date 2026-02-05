Return-Path: <linux-mips+bounces-13124-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCxgL5y/hGnG4wMAu9opvQ
	(envelope-from <linux-mips+bounces-13124-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 17:04:44 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 797B3F4F08
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 17:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86C6930233C0
	for <lists+linux-mips@lfdr.de>; Thu,  5 Feb 2026 15:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD38C42DFE0;
	Thu,  5 Feb 2026 15:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="nY8tgY1t"
X-Original-To: linux-mips@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BB7421F0C;
	Thu,  5 Feb 2026 15:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307126; cv=pass; b=FmDeH91We89OntnB9LlGPBzdP7yDpvBECGZEmNsATKM8dKwJ4yuQBYKa61KXzk7NV998naHc0cXO0wbLvkHP8Enu3KVKW+XkSSynvyFeMoEMCLoDDluISsTaIzXpGiJMAM4um1BTJmusOwptm4NkDmNrPwG23VWC38AG5td/Cyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307126; c=relaxed/simple;
	bh=Fi4VXOVvvEEM9yWZmbVIB2tdGgQxZe5fTXPkIeISGP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AWqENH64HNyi+v+AlPQ1XCcAMaYblpQss8MHemXmtmoRODe8pKhAjeKdgMuJafuNiD3gDicNuzGoX+OXnv6qEcSf07h7fVuq27rr5n0yUI8v+OPIClhPG+HD71x147jKlCLWVrDuRbbxasdE2mG1ZV77AnJeHAf95b90xp8/7Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=nY8tgY1t; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
ARC-Seal: i=1; a=rsa-sha256; t=1770307096; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LQdDS0sD9D9Nnv/1Z9zKLRa2h2j0LzjEp7mXNBpdyDWKa+NqBvy4WWANgCCail15iuYliP0LX4bYoa56Q83RF7KOYP0VlihvWpnKUqPClgy4RSHyst7RUTaYwfpmeMKnq4vRq/UtDKKlvUq0LHKtof8DgYTIGbjq+OhYlZE53EM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770307096; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JjgyVvQvDBdLV0lASR43tNdGfYV4elj5vN9l8aB40pM=; 
	b=CZ5Cz66ShZvrQHbcPHMgkcJZapk+/APN60SeoFYszw+WZVajE9fzff7P/wCRQEjvKPQi+vvNhyIBR/hcpfFI4N4pwHUFOE/EXpGpM9nKzvOeaQCxBUj8uEVMy4iBEGGLHpE/CuHXnrqnqKB+3t2UGQINwmHaYG1iEMlDJCE4vm8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770307096;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JjgyVvQvDBdLV0lASR43tNdGfYV4elj5vN9l8aB40pM=;
	b=nY8tgY1t/Dkhjz9KHtwgnxxqNL0p9D6mn0eW/qK4OPN1lDeF/9PdYpQw04p0eGUF
	kZ/+6IgEhlXpDkX9a9/s1l3QP5X0UysbUaPDqBwUQ84dFPuBP1X5KuL4sq7Vbc7Q7A1
	JvhO4qu/MjsXtEv2TXJ1h8dAn3l+KV/NMaUvcsHg=
Received: by mx.zohomail.com with SMTPS id 1770307094687863.0131325581174;
	Thu, 5 Feb 2026 07:58:14 -0800 (PST)
From: Yao Zi <me@ziyao.cc>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Yao Zi <me@ziyao.cc>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v2] MIPS: Work around LLVM bug when gp is used as global register variable
Date: Thu,  5 Feb 2026 15:56:44 +0000
Message-ID: <20260205155644.34421-1-me@ziyao.cc>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [10.34 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:email,ziyao.cc:dkim,ziyao.cc:mid];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13124-lists,linux-mips=lfdr.de];
	R_DKIM_ALLOW(0.00)[ziyao.cc:s=zmail];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[alpha.franken.de,kernel.org,gmail.com,google.com,linutronix.de];
	DKIM_TRACE(0.00)[ziyao.cc:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_NEQ_ENVFROM(0.00)[me@ziyao.cc,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ziyao.cc,quarantine];
	TAGGED_RCPT(0.00)[linux-mips,lkml];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	NEURAL_SPAM(0.00)[0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ziyao.cc:email,ziyao.cc:dkim,ziyao.cc:mid,gnu.org:url]
X-Rspamd-Queue-Id: 797B3F4F08
X-Rspamd-Action: add header
X-Spam: Yes

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
---

Changed from v1:
- Include a link to LLVM upstream issue in comment
- Collect tags
- Link to v1: https://lore.kernel.org/linux-mips/20260118090235.60670-1-me@ziyao.cc/

 arch/mips/kernel/relocate.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 7f1c136ad850..59833210542f 100644
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
2.52.0


