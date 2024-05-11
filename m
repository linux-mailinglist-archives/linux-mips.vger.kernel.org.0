Return-Path: <linux-mips+bounces-3241-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6CA8C324D
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 18:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B4F11F21749
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 16:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF5057CB1;
	Sat, 11 May 2024 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Y+uKLSTW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZMgtTnEn"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7573856760;
	Sat, 11 May 2024 16:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715443220; cv=none; b=kXpOjr05fNmDdKRvbp/e0TKPPraif0j85/C1TfFzZtuWGnojqRmnLfGvf/NWcU5S/V5mcVD/F6Rzvsi5RhQbWWBBiwUUe1N6EY42M22cSTfXGoXdU70NdVbSojZr9LNbX2H5bpgPzMJ1Lg27mGNxNDHsVl4uH9oOGKYy4uxUECQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715443220; c=relaxed/simple;
	bh=XX4ugxlQhFsZAkH9R4LtJMvFZc0CkYDJTh5AfKON094=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kGNe8PHkkL0HJfJvowfH1U0xxwBgsCT3RxlYXkDzHF2t28kfb77zEW4X3RRJLygdF5RZMJIY/Arl1Oh18LtJvFFl8gXiQm6B88YD5ELQKmBPCRxSHTXOlVj3qH5TttPg602VfMKyWCr2UL5vkWcB67lSlEMhShaVWZOstwxQgKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Y+uKLSTW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZMgtTnEn; arc=none smtp.client-ip=64.147.123.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id 364891800106;
	Sat, 11 May 2024 12:00:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 11 May 2024 12:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715443217;
	 x=1715529617; bh=Lq/pDh+sYDYCgGn5pgPk17tnsYLQeRwbX8kP/SMbYjg=; b=
	Y+uKLSTWdw3yRR1EpOSTeU27zuDVTBZKGZMdT7nUzeKs4eBbEGfDBY7f5eBilF2+
	djB3AFyKPF9N6L4eyBS42VLDm0GzQ1MuBLbc1u7FLdX3zSo8mTmKFcZK6IrVaBcX
	qDxYt5p4bzFuRzxuqWVD0gLgiZ+A7Ttzy/WCw3mBtTrqgXY2hfJaQ5JDw3fzg0PS
	cbGGj1s3UPZ+prt+6GGO+U8MI5Iik3VzxpstOFDwNq4Ohmy79n27Qzc4oHMIzjL/
	zAcEkpuIKRZYvFPwz9qMtFT7dNN98FEecM3/4A+s8Jo+g2miCXT3vKOam4mk+1RL
	80rnJMGyDmg6BfQH4QTuXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715443217; x=
	1715529617; bh=Lq/pDh+sYDYCgGn5pgPk17tnsYLQeRwbX8kP/SMbYjg=; b=Z
	MgtTnEnDkTcPuoVEH/7vCMp1CHIqDeQC6BoLQ49qxjLF1+44U7X+AjWbNFXj1DNe
	KYHJ3ncOgkA1rksD7J283DlN/dWIDLPa6UqcrKek6+yN2wou2z0c19CtI8nznPnV
	lrkfJGIGsHXev5fH5oY/Sua2XhADmjheOghGgYodu39Ia2YdtxLJy6o2fPnCnwHy
	JnxNBb4gYIKlyQUylzThmqkR34UEE/P8OIx42Muu/CFV9h4Y9gVWi5ckgbydM/4W
	McbEp+G5QMX+w0dL3U2G+SQ2M9wWGDYykUoWaVq/TakyiVMkEj16cFeDRl9DKwnl
	Q44/dCi9snd7XOY/FS8Tw==
X-ME-Sender: <xms:EZY_ZoiGTv1TvSYycX-lhyAEb2yfYdmxB6vr4nm--_BSKkGqssmnmg>
    <xme:EZY_ZhCUo6TjvNpp50OnQoPQ-jpF_0N9V940r5Cm9nT0z_pvPKxnkv4LXnSFTFbP4
    3on9DcwEoCBGjHI8po>
X-ME-Received: <xmr:EZY_ZgHDzGZw3ReBUSWKyf_m6O3u1w2xepDgpWXI9BqMuX7M4PafsF0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegtddgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:EZY_ZpRZMaRD3AHJnMbddq-SRZJ8lxD7G_NoFj6hxtTlITlhO95GGQ>
    <xmx:EZY_ZlzgMWgxqLH2tTd6SlAj5GZChzeF-uIoXZEy5NzjtIkYd7QyRQ>
    <xmx:EZY_Zn7LhUpwHcw7TZPer8Kh-mLuxCuXOmksJQ3c-uGObtQOPMMk8A>
    <xmx:EZY_ZixqkD5A7NxT8j_oqy5QomQQTrwYKfuBM9UaQw9-pLaNPtHotw>
    <xmx:EZY_ZkxCWh6rkSmIqFo-Uzo2sbmdmXKtQRWKeyQmJg_7O3oqBdGAt-lz>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 May 2024 12:00:16 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 11 May 2024 17:00:10 +0100
Subject: [PATCH 3/7] MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if
 64BIT
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240511-mips-clks-v1-3-ddb4a10ee9f9@flygoat.com>
References: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
In-Reply-To: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=683;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=XX4ugxlQhFsZAkH9R4LtJMvFZc0CkYDJTh5AfKON094=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjT7aZxc8ez3fnL/P5OzYcGyDM5C/4CLzBPOHjmSWJf2Z
 tu2678WdZSyMIhxMMiKKbKECCj1bWi8uOD6g6w/MHNYmUCGMHBxCsBE4rQYGbZ6OjIr/D3X+Hnn
 StO015r3n5nZziroanHUF19ueGO2nQ/DP41jEefexBZyiC86/UOvtuiUT+yfB5/4qyPU94ts0GW
 bwQUA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

csrc-r4k suffers from SMP synchronization overhead.

Select HAVE_UNSTABLE_SCHED_CLOCK to workaround drift
between the CPUs on the system. HAVE_UNSTABLE_SCHED_CLOCK
requires cmpxchg64, so enable it for 64 bits only.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f1aa1bf11166..fa8ca0287568 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1083,6 +1083,7 @@ config CSRC_IOASIC
 
 config CSRC_R4K
 	select CLOCKSOURCE_WATCHDOG if CPU_FREQ
+	select HAVE_UNSTABLE_SCHED_CLOCK if 64BIT
 	bool
 
 config CSRC_SB1250

-- 
2.34.1


