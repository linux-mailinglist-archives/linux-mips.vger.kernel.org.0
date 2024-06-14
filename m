Return-Path: <linux-mips+bounces-3677-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7427C908F02
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 17:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27A531F282BD
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 15:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A8E15B562;
	Fri, 14 Jun 2024 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="4Wt1PtHi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GwtxQTfL"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8FD249FF;
	Fri, 14 Jun 2024 15:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379621; cv=none; b=VdQts3hryxy2xS3XjycJe/rWkWmCWZgIwW6Sv7FFMHUDaJJZis3/CmjoHyE0yd1lI57iPu+rCGxg9JOj+nCEhv89PD5UNHoExUPf6qNsXePEPOiXYFhu5ATllhpAtLeeu89c5V4ybo8dxYtbBHmTFaajaL5UpW38fZyoaWHU0/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379621; c=relaxed/simple;
	bh=EZf0lUnELN2GWQaIJ6nDvEZTqExvv3t6/H3YbZP8zlI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JKQkQDVOkjm2nuawVr/2ESwLZ8HmojLg/ydV7WKXOnD7JMLlKO+k+1Wk92pn8SswbehRoFSZFvYArfvkenEzE0TLNSApgm0f+qLFdbJqon0QJ65q93a2Pi9aNdBDVEP4kpTdtP9fj0GRpYYJAmP06nMR30bfA73gDntGFqvQyUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=4Wt1PtHi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GwtxQTfL; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.west.internal (Postfix) with ESMTP id 986A1180014A;
	Fri, 14 Jun 2024 11:40:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Fri, 14 Jun 2024 11:40:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1718379617; x=1718466017; bh=Ga
	O+yIwWZyZ40p7yxj6bdxp1mbhr5lltwIpK9CcOxIg=; b=4Wt1PtHimXGBKHPitr
	FlLcoEeXsQH3BwaAd8ppBL0uS4D9ZD9BpPG9iLPE0mv1GDKWj4rZMbj83hsPYSBN
	1Im6tXyhm9FdnDSwTIoVlE0MR/i3VcF8NQAmgpoqH4Icr0odqGfcOAtwxdyuKGfx
	TNy37z/zhSuU1iKq+YTxiugLEOJQ8Dv0mtF4jO3Vpd0JMwN9gumwc8l74qh9jbEU
	scCr2mucE9MWnzlFcgfyRPX5ZBEkB/hOrvie37uHLvQRUn4d1zHfNl3JVLlhG6LS
	CGQr2JXJKmmIkRy5yH0t4OQjGQ9nh/k5eU0nKrJURtscdo0qrN1aZyFK8DBH0EKh
	x1iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1718379617; x=1718466017; bh=GaO+yIwWZyZ40
	p7yxj6bdxp1mbhr5lltwIpK9CcOxIg=; b=GwtxQTfLb84xlPp4DzQ+u/h3fAkXO
	iZ64xFHORVpUJSFhsurg5IOHAtHrY5q82WhAkp5zD0gv0WER5KTUWLDQI1R1ssu+
	htuAo/aM9F+ZJ9mI93J4IP/bwMVJiPWfkSs+n4uo54LpD9gPepvBOTRtX2JkAEza
	wBHdd32voUMREZAcQ/tPNbO3jY/+HIU5ROsCShFvyN/bo5kH47XOwFJjQ+DlHj6m
	xgV6al1mHrqfb0dPbAL+TQFIt8Q2LFtjROF1DiLAZ95B6kwcj2Ov27L/TY0Vw9ut
	dHpVwRMaXc7oaWCsM2ishOeIEOGW+LGkT0pQn0mEPaUUpHZYncmaBtL9Q==
X-ME-Sender: <xms:YGRsZlEDuvFGxpy5BXX3XdjvrbG2NozZnxS7BTNNpA6mXOpkGbcujg>
    <xme:YGRsZqVL0J88I2aGjg3REshcX19v9qi_nBz34oh7ZsPcvTzwRH99ji-o8SgLwnCvt
    vCkR1Y93cnAuamBVpo>
