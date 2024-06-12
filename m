Return-Path: <linux-mips+bounces-3597-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4FC904E90
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D8CD1C2179E
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 08:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE08016E862;
	Wed, 12 Jun 2024 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="MeY7WfHf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EETNPg0R"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E0416DEC7;
	Wed, 12 Jun 2024 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182479; cv=none; b=jgxccqnd9jiaQ3hziGWJy5c30ibJgq2EayuQJotsfCAei47GQLKpmA4yy3N3eSIb1anNPfvpfsfrV/Mr9Wn2WauuwojSnsA5zTueiV2/WHyWeKN3Etqz5OKTapkk8EOU0yDKWWiYF2NFqmjas25zeJNxHi/419dA/SXn4z94X6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182479; c=relaxed/simple;
	bh=/1HBI8X5gA92dWi6gRt06ZHjuNwe7f7CMITzKjoFsHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7SvM9lhOTWA0ajm98jgPcrTyqChgNiGzLOKk1Zavs2K6FcwHcyVwk16Dvld1HbWCvRuYIG4wv2RBx0ZWPkLD9Guh1ZVQzqcu2S2IbSs/L/IlOMyfgQq2b+cxiM0gqNCfoHyE7iMSYoebzII8wC7bYs2SEi842wRM4rVSeeG8+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=MeY7WfHf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EETNPg0R; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 311C911401CC;
	Wed, 12 Jun 2024 04:54:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 12 Jun 2024 04:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718182477;
	 x=1718268877; bh=Z7ouavquBUW1UOR6mgu9lgLaYW+/owiNH16TMADGF2g=; b=
	MeY7WfHfxpVk1JibBDHh5KRW7eiaYrQi2D/8PmdclYJMwFFA7QIbpI/12pu7L5Xf
	8/YeGjwQucHZCq2qZqUT2y5aOIrIbPcuq6pBRACaXF/DoNIL6/AU46ii56DzaCvO
	LbQLTvKuVO2zfRzPnsD/IswZp2RB1y/sg5Qdyil/9ZC70WMXB4j8te1dlxeIIbwb
	Ie8zkLoC/Y/6gcEaAfNdBh9VAkRX/IIqADSOTNVOXkmfeTJU5qS+5snY87L2xziX
	LFoMhusdV7JONyAuTjycG3x/mcj26PG1aVTYBjADrqDCICk4APSo7EHHxJHNnRtC
	nS4y+h9F1Z/ZRN+Q4KtXEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718182477; x=
	1718268877; bh=Z7ouavquBUW1UOR6mgu9lgLaYW+/owiNH16TMADGF2g=; b=E
	ETNPg0RXWaHoHojpUTQmrGxt3zeAcuvAvhfyUCKlwIExW/wIZofmBNE+TjZdtMon
	nUiIjtaHnbUC2htU8hNSBuYTcILPJ050PTT1M2twKN/2zOJQxWjikL3trnCtINgS
	p1FGfBtQd1TyWhkvFjlvB8yODZG3ydO55HQflcqRnwmMaaJ1ynt9aWw/M1c90MPH
	0k9DqIPLvhCDmzOJSIlCh6ULJ0LFQ25jMfK6wXskt+EzgJDAukl3jUjOp95qXkMv
	Hvbgfp4FWQCngPDBdnjp9DbLjASkPqDlab/13J3zTnIhoRxRN8S+qNfqV94it2ka
	b5LjauigO0COx0QoFWNxg==
X-ME-Sender: <xms:TGJpZjBY_VhEuovSmj-AgAnppL8-DJIrmImH08U-Qu6z1McCTNxgCw>
    <xme:TGJpZpjIT7UCBxQ5iU7K-Zd1WSDe8H31T3NwcEWK8YQuPnZASx3Jy0sdrMtLLUcA4
    EOei33lXEzSVrUWOUo>
X-ME-Received: <xmr:TGJpZulQsZSKiX3sYoyOVMW3EjZ-7L5cVShec4s151wvEOR7VdsCRfE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:TWJpZlw14IfeaN4UfXwzb2Js4z2WmoANm_uss2y4G9sYsDdOedtZjw>
    <xmx:TWJpZoQke38Ye7PhcXNYP7m71u2MLawEmRfVOufJaV7xwrPfl1oJEg>
    <xmx:TWJpZobA04xco2KInSrTM1ZnWzVyP8Sk4xou6QE2j6uVSdfL_c5BYA>
    <xmx:TWJpZpTuRlds9K0WQ1anshWeOZQNo2vTjbDrVcq0-5BxWE7seu4yZA>
    <xmx:TWJpZrFF6mTehmyrRBUAKeqOG1UbdwebW4tk8Dt5ORiF3GOrekjQUI8Y>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 04:54:35 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 09:54:30 +0100
Subject: [PATCH v2 3/7] MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if
 SMP && 64BIT
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-mips-clks-v2-3-a57e6f49f3db@flygoat.com>
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
In-Reply-To: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=723;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=/1HBI8X5gA92dWi6gRt06ZHjuNwe7f7CMITzKjoFsHY=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMJPfQo4IxfadkbvfcyxQ1OWl01tm1vmmCi4nUdoVCW
 aHbWy91lLIwiHExyIopsoQIKPVtaLy44PqDrD8wc1iZQIYwcHEKwESyKhn+p7NGbLB9sfVH1fP5
 8bzl31W89Fs8r21qtWa6HsMlYqkyn+F/6N058VPq/pw+fNh5y50H0fMTKrurX8+9vy9o1sygPZf
 bmAE=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

csrc-r4k suffers from SMP synchronization overhead.

Select HAVE_UNSTABLE_SCHED_CLOCK to workaround drift
between the CPUs on the system. HAVE_UNSTABLE_SCHED_CLOCK
requires cmpxchg64, so enable it for 64 bits only.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Depends on SMP as well
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f1aa1bf11166..656df5d4097d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1083,6 +1083,7 @@ config CSRC_IOASIC
 
 config CSRC_R4K
 	select CLOCKSOURCE_WATCHDOG if CPU_FREQ
+	select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT
 	bool
 
 config CSRC_SB1250

-- 
2.43.0


