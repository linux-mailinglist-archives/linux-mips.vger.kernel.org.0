Return-Path: <linux-mips+bounces-13074-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG2cJ8p2fmlgZQIAu9opvQ
	(envelope-from <linux-mips+bounces-13074-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 22:40:26 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2D6C4090
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 22:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2699A3018C03
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 21:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EC73793AF;
	Sat, 31 Jan 2026 21:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b="2jNDJ1Hy"
X-Original-To: linux-mips@vger.kernel.org
Received: from sg-1-23.ptr.blmpb.com (sg-1-23.ptr.blmpb.com [118.26.132.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B8367F29
	for <linux-mips@vger.kernel.org>; Sat, 31 Jan 2026 21:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769895623; cv=none; b=NmUQLouyTxBHcGHsBWiD5m6oE9NGwFvPMEEB+D4yeQMZa4TfGK0vcYULt0ZGbpWP8VPb3YBDwSGS8uXpTLFOS3L3ze7F+YE/1dHpf7WL+wtvjjtj9yNW23s4akLqbQVOdBsJUZWFUJlga0iT6MIJ19bZk1Ei5ixZUzSU38dMH2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769895623; c=relaxed/simple;
	bh=nw1rGU5h5B58d5ADg/fb9Capw24z4Tj9CPtVsWG2hcI=;
	h=Subject:In-Reply-To:Content-Type:References:To:Cc:Date:Message-Id:
	 From:Mime-Version; b=X/ms+iMrTplJ0hkYr2e5fGL/Cvs+4ldxdrAuJDGr4ABIXjgazip/Nt3YFhg4PAlVbT/xmhTP/dh/+478HqEHXx20NnivktVqtYAw3ZnRODgonDvh35apZDBQm9+1f6nHD7ewAmlQcjnDngRKZvcsITwIx1cL58hByAUe0azFTGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com; spf=pass smtp.mailfrom=oss.cipunited.com; dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b=2jNDJ1Hy; arc=none smtp.client-ip=118.26.132.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1769895608;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=TAw50Ptn+GzqCNl1FE6V8D/qQEhhF+S50YqzeyrOu9w=;
 b=2jNDJ1Hy3KnIJ5t5pVmup7spXT8pznfvRoOJwZExhAlwGCbffAkcdcFgOsb7jNrSQRKp0Y
 RR4Sq2F5v2tqVzg8sK08PsdRnlU/uMXcIXbpU1K7YQ9UIlMiSgcAYRqQS5B0KyzMSjx/ti
 zRbsez6CbAgzOaInTi6o3+Ugr32HZJHTyGVXiYybiigcJEphrFjMhyf9vILRUoOg1fXzJk
 mwghLZHgPTNP9xc4NZYkoUYrvPb49AqUWFFPJE3XyeaexI1qF63oCMOoS9VZAez/cITQdk
 p/IJPtGbx7Ycm5ppanmq5wPZh1YEdTKVz8/sQhZY6WMUBJXpePFJW1U3UQi7GA==
Subject: [PATCH 1/2] MIPS: Loongson2ef: Register PCI controller in early stage
Content-Transfer-Encoding: 7bit
In-Reply-To: <20260131214003.833520-1-rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
Received: from tb.lan ([223.88.91.217]) by smtp.feishu.cn with ESMTPS; Sun, 01 Feb 2026 05:40:06 +0800
References: <20260131214003.833520-1-rongrong@oss.cipunited.com>
To: "Jiaxun Yang" <jiaxun.yang@flygoat.com>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Rong Zhang" <rongrong@oss.cipunited.com>, "Rong Zhang" <i@rong.moe>, 
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	<linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<stable@vger.kernel.org>, "Beiyan Yun" <root@infi.wang>, 
	"Yao Zi" <me@ziyao.cc>
Date: Sun,  1 Feb 2026 05:32:58 +0800
Message-Id: <20260131214003.833520-2-rongrong@oss.cipunited.com>
X-Mailer: git-send-email 2.51.0
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+2697e76b6+ad79ad+vger.kernel.org+rongrong@oss.cipunited.com>
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oss.cipunited.com,none];
	R_DKIM_ALLOW(-0.20)[oss.cipunited.com:s=feishu2303200042];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13074-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rongrong@oss.cipunited.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[oss.cipunited.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.cipunited.com:mid,oss.cipunited.com:dkim]
X-Rspamd-Queue-Id: 7C2D6C4090
X-Rspamd-Action: no action

We are about to set loongson_pci_io_resource.start to 0 and adopt
PCIBIOS_MIN_IO. As the first step, PCI controller needs to be registered
in early stage to make it the root of other resources (e.g., i8259) and
prevent resource conflicts.

Register it in plat_mem_setup() instead of arch_initcall().

Fixes: ae81aad5c2e1 ("MIPS: PCI: Use pci_enable_resources()")
Cc: stable@vger.kernel.org
Tested-by: Beiyan Yun <root@infi.wang>
Tested-by: Yao Zi <me@ziyao.cc>
Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 arch/mips/include/asm/mach-loongson2ef/loongson.h | 6 ++++++
 arch/mips/loongson2ef/common/pci.c                | 7 +------
 arch/mips/loongson2ef/common/setup.c              | 1 +
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson2ef/loongson.h b/arch/mips/include/asm/mach-loongson2ef/loongson.h
index 4a098fb102325..0e586787eb87a 100644
--- a/arch/mips/include/asm/mach-loongson2ef/loongson.h
+++ b/arch/mips/include/asm/mach-loongson2ef/loongson.h
@@ -324,4 +324,10 @@ extern unsigned long _loongson_addrwincfg_base;
 
 #endif	/* ! CONFIG_CPU_SUPPORTS_ADDRWINCFG */
 
+#ifdef CONFIG_PCI
+void loongson2ef_pcibios_init(void);
+#else
+static inline void loongson2ef_pcibios_init(void) { }
+#endif
+
 #endif /* __ASM_MACH_LOONGSON2EF_LOONGSON_H */
diff --git a/arch/mips/loongson2ef/common/pci.c b/arch/mips/loongson2ef/common/pci.c
index 7d9ea51e8c01e..55524f9a7b96b 100644
--- a/arch/mips/loongson2ef/common/pci.c
+++ b/arch/mips/loongson2ef/common/pci.c
@@ -73,15 +73,10 @@ static void __init setup_pcimap(void)
 #endif
 }
 
-static int __init pcibios_init(void)
+void __init loongson2ef_pcibios_init(void)
 {
 	setup_pcimap();
 
 	loongson_pci_controller.io_map_base = mips_io_port_base;
 	register_pci_controller(&loongson_pci_controller);
-
-
-	return 0;
 }
-
-arch_initcall(pcibios_init);
diff --git a/arch/mips/loongson2ef/common/setup.c b/arch/mips/loongson2ef/common/setup.c
index 4fd27f4f90edb..a639e35acce59 100644
--- a/arch/mips/loongson2ef/common/setup.c
+++ b/arch/mips/loongson2ef/common/setup.c
@@ -27,4 +27,5 @@ EXPORT_SYMBOL(__wbflush);
 
 void __init plat_mem_setup(void)
 {
+	loongson2ef_pcibios_init();
 }
-- 
2.51.0

