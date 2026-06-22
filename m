Return-Path: <linux-mips+bounces-15169-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VksYJRKmOWrsvwcAu9opvQ
	(envelope-from <linux-mips+bounces-15169-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 23:16:02 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A85D6B26FD
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 23:16:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=mobileye.com header.s=MoEyIP header.b=iVBod8UD;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15169-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15169-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=mobileye.com (policy=quarantine);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85D2C3028CBD
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 21:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FA92EC0B0;
	Mon, 22 Jun 2026 21:15:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com [207.54.77.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC365235358;
	Mon, 22 Jun 2026 21:15:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782162959; cv=none; b=eUnqdv6mzxRRNLxbzBXRyRX9a9e5nUeRqUxjQ3gETG4csosh5ZP0SA5PcO9Dy60u06o95LAatuMtE34u4bvSerN30VDNixGPWWuZEYWARlppnj+FQ4nmWO3WPqjMSi9qqUy49wGLM859tAYS7YkcitZnA/kSjks4gCuU/hmpw6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782162959; c=relaxed/simple;
	bh=FTIF5cEmVnxxDW8vrLW8IxPoavSb7ayg0HJS7UNjj2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=njeaWiJGUZcCi5eZ7kJyRtwflJAfwtMbHRghMVazhLsHiRTqzAmjn+NinJc6AWlRE8bBQbypje4bs2jYFlnRD4Akne22svnUNlTtuUxkacOm8D29/FGJ4W8ZYgpNjsuJTRLdywud+29pLgL9gAHGQt0WOKKdcuriaUm07vKdqq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=iVBod8UD reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.50
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1782162958; x=1813698958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FTIF5cEmVnxxDW8vrLW8IxPoavSb7ayg0HJS7UNjj2U=;
  b=iVBod8UDtppU3YJO0iwvkFb1Wb4v62/GtQLY8fIYfOZtT7TpHEIqAJwr
   TeVtuQ2Q+LflN5aWHr/uvT0mcKjzofinpg6OHR7Zjk3zKObTVNUZTvX5J
   LUcjODCO6NJiQ0VHyfZycn+c/9e5eBspDg5nRoUjJ07RsfFzx/P0jFQvO
   PA0k111c+i4zAVcM7/Bg7LOdqUsamV4Mw0COuOneFs4d/L9fsKaZx4CNS
   j0BeP4C+/EL8U3d1pkH/uxBG11ecIlA+vpEmJ5tt8HMBZIhVpQK5IdvJB
   LRlIZNdTuf3kobDUTfHYXxX1mhF4ZcojjecEd0eRK/xnCp6c3vis4p0/c
   g==;
X-CSE-ConnectionGUID: 6viJilUMQMS0i1YfiLMwzQ==
X-CSE-MsgGUID: ECE+S/+wRUOqEFTzRY8w/g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 00:14:46 +0300
X-CSE-ConnectionGUID: d2Mj9Z/LTAyQwRo8bu/WlA==
X-CSE-MsgGUID: awrFJsz0TTW7kTmYesvBUg==
Received: from unknown (HELO epgd034.me-corp.lan) ([10.154.54.3])
  by ces03_data.me-corp.lan with SMTP; 23 Jun 2026 00:19:45 +0300
Received: by epgd034.me-corp.lan (sSMTP sendmail emulation); Tue, 23 Jun 2026 00:14:45 +0300
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
Subject: [PATCH 3/4] riscv: vmcore_info: export riscv arch-specific struct offsets to vmcoreinfo
Date: Tue, 23 Jun 2026 00:14:29 +0300
Message-ID: <20260622211430.4008899-4-pnina.feder@mobileye.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	R_DKIM_PERMFAIL(0.00)[mobileye.com:s=MoEyIP];
	DKIM_TRACE(0.00)[mobileye.com:~];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15169-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[pnina.feder@mobileye.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:bhe@redhat.com,m:rppt@kernel.org,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:ruirui.yang@linux.dev,m:corbet@lwn.net,m:alex@ghiti.fr,m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-doc@vger.kernel.org,m:pnina.feder@mobileye.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A85D6B26FD

Export RISC-V architecture-specific struct offsets needed by the
vmcore-tasks tool, including signal frame layouts and register
context structures used to reconstruct user-space register state
from a vmcore dump.

Signed-off-by: Pnina Feder <pnina.feder@mobileye.com>
---
 .../admin-guide/kdump/vmcoreinfo.rst          | 26 +++++++++++++++++++
 arch/riscv/kernel/signal.c                    |  8 ++++++
 arch/riscv/kernel/vmcore_info.c               | 11 ++++++++
 3 files changed, 45 insertions(+)

diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
index 36103b3cdc05..3c364434b846 100644
--- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
+++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
@@ -595,6 +595,32 @@ va_kernel_pa_offset
 Indicates the offset between the kernel virtual and physical mappings.
 Used to translate virtual to physical addresses.
 
+STACK_ALIGN
+-----------
+
+Stack alignment requirement for the architecture. Used to locate signal
+frames on the user stack.
+
+(sigcontext, sc_regs)
+---------------------
+
+Offset of the saved register array within struct sigcontext. Used to
+extract user-space register state from signal frames in a vmcore dump.
+
+_PAGE_PFN_SHIFT
+---------------
+
+The bit shift to extract the PFN from a page table entry. Used for
+virtual-to-physical address translation when walking page tables from
+a vmcore dump.
+
+(rt_sigframe, uc)
+-----------------
+
+Offset of the ucontext member within the RISC-V rt_sigframe structure.
+Used to locate the signal context (and thus saved registers) within a
+signal frame on the user stack.
+
 Task and VMA metadata
 =====================
 
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 59784dc117e4..eb03c0ea6aae 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -13,6 +13,7 @@
 #include <linux/resume_user_mode.h>
 #include <linux/linkage.h>
 #include <linux/entry-common.h>
+#include <linux/vmcore_info.h>
 
 #include <asm/ucontext.h>
 #include <asm/vdso.h>
@@ -40,6 +41,13 @@ struct rt_sigframe {
 #endif
 };
 
+#ifdef CONFIG_VMCORE_INFO
+void riscv_rt_signal_frame(void)
+{
+	VMCOREINFO_OFFSET(rt_sigframe, uc);
+}
+#endif
+
 #ifdef CONFIG_FPU
 static long restore_fp_state(struct pt_regs *regs,
 			     union __riscv_fp_state __user *sc_fpregs)
diff --git a/arch/riscv/kernel/vmcore_info.c b/arch/riscv/kernel/vmcore_info.c
index c27efceec3cc..dd174042dba3 100644
--- a/arch/riscv/kernel/vmcore_info.c
+++ b/arch/riscv/kernel/vmcore_info.c
@@ -3,6 +3,12 @@
 #include <linux/vmcore_info.h>
 #include <linux/pagemap.h>
 
+#include <asm/processor.h>
+#include <asm/pgtable-bits.h>
+#include <asm/sigcontext.h>
+
+extern void riscv_rt_signal_frame(void);
+
 static inline u64 get_satp_value(void)
 {
 	return csr_read(CSR_SATP);
@@ -28,4 +34,9 @@ void arch_crash_save_vmcoreinfo(void)
 						kernel_map.va_kernel_pa_offset);
 	vmcoreinfo_append_str("KERNELOFFSET=%lx\n", kaslr_offset());
 	vmcoreinfo_append_str("NUMBER(satp)=0x%llx\n", get_satp_value());
+	riscv_rt_signal_frame();
+
+	VMCOREINFO_NUMBER(STACK_ALIGN);
+	VMCOREINFO_OFFSET(sigcontext, sc_regs);
+	VMCOREINFO_NUMBER(_PAGE_PFN_SHIFT);
 }
-- 
2.43.0


