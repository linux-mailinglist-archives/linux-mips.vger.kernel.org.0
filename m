Return-Path: <linux-mips+bounces-3601-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD50F904E97
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 140D9B24310
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 08:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EE316EC11;
	Wed, 12 Jun 2024 08:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="G3tiSlWE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lVUw7ihc"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B3416EBFB;
	Wed, 12 Jun 2024 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182485; cv=none; b=vEzPDflfgBQHixUSBllWioyIw6LDxMIn2b8gul3DT0Je/+IC8D6vXk02oy/Tvnd67K4PZJfWRrx2omvCihGjwItP+8YJNl4b41mc16VKqC+z3V/YBZQdJ7mLLOrDy9s7PH7S3FKyAkdJrS0KxbXbslkqmYwxCVWBJge8c/bYvUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182485; c=relaxed/simple;
	bh=mjI/mjh69onU/yGH22kAjkQ4UV9AJXLhATGHNzoYz3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pgY7HIkx7n13QBobbBd5j/ix6vbu4MLgWcfNydLNbe/eFwYxxop81P3VmqG2woPCclFOsp/ucd+85M/8fJH213vJPpuq3Iz0wAjYC79C1MHWkwvnHRJXpTHP2+nDQsfJosJzN3b+5dl272o+le027nzeCRpfZ45wezeYu6jGr54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=G3tiSlWE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lVUw7ihc; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0FDCC11401E7;
	Wed, 12 Jun 2024 04:54:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 12 Jun 2024 04:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718182483;
	 x=1718268883; bh=e5M+mHpk8VIMJ+B95zDLNN/F7+/sf0MKyuTyQ+Iojtk=; b=
	G3tiSlWEkLFIxer/OA0/Xlflt2MfvS4HDu0puWaPvA32sWsjpVQjGFWVK3nWY2Fl
	fGrwg2U8CXhJ3qB/MLgQp2RZngV4ITMy5UtuUlD5k1jnVIxdU1k+Wv5vTg8Kcykf
	85KVSfCiERZcC7WHLovdHFDX0GlCmn2ahAuKWQO4lGR5+mDgh9TufDy9KrMdSA8D
	3sJFA+Oo51nBwH5K+QkOmoTqLcBhPsDgOKCOMw5MY+1mvrBetBeKyjyNh52I5czU
	Y1aZaUy8sbmtC+8nwAd0l7fSjrIJJjsRUfqx6hIisIk9NkGZACOEDYDq26vpPae3
	uXF9Dr7hJcOCq1Zz/hHD5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718182483; x=
	1718268883; bh=e5M+mHpk8VIMJ+B95zDLNN/F7+/sf0MKyuTyQ+Iojtk=; b=l
	VUw7ihcPKso+UWzYEGBLrNiiT+Tyql/4HNysEns8aB/48fA3h4zlC7KO9+p/2Ama
	ME4qh03kuGNSOCmpE8WWpghcmmosVCeVO/oyxUvlKsix7oEyWfX3LRuP5dLnC85E
	6CK+EYBYE68eLRVCucZ3AYe2qeGOOJI0WBVRU+ygSYNhFbig4+xLbhVhOisxAskH
	d6o80l6BqodGUUfpatFgajfVmG/nRX+TKMU0JJLXfzKpgj22+A4R00/IV1ezoSL2
	EuFBDH7TRLNsz2RLKAA18QdO8pfnp0CmoEvEEakt+70iCP3sNWQGJjEqk7bdS56k
	KOvjBeQO7dUSXdkNY1BwQ==
X-ME-Sender: <xms:UmJpZooO2kkXxTG5fASSzdLZCE65LI5OFb6rmknUXtfm6sAiEBKZzQ>
    <xme:UmJpZupIFrZIcqMPtj4wqBNq5thuixVU7zL7PXle8gXZgvwKkj__3lt1VXJ8zDoPE
    np2xlXfKhOc-eNU_1k>
X-ME-Received: <xmr:UmJpZtOfF6hzGtdckIGJ7IP5ltih-DdeKp2SBNisYq1P8JqgKhAifYs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepveevteehgefggeejkeejtddtteeuleduheevjefgjeetvdfh
    udegtefglefhveeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:UmJpZv4KDmE8XivdQi0PN_a5XEMfI-yn1qXuZGznJ5iAWLmwXQiozA>
    <xmx:UmJpZn6mRpPPm50hoxa7us8jvEApcOvbPALhHKdvjc01z8lFYj6RGg>
    <xmx:UmJpZvizuG_8BtE7C0I5GepUWIYS5A8HbM7ZgzkpukVU8sPDR7LAzA>
    <xmx:UmJpZh4Ck-7fnnvvhwEfszXt0Ml87uaDqTM4BPtBl7Axb4wh5-JZWQ>
    <xmx:U2JpZkHn0xhgOPWiTuNou1cjy0a5quoBk8zgixHH6-smBzk-rLCxLBiU>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 04:54:41 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 09:54:34 +0100
Subject: [PATCH v2 7/7] clocksource: mips-gic-timer: Correct sched_clock
 width
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240612-mips-clks-v2-7-a57e6f49f3db@flygoat.com>
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
In-Reply-To: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2015;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=mjI/mjh69onU/yGH22kAjkQ4UV9AJXLhATGHNzoYz3Q=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMJPefrdFGosqqyTq+R9SWHJijwn3e7veB48fOnxNs+
 +KxR2xyRykLgxgXg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAExk8lpGhgtHoj8qX/Yx95V4
 r1MxS8ZzOfdJoRUHt0w96Sv/oFHZey7D/woXc0nFyxpcsiqbt5870uj+aw+7yE33z/yXtP4scEk
 25QMA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Counter width of GIC is configurable and can be read from a
register.

Use width value from the register for sched_clock.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/clocksource/mips-gic-timer.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 7a03d94c028a..110347707ff9 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -19,6 +19,7 @@
 static DEFINE_PER_CPU(struct clock_event_device, gic_clockevent_device);
 static int gic_timer_irq;
 static unsigned int gic_frequency;
+static unsigned int gic_count_width;
 static bool __read_mostly gic_clock_unstable;
 
 static void gic_clocksource_unstable(char *reason);
@@ -186,15 +187,14 @@ static void gic_clocksource_unstable(char *reason)
 
 static int __init __gic_clocksource_init(void)
 {
-	unsigned int count_width;
 	int ret;
 
 	/* Set clocksource mask. */
-	count_width = read_gic_config() & GIC_CONFIG_COUNTBITS;
-	count_width >>= __ffs(GIC_CONFIG_COUNTBITS);
-	count_width *= 4;
-	count_width += 32;
-	gic_clocksource.mask = CLOCKSOURCE_MASK(count_width);
+	gic_count_width = read_gic_config() & GIC_CONFIG_COUNTBITS;
+	gic_count_width >>= __ffs(GIC_CONFIG_COUNTBITS);
+	gic_count_width *= 4;
+	gic_count_width += 32;
+	gic_clocksource.mask = CLOCKSOURCE_MASK(gic_count_width);
 
 	/* Calculate a somewhat reasonable rating value. */
 	if (mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ))
@@ -264,7 +264,7 @@ static int __init gic_clocksource_of_init(struct device_node *node)
 	if (mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) {
 		sched_clock_register(mips_cm_is64 ?
 				     gic_read_count_64 : gic_read_count_2x32,
-				     64, gic_frequency);
+				     gic_count_width, gic_frequency);
 	}
 
 	return 0;

-- 
2.43.0


