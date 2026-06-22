Return-Path: <linux-mips+bounces-15166-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AtbtDQmmOWrnvwcAu9opvQ
	(envelope-from <linux-mips+bounces-15166-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 23:15:53 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 857156B26EF
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 23:15:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=mobileye.com header.s=MoEyIP header.b=W8rrN4ye;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15166-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15166-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=mobileye.com (policy=quarantine);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 320FD300DE23
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 21:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B0430C37E;
	Mon, 22 Jun 2026 21:15:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com [207.54.77.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1F62620DE;
	Mon, 22 Jun 2026 21:15:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782162950; cv=none; b=AeNO3R8KSvHWl+OVg0mFOVJMfeUIH5qyXdzrM7YAQlxaBjIuDlV8GQgnCfX1TxGfL4ho9gXfPQLjLWf2Cy0jQaBofSD8bd37PUe0WAolblY0HEZGMCsgEjZYdS+v380TVWlmUiTRxHvh28lTC4qlyaqT8JxaHLDphol1NOvAYng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782162950; c=relaxed/simple;
	bh=D3y8PBJx5rtb8CmEmDXgcyrYvH9ZgsAHrPcIa59UTq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PCXeB6QfZXt5a4Yki5LkTWG6lO4ibMfWzNw9aS1N96tPF1YQW2jeFf/35iYt2x506o6HB6BhlNN6gjxLfFEa1YtyQDySfVhT2qmzM1+8/9cvr03Ft4jKlnjgg3KPTpEfTgnJftDiA7YeXov1ysYjf1ZP/Q3ieONJlojdLLK3l6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=W8rrN4ye reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.171
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1782162947; x=1813698947;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D3y8PBJx5rtb8CmEmDXgcyrYvH9ZgsAHrPcIa59UTq4=;
  b=W8rrN4ye+6FMk6jAmUigC1L4KWWW+1+l5GO7kUYuY1P7XXqjy3tUwgiC
   uOw498NeFH2oBZiR4nM2jYu2z8J9CE/au+g3CzCqj011vPVVFGOXyRLMr
   gBVH9oqsDvGBcu4yXY5NoJArfNDaJi0FwDQGgTMBbDKbs1Myol/NfxCJ5
   bBL35SV9e60nx4CMKavMsA2+gWsXlzqyGyF8vV11XRZFrNsrl5Khlvg10
   GhXO6xW4ZGPZW5GzK8e0Gy+uGUA2GKNQGY4EnXiuIjPLpKRp34lO/65kq
   Lq1W+AbWvtrsbJ157JW5BXUBDTatbybk9fCSNRTTO+FY7ujkNzrBp+XRO
   Q==;
X-CSE-ConnectionGUID: XEI7F5klSBWpX1iYm148Xg==
X-CSE-MsgGUID: B7hWNtgQRL6N9q1Ieybbqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 00:14:36 +0300
X-CSE-ConnectionGUID: IJ4IgnLqQFWzySBMiwjKVQ==
X-CSE-MsgGUID: aQq98ZxbQ3KVyRPomf/Zzg==
Received: from unknown (HELO epgd034.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 23 Jun 2026 00:19:42 +0300
Received: by epgd034.me-corp.lan (sSMTP sendmail emulation); Tue, 23 Jun 2026 00:14:34 +0300
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
Subject: [PATCH 0/4] vmcore-tasks: export per-task metadata to vmcoreinfo
Date: Tue, 23 Jun 2026 00:14:26 +0300
Message-ID: <20260622211430.4008899-1-pnina.feder@mobileye.com>
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
	TAGGED_FROM(0.00)[bounces-15166-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 857156B26EF

This series extends vmcoreinfo with struct offsets and sizes needed by
the vmcore-tasks userspace tool to extract per-task state from a vmcore
dump without requiring kernel debug symbols (DWARF/BTF).

The vmcore-tasks tool reads /proc/vmcore (or a saved vmcore file) and
reconstructs, for each task:
  - task name, pid, state, flags
  - VMA list (start, end, flags, backing file)
  - user register state (saved on the kernel stack at kernel entry)
  - user-space backtrace with VMA/filename mapping
  - kernel dmesg buffer

This provides a lightweight post-mortem crash analysis capability for
production environments where full debug info (DWARF/BTF) is not
available.

The companion userspace tool is submitted to kexec-tools:
  https://lore.kernel.org/all/20260622205550.1087163-1-pnina.feder@mobileye.com/

The series is structured as follows:

  Patch 1: Increase vmcoreinfo buffer from PAGE_SIZE to a fixed SZ_8K,
           decoupled from page size to avoid waste on large-page
           architectures (MIPS 16KB, arm64 64KB).

  Patch 2: Export generic struct offsets (task_struct, mm_struct,
           vm_area_struct, maple_tree, file/dentry/path, pt_regs,
           signal_struct) needed to walk task lists and VMAs.

  Patch 3: Export RISC-V arch-specific offsets (signal frame layouts,
           register context structures) for user register extraction.

  Patch 4: Export MIPS arch-specific offsets (signal frame layouts,
           register context structures) for user register extraction.

Additional architecture support (arm64, x86, etc.) can follow the
same pattern established by patches 3 and 4.

Tested on MIPS64 (QEMU Malta) and RISC-V with full kdump pipeline:
primary kernel -> kexec panic -> crash kernel -> vmcore-tasks analysis.

Pnina Feder (4):
  vmcoreinfo: increase vmcoreinfo buffer to 8KB
  vmcoreinfo: export task and mm struct offsets to vmcoreinfo
  riscv: vmcore_info: export riscv arch-specific struct offsets to
    vmcoreinfo
  mips: vmcore_info: export mips arch-specific struct offsets to
    vmcoreinfo

 .../admin-guide/kdump/vmcoreinfo.rst          | 137 ++++++++++++++++++
 arch/mips/kernel/Makefile                     |   1 +
 arch/mips/kernel/signal.c                     |   8 +
 arch/mips/kernel/vmcore_info.c                |  22 +++
 arch/riscv/kernel/signal.c                    |   8 +
 arch/riscv/kernel/vmcore_info.c               |  11 ++
 include/linux/vmcore_info.h                   |   3 +-
 kernel/vmcore_info.c                          |  60 ++++++++
 8 files changed, 249 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/kernel/vmcore_info.c

-- 
2.43.0


