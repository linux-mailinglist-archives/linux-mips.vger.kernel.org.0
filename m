Return-Path: <linux-mips+bounces-4838-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B3294DCD2
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 14:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A06AD280E3D
	for <lists+linux-mips@lfdr.de>; Sat, 10 Aug 2024 12:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E130158520;
	Sat, 10 Aug 2024 12:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="S5C7RUBY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JiNfGnkp"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CD1182D8;
	Sat, 10 Aug 2024 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723293556; cv=none; b=vBihPwHWjiHflLCgvs4pJxgnD3IN6II45nQoJ0ao5q3AzKYEnTV79Nq9/8YZbmXMbVDuRIVgtdeD5NAq0/bWFzF+CnVeoDLot2mQqp4kOWsXWbd6zxFyHL2eH20ZhNoNC6T7vAEVCxz7GTjyEdHESX6oXDUs9qftL64Xw67Dw+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723293556; c=relaxed/simple;
	bh=84UrtPhUIzqTXHOszQl9AJtJJits/wNbjdUEKeT5LVk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rolWc9WRHCR7Oicce82Un3DqQH9clzs//OXU+QJdbKrNWyfJEebLDk4PUwREe7GKxjSjI+f5drcAVqUy7YFUOZyOg+YFXCkAnPkERFj2dAeSWwm1O2XxtMpTDuCmXLmRxDmK8ETye2NG7jPYVxr+NxJlCcReDSqiqETzTMeChHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=S5C7RUBY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JiNfGnkp; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 7F40E11520F5;
	Sat, 10 Aug 2024 08:39:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sat, 10 Aug 2024 08:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1723293553; x=1723379953; bh=c3
	kJumPlmw6bEdKrQXU1IrBygp4YWOMOJr1E1+tFCj0=; b=S5C7RUBYzLUirf3GJA
	vSWW0cidMaj/o9WTR5+th/GrAgMckwzptyw46emGw7p1zDZTI+G2Vt+/qm1YdFCH
	MPfBySZbI37kC3iqHxSrybB3dd4gECv6lOUHFhpx8fKAadA+NG45tWSNtW5/GH1p
	KFOfvGoSiECYhY3QOsrpyMFQzbGxQvaf5IE4VqQBX9g7f/0WK3E2G+/ID4h+Zvp/
	I19VlyxG74mNabdOZdqf5Zg2v7KCOcjeXi8GvTX1N6Bis7YX2AnCcISuf3Ci+0vy
	h+qXgt7OWUB1eduOKbb7I/jy8GbYXrFtP45uwvzeRbymhAE3j46EnURa4wAFgLxA
	1a7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1723293553; x=1723379953; bh=c3kJumPlmw6bE
	dKrQXU1IrBygp4YWOMOJr1E1+tFCj0=; b=JiNfGnkp6HGpdgtmCRjhZufWccQhS
	gSksV67OREnXCK65q7x1DaV+hTH0+Tqv+ICoBUOS6DTBAF3X91qG16KEXOVDgexH
	O9lFIf0rDpWejgin94CivF/Sdy+wHUrW5YmcbU79YcD9EVv40pAF2FeJZ4fMT7aZ
	pkiJAM/H1uWo1DmoqfKeaBBFFQusG0M6nDgQK8e1fSfvP9B+Rp0Dm9x8f9JYZClW
	tM+6Nfb6a9Yws1ZJD1jioFU0qZFF3blo+KmDarL+RWL/nvkQlK62qCAU41v3ALZB
	GLAzNtqfpSuHgwJbtekZkRweKZgEOD66CQgDbUnT27dIrTzWfEnqMmLWA==
X-ME-Sender: <xms:cV-3ZsXz54uZbZGAooPkcS0WcYuUE8kCDaZrUIpV3QcMG_BRPjhXCA>
    <xme:cV-3ZgnlV878rtLdoRbFeU6NQc-JFzsZDLtTDAS7TFluGYa-f6t-gmPzshwPrZwnC
    Xz_7Z-_BuO8gjaeSRs>
X-ME-Received: <xmr:cV-3Zgbz3rymNDsdaMWt3Nc3Jui0gHBG2Az85VdOo8Az4BDVCJouoJHMojo3aySFpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleeigdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfh
    rhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorg
    htrdgtohhmqeenucggtffrrghtthgvrhhnpefgveffjeetgeejfeelgfekteelkefhuefg
    gedvueeujeekjeetkeekvdffffefudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgig
    uhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtohepuddtpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhish
    htsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhh
    rgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihg
    ohgrthdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprh
    gtphhtthhopehflhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhm
    pdhrtghpthhtohepphgruhhlsghurhhtohhnsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:cV-3ZrVJsDucZwnsm9hahwjKnzOxoZqZpRkfFlPhLF1mYjv99Tma0Q>
    <xmx:cV-3ZmnEZ_FNuIa-a4VXBbqcUqoJmGQYe7FUm_hRpHAR15Adc7MF3g>
    <xmx:cV-3ZgeTV6PNEEkPw3Qhi-u7nRAXenbD_jpla4uGeuVKbbHYFEHVJQ>
    <xmx:cV-3ZoF1c0mHJB678gKLOJnqrcQ7XhZNulFgtfOZyLr_tvw3GHHEOA>
    <xmx:cV-3ZvdC3Ao2OrCPU6EzvyrNdiXdfnAc8HMlUshVrPYqwQ_pZkLAC7cd>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Aug 2024 08:39:11 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 00/10] MIPS: IPI Improvements
