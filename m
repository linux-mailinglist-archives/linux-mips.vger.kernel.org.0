Return-Path: <linux-mips+bounces-3240-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C1F8C324A
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 18:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 577F81C20965
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 16:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7328057C83;
	Sat, 11 May 2024 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="xggs+Nvu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ee3VcNkk"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D9F5730D;
	Sat, 11 May 2024 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715443218; cv=none; b=lvJk8Hbvd2f820KkiKCM07ojL7aDuSz/zJ4zRErV6jxMqJ4uvxgwRtg6/5wPAg6RsXVq9hCB5V8I1NB7bsnVptdQXx2a1DFYoMnZS0LzbrzWm5KcjSpFXaWV9Isz+9/Dd32/bLiNQU1DzIuL+svC0udZJZokKMqrJlWdRZsWvTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715443218; c=relaxed/simple;
	bh=xN9LUMC2GUm6xv+BmxTm2mY70hbj5Q6VUPEtmaKqL1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DKX1JzufvJPsgh8gkk7FwtSYTmDxTaxNyueoRjZ2foaClXLIVyQhEeChLIw8VNTWqW79awRdIS0jI2iO29dGUavYSZ6G3QZH4oXYgGFgDdcI0uvSHfgRqQjWhsRzBy7tQEh2E2rlbh3z3CTlKrG4YKadE3p9zw+G7asoxVkUzTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=xggs+Nvu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ee3VcNkk; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id D03AF1C000C4;
	Sat, 11 May 2024 12:00:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 11 May 2024 12:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715443215;
	 x=1715529615; bh=5LhiRvWSlGj8b9Vyp8q5tRJ77PHNOG0JGLU5aD0r8xQ=; b=
	xggs+NvusRV2aORI4dl4UFKfIci2vSAe/wvctrHrN8ytLUVKbrhTH0/CVYcukZDX
	qaqkei7akJ26kYJrst6KLHgAOCo2Scb0h/B7NbwRYOVurySAaC6i9r2LaQrE089M
	P0vQEFYQdp7/9geKyWLeG10p02O2EBZeQE8V72LOmpMqineKdpfd+W0v1Rji034F
	ALVesL4T4MxHqlWTCvLVhqPs5LIvzc61UF1+kgROmNYKFY18k7qDS1f0gzJvxrYQ
	IJsWCvF+WyPSWZ2MjIdO+JMD5s0JmdsFlWqAeYRtu07fTSsHfMMcIQ3ZMsvkNZfx
	+FJpaDQELG5pDyFpz0eang==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715443215; x=
	1715529615; bh=5LhiRvWSlGj8b9Vyp8q5tRJ77PHNOG0JGLU5aD0r8xQ=; b=E
	e3VcNkk5QjWHSJ8WAlthyHykTsr2zn84DSMgRO5APqaMPKHU2gyytt3+69NCWHph
	orGtRA8WOTT9vXo1Dz7Uh2GxPypt8vA1+iLVP7cH7edlF13W0p1X9RSrAzeMEj+o
	i3GwxiHT9Z4dLLDc9XP72xHu3QBVM6s/xZEBCq+6eLRpF+GYgEM7KkNvzJNESURr
	qImnp8PZViRhlaXeTezsBEnYE+Xlke7gdxIAgp0q3FAVkHSqWiKkzUp+Fqc1KI+m
	+h3KEOwTIrRArFhFPRnOAOom/fiq0GV6TgrzFJxsUwZiNWjCgsxIM4iiQXTxqUaH
	Zj7YldazGabnvUFJbaJTQ==
X-ME-Sender: <xms:D5Y_ZkFa92M3cncwOmLb-HZTuMqSzvFnJ4qCFe3ucVsLFEl1-tP5zQ>
    <xme:D5Y_ZtXvSaVidcA_7h4c70o6hYaAcjUJs78P3umYtFbWLLugGnqmyr-ALnbL45tQJ
    uFWQuFiH2TINMOQtEQ>
X-ME-Received: <xmr:D5Y_ZuLTsJNoDbt-_Lzs5o5KddPQaCYXkNsfhyOvKOdZ1Z_pWDhI9-U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegtddgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:D5Y_ZmGv4lWk_cPd6m8wTR8d9GVRK_DCgTc6sYspPFHEN8NWlYC3sw>
    <xmx:D5Y_ZqWWxULyimh_831eCBsIf5WSdCp5bgmb0_CusOE3JwGaRd7p5g>
    <xmx:D5Y_ZpP-e2r7AaV8KP7jJ63raSajuz3QPfB6VBLUx98yyEvTjLVP_w>
    <xmx:D5Y_Zh0IpVmkKMOhmhJs8Pq5In1W1wGvWjBw00KHJwTiS6rO1FYCVA>
    <xmx:D5Y_ZlEZkwqIgn5agcuPh03TowaP3M3Ii9eBHSwGMUPn1EB_9_5DCeL8>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 May 2024 12:00:14 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 11 May 2024 17:00:09 +0100
Subject: [PATCH 2/7] MIPS: csrc-r4k: Apply verification clocksource flags
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240511-mips-clks-v1-2-ddb4a10ee9f9@flygoat.com>
References: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
In-Reply-To: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=xN9LUMC2GUm6xv+BmxTm2mY70hbj5Q6VUPEtmaKqL1o=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjT7aZzhPcfmnG9fxsyonGl7om/lnerMsEnppu57i7YsK
 PqUsvB8RykLgxgHg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAEyE6QHD/7xl7HwdLY4u3YW7
 xH84PSrUfxo8x+Nk6lw/vfd+O5lDehn+Sutv1J5xNqaE5+Q6SQfNcr5ZPxk72bdmPL557ceXI9Z
 tDAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

CP0 counter suffers from various problems like SMP sync,
behaviour on wait.

Set CLOCK_SOURCE_MUST_VERIFY and CLOCK_SOURCE_VERIFY_PERCPU,
as what x86 did to TSC, to let kernel test it before use.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/csrc-r4k.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
index 262896871351..5c37e41e8970 100644
--- a/arch/mips/kernel/csrc-r4k.c
+++ b/arch/mips/kernel/csrc-r4k.c
@@ -21,7 +21,9 @@ static struct clocksource clocksource_mips = {
 	.name		= "MIPS",
 	.read		= c0_hpt_read,
 	.mask		= CLOCKSOURCE_MASK(32),
-	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
+	.flags		= CLOCK_SOURCE_IS_CONTINUOUS |
+				  CLOCK_SOURCE_MUST_VERIFY |
+				  CLOCK_SOURCE_VERIFY_PERCPU,
 };
 
 static u64 __maybe_unused notrace r4k_read_sched_clock(void)

-- 
2.34.1


