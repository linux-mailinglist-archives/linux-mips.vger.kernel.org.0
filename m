Return-Path: <linux-mips+bounces-3680-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E05BA908F0D
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 17:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFBD11C23D83
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 15:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543CE181CE3;
	Fri, 14 Jun 2024 15:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="AR/OO4HY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TLmg2TNg"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5E218131A;
	Fri, 14 Jun 2024 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379631; cv=none; b=lSONCOTKhTdOsSzNT6ofc/RrRplSmUn0+WTASrmS+Dd9hlnjARg9uwxvNHE876iKC25R1kmmnchylAkfZyC0tlBGySJAjRaC/VYknwI/X7SWuJfeNXYuW+U/h0KrE/VeEeJPRboQHYuZalEpvTk6KMZw6ubqhAKPF/dbVyZHrws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379631; c=relaxed/simple;
	bh=FweENlZ63bOWfTc5I4r3KjymBEwR3NO4d7vDQ/jtcek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XhyqGv+LD1CduZiz4Dyhc0cc8/KwsCWBH0FjcwMFHfFL4DwgM02P+9olkAtUAqqFDpfR9CcHnsqzRf8FbpZv1iZDqvrjZudfmHhu1XGNFHQ81LRJm6J4EnftefZnGIEaobd/EjthaUMvl4YCiVwBFVdnjEfLrzr76AaLqaBJSMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=AR/OO4HY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TLmg2TNg; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id DBF00180013A;
	Fri, 14 Jun 2024 11:40:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 14 Jun 2024 11:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718379627;
	 x=1718466027; bh=VL2IWi8aIIhAUiv5ylXPwd8C3J2xPWc4eXe91OcTt90=; b=
	AR/OO4HYLjw6CezpKAWEVbGVGzJumdkzYl8hzss/YoR01saFXIAO+MFt98JZzLwz
	+yhRLRwaAqU4ZeEDzKRS0ha1AOl2Bd1+QMV8MUFbi9BCdNwJuhlql3X4FJKauGu9
	+VhZcUgWZhKhSUV5DGyojHPDbuZmU9LtFY8C52f3jrKx0JPc/7SvRzTVat19R1rL
	X5Vv/cScHj7ilOOQfBPo5IagnJlK1WjQ1pGUMDntCMx5crWF1Uje+FSDeWlqREq2
	ieFYDx5ZqFrsiKTWqqGqvRuG7PRpbeMi/e5YYDlLnBCELFc2QrBgfHRRL5ASoV46
	WcovfqTnZtY1Gh+0pN1m3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718379627; x=
	1718466027; bh=VL2IWi8aIIhAUiv5ylXPwd8C3J2xPWc4eXe91OcTt90=; b=T
	Lmg2TNgcF91xsiPDOvEyHXPJQWxB3cAEISzHE7G6MbtpL7oL8qtHFU/ZqXRriSZ3
	t98Tf0HKrVRR5vEumZSkg1kb2dKyKjAE+wgI1hu0ESu8Bif4CrPGsbgAVArC5Z1h
	2CUkF9BUem3ACYclbZgDo7hZMWHHreZLoHQS9YvEUohDUEJtBdu8Bjrvjojw8Xpx
	y9HY5EePukwPbC5KK8rYvhoERJf+Aa/Ijg6Mdo5XycgFnMTI+swOdw7BxbeMYHoB
	eRbL2QrunUDXP1zz3NplEvvt5eC3mOCvsYsaiNyCksPPAm8FUDDVAX02obUN0+5P
	RG2rr1J9jbm9RLdH8yqnw==
X-ME-Sender: <xms:a2RsZiEVQkgZpb_E7NQy55RA5yO07FYHMvnnhKrDJYSv6cjY93VcJg>
    <xme:a2RsZjXBgIM5jp4vUEBRBAI-iKKvmE2SqIMVc0a7KxNY1sJ9dRqxHchpKqOq9Yusb
    2WNZjTSACfeNTerjmk>
X-ME-Received: <xmr:a2RsZsI5pLXy13Du25yfMXlyYGYM3-9zKDQ-NkUNl8---R2HwPvGJFo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:a2RsZsFPjKLVAubPjhjL7vRraVjDt7_Gk3tAusfVmXk2pZTu41lAVg>
    <xmx:a2RsZoUflWVoCxMesYqLQhwMl57xVXzkR2P79TJuYeUAiJ1nM1miAA>
    <xmx:a2RsZvOFUiAJy-XgTXTOYnJAZ26dYnGGyO4JfjNhgmydyACXtvLhZw>
    <xmx:a2RsZv3rHJB6dy7ak4cwIrM2ZxCheR_3B52GaaxDQjngxRj1nwP7jg>
    <xmx:a2RsZpvlf0b5pLmef5OnjfYupv-xQkzVCbVW6nl84NOZ8BE1jBB-DV3i>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 11:40:25 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 14 Jun 2024 16:40:11 +0100
Subject: [PATCH 03/10] MIPS: dts: loongson: Fix ls2k1000-rtc interrupt
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-ls3k-mips-v1-3-7614340ace7d@flygoat.com>
References: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>
In-Reply-To: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Qing Zhang <zhangqing@loongson.cn>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=998;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=FweENlZ63bOWfTc5I4r3KjymBEwR3NO4d7vDQ/jtcek=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSclLj3XzyDqg1elz94teOk8eRkvZ+TRTZOP9HfE/BUp
 pP174mQjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZjIYUNGhlk6QbovlP0aZs6P
 O+v4KO6m0X6G9NmvI16wa73e+Cv0x3dGhokm57f/+3zH4VCC+YTTcmr667QvvTxR68Jistrkvew
 ucU4A
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

The correct interrupt line for RTC is line 8 on liointc1.

Fixes: e47084e116fc ("MIPS: Loongson64: DTS: Add RTC support to Loongson-2K1000")
Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 3f5255584c30..c3a57a0befa7 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -92,8 +92,8 @@ liointc1: interrupt-controller@1fe11440 {
 		rtc0: rtc@1fe07800 {
 			compatible = "loongson,ls2k1000-rtc";
 			reg = <0 0x1fe07800 0 0x78>;
-			interrupt-parent = <&liointc0>;
-			interrupts = <60 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&liointc1>;
+			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		uart0: serial@1fe00000 {

-- 
2.43.0


