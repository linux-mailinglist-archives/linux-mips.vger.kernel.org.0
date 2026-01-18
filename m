Return-Path: <linux-mips+bounces-12956-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5935FD39371
	for <lists+linux-mips@lfdr.de>; Sun, 18 Jan 2026 10:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DB03300E143
	for <lists+linux-mips@lfdr.de>; Sun, 18 Jan 2026 09:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968281EA7CB;
	Sun, 18 Jan 2026 09:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="PxNZv06i"
X-Original-To: linux-mips@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165936FC3;
	Sun, 18 Jan 2026 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768726996; cv=pass; b=mBQjreKl1oVwGRSyorR19QA4lOecuHksMhQttjP6tn4lsdtajA/K/jAkC1/3KTL9rXGplBrPYty5WK3AWTgq85NHzo7KWpY1F2lDzoa5weRCBM4YSLbKxZR3rD3CkrpIJRzkPHuvHXlVQLk9rWApPLYhykb/SuWCy9KLCFy1iiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768726996; c=relaxed/simple;
	bh=uZrjtSNl7WA0To3TDLXDmC5txmqD3ciHeAn+zcxAJfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XleFMCs5o7SteFkbxNvoK+rtDEFRI8MXUOSBmezutOUVR1M9Q+lo36IOh+Jjr9zxUDHx/7iB12WofU7ZdW9eL5rRWIJ5Zf9cmB6MA7KtjkVi5JAN25JRzgFaefk0GP5DCVtperpXimd2Okd96Q/WT10KyBr5ewDpPBy61C+KKbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=PxNZv06i; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
ARC-Seal: i=1; a=rsa-sha256; t=1768726966; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jouxY5SByNcmXi/vOnAEE4ZYQElPLgwqWWJcwKUJMg2tin8j6hOfD8xCK6866oP+QGhKsiYoHf2+OTR3L5XCwDrXJ5fsT5xZ3wpI03SDm5ma/ratNMVLKsIyu7dGr6ItC8x8nHI1bvBvJ49NzFEbgPEFAzDlfoXjb7Ny6SA0B3k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768726966; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rbBA+pmKoTQxxz0XddBk9DcB50kiQw+IwRhWDthJeH8=; 
	b=P9diO6yyf14L1CYOXiYgjdo6aWtUwOMuTRQU9V9AsXB3o9C1GWex2/J1cYRf4c0swpuz01xZh9D703suNudOhGejpcWEBCGFapigZO6pkTSzf/e+q63WTlftIsEE/iMwlkmc8mPIU3cNH/3SwasS7o3+H5zYXmuhYdphSUPEuOk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768726966;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rbBA+pmKoTQxxz0XddBk9DcB50kiQw+IwRhWDthJeH8=;
	b=PxNZv06i19r4R1L2Q3A1XwnJRz6hhYRPcSHM/cshvN0kuaOB5NkV/L0ERfAQPhpW
	q/tjmnG1yWajnxT+88MWDKY5wBKLGxrWaJrSle7v5iYRvdMnCVwpMfNbMb5fBDokzT0
	tHz1Atg94a0feAYNH0TKwHHD2XP25SBGtwUSrKYU=
Received: by mx.zohomail.com with SMTPS id 1768726963844776.8985224358725;
	Sun, 18 Jan 2026 01:02:43 -0800 (PST)
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
Subject: [PATCH] MIPS: Work around LLVM bug when gp is used as global register variable
Date: Sun, 18 Jan 2026 09:02:35 +0000
Message-ID: <20260118090235.60670-1-me@ziyao.cc>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

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
---
 arch/mips/kernel/relocate.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 7f1c136ad850..12aa0bbdd65e 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -420,7 +420,18 @@ void *__init relocate_kernel(void)
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
+		 */
+		asm volatile("move $28, %0" : :
+			     "r" (RELOCATED(&init_thread_union)));
+#endif
 
 		/* Return the new kernel's entry point */
 		kernel_entry = RELOCATED(start_kernel);
-- 
2.52.0


