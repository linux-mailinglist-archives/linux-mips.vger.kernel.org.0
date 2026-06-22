Return-Path: <linux-mips+bounces-15168-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DDOXAA2mOWrpvwcAu9opvQ
	(envelope-from <linux-mips+bounces-15168-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 23:15:57 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB56B26F7
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 23:15:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=mobileye.com header.s=MoEyIP header.b=iDcg1H9L;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15168-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15168-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=mobileye.com (policy=quarantine);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CDACA3034217
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 21:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1CD367B68;
	Mon, 22 Jun 2026 21:15:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com [23.90.104.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4865735DA68;
	Mon, 22 Jun 2026 21:15:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782162953; cv=none; b=t863pNwTKd6plAYfoc+gJB+x/bvZ8P5FpgrkeV3keX3acrZH9ZOiQ2W9t8ghOhru9FGTZrsKk4EEm7Ja/N7Oo2uMIAvyEsWnBxLzDcVWKenfRdAGmQzsAxGSazZ523Sw/uEB4XwybjckybqrAkk1vfCMVJ2OqmYYmgKThj8OvN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782162953; c=relaxed/simple;
	bh=6BSSkCU+NkPV6pTJggNtiu9r13kyn8sWkrRXlCMT02U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvY6oGNqxJoXN5soGb/6tkAhy4UaSS2uyT7vV6gDRwlRUIC9ioOUaaA3oazr/O0Z2t0wNELl9HOYCFcGQjYCpDvChK3sjhCsTM3EgpViL8Nf2NZLm1gBRHTStEoYw2btRGGYybyJ5WE/Y4KcL0Dz3F0hCi+fCQHlNh2yy/Hps+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=iDcg1H9L reason="key not found in DNS"; arc=none smtp.client-ip=23.90.104.147
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1782162951; x=1813698951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6BSSkCU+NkPV6pTJggNtiu9r13kyn8sWkrRXlCMT02U=;
  b=iDcg1H9LQQqSLT7nSsh5d65QzL3ncOstEswhp9GICiYjmo/TzgAmvzVK
   oOt9oAd9jf2hekjk+v2MuNp5ueSEL7GqTWYYJaalxA1xYM1seVFtBSg1e
   KK0Q1zhVwVyfbFWd3ng8cStRA+e94R4lxaSMEfP37nyJIj8PMRAs43d8x
   i2qpmk3g6yL2MY5Brli3Blc2cnLpb4eNks97gR7RJ4ii5b/6KHRQtMCNP
   seDx1+vEjVwd+QrbC+8nD4ujeMliCZF2OYd6qVA/YwvxPMoSKRhXClFzE
   ioGoeldfr6gnbdbGQoN7YxrEzKmBFnKg3NK3FibtC10FhjQOageEMBVrh
   w==;
X-CSE-ConnectionGUID: m/694ET+Ti6VJSs4MjetgA==
X-CSE-MsgGUID: HeqJgrjvREGSEqVRiJRQ5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 00:14:44 +0300
X-CSE-ConnectionGUID: +BChgPoUTmWAZnmRsk2pqw==
X-CSE-MsgGUID: usVcw5RxR/2NhQhyF0UC9A==
Received: from unknown (HELO epgd034.me-corp.lan) ([10.154.54.3])
  by ces02_data.me-corp.lan with SMTP; 23 Jun 2026 00:19:53 +0300
Received: by epgd034.me-corp.lan (sSMTP sendmail emulation); Tue, 23 Jun 2026 00:14:43 +0300
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
Subject: [PATCH 2/4] vmcoreinfo: export task and mm struct offsets to vmcoreinfo
Date: Tue, 23 Jun 2026 00:14:28 +0300
Message-ID: <20260622211430.4008899-3-pnina.feder@mobileye.com>
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
	TAGGED_FROM(0.00)[bounces-15168-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: 97CB56B26F7

Export the struct offsets and sizes needed by the vmcore-tasks tool
to walk task lists, extract register state, and enumerate VMAs from
a vmcore dump. This includes offsets into task_struct, mm_struct,
vm_area_struct, and related structures that are not already covered
by existing vmcoreinfo exports.

Signed-off-by: Pnina Feder <pnina.feder@mobileye.com>
---
 .../admin-guide/kdump/vmcoreinfo.rst          | 77 +++++++++++++++++++
 kernel/vmcore_info.c                          | 60 +++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
index 7663c610fe90..36103b3cdc05 100644
--- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
+++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
@@ -594,3 +594,80 @@ va_kernel_pa_offset
 
 Indicates the offset between the kernel virtual and physical mappings.
 Used to translate virtual to physical addresses.
+
+Task and VMA metadata
+=====================
+
+The following vmcoreinfo entries export struct offsets and sizes needed
+to walk task lists, extract register state, and enumerate VMAs from a
+vmcore dump without requiring kernel debug symbols (DWARF/BTF). Used by
+the vmcore-tasks userspace tool for lightweight post-mortem crash
+analysis.
+
+init_task
+---------
+
+The address of the initial task (swapper). Used as the starting point
+to walk the circular task list via the tasks member.
+
+(task_struct, tasks)|(task_struct, pid)|(task_struct, tgid)|(task_struct, comm)|(task_struct, mm)|(task_struct, stack)|(task_struct, signal)|(task_struct, flags)|(task_struct, __state)|(task_struct, exit_state)|(task_struct, thread_node)
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
+
+Offsets into task_struct needed to extract per-task metadata: process
+name, PID/TGID, task state, kernel stack pointer, mm_struct pointer,
+signal_struct pointer, and thread group linkage.
+
+(signal_struct, thread_head)|(signal_struct, nr_threads)
+--------------------------------------------------------
+
+Offsets into signal_struct for walking the thread group list and
+determining the number of threads.
+
+(mm_struct, mm_mt)|(mm_struct, pgd)|(mm_struct, start_brk)|(mm_struct, brk)|(mm_struct, start_stack)
+----------------------------------------------------------------------------------------------------
+
+Offsets into mm_struct for accessing the VMA maple tree, page global
+directory, and memory layout boundaries.
+
+Maple tree internals
+--------------------
+
+Offsets for maple_tree, maple_node, maple_range_64, maple_arange_64,
+and maple_metadata structures. These are needed to walk the maple tree
+that stores VMAs (mm_struct.mm_mt) from a vmcore dump.
+
+(vm_area_struct, vm_start)|(vm_area_struct, vm_end)|(vm_area_struct, vm_flags)|(vm_area_struct, vm_file)|(vm_area_struct, vm_mm)
+-------------------------------------------------------------------------------------------------------------------------------
+
+Offsets into vm_area_struct for extracting VMA boundaries, permissions,
+backing file, and owning mm_struct.
+
+(file, f_path)|(path, dentry)|(dentry, d_name)|(dentry, d_parent)|(qstr, hash_len)|(qstr, name)
+------------------------------------------------------------------------------------------------
+
+Offsets for traversing file -> path -> dentry -> name to reconstruct
+the filename backing a VMA.
+
+THREAD_SIZE
+-----------
+
+The size of the kernel stack. Used to locate the pt_regs saved at the
+top of the kernel stack for each task.
+
+(ucontext, uc_mcontext)
+-----------------------
+
+Offset of the machine context within struct ucontext. Used to locate
+saved registers within a signal frame.
+
+__NR_rt_sigreturn
+-----------------
+
+The rt_sigreturn syscall number. Used to identify signal frame return
+trampolines on the user stack during backtrace reconstruction.
+
+CONFIG_PGTABLE_LEVELS|PMD_SHIFT|PGDIR_SHIFT
+--------------------------------------------
+
+Page table geometry constants. Used for walking page tables to translate
+user virtual addresses to physical addresses in a vmcore dump.
diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index 8614430ca212..f963274ab1a2 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -17,6 +17,7 @@
 
 #include <asm/page.h>
 #include <asm/sections.h>
+#include <asm/ucontext.h>
 
 #include "kallsyms_internal.h"
 #include "kexec_internal.h"
@@ -244,6 +245,65 @@ static int __init crash_save_vmcoreinfo_init(void)
 	VMCOREINFO_SYMBOL(kallsyms_offsets);
 #endif /* CONFIG_KALLSYMS */
 
+	VMCOREINFO_SYMBOL(init_task);
+	VMCOREINFO_STRUCT_SIZE(task_struct);
+	VMCOREINFO_OFFSET(task_struct, tasks);
+	VMCOREINFO_OFFSET(task_struct, thread_node);
+	VMCOREINFO_OFFSET(task_struct, pid);
+	VMCOREINFO_OFFSET(task_struct, tgid);
+	VMCOREINFO_OFFSET(task_struct, exit_state);
+	VMCOREINFO_OFFSET(task_struct, __state);
+	VMCOREINFO_OFFSET(task_struct, flags);
+	VMCOREINFO_OFFSET(task_struct, comm);
+	VMCOREINFO_OFFSET(task_struct, stack);
+	VMCOREINFO_OFFSET(task_struct, signal);
+	VMCOREINFO_OFFSET(signal_struct, thread_head);
+	VMCOREINFO_OFFSET(signal_struct, nr_threads);
+	VMCOREINFO_OFFSET(task_struct, mm);
+	VMCOREINFO_STRUCT_SIZE(mm_struct);
+	VMCOREINFO_OFFSET(mm_struct, mm_mt);
+	VMCOREINFO_OFFSET(mm_struct, pgd);
+	VMCOREINFO_OFFSET(mm_struct, start_brk);
+	VMCOREINFO_OFFSET(mm_struct, brk);
+	VMCOREINFO_OFFSET(mm_struct, start_stack);
+	VMCOREINFO_STRUCT_SIZE(maple_tree);
+	VMCOREINFO_OFFSET(maple_tree, ma_root);
+	VMCOREINFO_OFFSET(maple_tree, ma_flags);
+	VMCOREINFO_STRUCT_SIZE(maple_node);
+	VMCOREINFO_OFFSET(maple_node, slot);
+	VMCOREINFO_OFFSET(maple_node, parent);
+	VMCOREINFO_OFFSET(maple_node, ma64);
+	VMCOREINFO_OFFSET(maple_node, mr64);
+	VMCOREINFO_OFFSET(maple_range_64, pivot);
+	VMCOREINFO_OFFSET(maple_range_64, slot);
+	VMCOREINFO_OFFSET(maple_metadata, end);
+	VMCOREINFO_OFFSET(maple_metadata, gap);
+	VMCOREINFO_OFFSET(maple_arange_64, pivot);
+	VMCOREINFO_OFFSET(maple_arange_64, slot);
+	VMCOREINFO_OFFSET(maple_arange_64, gap);
+	VMCOREINFO_OFFSET(maple_arange_64, meta);
+	VMCOREINFO_STRUCT_SIZE(vm_area_struct);
+	VMCOREINFO_OFFSET(vm_area_struct, vm_start);
+	VMCOREINFO_OFFSET(vm_area_struct, vm_end);
+	VMCOREINFO_OFFSET(vm_area_struct, vm_flags);
+	VMCOREINFO_OFFSET(vm_area_struct, vm_file);
+	VMCOREINFO_OFFSET(vm_area_struct, vm_mm);
+	VMCOREINFO_STRUCT_SIZE(file);
+	VMCOREINFO_OFFSET(file, f_path);
+	VMCOREINFO_OFFSET(path, dentry);
+	VMCOREINFO_STRUCT_SIZE(dentry);
+	VMCOREINFO_OFFSET(dentry, d_name);
+	VMCOREINFO_OFFSET(dentry, d_parent);
+	VMCOREINFO_OFFSET(qstr, hash_len);
+	VMCOREINFO_OFFSET(qstr, name);
+	VMCOREINFO_NUMBER(THREAD_SIZE);
+	VMCOREINFO_STRUCT_SIZE(pt_regs);
+	VMCOREINFO_OFFSET(ucontext, uc_mcontext);
+	VMCOREINFO_NUMBER(__NR_rt_sigreturn);
+	VMCOREINFO_NUMBER(CONFIG_PGTABLE_LEVELS);
+	VMCOREINFO_NUMBER(PMD_SHIFT);
+	VMCOREINFO_NUMBER(PGDIR_SHIFT);
+
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
 
-- 
2.43.0


