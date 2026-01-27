Return-Path: <linux-mips+bounces-13021-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBc+FtKteGlasAEAu9opvQ
	(envelope-from <linux-mips+bounces-13021-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 13:21:38 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCB7943C0
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 13:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F71C303D73B
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jan 2026 12:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC34834AAEB;
	Tue, 27 Jan 2026 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PPUTXLwM"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47647312836
	for <linux-mips@vger.kernel.org>; Tue, 27 Jan 2026 12:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516228; cv=none; b=VfcjLdJktDqvRkSoVTTL/W4MHiihKFvE04tu5f7xxTwN7FTqpPrgi/ShJ6rV8PfCELomFsmARmF7w20t8mgBFwffm7twrjLHtpNItc12QFdlcnoI9a775qht3EbjnFQQcIlVwp+Yr0XfpXdMlptpE5uoPFz6m+DOrwconAEZ4Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516228; c=relaxed/simple;
	bh=VLhAYRab+uCXbMXmi0FAQowbk8oZ+0XrtFLxtQv6uEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ic0HR6fL2cLkrZnnJy79Sxvo/w7z7kBzMBa941M/aHdoMPi5p217zMlqML1d1DdVymPVu0e7enKGpGTiSqrK0DZ+CjgDhUREWN/YaRawHjsn/n9kF+BixDUrX7ELCQycCf+CUAycctk1SqBeBn9kiWdDW7HQA1eH3cktmoHOr7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PPUTXLwM; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769516225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9S/xSrdX3PQNdvGeiuAn8WfyMx/Wvh3tfYwOBKYci1k=;
	b=PPUTXLwMU1duEHyeudBnwMgqeL0QFNpFSjT+IpgiJrSgmVNwexEAjm3B23aqu5g9VcrKTg
	Aaw90cmNk5t7rMZujqg3RHg4NK585jt1GbWmBoHuCc2OwJwlcNbfr9XVJ72IPkS44CiySj
	6Y7MLvU/JazKo2G7NgIk8Lrczju32XY=
From: Qi Zheng <qi.zheng@linux.dev>
To: david@kernel.org,
	andreas@gaisler.com,
	richard.weiyang@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dev.jain@arm.com,
	ioworker0@gmail.com,
	linmag7@gmail.com,
	akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-um@lists.infradead.org,
	sparclinux@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 8/8] mm: make PT_RECLAIM depends on MMU_GATHER_RCU_TABLE_FREE
Date: Tue, 27 Jan 2026 20:13:01 +0800
Message-ID: <83b034810935a9ff18e425b085e065bb0acb28f3.1769515122.git.zhengqi.arch@bytedance.com>
In-Reply-To: <cover.1769515122.git.zhengqi.arch@bytedance.com>
References: <cover.1769515122.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13021-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gaisler.com,gmail.com,infradead.org,arm.com,linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qi.zheng@linux.dev,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bytedance.com:mid,bytedance.com:email,linux.dev:dkim]
X-Rspamd-Queue-Id: ADCB7943C0
X-Rspamd-Action: no action

From: Qi Zheng <zhengqi.arch@bytedance.com>

The PT_RECLAIM can work on all architectures that support
MMU_GATHER_RCU_TABLE_FREE, except for those that have selected
HAVE_ARCH_TLB_REMOVE_TABLE,so make PT_RECLAIM depends on
MMU_GATHER_RCU_TABLE_FREE && !HAVE_ARCH_TLB_REMOVE_TABLE.

BTW, change PT_RECLAIM to be enabled by default, since nobody should want
to turn it off.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
---
 arch/x86/Kconfig | 1 -
 mm/Kconfig       | 9 ++-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 80527299f859a..0d22da56a71b0 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -331,7 +331,6 @@ config X86
 	select FUNCTION_ALIGNMENT_4B
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
-	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
 	select ARCH_SUPPORTS_SCHED_SMT		if SMP
 	select SCHED_SMT			if SMP
 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
diff --git a/mm/Kconfig b/mm/Kconfig
index 456e9eaedca39..1f3109b164d86 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1454,14 +1454,9 @@ config ARCH_HAS_USER_SHADOW_STACK
 config HAVE_ARCH_TLB_REMOVE_TABLE
 	def_bool n
 
-config ARCH_SUPPORTS_PT_RECLAIM
-	def_bool n
-
 config PT_RECLAIM
-	bool "reclaim empty user page table pages"
-	default y
-	depends on ARCH_SUPPORTS_PT_RECLAIM && MMU && SMP
-	select MMU_GATHER_RCU_TABLE_FREE
+	def_bool y
+	depends on MMU_GATHER_RCU_TABLE_FREE && !HAVE_ARCH_TLB_REMOVE_TABLE
 	help
 	  Try to reclaim empty user page table pages in paths other than munmap
 	  and exit_mmap path.
-- 
2.20.1


