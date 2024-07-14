Return-Path: <linux-mips+bounces-4312-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6163493084E
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 04:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F0352825AB
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 02:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917A7F9F7;
	Sun, 14 Jul 2024 02:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Y+0XCmLt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Rd1/kBZA"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E68E54D;
	Sun, 14 Jul 2024 02:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720923678; cv=none; b=cfBtv+hwbtFqYKAzgwrjRCA97exDPT5El2XWxbcU2AA2Kr/0vT82Eh/39SDXDiL/PzZ++rRW0zdzMdups4zFOtZ7agi8UUS0vjaZZAuvGPeBxVWH2GjhGyjSgdtP18bHzzkLzjy4qLB06/mUXpm+EsY3m37mjOTetkpjSnsIb1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720923678; c=relaxed/simple;
	bh=JGMKoHIRkhbQYv2lRCzoXdcWP5dT/oaY45kO1+E+CX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbU8xU18UrMPAJOmvg8AA5FeE0ObOjn/htWXjOj2B5K1j8GxTloUmHfTmevAJCeUH9cm/Ja5LFewMRFbqJCNlR2RmwhK3+LOd8I+9qEfh6ot8cHLArUwgsL2VDEO2c6xhrBhztyjuh71/idvmMmuE6+5eNC802aO9VckP/qv0+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Y+0XCmLt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Rd1/kBZA; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 08FB71381118;
	Sat, 13 Jul 2024 22:21:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 13 Jul 2024 22:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720923676;
	 x=1721010076; bh=d1sLsHiAW3GaaORUwOo1HmqqzMrjYajC3KR2rpSU5MQ=; b=
	Y+0XCmLtKpi1MMHa8NdxXoUU3y0HcI24nQHLgOcH9V02CRsx0gzShCxLUrALkS+6
	5vvMM40wJkdpgLrAuvtHMVFK6ecef3//VgU0qukstXykQjl4HpUUTVtjYT9JkXSz
	zOaKi8tmOjCwW9JnpiY25wJaZA3t7POtZLu4msTZsX6Vwc1M/dlDdwnh7DQn9z0Q
	wQ3yapKaOpwmdX2aAm0HNV9TBWn5CgsD+n6lY6gAAhth+xPTS7yJNB5dq872T+VU
	/b1jC1nAlgUa05sUAeckANuMmHicDqog39MdaSu0dSXsHghOTe0bmK4kfZdJSLXb
	U+EB6XMi8vUDAhwXzNYY9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720923676; x=
	1721010076; bh=d1sLsHiAW3GaaORUwOo1HmqqzMrjYajC3KR2rpSU5MQ=; b=R
	d1/kBZARZkpTxzSZixJ4waDtHkZ/gntG/chNYUqRGioFHS765SskKwIknxx6gsHy
	7w50zUtxQ2QzqHhzJD4V8/25RjLeLr+LrvQYGjmQUppwT727uLpDwyUayLdaX8aP
	+9wqtXjCiw4VB0KlQzHjPubJCa59u/FhgRGfIyEqr5CyW0BmpzBgeKyPMpjp3iiq
	1MQrhQibfQ7P5av8Q0ADvMxKMkUJVfT4m1xzEgQuAyP1fU7LZUKYe4gp9NC1/S/J
	UywqK0VIPbJgGkieknwNCEge9wxApFqz+gWHFa43Wf1XQXXxO9qIx06cE0ucHQhK
	vhxjvV5jJhN6bUfM3ZV+w==
X-ME-Sender: <xms:GjaTZpzCXjpxo7G6uqMAy3fweAUvd1mp02gpYQ8rL2as69Ip79Ll2Q>
    <xme:GjaTZpQg9_QkASvAdCkIZGzIKJKJuk6MVhoeGLLiXUR4pXQFlyF3K_Iwmmh4oW7SZ
    wdecyIbd3ZkFfD7Khg>
X-ME-Received: <xmr:GjaTZjUvTqx7GNzUlhMwiFNiZd7KMI6hX9gCZpMSeMI1202Osx0cAV0ZtgjdEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeelgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefgleegfeekgeeggeeifeethfejjefhuddvleelheetveektdeh
    geeghefhffegteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:GjaTZrgjc1tTr8LAhDdO6zL3e8zx8YMiEq5Shv5sB8PkobpNlVEfVw>
    <xmx:GjaTZrBJARw1YMhZaO_fT1wJx8MTgO-unmH26xyvLfxH4SaLKPK5kw>
    <xmx:GjaTZkIc5yOc4pQPrWYSIJ684euWGrgxtc4xNh6uTm-Qk4IXKL-5DQ>
    <xmx:GjaTZqDlP6hUyYqduNGUgRLrkT8p_wt_GY-NI-ORrUHxlfSfUcHYfQ>
    <xmx:HDaTZm-I7ERfGXJo7nuR5Q5ub6RMHdUJNhuLp5K6cQ0UeE42fgZ7EamN>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Jul 2024 22:21:12 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 14 Jul 2024 10:20:48 +0800
Subject: [PATCH v2 2/4] MIPS: config: generic: Add board-litex
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240714-config-refresh-v2-2-33f1649b2efc@flygoat.com>
References: <20240714-config-refresh-v2-0-33f1649b2efc@flygoat.com>
In-Reply-To: <20240714-config-refresh-v2-0-33f1649b2efc@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1059;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=JGMKoHIRkhbQYv2lRCzoXdcWP5dT/oaY45kO1+E+CX8=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTJZgIfO5Jmy9rypV99pnAz9cXGKaF/yladmWl683bUw
 jM7mFaWdpSyMIhxMciKKbKECCj1bWi8uOD6g6w/MHNYmUCGMHBxCsBE1ugwMmx/vfh2/DPfdZc+
 2jlNUz65sCNpwveV6ZWno1ZfXaD/2WojI8P7C4dYv1seNzdcvkHEedXXjPhngt89f3cWWVw1+xC
 x/zAnAA==
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


