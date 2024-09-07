Return-Path: <linux-mips+bounces-5403-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB988970202
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 13:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DD0F1F22867
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 11:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F9015B98D;
	Sat,  7 Sep 2024 11:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="lS2Ys18X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kK0X8Co8"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A3C15B551;
	Sat,  7 Sep 2024 11:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725709707; cv=none; b=qtpqscBSBhe72dzumRX1KByNv7uetpCZ4TQbEkq5hzafYJVNMKp9S6stNLEqBfVCraAsUaiYCEHgn0v7km4iz+WWQHHhWP7FvDOxJT2X07DNWgFVTWcypRONSG+SSkuj1PjXDQQQNdC5g9+c//JxGX3pDD2bj+HY6F0rP051sDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725709707; c=relaxed/simple;
	bh=h1CQghwYCPF+SPQ/gns7o2gvkxa6sP1KKjEjw9Zu6Ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iq2OgeBCTKj7QnLawNA4l4N1irsLFY7KcRvqVikKvx56op8fXc4DXBWFOk5E5nYzYgcFNitaSh8hIWP91AU/47t4s3NT2tRa63vOgu0fRmI/kswt+vvQY5y1v18hgyH28caUSdQ4L7FzR2HexKFECjlQ/jsdfzFN3yA6QlxRxRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=lS2Ys18X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kK0X8Co8; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AEDB31140397;
	Sat,  7 Sep 2024 07:48:24 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 07 Sep 2024 07:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725709704;
	 x=1725796104; bh=UYj2B4lpikMda7PIIE6TQxRt02SlCYsTBh0EWJX+0Ok=; b=
	lS2Ys18XMJrhJzIy948eVWDkHPjqj4x+map2exn8P6NmSALV5nA5PTsqJA4+uu6Q
	FaDoooqH2Z658sJIIq/7krUclbHy8WXR+2vHJLtRgZ+I0b7k6O5JXl5yvR9HWejV
	NhswDalwGfHt/mj8UMgS+t+kaoAi2RNmKAkFAuFyzF94fyCWwel0EW4YZ2ArsoHb
	qivE75Y1gUO1OnbV03nR9tjlJiupt78/bc8nKi4T08BhVzLCJexjzMQ8atIPBCvg
	vmiIRhDSdmE9gc+5iwU5dZUcXzQxzlzmf7u9xFL9aVvhld23TEOBPU+8ILV6jEnI
	P0bUyshsxfNlD/b6sSlowA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725709704; x=
	1725796104; bh=UYj2B4lpikMda7PIIE6TQxRt02SlCYsTBh0EWJX+0Ok=; b=k
	K0X8Co8gN5PkImhT8+CpOx3FHDcdZvlYqkCoX6iIieb+dBTcsHoA3UqF/qqvdwAx
	ZUuEdeziVoppdpdcvOVoz7yAJhW695gm7f90N6Qe4YwwilNHFhKb2IXOlgv3bIZl
	0cP5yz5ZNO8RmcKLiZl7ACo0SRTze1pbi6ae0xK+mWiPZ/7/hNjkr628EtPbO2tk
	x6LJWnmyspdzoqP4oYPqKpRxlF3PZ2Y6eRAHjkoJpSBUTy0LVcayGrWPLbyAqTGX
	jXd06DAcN4pMajA7/tUyOyhVDqm331uEalpk8Nma/RZekeazQkViNf0VA7a48hg3
	UvOgyj4eupIheT4zMhJag==
X-ME-Sender: <xms:iD3cZttBa-DIHF1wLjApIb0RaYMxxOATLhW4MlOWrR8DOwegJNohyA>
    <xme:iD3cZmfor9Ib4FD2Gldvxqomgnsu_Z26JsEEOttYJaPRFv6Kij0JhdL9xC_wXRAMo
    xygtNHCmI8DfWtq9tk>
X-ME-Received: <xmr:iD3cZgzWBkjbTH0Pntm6Zp8dxmM4hVzXUOL9qreQJPryVZ8IQ2I4dG1dPisJ5AUd_Hw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeifedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
    gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
    tghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhm
    rdgtohhmpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpth
    htohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopegt
    hhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmh
    hiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlsghurhht
    ohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlh
    hlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhgrnhgtvghrrdhlrghntg
    gvrhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:iD3cZkNXK88U_GhaUiMzGF5EkDd-fMoYi8oCojcTWizArmAQgUYkdQ>
    <xmx:iD3cZt8d4u3Du4hNSC9iLGfUfnb-upVIGQXO5ccofzrQi0NXqBbrPg>
    <xmx:iD3cZkWul9wVTJHaTuRlSYXbvc-YNZvs89vBaoO_l1s95Dq7nuq-1w>
    <xmx:iD3cZufCYCN-2q28uxAgTI2M1lxnS8fu72c2cSVX3A9InVhiaXf30Q>
    <xmx:iD3cZu3lF-Toz8nRhE9a0WALX010hmaIirUrQsb-_itK_7mBy4AKZGqt>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Sep 2024 07:48:23 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Sep 2024 12:48:10 +0100
Subject: [PATCH v4 04/10] MIPS: Move mips_smp_ipi_init call after
 prepare_cpus
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-b4-mips-ipi-improvements-v4-4-ac288f9aff0b@flygoat.com>
References: <20240907-b4-mips-ipi-improvements-v4-0-ac288f9aff0b@flygoat.com>
In-Reply-To: <20240907-b4-mips-ipi-improvements-v4-0-ac288f9aff0b@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1192;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=h1CQghwYCPF+SPQ/gns7o2gvkxa6sP1KKjEjw9Zu6Ww=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQ7tnXeN1Wj9ewvzTKt1kxq9Fw5UeDhjucqws8eR20s7
 pHdtCOno5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACai7MPwv/rHi9LlV5MPROhL
 2HXtDg4sbTC3NbNSPDa1aVP///2HpjMyLNLovDF5wv2aGnbFJXP2RCyLk3zim6axT+6Q7cd/eZs
 fcAIA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

This will give platform code a genuine chance to setup
IPI IRQ in prepare_cpus.

For most systems IPI should be registered by irqchip drivers
fairly early, but if IPI IRQ is tightly coupled with platform's
SMP implementation it makes sense to do it here.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/smp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index d3c7486fee3d..81ae65f21f73 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -375,7 +375,6 @@ static int __init mips_smp_ipi_init(void)
 
 	return 0;
 }
-early_initcall(mips_smp_ipi_init);
 #endif
 
 /*
@@ -466,6 +465,13 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	set_cpu_sibling_map(0);
 	set_cpu_core_map(0);
 	calculate_cpu_foreign_map();
+#ifdef CONFIG_GENERIC_IRQ_IPI
+	if (mips_smp_ipi_init()) {
+		pr_err("Failed to initialize IPI - disabling SMP");
+		init_cpu_present(cpumask_of(0));
+		return;
+	}
+#endif
 #ifndef CONFIG_HOTPLUG_CPU
 	init_cpu_present(cpu_possible_mask);
 #endif

-- 
2.46.0


