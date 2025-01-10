Return-Path: <linux-mips+bounces-7353-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D646A09856
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2025 18:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28C79168FA8
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2025 17:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAE42139AC;
	Fri, 10 Jan 2025 17:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="Ug+DJXQP"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB633213254;
	Fri, 10 Jan 2025 17:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.248.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736529758; cv=none; b=j5Wbo2aKOIdu1V/wn6EvFt3ZozJIMIh0iKn6MjIELip2oepiMGGGscLrPkwq/6d0AvUqQkyIHmOVFv9/9twtW/fQD3x+OsZXShohVg7xkcd/MKIYSaNKnStr2nw5l1BTi6AxbbZRBzI2cyBCwxfY3dSQfZDHJUUEp4G43WBKXt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736529758; c=relaxed/simple;
	bh=l325ifDn/u3mvHIJGA+iKBHWUnwAJ2KdGJ8eM0wsi8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DWOURch+Qs2EQf0LfpkwCN3vizeEHakzwKo5LHYL6XpEB/fcUDRgXI+nG3xjyKC1yMTo41gWhF6x5eQglcYQ8kP43logQcrSzfTt0bsE+FTv9odEuiOiPRAr/NKX81CS8+G2uFAsxs7yg22jTtEwiuzr0qsofcWGLFH58E+9T5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=Ug+DJXQP; arc=none smtp.client-ip=159.100.248.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id CCAB12675E;
	Fri, 10 Jan 2025 17:22:34 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id E0D3F3E8EB;
	Fri, 10 Jan 2025 18:22:26 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 50DC240078;
	Fri, 10 Jan 2025 17:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1736529746; bh=l325ifDn/u3mvHIJGA+iKBHWUnwAJ2KdGJ8eM0wsi8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ug+DJXQPLGfst/6z74ziZ19lG4BcVV9zE5CGDB+je7u4e/K0Km+RFwN8WaUslY5JD
	 zw9lC7Ou6H68GymNKtVm6mIGnkqC/kgZ+SKhEbAvNj87Cr12cdm5U0pEOHu6KJ30mi
	 kr+vLwRCHL/j1k4OPI7Toz6R1AXM62VVB7IWxHcM=
Received: from ProArtB550-CREATOR. (unknown [58.32.41.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 170874146B;
	Fri, 10 Jan 2025 17:22:23 +0000 (UTC)
From: Kexy Biscuit <kexybiscuit@aosc.io>
Date: Sat, 11 Jan 2025 01:22:09 +0800
Subject: [PATCH 2/2] MIPS: Loongson: Add comments for interface_info
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-loongson64-boardinfo-no-size-v1-2-e9f26fcd069e@aosc.io>
References: <20250111-loongson64-boardinfo-no-size-v1-0-e9f26fcd069e@aosc.io>
In-Reply-To: <20250111-loongson64-boardinfo-no-size-v1-0-e9f26fcd069e@aosc.io>
To: Huacai Chen <chenhuacai@kernel.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kexy Biscuit <kexybiscuit@aosc.io>, Icenowy Zheng <uwu@icenowy.me>
X-Mailer: b4 0.14.2
X-Spamd-Result: default: False [-4.10 / 10.00];
	REPLY(-4.00)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[kexybiscuit.aosc.io:server fail,uwu.icenowy.me:server fail];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 50DC240078

Clarify meanings of members of interface_info, especially for .size,
which does not define the ROM size.

Suggested-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>
---
 arch/mips/include/asm/mach-loongson64/boot_param.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index 9218b3ae338322d3cce47421c48d737c93858398..3a11ce85762be626a557ae867e5ee427ea355524 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -128,10 +128,10 @@ struct irq_source_routing_table {
 } __packed;
 
 struct interface_info {
-	u16 vers; /* version of the specificition */
-	u16 size;
-	u8  flag;
-	char description[64];
+	u16 vers; /* version of the specification */
+	u16 size; /* size of this interface */
+	u8  flag; /* used or unused */
+	char description[64]; /* description for each change */
 } __packed;
 
 #define MAX_RESOURCE_NUMBER 128

-- 
2.48.0.rc2


