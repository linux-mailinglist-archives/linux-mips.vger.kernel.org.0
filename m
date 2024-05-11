Return-Path: <linux-mips+bounces-3245-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5D38C3256
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 18:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E7E2281AA6
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 16:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83192634EA;
	Sat, 11 May 2024 16:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="qOkc4VzF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K5+bVDg0"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2B0612EB;
	Sat, 11 May 2024 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715443230; cv=none; b=Z9BIhI5t5EFRDQAE3uku95bMpcb/weAqpSL/jDt954rL8v3mATw2RPnJGraZ/TKy3XXCbpVDqVDz0ed1g0UAQynOJ+PPOLm0pQtxu314+SrhThO6ZXmp0Y6zHJ7nFM/eR3yTE95o0W0N4BO0P6RzyyqmKSHnhbGqRaGzVaGmZFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715443230; c=relaxed/simple;
	bh=QoFq1d4EB6JF/VXmsnCt30uB7ETZJLm1mA9nrZugG5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EFpcuohycTGcR/r3WQ9uhhcmM9Ze/dxqzu/WY2dTUIJ5iHuQx8i1wiaiN3V8qxImTYEYbSKFas0cVN/DYY2kN9mxoCUpIjBS76TObbJGZQPOjL3H+j18VkKA9HtBuOOydGlIQQ25ABpEWNQEDnH2z37UH34LsB9x1tCfwqEOUms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=qOkc4VzF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K5+bVDg0; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id E074F1C000C4;
	Sat, 11 May 2024 12:00:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 11 May 2024 12:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715443227;
	 x=1715529627; bh=vD6rDPAVkIjqWQOwrtHmYQ2cQTTYvi5Iri1uGX4o4Ig=; b=
	qOkc4VzF1JvExNaogjpWVEW6xmK7tekVQIi2e0HSPcDXLAYhDLGl/IRfKF1MHTPP
	kKN0CR9BNnP1Ovs3P+oAlbTG/Dxf9O9n4i3xdVwHdJbxNbW50vcSoSVwQVMDen2k
	8bMSpHB/tYpyX+8J7q3mZoj99zcdak0dNdyRK4IJLhFtaryIvTs3KiyWiTVI3HFr
	CTmZfgoU7Tul3eEHPASxRq+4XTysz6nxwvG40JkckXM1USo5Smi0/4bvUO8Gz7Jt
	TUqFn6qM21tDZEcyM23K++qSvna106MiQ417o0DdLfq1Gm8wuwBaNzpTkd31uR90
	rIo3lfzetSxvRSBX6MQ5Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715443227; x=
	1715529627; bh=vD6rDPAVkIjqWQOwrtHmYQ2cQTTYvi5Iri1uGX4o4Ig=; b=K
	5+bVDg067w7uI21QmH+ip2A90cgGT7EKJGlPvNGFvh1mnjhLCYKGya1DkotarqTG
	3OrZFCNQnejzwAg9DJ9NNC6N6ePiE81WLmurgNiXu+SYkyymo37uL9fj9bTcLqtk
	GadEVgoU8lQA1MKM7QIIC+RtXFVxeCC5Dycgbts/jPkGWBlw1xMUkD1R7Qo+YVXY
	Og+nXfBL9fU5Xx+tcTyHgvk1YTwrvRCWX2BJ7XRiwGcaXzvZLj6z4XuM2tnpHzZr
	kRnk5ZoUx1QorYU2D5xJOIzmHqCJPKR2QqMKeYVh2uwLUrOFaSteSh+k1EmDmpQY
	E1Oj6KgkPzKIuu5miQFjQ==
X-ME-Sender: <xms:G5Y_Zsic8jRPSm2B1Rvt8zYNQh4czuAEUROI5MKTQ4rOFslvBBbj1A>
    <xme:G5Y_ZlCNfsTWta-NdaH5Y_MAAPl2eZrn2To6vQWrppPJ15MorG_JdKGtnAb1I0fSn
    kH3vwfIDABDYhPHGQo>
X-ME-Received: <xmr:G5Y_ZkFj-PmdJdDR-6Mv8G89ayqpBx1-DQu3bSwZx_-oMHf_svz_E1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegtddgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:G5Y_ZtQUvrqZeKQCpRs6dZD3bEhbsK1Hgce21b0rQq3-CYT9CB4z-Q>
    <xmx:G5Y_ZpwaWZG2LgrdGnjtCRPHOgMF76lWo8b0cvEVycE2chSc36Q7_w>
    <xmx:G5Y_Zr4Yj0EZ3ndWzZnaUpvEF73B_mhe9_g4QF34txA32gvzkYeJhg>
    <xmx:G5Y_ZmzO7X8f9wCT3hCa4TNdW0TtE8Xq0ROEJ6995ZJfKnG97ipG2Q>
    <xmx:G5Y_ZowL5tsngCk_XBW8-yjVAAMrUlbm2KMC0jLznmVvR7c81sqYCFUr>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 May 2024 12:00:26 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 11 May 2024 17:00:14 +0100
Subject: [PATCH 7/7] clocksource: mips-gic-timer: Correct sched_clock width
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240511-mips-clks-v1-7-ddb4a10ee9f9@flygoat.com>
References: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
In-Reply-To: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1957;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=QoFq1d4EB6JF/VXmsnCt30uB7ETZJLm1mA9nrZugG5c=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjT7aZwcr/WclZZ8rzkRMqco7veuiZEM50SNZM7+3Ke6O
 Vb27ZztHaUsDGIcDLJiiiwhAkp9GxovLrj+IOsPzBxWJpAhDFycAjCRgjSG/95RmfFeJXe+rEgr
 tmI4y8DhHmYzJ2XChrVmCgxbzZgEvBj+B082ituR2Zid4aYudfrB9EW3unnsmu68CKkL4GPeuSm
 TCwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Counter width of GIC is configurable and can be read from a
register.

Use width value from the register for sched_clock.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/clocksource/mips-gic-timer.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 67498dc9c5a5..47143e49fc44 100644
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
2.34.1


