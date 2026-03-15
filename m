Return-Path: <linux-mips+bounces-13647-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEYPAILutmnnKgEAu9opvQ
	(envelope-from <linux-mips+bounces-13647-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 18:38:10 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EA9291CB5
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 18:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02060300C93D
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 17:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858A6375F96;
	Sun, 15 Mar 2026 17:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b="Ef6UNyM5"
X-Original-To: linux-mips@vger.kernel.org
Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75A0371878
	for <linux-mips@vger.kernel.org>; Sun, 15 Mar 2026 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595715; cv=none; b=r0KgsNdxN09lAdZQGaW9lwuPHl2AZH/ymLe4meW0J/xeO3U89VMZJSzejERwn/H7CocPcq05pRu/nxbDw/bjB6OcvutH2tWUyQukyhQCjj4N6Xcl5+sAHbQFbrKhTwuB9oA27LT0ijYJO5QbP84yqoDGiSbKnscW/ObcIH3q6no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595715; c=relaxed/simple;
	bh=DLTV3DEPiYVrighbdNLryHvZFnfJ7hnxF/o0bJ9aoog=;
	h=Mime-Version:Date:References:To:Subject:Message-Id:In-Reply-To:
	 Content-Type:Cc:From; b=EnMoyTY3ruvlv/vINUx+o6ey1b9wdcimAwne2LE4OkgoiEZIjsADDjAjrXL5yQJ9/GWzgi20bPUH+DOvLqntD+vD/ODnlafBT/yDqR5HTEuSjI8E5ldkGpxa1PhHOrKHHT9cSiBOBts4FfPhQcVV5M4U2HG/QHhJvvyC2HXhQwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com; spf=pass smtp.mailfrom=oss.cipunited.com; dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b=Ef6UNyM5; arc=none smtp.client-ip=209.127.231.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1773595708;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=NzlBNr0cDChkbzT0CUkDLqCb6VHS1coc88/duTE3E+s=;
 b=Ef6UNyM5nHmwwPYPBbh4YXQG2Sr8u/g0UovNvBrzsN6gfCJZowJbg3vZPlwrSad47mo9GE
 vMDrJCzR/exg9RNV5+hgFQW5Wd+xdIUkXFLISx74RJq5lxfwrA6zK06fs3m5QycE5NKUDQ
 d6+YCxhhdIgVNmCflPt2XQSfmUiKPil1sd9GHDxXsYhPswpWBcVuocBunVSzDlJ8jAB3/v
 oSdslIfrccEmDJYO3LRMHfslegBWuBvvORrzqy0zQbquMY/Pbz0rMuoLLmEvUCPOkwU4Fp
 KTODyTBvxXdbgDC9TD7NOqVOw5U+t+8SBeVOcWDKL6hU1L1aLa7ZXKxEP+KCjQ==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from tb ([223.88.91.90]) by smtp.feishu.cn with ESMTPS; Mon, 16 Mar 2026 01:28:25 +0800
Date: Mon, 16 Mar 2026 01:28:22 +0800
X-Lms-Return-Path: <lba+269b6ec3a+10028e+vger.kernel.org+rongrong@oss.cipunited.com>
References: <20260314211336.408561-1-rongrong@oss.cipunited.com>
To: "Huacai Chen" <chenhuacai@kernel.org>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH v2] MIPS: Loongson64: env: Check UARTs passed by LEFI cautiously
Message-Id: <20260315172824.352412-1-rongrong@oss.cipunited.com>
In-Reply-To: <20260314211336.408561-1-rongrong@oss.cipunited.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Cc: "Rong Zhang" <rongrong@oss.cipunited.com>, "Yao Zi" <me@ziyao.cc>, 
	<linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Icenowy Zheng" <uwu@icenowy.me>, "Rong Zhang" <i@rong.moe>, 
	<stable@vger.kernel.org>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
X-Mailer: git-send-email 2.53.0
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
X-Spamd-Result: default: False [8.84 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:email];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13647-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[oss.cipunited.com:s=feishu2303200042];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[oss.cipunited.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rongrong@oss.cipunited.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[oss.cipunited.com:+];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.713];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.cipunited.com:dkim,oss.cipunited.com:mid,ziyao.cc:email,cipunited.com:email]
X-Rspamd-Queue-Id: 55EA9291CB5
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

Some firmware does not set nr_uarts properly and passes empty items.
Iterate at most min(system->nr_uarts, MAX_UARTS) items to prevent
out-of-bounds access, and ignore UARTs with addr 0 silently.

Meanwhile, our DT only works with UPIO_MEM but theoretically firmware
may pass other IO types, so explicitly check against that.

Tested on Loongson-LS3A4000-7A1000-NUC-SE.

Fixes: 3989ed418483 ("MIPS: Loongson64: env: Fixup serial clock-frequency when using LEFI")
Cc: stable@vger.kernel.org
Reviewed-by: Yao Zi <me@ziyao.cc>
Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
Changes in v2:
- Sort new includes alphabetically (thanks Yao Zi)
---
 arch/mips/loongson64/env.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 11ddf02d6a15..7abcca7ab4ed 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -17,7 +17,9 @@
 #include <linux/dma-map-ops.h>
 #include <linux/export.h>
 #include <linux/libfdt.h>
+#include <linux/minmax.h>
 #include <linux/pci_ids.h>
+#include <linux/serial_core.h>
 #include <linux/string_choices.h>
 #include <asm/bootinfo.h>
 #include <loongson.h>
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

base-commit: 267594792a71018788af69e836c52e34bb8054af
-- 
2.53.0