X-ME-Received: <xmr:YGRsZnLLIvn8EWaIBadJzdiwSsDuqiujyChecLzcQKvvukkSejGpxBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepudffffffhfeuheevhffgleevkeeugeetfeegieeijeehfeekheek
    veduveeigeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:YGRsZrF3lARW-ovoc5eOCKQLoUIhKKl26ytU-zdjpQ-a9FR-umEWqw>
    <xmx:YGRsZrXAL2g2YSJEn4ZKQCjbsjTmiMOKqTQ45SyoBBk1AvsyOjxv3A>
    <xmx:YGRsZmNHOmEz8jW5obK9gyiKAvRD39CBRYOki9yDfT6xmjLAVonK4g>
    <xmx:YGRsZq3o1N2P5Qxaaq_IUc6DF4hrdDVD9NSpn9luHZW3XcPrBdXzfw>
    <xmx:YWRsZktu8PElbVNPUh9Qx6xBYdwQfgai0OglCXA9fsMWPEi22gf8j2kc>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 11:40:14 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 00/10] MIPS: Loongson64: Loongson-2K1000 fixes
Date: Fri, 14 Jun 2024 16:40:08 +0100
Message-Id: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFhkbGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0Nj3Zxi42zd3MyCYl1To9Qk47Qk41RLQ3MloPqCotS0zAqwWdGxtbU
 AhPKejVsAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Qing Zhang <zhangqing@loongson.cn>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=EZf0lUnELN2GWQaIJ6nDvEZTqExvv3t6/H3YbZP8zlI=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSclLhzix+fUaz+em3JB6fDE15tfhXM81nNLmXPTJbFv
 +ad8Ki411HKwiDGxSArpsgSIqDUt6Hx4oLrD7L+wMxhZQIZwsDFKQAT+WvMyLDLPbixRJ/H8sXP
 iYfeyD3p+r89OnGSjv2tpV+i78cLBr1j+MNpxNNx14y9KdZF6hV3wENfUZvJyyaI5e3bwMab9NC
 glx0A
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Hi all,

This series fixed various problems I meet when I was trying to
boot kernel on my Loongson-2K PI2 system.

Although most of the series are taged for stable, please apply
it to mips-next tree as it has dependency to commits in next
and I'm not in rush to get them into linus tree. I have some
future works planed based on this series that may get into this
cycle.

Thanks
- Jiaxun

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Jiaxun Yang (10):
      MIPS: Loongson64: Remove memory node for builtin-dtb
      MIPS: dts: loongson: Fix liointc IRQ polarity
      MIPS: dts: loongson: Fix ls2k1000-rtc interrupt
      MIPS: dts: loongson: Fix GMAC phy node
      MIPS: dts: loongson: Add ISA node
      MIPS: Loongson64: Test register availability before use
      platform: mips: cpu_hwmon: Disable driver on unsupported hardware
      MIPS: Loongson64: reset: Prioritise firmware service
      MIPS: Loongson64: sleeper: Pass ra and sp as arguments
      MIPS: Loongson64: env: Hook up Loongsson-2K

 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 65 +++++++++++-----------
 arch/mips/include/asm/mach-loongson64/boot_param.h |  2 +
 arch/mips/loongson64/env.c                         |  8 +++
 arch/mips/loongson64/reset.c                       | 38 ++++++-------
 arch/mips/loongson64/sleeper.S                     |  8 ++-
 arch/mips/loongson64/smp.c                         | 23 +++++++-
 drivers/platform/mips/cpu_hwmon.c                  |  3 +
 7 files changed, 89 insertions(+), 58 deletions(-)
---
base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
change-id: 20240613-ls3k-mips-52eb3fb3e917

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


