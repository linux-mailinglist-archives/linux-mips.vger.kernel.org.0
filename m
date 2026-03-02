Return-Path: <linux-mips+bounces-13308-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Lx4IiSDpWmxCwYAu9opvQ
	(envelope-from <linux-mips+bounces-13308-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 02 Mar 2026 13:31:32 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 334171D8843
	for <lists+linux-mips@lfdr.de>; Mon, 02 Mar 2026 13:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C4FD30EB6F7
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2026 12:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2037036DA09;
	Mon,  2 Mar 2026 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NgEmBRH8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wBjvzdwE"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A9B36D4EE;
	Mon,  2 Mar 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454350; cv=none; b=f9Hy/ei5vjOFOJ9oGiFhURuwjdtOdd0modt0KibXTUl+2Bt2lorkfUxHW0XjKIE1hdp5tpPk+32Woae0UcYZce25EZEnOSNTfU42O4NUnlDBoLwXINSdwxcmq2XghN2WhEEPtB3mbtoR9glN4hFvu1bqcI2k3f26QcOvBvdHsnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454350; c=relaxed/simple;
	bh=H/zS+Ct3UHio/FsL18acsKnK+cbSHWGTE0BjVHLUtvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tKX8pOpf7IEBs9XMPmSlsQs2PAbwLGAaFa56vDtDSfu5oRPHwSMBegCVK8gA7oDxikPQ7Wlsf0sMYAIfFDiuXLstrAMqc4M1cqiqn9WMMTK1vH50SLq1wyP2ojIjJACzB+ftxn2bCLKq8oYJ/SkJIw4MDG5Pduj7mBGmrgSNRGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NgEmBRH8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wBjvzdwE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yr/FVLaERA/6AyGKnbc+eEestu0HgmTMXr3G7w1zsEE=;
	b=NgEmBRH83vNY7H36CH4oO6VnJ5MAvKmiUKvwK3t7ouIQuPACqkkjKl2URmwcjH+onPdSZb
	r9EzOPFWNJPD/IuM4H7H7vF+bKQ2SYeG40TaRA9tVFaRIHivjPmTcNQ5/9CdZNluIMIyXb
	eAEshz46RA8/Ju0Ah9MapcJN+oVWn19o1cu3Mz6ujerXIQ7x5HQj7wht4jZmqkSgxgJ1TF
	3OxHlKUOzBCmOC0KB00MIeEsuA/rH+5YF1NUpCcU5Zfiqm6TXzb8mbOaNOvRguUB5IAS6w
	sz6lJH8dDDk5KbCgBUQK4ckDtwyo3MRB9L7tWcpXT8jZB/H/xMqqehwM/C37xw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yr/FVLaERA/6AyGKnbc+eEestu0HgmTMXr3G7w1zsEE=;
	b=wBjvzdwEGM5OTq4hn5Ae5qenwnN25sPzXSMLGyi7kK7MBM5frm1SN3i93koTAjShsmKHdH
	r/HgSkHAiAt1SKCQ==
Date: Mon, 02 Mar 2026 13:25:29 +0100
Subject: [PATCH 05/15] x86: Remove AT_VECTOR_SIZE_ARCH from UAPI
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-at-vector-size-arch-v1-5-a11f03ba2ca8@linutronix.de>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1952;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=H/zS+Ct3UHio/FsL18acsKnK+cbSHWGTE0BjVHLUtvg=;
 b=zafh0BF3nW0lW74zLMVAm5CMViipzIhJlV12m0OWQt+FQwiQhO8t2F9dDNqKSZeCroOF2w7dU
 QaM4A6LGzPhCYQpOkBtTE0q/iOHVWPqMyNJAu5/H35A8mav/lYtcmVc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13308-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 334171D8843
X-Rspamd-Action: no action

There is nothing userspace can do with this value. In the kernel is
always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
userspace and also changes from time to time.

Move the symbol to a kernel-internal header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/include/asm/auxvec.h      | 12 ++++++++++++
 arch/x86/include/uapi/asm/auxvec.h | 13 +++----------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/auxvec.h b/arch/x86/include/asm/auxvec.h
new file mode 100644
index 000000000000..ed26ad09f3e3
--- /dev/null
+++ b/arch/x86/include/asm/auxvec.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_AUXVEC_H
+#define _ASM_X86_AUXVEC_H
+
+/* entries in ARCH_DLINFO: */
+#if defined(CONFIG_IA32_EMULATION) || !defined(CONFIG_X86_64)
+# define AT_VECTOR_SIZE_ARCH 3
+#else /* else it's non-compat x86-64 */
+# define AT_VECTOR_SIZE_ARCH 2
+#endif
+
+#endif /* _ASM_X86_AUXVEC_H */
diff --git a/arch/x86/include/uapi/asm/auxvec.h b/arch/x86/include/uapi/asm/auxvec.h
index bdde9e18f94e..6677c9ace117 100644
--- a/arch/x86/include/uapi/asm/auxvec.h
+++ b/arch/x86/include/uapi/asm/auxvec.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _ASM_X86_AUXVEC_H
-#define _ASM_X86_AUXVEC_H
+#ifndef _UAPI_ASM_X86_AUXVEC_H
+#define _UAPI_ASM_X86_AUXVEC_H
 /*
  * Architecture-neutral AT_ values in 0-17, leave some room
  * for more of them, start the x86-specific ones at 32.
@@ -10,11 +10,4 @@
 #endif
 #define AT_SYSINFO_EHDR		33
 
-/* entries in ARCH_DLINFO: */
-#if defined(__KERNEL__) && (defined(CONFIG_IA32_EMULATION) || !defined(CONFIG_X86_64))
-# define AT_VECTOR_SIZE_ARCH 3
-#else /* else it's non-compat x86-64 */
-# define AT_VECTOR_SIZE_ARCH 2
-#endif
-
-#endif /* _ASM_X86_AUXVEC_H */
+#endif /* _UAPI_ASM_X86_AUXVEC_H */

-- 
2.53.0


