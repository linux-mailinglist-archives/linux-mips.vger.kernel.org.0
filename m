Return-Path: <linux-mips+bounces-13638-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hITqG2TStWlc5gAAu9opvQ
	(envelope-from <linux-mips+bounces-13638-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 22:25:56 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 478C128EF9F
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 22:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6297302AE2D
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 21:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C8623BD17;
	Sat, 14 Mar 2026 21:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b="gir/KaIm"
X-Original-To: linux-mips@vger.kernel.org
Received: from sg-1-14.ptr.blmpb.com (sg-1-14.ptr.blmpb.com [118.26.132.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74D9139D
	for <linux-mips@vger.kernel.org>; Sat, 14 Mar 2026 21:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773523553; cv=none; b=DwKM7KK5fyoVKEL5e1peOYdwazVbh7qphN2znYdMtLMIQ5ZGmTejBQAe1cdZU2tQRYqfI4Re+hgW13TYNlzHFKLJP7Kv3FHbuZpeDx+RbSCvGkwYukPdr8fOAB1Lb9feiQKWYK9FQ3Dg8AScnX64JeuWdsOwV5yg5IAPmxPOGA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773523553; c=relaxed/simple;
	bh=2l8Aq3q47mZIeyFLFz+qNp49rySAqazzEA425JL2ccY=;
	h=Cc:Mime-Version:Content-Type:Subject:Message-Id:To:From:Date; b=nuYP0RJw2Qc9Hvh/ULPgGsHfFQ+PyJRK3IIreTaST9DIsFFpY+f77Yg3fXHK6TR1exyZ3YRMT3FTqxKeqsQvsjy3iJ+QctaqT7XNANSNtS8FWGMc04s3UtlZ+77eAOyep0AwR3DQQmbjMtm4P6oZV6Hp6XU27HsPyxzuptxQEf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com; spf=pass smtp.mailfrom=oss.cipunited.com; dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b=gir/KaIm; arc=none smtp.client-ip=118.26.132.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1773522820;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=kdAHhY4LzOSTwrWeGlffF4IZm5AJOs7Wf+YiF6CWeho=;
 b=gir/KaImGq6hmyBOzgLhWX9E2p+8SjamXGrTfmKNwshlGXbLT2QcDyj/gChbqGOkwSZ6xP
 xIRLsmxxtHE+YcaO3RtPlUxvQrYS4nPbZR7jEia/uv+WLhqC3WDbbwM74o8Pr+jA5ZaxMG
 J1kBjCPeVbpRkQYGv1UXu1Y2y/TXYRa/fnLMuoh3G+t0hQGWkSMmbeUoQbxwcbeCNabsx8
 xYHzXp81RHvPXiD27L6S6L/hdAU6lo+NNIBUGsDKKbmzt5ewyzwrZpb9u6NamCMlfIgHO/
 AdbEA2yxlHzHjdboLuKqOhlAAcNMLdwEs1MhzEz8zRcIAbR1wax1iyL9VZfClw==
Cc: "Rong Zhang" <rongrong@oss.cipunited.com>, "Yao Zi" <me@ziyao.cc>, 
	<linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Icenowy Zheng" <uwu@icenowy.me>, "Rong Zhang" <i@rong.moe>, 
	<stable@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Received: from tb ([223.88.91.90]) by smtp.feishu.cn with ESMTPS; Sun, 15 Mar 2026 05:13:38 +0800
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
Subject: [PATCH] MIPS: Loongson64: env: Check UARTs passed by LEFI cautiously
Message-Id: <20260314211336.408561-1-rongrong@oss.cipunited.com>
To: "Huacai Chen" <chenhuacai@kernel.org>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Date: Sun, 15 Mar 2026 05:13:29 +0800
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+269b5cf82+40a837+vger.kernel.org+rongrong@oss.cipunited.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oss.cipunited.com,none];
	R_DKIM_ALLOW(-0.20)[oss.cipunited.com:s=feishu2303200042];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13638-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rongrong@oss.cipunited.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[oss.cipunited.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cipunited.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.cipunited.com:dkim,oss.cipunited.com:mid]
X-Rspamd-Queue-Id: 478C128EF9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some firmware does not set nr_uarts properly and passes empty items.
Iterate at most min(system->nr_uarts, MAX_UARTS) items to prevent
out-of-bounds access, and ignore UARTs with addr 0 silently.

Meanwhile, our DT only works with UPIO_MEM but theoretically firmware
may pass other IO types, so explicitly check against that.

Tested on Loongson-LS3A4000-7A1000-NUC-SE.

Fixes: 3989ed418483 ("MIPS: Loongson64: env: Fixup serial clock-frequency when using LEFI")
Cc: stable@vger.kernel.org
Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 arch/mips/loongson64/env.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 11ddf02d6a15..c6b99b3740ea 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -17,8 +17,10 @@
 #include <linux/dma-map-ops.h>
 #include <linux/export.h>
 #include <linux/libfdt.h>
+#include <linux/minmax.h>
 #include <linux/pci_ids.h>
 #include <linux/string_choices.h>
+#include <linux/serial_core.h>
 #include <asm/bootinfo.h>
 #include <loongson.h>
 #include <boot_param.h>
@@ -106,9 +108,23 @@ static void __init lefi_fixup_fdt(struct system_loongson *system)
 
 	is_loongson64g = (read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64G;
 
-	for (i = 0; i < system->nr_uarts; i++) {
+	for (i = 0; i < min(system->nr_uarts, MAX_UARTS); i++) {
 		uartdev = &system->uarts[i];
 
+		/*
+		 * Some firmware does not set nr_uarts properly and passes empty
+		 * items. Ignore them silently.
+		 */
+		if (uartdev->uart_base == 0)
+			continue;
+
+		/* Our DT only works with UPIO_MEM. */
+		if (uartdev->iotype != UPIO_MEM) {
+			pr_warn("Ignore UART 0x%llx with iotype %u passed by firmware\n",
+				uartdev->uart_base, uartdev->iotype);
+			continue;
+		}
+
 		ret = lefi_fixup_fdt_serial(fdt_buf, uartdev->uart_base,
 					    uartdev->uartclk);
 		/*

base-commit: 69237f8c1f69112cca7388af7fab6d0ee45a2525
-- 
2.53.0

