Return-Path: <linux-mips+bounces-3600-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61770904E94
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE027286CDB
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 08:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF24D16EBFA;
	Wed, 12 Jun 2024 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="mHRmt356";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g2OhCaQL"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4381716E89B;
	Wed, 12 Jun 2024 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182483; cv=none; b=rYfbicEt1dbwjZVBb9hG0+SAriAOrvfDnV5wv8DezSj5FcLTXjVqDjMkUZZvkVr6hNIJgjusIolGbv6q62MWk/VfJYFHj+EIE1vOVr0zNExBE50CUKdz0lGWq+92WPsFP/7bboZt+nJZchxErT9JrGzowBTw/4/+/WYqM2LgUQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182483; c=relaxed/simple;
	bh=ubnQb338iKShZTU1iTrw7BeDTT6ctPCLmk5scTR/g2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2L1dm9fFNpHNTZWGFuKbkFKt/cz9tj8Y5CsleE/5UPfLEERdMKtjDWXYcbelO3Ayy1yzvRfPdrNiYv6QzoN83S3+OcmHoCByQxxsZ0DpP7F3vfC5EN5EmORyVHFz3V1uvq5VPYc8nSxdGyXuI8sQ4w1qubsx9T6MjsXavBVKZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=mHRmt356; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g2OhCaQL; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 69E3613800FF;
	Wed, 12 Jun 2024 04:54:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 12 Jun 2024 04:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718182481;
	 x=1718268881; bh=qYBXHzwR0jL5n8ok9fiDtrURuk3J/fQJOqmVN5fEF4w=; b=
	mHRmt356EBg0skJSBX/7hyT+AADIiVf6NV1im6OSFFIlSshSauq0za1IUOqwM5nR
	rcNHcsTVjuCJULubMFF0ABhJCg9Js7Hostz9eLifqbfp2lstHo4yQG90BGwei8Cv
	qwfJZDtlE+EooRitnO+tXMkyNE9zOG7yS1esJR46ntDp5NKO5FlR8VIyqmP9dhjk
	BCOb5CEQEDyWlU+sltQTgZKTj/mQR2rp4n4cDC8igzsvTB9I2es/v5kRtHBslUQ/
	p/26sq0wVKDyiAZGZdXgI1k1klBninwKVXPeNb2VZLVBOHfbNGzL/7nnOl9mGr5f
	N2otlUGgzIrsV2gO8PUOqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718182481; x=
	1718268881; bh=qYBXHzwR0jL5n8ok9fiDtrURuk3J/fQJOqmVN5fEF4w=; b=g
	2OhCaQLfm0/7xxu6SJgtr2jwL3WttSex7O6UrYGOFBGhFcdcdkJrhU9hDu5AQs2R
	sd383ua/cpH3gR5YoMZZlTgXjvViJyJgD7+rH2yxEYpZC3/hwboMXcPHT8I92QDI
	iQ0Wy0e5VgAlzMpZLXEC5rzN3v0GDpp3SewsY1LKZHbAnlSe6P41dn7v55+tISdV
	qgu7OyltliAofIZUVmhb8QYmDsPvBk9YTwPTl0QWwOkcriggJo3P65Km/JspKJOt
	pw7sXYMSp5ZyIhQZKYeMvDTtidkgF47gxPBMDa+qA/G6Nj+ZoEdjPQUtGB0SLwEr
	k4fLLAUly/v7IMJrB4uRA==
X-ME-Sender: <xms:UWJpZqG2ok0ZJk4bD-M8F3qaD_7je5N6hh7NWuno-gY3PE4nb6mj7A>
    <xme:UWJpZrWEvoBEIW-7FK2xdNaWy3R11bkYjh65lQlag4c0vazoaPhn57awwua6GclbS
    cl7hg36bxHMrkcjNbo>
X-ME-Received: <xmr:UWJpZkJ3lUA8pKaNeyZgeHLiEDaAWomfaHgL8H5b5VPZR_aDd4mhMgo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:UWJpZkF_hDrc9zj2dfWCXQI0qEJUn-vTFmQ91UD0mDrZGaBCyPbjbg>
    <xmx:UWJpZgVZ7t7_TxiacJN9409hKzr5R6Ui8yPb63hwOSE9PdZrisGHTQ>
    <xmx:UWJpZnMB-fYxXUPnbDRFKIrBwTHlhxs0uw4JZuQg9DjO_M8cd-cGqg>
    <xmx:UWJpZn2B9GFZrkguIKR_8V9FklHhTc9knJ-RRIN-PxyKry7EaR9smg>
    <xmx:UWJpZkq0eJJfDm0kK0Pemrzq-Ip7Wm4jN1XYfo4Kn8JON6wEvqIaqrZ0>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 04:54:40 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 09:54:33 +0100
Subject: [PATCH v2 6/7] clocksource: mips-gic-timer: Refine rating
 computation
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-mips-clks-v2-6-a57e6f49f3db@flygoat.com>
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
In-Reply-To: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=ubnQb338iKShZTU1iTrw7BeDTT6ctPCLmk5scTR/g2M=;
 b=kA0DAAoWQ3EMfdd3KcMByyZiAGZpYkej99mdg8cccBjdsvZE17rDTvcux0h6SSDNZtOc24FAb
 4h1BAAWCgAdFiEEVBAijrCB0aDX4Gr8Q3EMfdd3KcMFAmZpYkcACgkQQ3EMfdd3KcMtxwD5Aez6
 5355Bn0G0hxyZCy0m/EYO7G5FSQCNetKlyO7ZSUBAM2slUf95REmTxEDq3wILWXN3ShI7x1R8Zc
 /K3XCOI0M
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

It is a good clocksource which usually go as fast as CPU core
and have a low access latency, so raise the base of rating
from Good to desired when we know that it has a stable frequency.

Increase frequency addend dividend to 10000000 (10MHz) to
reasonably accommodate multi GHz level clock, also cap rating
within current level.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Fix number of zeros for 10 MHz
---
 drivers/clocksource/mips-gic-timer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index b3ae38f36720..7a03d94c028a 100644
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
+	gic_clocksource.rating += clamp(gic_frequency / 10000000, 0, 99);
 
 	ret = clocksource_register_hz(&gic_clocksource, gic_frequency);
 	if (ret < 0)

-- 
2.43.0


