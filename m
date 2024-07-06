Return-Path: <linux-mips+bounces-4170-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC06192910A
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 07:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 921311F2317E
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 05:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403BA1C2A3;
	Sat,  6 Jul 2024 05:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="K0VS1o7n";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fZ9ckMv6"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921E31804F;
	Sat,  6 Jul 2024 05:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720242498; cv=none; b=aAP1ezVgWlq3o54OEgh9POR1m9rjTM3JJBbfjH9uzDkEQOK4qWtPyiUCbwvAh8u9YkZE5eYQq3R4oHLPE8I5JkhOOWAw3Tnb2m0ezSCTyaw7kIqP2FjLS0vKG4IZ/Y0p2VqQwLCabCcv4DYLPUaCptVpqc7x0FjJ8jYHqmwEMw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720242498; c=relaxed/simple;
	bh=JGMKoHIRkhbQYv2lRCzoXdcWP5dT/oaY45kO1+E+CX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4N22grAcY/+tQcFjaPPXdDI90xMy3NFPxCejMkSzzwBD8WL36h2WbWQnJIQyXuyaoYic/0NhqvQKmIUybvRfit+/abgBipbj4jRxvG5oSsVGRWBoCPVK7Y4JbpYIUyiJjYrrJMFhCsZWXyas720IumqAmhCOvoxT/SFvUMg+ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=K0VS1o7n; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fZ9ckMv6; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 99F4D1140323;
	Sat,  6 Jul 2024 01:08:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 06 Jul 2024 01:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720242495;
	 x=1720328895; bh=d1sLsHiAW3GaaORUwOo1HmqqzMrjYajC3KR2rpSU5MQ=; b=
	K0VS1o7nKdh8NPi2nqNpGAHkusq2zY/6AtnysRMXVJYoB++nWCfbAb05Fb2VsB1J
	/Abhso6u5yp2NLojXdkGCBHLUcp0wVbN/Bi89mszzD8DWCHYTCM0DP5i5OktMkk+
	qfwgXCZDQG4V75S8HdKgnJWPuZEDvmQIGd9JZ7Wv+Q4Ue1o1O1/FtI5fF6Qh1br8
	3ZZR0pmnb4VgNbP94FQn4FGuvymmtF8aJ3jx5wSPmQZg/CHwdqkh15A9cOiRIhlm
	gUOswOq5cYOacDHOSqbouY/CPt+jKEIBFCB0bBaqJHvkOlzeVPfnwLYK73QvibjQ
	HdAkZsouDZHSApqWD2ZNwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720242495; x=
	1720328895; bh=d1sLsHiAW3GaaORUwOo1HmqqzMrjYajC3KR2rpSU5MQ=; b=f
	Z9ckMv6uwrc/ZZIii6W0bC1PC8Ztmo7YoTBBVil3hKMRZy2rqDqk/ux8hXF6LsRx
	/XBAi7IdtlpFjV95xPU9p3qeT7cGSOn69EoHE71oLoTWsSB0qQzHUnW/lF3b/l8x
	MSwfU5RJ21IgDnkCjNli6IbUMuSixACal5aJdqRUX3kwbaG0agMAkm6sZ/NgnzkF
	oPlbLQUuzvPgy5425t+xNR0gjgVr5MwSO1WTR9mshpNvCgddMzmDYPWb3csbN2zr
	8QuJEj3XglM4mvXAYGbPdMShD5f8zBtCQ53EBNDbeYqsfd68DvQQ8OGYdqNedoiq
	QrcQmXXwsjOdM7omMMl9A==
X-ME-Sender: <xms:P9GIZnWJNafgZfF806EhsDauTDkPdlfSpyg1qq4MtexVYZm1_f5S2w>
    <xme:P9GIZvnAHMF1OVwDv4jOJbTnAvMwiv84vjnQR9dsDhZ1AhZfHJ6JQnZmk-pqfsvtk
    Ti-4hcxsadXp_WLUd0>
X-ME-Received: <xmr:P9GIZjY4itnNPSOfgsW31gAKcBKw3lALPwyFcUp6zH41fPE1n8ws6BkLzfWocMlhp68>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefgleegfeekgeeggeeifeethfejjefhuddvleelheetveektdeh
    geeghefhffegteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:P9GIZiXfBblIz_qBcWXglEtwtu7aQK9MiLOPxWluppzQ6nGCnFQ3aQ>
    <xmx:P9GIZhkFWxbCuQp9ODUKYRJfv5wo51IRkQ6GfBRVVFCYDM0lQRcQrw>
    <xmx:P9GIZvc9SC3wkiyuEyv27g3vOt0A_vaTZmEwDnMCYuQQgc9MFPhfzg>
    <xmx:P9GIZrHdv_N403Xu_BepvYH0pMAdCBkydky_72cXQBoexOoZOx-5iQ>
    <xmx:P9GIZqAR8-RpYXrDGqPhcp65jejxx3tZc0RngbVC2ENfwH2wk80j7Z4a>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Jul 2024 01:08:13 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 06 Jul 2024 13:07:59 +0800
Subject: [PATCH 2/4] MIPS: config: generic: Add board-litex
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240706-config-refresh-v1-2-5dba0064cf08@flygoat.com>
References: <20240706-config-refresh-v1-0-5dba0064cf08@flygoat.com>
In-Reply-To: <20240706-config-refresh-v1-0-5dba0064cf08@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1059;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=JGMKoHIRkhbQYv2lRCzoXdcWP5dT/oaY45kO1+E+CX8=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSOixYRvr0MbScfGBnFRDHfbdw3R/KRAWPjJHVrebNNY
 ktvtQt1lLIwiHExyIopsoQIKPVtaLy44PqDrD8wc1iZQIYwcHEKwET6KxgZmh65p+9OZNisorLI
 fBavCyvH628v5FRTDqmpJ5X9MmSSZGR4GrxQb//GiPLr8g/1YsQtVm+Y121xRcdL86PS3f0dC+P
 5AQ==
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

The LiteX framework provides a convenient and efficient infrastructure
to create FPGA Cores/SoCs.

We have implemented LiteX support for a couple of opensource MIPS
CPU cores including microAptiv UP from MIPS, GS232 from Loongson,
and CDIM from CQU.

For this platform, devicetree is generated by litex python scripts
so there is no devicetree addition necessary.

Link: https://github.com/enjoy-digital/litex/pull/1990
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/configs/generic/board-litex.config | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/configs/generic/board-litex.config b/arch/mips/configs/generic/board-litex.config
new file mode 100644
index 000000000000..f372d0647bfc
--- /dev/null
+++ b/arch/mips/configs/generic/board-litex.config
@@ -0,0 +1,8 @@
+CONFIG_LITEX_LITEETH=y
+CONFIG_SERIAL_LITEUART=y
+CONFIG_SERIAL_LITEUART_CONSOLE=y
+CONFIG_MMC=y
+CONFIG_MMC_LITEX=y
+CONFIG_LITEX_SOC_CONTROLLER=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y

-- 
2.45.2


