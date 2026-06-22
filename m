Return-Path: <linux-mips+bounces-15170-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SY0SDoOmOWoFwAcAu9opvQ
	(envelope-from <linux-mips+bounces-15170-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 23:17:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CD56B2734
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 23:17:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=mobileye.com header.s=MoEyIP header.b=bbwR3ho7;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15170-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15170-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=mobileye.com (policy=quarantine);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9C07305A45D
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 21:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4789B27A476;
	Mon, 22 Jun 2026 21:16:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from esa1.hc555-34.eu.iphmx.com (esa1.hc555-34.eu.iphmx.com [23.90.104.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23044357CFA;
	Mon, 22 Jun 2026 21:15:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782162962; cv=none; b=LC/+V2+t/PgqLA3ntFDkEzMbafIUV0SSjWIoyHGDLhhLpwr41183OAMCmiViuYeIp072muZ5pRE/x/JsEWyf4MGUC7i7UL0E8gk7mC1IX41PtcuvFvtw6sNDJgViPtWcgsc7GadUzHyp+vhbSmmTJOg167WewljkzGs5F3DYzD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782162962; c=relaxed/simple;
	bh=NzDP/Qf23/prJJNPPgsghEZJIH7cLqjLXgSqIcy81Tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V1ykZE+WglP4It3yggWebFuCOfteIE9moSnUZTQKye6zMoKV/5oWpN8o5dMoDvj83aAplcHjskDSlqqlECfVcgw6Ekipg35UfMVjF+GqITAfM32s2NvdtpQY9h2fATIdKRLQ9GoX+LnVr/UOavLX1HOv5eyBFS5KvIJnKfjoKXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=bbwR3ho7 reason="key not found in DNS"; arc=none smtp.client-ip=23.90.104.144
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1782162960; x=1813698960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NzDP/Qf23/prJJNPPgsghEZJIH7cLqjLXgSqIcy81Tw=;
  b=bbwR3ho7EZwGdBskwD+U4WX5oU1fsDIqSoEOgzR91WSuz0zFqD5xkhDh
   Nn1Uok+P6lIJbCodPZdt1qmdmhT5KfOv3SvdfQoPrbt2fI3msvbVZ0gKv
   b0f5Q5FxehA0a3hwJqaBMKBEONQaWxTXczTXuZMdxsJIX3vdWSSjC8VFB
   Kzg5k1nVL6tnISWweDkr+RmqjItg7WXGW+fvaaTLQLi2fE+wCDJMml0wx
   98+LKjO4L3Ulxx7UUDe6FbcD9kYoVWIl7rwUqXgwFsWnLmj/yDExuJGql
   hBpaJiwgFSWQkcmS376ulgmELujjJmMQyQ9fwpO+oMHzwN2yNhRBKo9At
   g==;
X-CSE-ConnectionGUID: ItTf23kdRN2Q2hgcFQPqfw==
X-CSE-MsgGUID: fALokgqGTVWre3ci6DjaHA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 00:14:48 +0300
X-CSE-ConnectionGUID: PIZbsQHORw2HX0SvceFskA==
X-CSE-MsgGUID: G7hsW6c/S6ifmNGfrT+2Lg==
Received: from unknown (HELO epgd034.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 23 Jun 2026 00:19:57 +0300
Received: by epgd034.me-corp.lan (sSMTP sendmail emulation); Tue, 23 Jun 2026 00:14:46 +0300
From: Pnina Feder <pnina.feder@mobileye.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Pnina Feder <pnina.feder@mobileye.com>
Subject: [PATCH 4/4] mips: vmcore_info: export mips arch-specific struct offsets to vmcoreinfo
Date: Tue, 23 Jun 2026 00:14:30 +0300
Message-ID: <20260622211430.4008899-5-pnina.feder@mobileye.com>
In-Reply-To: <20260622211430.4008899-1-pnina.feder@mobileye.com>
References: <20260622211430.4008899-1-pnina.feder@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[mobileye.com : SPF not aligned (relaxed),quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	R_DKIM_PERMFAIL(0.00)[mobileye.com:s=MoEyIP];
	DKIM_TRACE(0.00)[mobileye.com:~];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15170-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[pnina.feder@mobileye.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:bhe@redhat.com,m:rppt@kernel.org,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:ruirui.yang@linux.dev,m:corbet@lwn.net,m:alex@ghiti.fr,m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-doc@vger.kernel.org,m:pnina.feder@mobileye.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pnina.feder@mobileye.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mobileye.com:email,mobileye.com:mid,mobileye.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86CD56B2734

Export MIPS architecture-specific struct offsets needed by the
vmcore-tasks tool, including signal frame layouts and register
context structures used to reconstruct user-space register state
from a vmcore dump.

Signed-off-by: Pnina Feder <pnina.feder@mobileye.com>
---
 .../admin-guide/kdump/vmcoreinfo.rst          | 34 +++++++++++++++++++
 arch/mips/kernel/Makefile                     |  1 +
 arch/mips/kernel/signal.c                     |  8 +++++
 arch/mips/kernel/vmcore_info.c                | 22 ++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 arch/mips/kernel/vmcore_info.c

diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
index 3c364434b846..4af32ddf5615 100644
--- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
+++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
@@ -494,6 +494,40 @@ Used to get the vmalloc_start address from the high_memory symbol.
 
 The maximum number of CPUs.
 
+MIPS
+====
+
+(rt_sigframe, rs_uc)
+--------------------
+
+Offset of the ucontext member within the MIPS rt_sigframe structure.
+Used to locate the signal context within a signal frame on the user
+stack.
+
+(sigcontext, sc_regs)
+---------------------
+
+Offset of the saved register array within struct sigcontext. Used to
+extract user-space register state from signal frames in a vmcore dump.
+
+PAGE_SHIFT
+----------
+
+The base-2 logarithm of the page size. Used for page frame number
+calculations during address translation.
+
+_PFN_MASK|_PAGE_PRESENT|_PAGE_VALID|_PAGE_GLOBAL
+-------------------------------------------------
+
+Page table entry bit masks and flags. Used for walking MIPS page tables
+and translating virtual to physical addresses in a vmcore dump.
+
+PTRS_PER_PGD|PTRS_PER_PMD|PTRS_PER_PTE
+---------------------------------------
+
+Number of entries per page table level. Used for page table walking
+during virtual-to-physical address translation.
+
 powerpc
 =======
 
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 95a1e674fd67..99f2961f6ee1 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -24,6 +24,7 @@ CFLAGS_REMOVE_perf_event_mipsxx.o = $(CC_FLAGS_FTRACE)
 endif
 
 obj-$(CONFIG_CEVT_BCM1480)	+= cevt-bcm1480.o
+obj-$(CONFIG_VMCORE_INFO)	+= vmcore_info.o
 obj-$(CONFIG_CEVT_R4K)		+= cevt-r4k.o
 obj-$(CONFIG_CEVT_DS1287)	+= cevt-ds1287.o
 obj-$(CONFIG_CEVT_GT641XX)	+= cevt-gt641xx.o
diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index 4a10f18a8806..f2241f52fa17 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -26,6 +26,7 @@
 #include <linux/syscalls.h>
 #include <linux/uaccess.h>
 #include <linux/resume_user_mode.h>
+#include <linux/vmcore_info.h>
 
 #include <asm/abi.h>
 #include <asm/asm.h>
@@ -62,6 +63,13 @@ struct rt_sigframe {
 	struct ucontext rs_uc;
 };
 
+#ifdef CONFIG_VMCORE_INFO
+void mips_rt_signal_frame(void)
+{
+	VMCOREINFO_OFFSET(rt_sigframe, rs_uc);
+}
+#endif
+
 #ifdef CONFIG_MIPS_FP_SUPPORT
 
 /*
diff --git a/arch/mips/kernel/vmcore_info.c b/arch/mips/kernel/vmcore_info.c
new file mode 100644
index 000000000000..5d7fdc662065
--- /dev/null
+++ b/arch/mips/kernel/vmcore_info.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/vmcore_info.h>
+
+#include <asm/pgtable.h>
+#include <asm/sigcontext.h>
+
+extern void mips_rt_signal_frame(void);
+
+void arch_crash_save_vmcoreinfo(void)
+{
+	mips_rt_signal_frame();
+	VMCOREINFO_OFFSET(sigcontext, sc_regs);
+	VMCOREINFO_NUMBER(PAGE_SHIFT);
+	VMCOREINFO_NUMBER(_PFN_MASK);
+	VMCOREINFO_NUMBER(_PAGE_PRESENT);
+	VMCOREINFO_NUMBER(_PAGE_VALID);
+	VMCOREINFO_NUMBER(_PAGE_GLOBAL);
+	VMCOREINFO_NUMBER(PTRS_PER_PGD);
+	VMCOREINFO_NUMBER(PTRS_PER_PMD);
+	VMCOREINFO_NUMBER(PTRS_PER_PTE);
+}
-- 
2.43.0


