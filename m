Return-Path: <linux-mips+bounces-3594-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6E0904E8A
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 137301C2179E
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 08:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B699016D9A6;
	Wed, 12 Jun 2024 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ke1S2oNQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VgvSWGuR"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F332D16D4F0;
	Wed, 12 Jun 2024 08:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182476; cv=none; b=Fd/+n4e5It736cYDd4jmrOg2MgxT59WpxIuKK8WPS3UweHDXQ8yS7lR0LJmoS1htGhfumWU7lx8PG4agmgsRMAA4qs1JhJK62mc1JXKdSH/LIQ5C7R7gpkekROAPBq91oPi2CvFJJ79TB4oOMobkGq2iDA5niS7XnNF1+o5WB9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182476; c=relaxed/simple;
	bh=CbzxrYeWgw0AJwKo1baxmPySDo25rlvVno/AJ+pxyo0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hr3g5W+vmkY8OG9DxYryc7HH20x61HXFw8fFB6mfoS0MxZjBrZTD0mDtpbQB1MCzDEw4nNEh4E/zlc2TjzRg0NxrQmEL+VpHLIvBOxBpFoK9wNc47xlS+BYKCQ+zTYI2ULdMtAWoHz3Oo+HDqcnv3qBYa4p+kpUs3ZDVccBhI6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ke1S2oNQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VgvSWGuR; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0E06011400DB;
	Wed, 12 Jun 2024 04:54:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 12 Jun 2024 04:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1718182473; x=1718268873; bh=ic
	XDkmrTkbw+7e+GGybAesg+ne93WRifjmWt4ck9bYw=; b=ke1S2oNQuCwTKjl7Nv
	oLVyjLUoU/Z9kFiwl9ZCcuvl8FNbmI44QG9IacwtjZPV+2OwhgJmvB4IN3cF0b1n
	Rj9ME3vGwdKGYYAJLt84BnoWmtcSrihs8qpgthRdhi2vbtOI6MIJtEoaFY2AWnxQ
	J5BbM2FprBzjwUsx/KxH0EZNPSQM9Yj0Jt7otDHvXX1DGPCVJ4gnGHIXU9ORmbiy
	mGmpOgJtrZ7/kxcNJeY3UMaffYbTNG1ndAKEzlFve/GP2k5CSGwc2mJjeS9Mxber
	oWn32peWuyZnrPU/XczRxf9DH/5EXS6GzrkKRgKyKt3VlWUcWVG1sRPwdXTHcwQB
	0krQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1718182473; x=1718268873; bh=icXDkmrTkbw+7
	e+GGybAesg+ne93WRifjmWt4ck9bYw=; b=VgvSWGuR01+nMSBmxbHSmR66vfv1j
	t2nCImmSfZ9JEFHael8hv430aAOlkCdB/b0+4F7/1ToxJ1IDnqTl0GhkXbfuf06L
	th8tlAukTewCyVRn548927GHO6LpVXTXrWiud+8dPWYezlOOennwSKsHc0cUOuBw
	XbFxZw8QvDSegXbW86ZUkdSKYkemY9x1hl8sUPvMpVL1rzGQWHbIrJKG1QZdpz7t
	Exlu0KveU31JuTTpNhZ+vjmWg3krTczkjjQjhyEIibAZQZmwx9HBB4sX33TfO2Qr
	sZN1nfyUVQAqzj0tOKWTmcoZOz4W2FhCrxQdxzWkF83gFPpHYKeUyWd+w==
X-ME-Sender: <xms:SGJpZg4ksddIBtrvtmZRA6Wz9z7fyrGTSCUAQUhN5_Nv_if8Ssra4Q>
    <xme:SGJpZh4Kr6Ul5gUV_TKufHPbfydWP8i0Bd5CufpBVwZzuejA-eVq7tyUv1kbc3Pz9
    rGCjoIoyrbF9YWsB6U>
X-ME-Received: <xmr:SGJpZveaph3GDyOgO9i3l1tUGly-EmiVsNPBzPqY903XWPZW1mtX9eo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepgfevffejteegjeeflefgkeetleekhfeugfegvdeuueejkeejteek
    kedvfffffedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:SGJpZlJRwaGRBQrFg_nfXkX9-Lb3xM2jMhwztbIDvHmTdFiAT_g53g>
    <xmx:SGJpZkIQO94-JlbB4N8q3KTlTuo5H0D5lS98AfYquokjztRo0y6fAA>
    <xmx:SGJpZmzUf2kFeQ7HS43sELaoXHlmxM8ByoDFyR6-BdK69U1yl_CS3A>
    <xmx:SGJpZoILdLKTJ0PllA1b0TH_7ZEvppe4B-x8fd5N68sEQI6Fx5QhFQ>
    <xmx:SWJpZpVq9UqZk4axxpwhQwjKrMPXR8tltf0EFhmSHoU9N79sTBVKcGEV>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 04:54:31 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 0/7] MIPS: clocksource cumulative enhancements
Date: Wed, 12 Jun 2024 09:54:27 +0100
Message-Id: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAENiaWYC/03MQQqDMBCF4avIrJsyCWkhXfUexYUmEx2qRhIJi
 nj3ptJFl//j8e2QKDIleFQ7RMqcOEwl1KUC2zdTR4JdaVCoNN7QiJHnJOzwTsIgSnXX3vqWoPz
 nSJ7X03rVpXtOS4jbSWf5XX+KlH9KlgKFc61uJBIZb55+2LrQLFcbRqiP4/gALnSyk6QAAAA=
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=CbzxrYeWgw0AJwKo1baxmPySDo25rlvVno/AJ+pxyo0=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMJPebe4N/+p5ki77pGPXNKXTnhSkfMxr3rbfi/l/hb
 VuVuftvRykLgxgXg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAEzksSbD/+qWB/8WZU99as8q
 3LJZ547cqiBW3d01zilnhGVvbxH7M4Hhn9oFT+a1Rw8m6YW0rTjHcyC7R7NKccWjhds9vFjPp8h
 cZQMA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Hi all,

This series combined many enhancements for MIPS clocksource subsystems,
It improved r4k count synchronisation process, clock source rating for
selection, sched_clock eligibility and so on.

It seems fixed random RCU stall issue on Loongson 3A4000 multi-node
system and some boot failures on QEMU.

Please review.

Thanks 

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Changes in v2:
- Fix number of zeros in rating computation (Maciej)
- Only select HAVE_UNSTABLE_SCHED_CLOCK for SMP (Maciej)
- Link to v1: https://lore.kernel.org/r/20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com

---
Jiaxun Yang (7):
      MIPS: csrc-r4k: Refine rating computation
      MIPS: csrc-r4k: Apply verification clocksource flags
      MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT
      MIPS: csrc-r4k: Don't register as sched_clock if unfit
      MIPS: sync-r4k: Rework based on x86 tsc_sync
      clocksource: mips-gic-timer: Refine rating computation
      clocksource: mips-gic-timer: Correct sched_clock width

 arch/mips/Kconfig                    |   1 +
 arch/mips/include/asm/r4k-timer.h    |   5 -
 arch/mips/kernel/csrc-r4k.c          |  24 ++-
 arch/mips/kernel/smp.c               |   2 -
 arch/mips/kernel/sync-r4k.c          | 281 +++++++++++++++++++++++++----------
 drivers/clocksource/mips-gic-timer.c |  20 ++-
 6 files changed, 234 insertions(+), 99 deletions(-)
---
base-commit: 704ba27ac55579704ba1289392448b0c66b56258
change-id: 20240509-mips-clks-9001264fcfbe

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


