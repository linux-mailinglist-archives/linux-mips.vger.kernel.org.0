Return-Path: <linux-mips+bounces-3242-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7F08C324F
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 18:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF2BB1C20C3E
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 16:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495F25A4CD;
	Sat, 11 May 2024 16:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="fsjFzELc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ESe+v6Hr"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEFD58229;
	Sat, 11 May 2024 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715443223; cv=none; b=T2Fwqhl63tPNk1c6Xffe2Jox+myD9I4wCkbbEqqiCVgpJjb8yw1IMiUed7zcAhaEQI8PO73eYQ1Q6Ru2pmb4M8YMh/psMp5XkGss8/5xKBm8i5BJxdV0dE6F6+uhU1/u7QX3ZS6pg4qM6CuUpnvXOgtzAY2rBZSJGY2LH1s+BoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715443223; c=relaxed/simple;
	bh=U+UVB4xsBeR9swGFKSPQmDKTBSfdxpeJjE23y7dy0tM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QFXGJHSk0YvwtF4SrhoCFHRjieB9SMyOfALR5xRUtzAjbWDdUoA8JupjfRj5JppLCBAfVSBY3HSPPZBldvc8cOn1RnZiQsdLpPXoiNH65gLmDbH1INtbMYSnxnjzEKX3xphR4UxVcThTd62qqrGVmC8wFz+8GkB2AcIby40uBUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=fsjFzELc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ESe+v6Hr; arc=none smtp.client-ip=64.147.123.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id 8DBF418000A6;
	Sat, 11 May 2024 12:00:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 11 May 2024 12:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715443220;
	 x=1715529620; bh=taaP0de1JMrUsTaQ5p3XewSALo/OUNM7p36PinVNGQI=; b=
	fsjFzELc3eyNlFo4JGEEnuUPt6BiMox1ALJstmWL1fB2+D82TdyRJpRoY2uMg/gu
	uh8TlQZ3kEmMKI4Kl6YkVJvt19+a4eJZotW/vwj6dqLp3dLoUKsZJN19T9qvMudz
	S8srSjrmryTfApxr+fDD1UWwlvJ760d2b+1QErxBZ7Ggz8QRRaIW2r5E6hHZol9w
	/qWd0jLWLVD2k/lrepaK6JtqgRMztRkZmlz/Z8EbAhDQ7ALylbnfmm7DblfbNFG0
	1WYtkj/icJ9/uBBTj8npAaeih9pQI1ryZIgWJBk7nKC/oBc8b7sxRWe404P/pMrT
	hGHSdPfEAx9GLdUBGhv3Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715443220; x=
	1715529620; bh=taaP0de1JMrUsTaQ5p3XewSALo/OUNM7p36PinVNGQI=; b=E
	Se+v6Hrt+xzY4N5CHGJ+KVececDLv2CoixJ8ki1q+Hzr/He7SKDEYjSQP6kO0p/D
	XHN4v9Hx4N+kmy6LyU+TudwjO/3rXvgBmSuroq5pDanAGl2ChMhDHQ2SrSkqoUyZ
	WvWoKBv/b2NW+GzckA2VwUJZD6QsS76KvEvJdmiH72agr8F4I8kz59UoORJ08eMa
	gt6PNX9tUYh2rBKs8cleic6VfvGiuKIX4OtVtbSTv0IqcBECbMxpr55PXW2q5Cdl
	UomDfSf1hRhrW10jScg1s0ceOa321906ORoP0dTB8rqdd6v63SBjQkupQEr3rbyK
	xNTAVRcNo0RNVY6w/6VNQ==
X-ME-Sender: <xms:FJY_ZoxJ7FdjdOrKyGZmSj3LjDP9T24TeouCOADRkxPQft5k2bBVoQ>
    <xme:FJY_ZsQ0tTbXGKvTFzeo74gpRJ8Q9WLjvm5IXtZsSKqzDyr2DjZP6AIuRHL_cuJGQ
    kYBuqXNHAlETRGFPdg>
X-ME-Received: <xmr:FJY_ZqXnn6wlfE8REz7vEzB6fevpR0XtsTbT0mpVXWtu_liu6xWU9yI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegtddgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:FJY_ZmhLMxGtaNe2fAG_NpzRYFQYCIrMYlSM5s09of_iQaO09S-67Q>
    <xmx:FJY_ZqBPuljQTOxH2DWB-7jjArWXPnbC2vV1tG_AZV9qpzptl6G6Dw>
    <xmx:FJY_ZnJDRNO6ejWTmblVX-qToagvP2b_FSGSJgx28c_xLMZ9_i-ZQw>
    <xmx:FJY_ZhC1XsQsPPWQNJbjDAxNC6jBJUu3msRoAPtmJXxmRGmXNdluZw>
    <xmx:FJY_ZgB4palDoK6HOCG1Ukgzf1RknW7Aiz_Jh0vHmFEYmgGCq90A-CUt>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 May 2024 12:00:18 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 11 May 2024 17:00:11 +0100
Subject: [PATCH 4/7] MIPS: csrc-r4k: Don't register as sched_clock if unfit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240511-mips-clks-v1-4-ddb4a10ee9f9@flygoat.com>
References: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
In-Reply-To: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=U+UVB4xsBeR9swGFKSPQmDKTBSfdxpeJjE23y7dy0tM=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjT7aZxhCwuns22+arsnRadMyG7Ki6lhPkvj2ULbZiz+y
 jVjg4ReRykLgxgHg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAEzET5Xhv99VXtd33x5sEn51
 7texgJoSg8mbS3JCuiM/lp5QM0nn9GBk6NhuLqtcGCBW3Mn5vYnN0/z9gS+Zp4JSurPDFLt3uZx
 mAAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

When we have more than one CPU in system, counter synchronisation
overhead can lead to a scenario that sched_clock goes backward when
being read from different CPUs.

This is accommodated by CONFIG_HAVE_UNSTABLE_SCHED_CLOCK, but it's
unavailable on 32bit kernel.

We don't want to risk sched_clock correctness, so if we have multiple
CPU in system and CONFIG_HAVE_UNSTABLE_SCHED_CLOCK is not set, we just
don't use counter as sched_clock source.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/csrc-r4k.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
index 5c37e41e8970..18733a2ec594 100644
--- a/arch/mips/kernel/csrc-r4k.c
+++ b/arch/mips/kernel/csrc-r4k.c
@@ -68,6 +68,18 @@ static bool rdhwr_count_usable(void)
 	return false;
 }
 
+static inline __init bool count_can_be_sched_clock(void)
+{
+	if (IS_ENABLED(CONFIG_CPU_FREQ))
+		return false;
+
+	if (num_possible_cpus() > 1 &&
+			!IS_ENABLED(CONFIG_HAVE_UNSTABLE_SCHED_CLOCK))
+		return false;
+
+	return true;
+}
+
 #ifdef CONFIG_CPU_FREQ
 
 static bool __read_mostly r4k_clock_unstable;
@@ -125,9 +137,8 @@ int __init init_r4k_clocksource(void)
 
 	clocksource_register_hz(&clocksource_mips, mips_hpt_frequency);
 
-#ifndef CONFIG_CPU_FREQ
-	sched_clock_register(r4k_read_sched_clock, 32, mips_hpt_frequency);
-#endif
+	if (count_can_be_sched_clock())
+		sched_clock_register(r4k_read_sched_clock, 32, mips_hpt_frequency);
 
 	return 0;
 }

-- 
2.34.1


