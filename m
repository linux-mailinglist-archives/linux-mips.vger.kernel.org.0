Return-Path: <linux-mips+bounces-7354-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A02CFA09858
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2025 18:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E20D3A49A4
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2025 17:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C2E2139DD;
	Fri, 10 Jan 2025 17:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="C9XEHc9L"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5C621324F;
	Fri, 10 Jan 2025 17:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.248.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736529759; cv=none; b=LGz+bSNOOJHBLsWTTK4sSbgbC+6+27DQL7lKqH2IoQYyb4xqUGy0oeoozy4Uktnssg0kE6jBOazcW63gNO4fsFf/MfuK8KeHwMv3wx1P8JDLCqeGkhmX6nWPmxloKbLjmzY0oZAQjDkgiCkIJ4PwuPaKZ+fVKwTDmbYS3C+D450=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736529759; c=relaxed/simple;
	bh=LP4abWP/B8MTSQyfsYy/JPhizH98np/yTbPk5BUK50s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fhBkclOL7EgCrDySOuctZZElIVXJRcKpgvFuY1DGw0hcpFz8F9gibzraTG022jkRsXx7gGgAxBjBtwV4r4oLQxpR+R/Po0TWbRNSXtYtKuTUHOyYtxcIkev2Ro8iIeaoKujOjOmDE7L0z6NeP+LKVBbrjGbNPXx+vzUybHky0s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=C9XEHc9L; arc=none smtp.client-ip=159.100.248.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id E596C2675D;
	Fri, 10 Jan 2025 17:22:28 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 022003E8E7;
	Fri, 10 Jan 2025 18:22:21 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 909E740078;
	Fri, 10 Jan 2025 17:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1736529740; bh=LP4abWP/B8MTSQyfsYy/JPhizH98np/yTbPk5BUK50s=;
	h=From:Subject:Date:To:Cc:From;
	b=C9XEHc9LF8nEReaVICcSoKj9EBgYlF+WmpwLL/FLgMu9wx0Tol6aDQhM4vE2/QDQ1
	 /pwExSeT98cl578XsjtWSpNHa8MG/sD8Sz/ZGfQjq4itiKKiFbLTP+SVGgZL1mgPQ/
	 oSOpOzx0FgknxaIOQQVI+Z/dW90WUc7rRsl4r+8U=
Received: from ProArtB550-CREATOR. (unknown [58.32.41.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id BA57A401E5;
	Fri, 10 Jan 2025 17:22:17 +0000 (UTC)
From: Kexy Biscuit <kexybiscuit@aosc.io>
Subject: [PATCH 0/2] MIPS: Loongson64: Remove ROM Size in LEFI boardinfo
Date: Sat, 11 Jan 2025 01:22:07 +0800
Message-Id: <20250111-loongson64-boardinfo-no-size-v1-0-e9f26fcd069e@aosc.io>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAD9XgWcC/x3MwQqDMAwA0F+RnA20nQ7xV4aHaKMGRjIaGDLx3
 1c8vss7wbkIO4zNCYW/4mJaEdsGlp10Y5RcDSmkPsQY8W2mm5s+O5yNShZdDdXQ5cdIqc85UXj
 QMEMtPoVXOe7+NV3XH8PpqO9uAAAA
X-Change-ID: 20250111-loongson64-boardinfo-no-size-a25dd2a03a8b
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[kexybiscuit.aosc.io:server fail];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 909E740078

In "MIPS: Loongson64: Add /sys/firmware/lefi/boardinfo", "ROM Size" was
added under section "BIOS Info". However, that is incorrect per Appendix
A.7 in Q/LS 0013-2014 (龙芯CPU开发系统固件与内核接口规范 V2.2,
lit. Loongson DevSys Firmware Kernel Interface Specification V2.2),
which defines the size to be the size of this interface itself.

Removing "ROM Size" from boardinfo, and also adding comments to the
struct interface_info to clarify meanings of its members.

Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>
---
Kexy Biscuit (2):
      MIPS: Loongson64: remove ROM Size unit in boardinfo
      MIPS: Loongson: Add comments for interface_info

 arch/mips/include/asm/mach-loongson64/boot_param.h | 8 ++++----
 arch/mips/loongson64/boardinfo.c                   | 2 --
 2 files changed, 4 insertions(+), 6 deletions(-)
---
base-commit: 2144da25584eb10b84252230319b5783f6a83041
change-id: 20250111-loongson64-boardinfo-no-size-a25dd2a03a8b

Best regards,
-- 
Kexy Biscuit <kexybiscuit@aosc.io>


