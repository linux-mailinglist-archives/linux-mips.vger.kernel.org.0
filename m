Return-Path: <linux-mips+bounces-3238-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6AF8C3246
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 18:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A9921C209E4
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 16:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D2856740;
	Sat, 11 May 2024 16:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="VgbnpXqE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g/cgWqhm"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B159738DD3;
	Sat, 11 May 2024 16:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715443213; cv=none; b=kVgW26IVWkqgavGGPUTypywe5MNmy866x6nq3TbWm++J6x+cddlpz/bjxDBSCSczvb2ghOPCL2xXKb7ZZCfFZDw9z3SPbiJ2C8/skloI4o2H3BeYltdYkh5GknDVgSRmuJPg5150WIAhKeyw45qHI1FR50jZBLG6nWk96/M9Chs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715443213; c=relaxed/simple;
	bh=whMjsLZJGaUajod7KF9MLT0d0IbLjahrsbL31bpTkAo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wt/eJsXrrmSoqCk2hNEOee1USiM3Cvj0wGNyFmV26ApPSLk5/SDEalxg93ce4WAGndKSeIwgpcHY8lyEpHChixU4NZvABGPtba6eMW4cBy4QIl0cpGqlR1Ub2/pQw3Nwcb6yQsCaNlofaq8Qm++qNdSolxWNx71lIesw5zLUvVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=VgbnpXqE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g/cgWqhm; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id 607701C000F7;
	Sat, 11 May 2024 12:00:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 11 May 2024 12:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1715443210; x=1715529610; bh=W6
	xDaVpMV3svJD9qzdHdtlzYKGqhyjFklxVbS5VleSo=; b=VgbnpXqEcHykLaUrL3
	igbjKCTauJKq3vshSWnb6RB9Dj1/w3dFWXIMwd+1osZ2DNyfdPamMG7k3uFjDeXY
	syo1274AS3TClRT75E+Hgd+vLGN8PRph9BSzguR/65fLidNQM6rYCZTU47cGNjHe
	85/4+YeCmpuDdyVDcSug2Iz9/27AR56Jd8+XTKvLBWpJw4WvzIq8BWhZVGAJJSne
	Zd8xMilwIzCpn2D8HXwtFPeyah6XmFS6KsAQ6ptrCkLuDsXPP4iCQf7sVm4IEClI
	aYL3lMZG7PmZZNPErIoJUG93pgyQZ+x+4e6k1+1za2yu6V03FUMFCR+7wGBTH17D
	WnOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1715443210; x=1715529610; bh=W6xDaVpMV3svJ
	D9qzdHdtlzYKGqhyjFklxVbS5VleSo=; b=g/cgWqhmRe6hXkSA+L5pW0/lYcG+O
	Q+bCnWEQYhhTq6ORs0+1GXi/AJ2w9nIfNXgIyacScfeTVlDeTaMuLonXk32Wga+9
	En0Wu/GTcKFyKvRHd1rLVaLk3D37D10PKe3JM0eFDKYw1IU00M3qr5tUYA39Lnl1
	wCMPHriSGZOXtfAPAIOx9q0PTKc3mQdkh2JOjFvTbWcMH3KuRz+3G/K2Dr8ohkHK
	JtquVgTAZv61WMvQBz89zfHmAaEfYtk63FPXC0bf7JK2Vi1gDfd8pC1BGD94BNyw
	lWDauYxQGggBrZrypTHCeOabu/dL8LqCvcPtml+P34PS2YAu/28Txn+dA==
X-ME-Sender: <xms:CZY_ZvLL1quJbmpA78tvkEfjZesfcDdxA1_M1bKhGh3YMPOtbvN5jg>
    <xme:CZY_ZjJevkz7fM1MY08OIUTYKzZm9mjo413vu46VYwb_z4MDXLXnjBwzASp6byRXt
    6EwsN8HxqnX7KyTKJ8>
X-ME-Received: <xmr:CZY_ZntfJ99AFofMEuABCLCLuud6pGnPVuevITvNv65tIqgoKXHuIIE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegtddgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepudffffffhfeuheevhffgleevkeeugeetfeegieeijeehfeekheek
    veduveeigeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:CZY_ZoaV01d29FijQpgyzJd7ce-KwRGTQxYL-40QVVZa9gIL6hl7Ng>
    <xmx:CZY_ZmbSOMXjK6VEo8pKI4BZ8DdSpOKvme9yI9kv3QgCzXVX79tK_w>
    <xmx:CZY_ZsDVJ_HV5dNZLW8SdWYl0xcJXVj23mG7TAipWqzplm6IwJdF-w>
    <xmx:CZY_ZkYUnnfjZXN54_kilJjFWPhyCH0fs8RDkj03YnHD4MqGmrrbDw>
    <xmx:CZY_Zu7YI1pm_lS78tcLoMkoLZWnVDQXaqrhnKcIl1DhX0B2CYY_N4qX>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 May 2024 12:00:08 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/7] MIPS: clocksource cumulative enhancements
Date: Sat, 11 May 2024 17:00:07 +0100
Message-Id: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAeWP2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwNL3dzMgmLd5JzsYl1LAwNDIzOTtOS0pFQloPqCotS0zAqwWdGxtbU
 Ac4p0wlsAAAA=
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=whMjsLZJGaUajod7KF9MLT0d0IbLjahrsbL31bpTkAo=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjT7aZydpf9lAmbv26x/JlJrYalDHmPkAnGFH/c2z8v/o
 bTUNt++o5SFQYyDQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACZyLpDhr9iVKXwL7VZJ5hU/
 c/Oavv7C7QQJNtGKy/sPfd6zpejspkuMDJ/O8xrJ81x49OvW8psx2t0aUateyj/PXDJ57hv9ogt
 n2TgB
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
Jiaxun Yang (7):
      MIPS: csrc-r4k: Refine rating computation
      MIPS: csrc-r4k: Apply verification clocksource flags
      MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if 64BIT
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