Date: Sat, 10 Aug 2024 13:39:05 +0100
Message-Id: <20240810-b4-mips-ipi-improvements-v3-0-1224fd7c4096@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGlft2YC/43NQQ6DIBCF4asY1qUBVKBd9R5NF4qDTlKFgCE1x
 rsX3TTdNF3+L5lvVhIhIERyLVYSIGFEN+UoTwUxQzP1QLHLTQQTFZNc0raiI/pI0SPF0QeXYIR
 pjtRqo2XLOyOVIvncB7D4Ouj7I/eAcXZhOT4lvq9/oIlTRqEshdTKcnkRN/tcetfMZ+NGsrNJf
 CjF6h+UyJToatbWMnOgv6lt2962lyL7DQEAAA==
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3134;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=84UrtPhUIzqTXHOszQl9AJtJJits/wNbjdUEKeT5LVk=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTt8fmCdSkO83kua3mpODOHbllnvmGO0oGTiTUzQjdMZ
 Hu5PCivo5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACaysIXhf0b4qSA7nlQhq1V6
 n3TNrPed9/1xV/DoO07HbmuLi2/EtjL8ld5uZNf1T9s3pOTN6sUWN9aemifTyFysvtVkQ0jBAa7
 7jAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Hi all,

This series improved general handling to MIPS IPI interrupts, made
IPI numbers scalable, and switch to IPI-MUX for all GERNERIC_IPI
users on mux.

It is a prerequisite for enabling IRQ_WORK for MIPS.

It has been tested on MIPS Boston I6500, malta CoreFPGA3 47K MT/
interAPtiv MPF, Loongson-2K, Cavium CN7130 (EdgeRouter 4), and an
unannounced interaptiv UP MT platform with EIC.

I don't really know broadcom platforms and SGI platforms well so
changes to those platforms are kept minimal (no functional change).

Please review.
Thanks

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Changes in v3:
- Fix build errors reported by kernel test bot
- Rebasing to current next
- Link to v2: https://lore.kernel.org/r/20240705-b4-mips-ipi-improvements-v2-0-2d50b56268e8@flygoat.com

Changes in v2:
- Build warning fixes
- Massage commit messages
- Link to v1: https://lore.kernel.org/r/20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com

---
Jiaxun Yang (10):
      MIPS: smp: Make IPI interrupts scalable
      MIPS: smp: Manage IPI interrupts as percpu_devid interrupts
      MIPS: smp: Provide platform IPI virq & domain hooks
      MIPS: Move mips_smp_ipi_init call after prepare_cpus
      MIPS: smp: Implement IPI stats
      irqchip: irq-mips-gic: Switch to ipi_mux
      MIPS: Implement get_mips_sw_int hook
      MIPS: GIC: Implement get_sw_int hook
      irqchip: irq-mips-cpu: Rework software IRQ handling flow
      MIPS: smp-mt: Rework IPI functions

 arch/mips/Kconfig                     |   2 +
 arch/mips/cavium-octeon/smp.c         | 111 ++++++------------
 arch/mips/fw/arc/init.c               |   1 -
 arch/mips/generic/irq.c               |  15 +++
 arch/mips/include/asm/ipi.h           |  71 ++++++++++++
 arch/mips/include/asm/irq.h           |   1 +
 arch/mips/include/asm/irq_cpu.h       |   3 +
 arch/mips/include/asm/mips-gic.h      |  10 ++
 arch/mips/include/asm/octeon/octeon.h |   2 +
 arch/mips/include/asm/smp-ops.h       |   8 +-
 arch/mips/include/asm/smp.h           |  41 +++----
 arch/mips/kernel/irq.c                |  21 ++++
 arch/mips/kernel/smp-bmips.c          |  43 ++++---
 arch/mips/kernel/smp-cps.c            |   2 +
 arch/mips/kernel/smp-mt.c             |  70 +++++++++++
 arch/mips/kernel/smp.c                | 213 +++++++++++++++++++++-------------
 arch/mips/loongson64/smp.c            |  24 ++--
 arch/mips/mm/c-octeon.c               |   3 +-
 arch/mips/sgi-ip27/ip27-smp.c         |  15 ++-
 arch/mips/sgi-ip30/ip30-smp.c         |  15 ++-
 arch/mips/sibyte/bcm1480/smp.c        |  19 +--
 arch/mips/sibyte/sb1250/smp.c         |  13 ++-
 drivers/irqchip/Kconfig               |   2 +-
 drivers/irqchip/irq-mips-cpu.c        | 180 ++++++++--------------------
 drivers/irqchip/irq-mips-gic.c        | 213 +++++++++++++---------------------
 25 files changed, 577 insertions(+), 521 deletions(-)
---
base-commit: 61c01d2e181adfba02fe09764f9fca1de2be0dbe
change-id: 20240616-b4-mips-ipi-improvements-f8c86b1dc677

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


