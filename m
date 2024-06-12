Return-Path: <linux-mips+bounces-3598-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9E0904E92
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1AD21C21C2C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 08:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF11116E882;
	Wed, 12 Jun 2024 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="CPtd76e0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="diQ5EiOH"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7A816DED6;
	Wed, 12 Jun 2024 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182480; cv=none; b=Vv0BvawbVKeopVJ1UrxWFPRcqkMUHvGYpg6jstw75Ir84uJvD2gARFRwtJC1OHkcPbmJjAsc1wKisXelpC9JG4xLKTe4GlTm5qWQqmgYApo0N2+0yqUQtnTLDo+TRZmqCLHjjYJumqa3xdJAsKn/rmBMMwpFKegFEBCr/9RHTvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182480; c=relaxed/simple;
	bh=ck/0wmFfxcf8nADSXP1DJNBzmOLr1sy9OsInITDxgf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uDQoe0kenJMkTY+zD51jxeXAu7zK/qJZzeAV8TBjqOFVKNBZQ9RdEV1vNvhxxlG9zl/s0rtii1+4VzmrLOCT/1aJ/8pnINlyPDV79DFH2HoATz8ktHt2zwC8kur7RFtYBSWu08Xbh5u910GQECz+2PS221LZpS/U9OZqOkPLYxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=CPtd76e0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=diQ5EiOH; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 727B611401D8;
	Wed, 12 Jun 2024 04:54:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 12 Jun 2024 04:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718182478;
	 x=1718268878; bh=Q8hmYgF9hlZ4LpGuFAPoGbYbRvEb2FRtda/KrPzYjtc=; b=
	CPtd76e0SnYwSajCztSq4O+7RbFWO1NVerdxgTtiuzzEHS6YxNPH1DV3K2cDjhQY
	bU3nQeTca9bQCdmXG3FJXri20GzRsDsS+bhoJR/mYVpWctAp/9wtlRR+vbszmsyt
	Lw46UlcO4qREsnb9g6rENXokmo4CG4ir8WbBtdhxocas9ei9Cibtgy3TM3Jf1ECN
	v8wYruYWxPiQIoEX9hcmKINH7cK2/i17Uvwyd897jg8SBx1Am6QEN2EJvXAzl/8u
	g6fNRBxj4WqUl6ItOFf7zRVo6xbSUZ+ZRBFmoHslfeLBLm0ZRZQpx62CqkK5eJ/w
	dwlOs8xgtOAUJBbzbyLyfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718182478; x=
	1718268878; bh=Q8hmYgF9hlZ4LpGuFAPoGbYbRvEb2FRtda/KrPzYjtc=; b=d
	iQ5EiOHd6HhcM8/hco4p16U3re6aPQxbjIySTxUTwYDDuHuYes4J7XPOwGz7gneN
	Ehbc9OpWxIRweGFy0BMnLy1MRP8BnkEDL1INfUpASwOO5ccb8f3HelcRwY/WaJA1
	LKUXODZgA1lsCQ9GGf4LQZPeR1KVDCLA3SGIi9Q7ZifsuxkR7GEgMpegPBXH2HL2
	8+6kb/8QbSZRmv8Bv9frP9V7JBenSHrQ+gvWQX7lNFh5mfjOHkWko9GD6eMCf/33
	iko9+0CfJLh51+Jc97ouAQYBzo6NbZdZFI1QA5kbpfH3L94o3YU2lvZTd3HBW+eK
	B6BcULzvqzq2lg9pfzNAg==
X-ME-Sender: <xms:TmJpZoKEYwOLQUftQG05dplqqt1ua_19-K4ScXCFmFu0gq1y39-H-Q>
    <xme:TmJpZoJTOgYuod3_tRou0PA_VOzWIcCiTIs6WlkAXAH3c-BlG9--VhADCEHVhnoLf
    56TRpnQHv-4wu-1Fzg>
X-ME-Received: <xmr:TmJpZouyFL0NW_7934eCjxqER0zfGudvjWBfZ4stKuuGUA2AcpsIifg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:TmJpZlZTQIFGOF5cGXkTQYTBqVLHGjeEyOSZTkuspOf5DHDcgyqlPA>
    <xmx:TmJpZvaDznbgslhXWojLczrQv1ehdzaCAC2eq7QXbus87OE0wbozwg>
    <xmx:TmJpZhDQK5zcKb8JaeWdEmoNRuqUFAIkx1b3GGxWZv3ADDR7REoxpw>
    <xmx:TmJpZlaI8_wjr_EUSFstVualIMwdPl4xBlaCZIUj2x5IUaiP6r44DQ>
    <xmx:TmJpZtNTUWpSuvZcxYuiucjX__eplu9GX-LZJdOBjv20q7xm1OixJan6>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 04:54:37 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 09:54:31 +0100
Subject: [PATCH v2 4/7] MIPS: csrc-r4k: Don't register as sched_clock if
 unfit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-mips-clks-v2-4-a57e6f49f3db@flygoat.com>
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
In-Reply-To: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=ck/0wmFfxcf8nADSXP1DJNBzmOLr1sy9OsInITDxgf4=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMJHdBa7sNZxQzuWbv/H6td+PF/EvrzQPtdb5eTlu72
 jxxQ96tjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZiI4kuG/87V4v+/Rf3dX3fY
 Ii/qhb3dP6mPGSl3Dq5+mvzTIJBrWQIjw6M8/YstsVbf1hwW+rY/odpE2eHxKhnlJavPS4TrLhX
 WYgYA
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
index 055747a7417d..bdb1fa8931f4 100644
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
2.43.0


