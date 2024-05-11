Return-Path: <linux-mips+bounces-3244-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BE58C3253
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 18:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B3ED1F21AE2
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 16:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB91605CE;
	Sat, 11 May 2024 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="D+6fEmLA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NDjqs6yi"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810D260263;
	Sat, 11 May 2024 16:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715443227; cv=none; b=MslQpF8l/2rdOXlFxwghWzxF87lVRg3AAMx/Q9Mq1ccuDrjcsufY4jazbaUSwPD13kX3keDWgkEzhqXn1Q4U4sqd6FQymUDPWkoCjuGXx44iY+XTXh2C6eQinnTUvyquIFU5HR51PR09zh5w99mQMaUwYWTw/No22e863C+a96k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715443227; c=relaxed/simple;
	bh=LTJ2PdwrtfpyOd9ncjTs/2ypXjc7FhtM/f5PM28BJKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AoWK0JupGEhN1VltoTWJxTPgYQqjLNRAEFlLyByH2oMN5CGrKB/2KIbp8FPdtGjA9tj3XUpmqVYlWjZLECy7wZt/NqWHwsxl37CqyO4lRSloT9EeZLGPzbwadIZv9/MOqLldpUfNosytnJlwX00fE6040PtEX62nStQwSxcM4mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=D+6fEmLA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NDjqs6yi; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 53B461C000F1;
	Sat, 11 May 2024 12:00:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 11 May 2024 12:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715443224;
	 x=1715529624; bh=DsfUiYmStvOvLHJLDxVevwp6/j2FmnRSicicLuBbeWs=; b=
	D+6fEmLAqgCmr3Sn7n+K567v6Q7raaeJu3EHNZYdmKvuWLXRBdQqxmJGgcwbZACO
	akGMqy8IdpiSQkakblZ3Wy+J2KLY9iJTl4H/d0Y+ogzSWucTPyUihiv6M2X12Doq
	PuIcLGAKQUTt0Vs6/8BkOyzG9Y+G4TX+5ZP7sZYirrSumvCD9XaTHOWGtuK1PhmI
	Clklj6XfuJBOmyds/C+1n+o1U71nDFhnSfioy+xWBroLrUVbKssk3Qg2ROMfzIDK
	Xr2MC7iuPgDLvqUTxTl1zOKhwlPQ0jPK+uhLOrejvUcbYrG6D50E6R32781VGoap
	rjBpiLCbO4KSnnDRdlqvxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715443224; x=
	1715529624; bh=DsfUiYmStvOvLHJLDxVevwp6/j2FmnRSicicLuBbeWs=; b=N
	Djqs6yi4X5/HQTnuDHcmRGzzL/D+3sUpDZab0A95yw6n26Kw+gRhkATlqBP0upPZ
	CdjxVZqyqfyObk2MkpseL3qjPsr3VHlVSIAezsUc61ddZSV1hLaWk+HU0i28hwrs
	OVZNgHty4/2Rr7ftrY8HOSNK9ckv+5zdrt4PsqRgJ8xsF0++P0GgZIrJyfGHWx6V
	ec0ZJpoUimdW+5bHgCJPaBlKdLHVUe7H7CfCE1ul6sEULkJC1+XOh3iH/02eP8CK
	rEjQ/73mT6YuZGUV+Zj4IL0wFDN3o7Hvw+jB1tLDj2Z7+zivZyQWs5MB6tvft4nK
	Z98aLy16/8VD7ppAkIqZQ==
X-ME-Sender: <xms:GJY_ZrwJKoArAtUvEOKHenYXp892HSA_Ga7b8OmOIniV-nswcXd9eg>
    <xme:GJY_ZjQp659H6hYSM4koghGIz-dOBA5-5Fwg0RxnvYGKQNvl4vmeI6RYJFeWVlz1f
    V0wAK2lT-sR7g16LUA>
X-ME-Received: <xmr:GJY_ZlWbdWkzggFqEGIDAk7KrGmrDCgTIC7LyjM6NahNRwAboyGV2lg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegtddgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:GJY_Zljt4L2fv8l9QU9EqMA3WDS3OjWMfUmz_DIvKN73sEmxLz9E8w>
    <xmx:GJY_ZtDiZUcXP4dDRc-v_ubTSOzbB9ElDTJJEEppp-vk-op6afqlLA>
    <xmx:GJY_ZuIOz-jWdCzcEt88sXn5QeKOaFOWfQyV2_P0XDNJ8BqyoP0ZsQ>
    <xmx:GJY_ZsDzfU69cMub2lbBGwvPNUivQq2npZf5-0moWQrcwkHL0BA0Ag>
    <xmx:GJY_ZnBoAY__j7Haypnt9gjWAfyXFYBaBVUWD0eNtasj4mZfF4P2GSLI>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 May 2024 12:00:23 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 11 May 2024 17:00:13 +0100
Subject: [PATCH 6/7] clocksource: mips-gic-timer: Refine rating computation
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240511-mips-clks-v1-6-ddb4a10ee9f9@flygoat.com>
References: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
In-Reply-To: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=LTJ2PdwrtfpyOd9ncjTs/2ypXjc7FhtM/f5PM28BJKg=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjT7aZxhDt9b2IuXV+vqLSm+3HbztMGJzdZ7VrH3ytod/
 B4tu9y9o5SFQYyDQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACbSeYHhv1/ExzL9gBcC0qqZ
 Ha+T4myDg7cfeKv5aAUT34R7Rqu/RjAyNBpu5G+9YG+4LXba/e7+v6IqOTrzrJO4++7L/rkonPW
 JCwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

It is a good clocksource which usually go as fast as CPU core
and have a low access latency, so raise the base of rating
from Good to desired when we know that it has a stable frequency.

Increase frequency addend dividend to 100000000 (10MHz) to
reasonably accommodate multi GHz level clock, also cap rating
within current level.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/clocksource/mips-gic-timer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index b3ae38f36720..67498dc9c5a5 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -197,7 +197,11 @@ static int __init __gic_clocksource_init(void)
 	gic_clocksource.mask = CLOCKSOURCE_MASK(count_width);
 
 	/* Calculate a somewhat reasonable rating value. */
-	gic_clocksource.rating = 200 + gic_frequency / 10000000;
+	if (mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ))
+		gic_clocksource.rating = 300; /* Good when frequecy is stable */
+	else
+		gic_clocksource.rating = 200;
+	gic_clocksource.rating += clamp(gic_frequency / 100000000, 0, 99);
 
 	ret = clocksource_register_hz(&gic_clocksource, gic_frequency);
 	if (ret < 0)

-- 
2.34.1


