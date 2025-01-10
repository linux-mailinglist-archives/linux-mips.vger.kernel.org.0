Return-Path: <linux-mips+bounces-7355-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE85A0985C
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2025 18:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B7FC3AADE3
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2025 17:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B48F2139AC;
	Fri, 10 Jan 2025 17:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="Fj+lejn5"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBE7213E92;
	Fri, 10 Jan 2025 17:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.241.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736529763; cv=none; b=p9njQQMRfO7zaBpWOiCiXSkr1SqAOH9GGxrrK6S/KY7mGA7s4mNREp6ufd1W9DgjtoDdqfdf1CjSfk9+OlIwlMO62hWkDp0IqxsspOvgx+8D0b7msmMuFC7F5Shh6vpQ6x84/+3ZSoFGTCFmiG60rZVKG0tRiZn662B96WO4S7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736529763; c=relaxed/simple;
	bh=sZx7dgImXTwjqmyF+Y3t6izCPj6C9AWw7JmwFYOO7JA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lvvL9na9P6lwNBe4sITo8ztj0CpVLcDul6kF7vbPN6i9Sx3KGkMdSo8eut2d8zBXmg3qjnWbjJHsrP8gulWbnBjhAbIDJD/EictVmTPPow9DONbNAm9J9ZDpj7kXzLhWffSEVkI68uBYgAp43dkA/xgbN91YAhF5SPHHRDj8u7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=Fj+lejn5; arc=none smtp.client-ip=159.100.241.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.155])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 2E3AC20761;
	Fri, 10 Jan 2025 17:22:34 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id C41D5201D9;
	Fri, 10 Jan 2025 17:22:25 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 9375340186;
	Fri, 10 Jan 2025 17:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1736529743; bh=sZx7dgImXTwjqmyF+Y3t6izCPj6C9AWw7JmwFYOO7JA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fj+lejn5HE7YS7eDqaoHJmUFR9YFaBGHCpVOe72YKvZmb7m+CeNel/9kjXLkDKWTU
	 ujAxdxAhS9oVANSfeWghPStR57OovFTMPu1/ugJawrLrMHDlPpOniBfrxeIxNZm5S+
	 WwEiDJcoLcDEnHVkGOYZTAP2JplYAtWHGBpRF+Oo=
Received: from ProArtB550-CREATOR. (unknown [58.32.41.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id E65664113C;
	Fri, 10 Jan 2025 17:22:20 +0000 (UTC)
From: Kexy Biscuit <kexybiscuit@aosc.io>
Date: Sat, 11 Jan 2025 01:22:08 +0800
Subject: [PATCH 1/2] MIPS: Loongson64: remove ROM Size unit in boardinfo
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250111-loongson64-boardinfo-no-size-v1-1-e9f26fcd069e@aosc.io>
References: <20250111-loongson64-boardinfo-no-size-v1-0-e9f26fcd069e@aosc.io>
In-Reply-To: <20250111-loongson64-boardinfo-no-size-v1-0-e9f26fcd069e@aosc.io>
To: Huacai Chen <chenhuacai@kernel.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kexy Biscuit <kexybiscuit@aosc.io>, Mingcong Bai <jeffbai@aosc.io>, 
 Icenowy Zheng <uwu@icenowy.me>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Spamd-Result: default: False [-0.10 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[jeffbai.aosc.io:server fail,kexybiscuit.aosc.io:server fail,uwu.icenowy.me:server fail,stable.vger.kernel.org:server fail];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: nf2.mymailcheap.com
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9375340186

Per Appendix A.7 in Q/LS 0013-2014 (龙芯CPU开发系统固件与内核接口规范 V2.2,
lit. Loongson DevSys Firmware Kernel Interface Specification V2.2),
interface_info.size is size of this interface, not size of the LEFI BIOS
ROM.

In any case, the BIOS ROM Size just cannot be several kilobytes (KB) on
Loongson64 LEFI platforms.

Reported-by: Mingcong Bai <jeffbai@aosc.io>
Suggested-by: Icenowy Zheng <uwu@icenowy.me>
Fixes: 6c1bfbd9df8c ("MIPS: Loongson64: Add /sys/firmware/lefi/boardinfo")
Cc: stable@vger.kernel.org
Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>
---
 arch/mips/loongson64/boardinfo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/loongson64/boardinfo.c b/arch/mips/loongson64/boardinfo.c
index 280989c5a137b5f32708b21331b48bc581745130..8bb275c93ac0991c77827404d0c76cf97201a1a8 100644
--- a/arch/mips/loongson64/boardinfo.c
+++ b/arch/mips/loongson64/boardinfo.c
@@ -21,13 +21,11 @@ static ssize_t boardinfo_show(struct kobject *kobj,
 		       "BIOS Info\n"
 		       "Vendor\t\t\t: %s\n"
 		       "Version\t\t\t: %s\n"
-		       "ROM Size\t\t: %d KB\n"
 		       "Release Date\t\t: %s\n",
 		       strsep(&tmp_board_manufacturer, "-"),
 		       eboard->name,
 		       strsep(&tmp_bios_vendor, "-"),
 		       einter->description,
-		       einter->size,
 		       especial->special_name);
 }
 static struct kobj_attribute boardinfo_attr = __ATTR(boardinfo, 0444,

-- 
2.48.0.rc2


