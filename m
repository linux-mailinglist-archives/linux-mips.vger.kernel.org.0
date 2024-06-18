Return-Path: <linux-mips+bounces-3727-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5570A90D6B8
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 17:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6494C1C23E7E
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 15:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F5B2233A;
	Tue, 18 Jun 2024 15:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="R8M1E4Q0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M513Q26F"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout7-smtp.messagingengine.com (wfout7-smtp.messagingengine.com [64.147.123.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EA31E532;
	Tue, 18 Jun 2024 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723475; cv=none; b=ZSq9lPLG5JonJel9hk8E+FgZNc67YkgV74MaJ5vWbodIByodlzEcRuc/HIwQ+3HGSNY+5B57j59bW4uXym69U0sjeq1ey7NJVNaBDwfv6njVP/4LqAkMXDhyQRv4Iuj7ttAy1VicsKb/Fa1z6Hqg/PRHOpNR0B6OdvRPlAkw0/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723475; c=relaxed/simple;
	bh=YxzE21lNUaeTb0yp9pxht2aTui6m/EtqohrniRXP1J0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYnK9nibFE45WeKDZFK3mHvM3/52p0bHtYLquFNXfogCu5aBvrKZSgmAQqnpr+jZG04nFadMc3HAGOqpV/5ls8kn4edkgjIfucZDzN62qkJ5e+UJfEnIOUw2koC9GJ1R1ODzw/ugs37N6GW+5Z9qGlnndN1RzFU35B/UH0Bj/Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=R8M1E4Q0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M513Q26F; arc=none smtp.client-ip=64.147.123.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id BFFEC1C000AF;
	Tue, 18 Jun 2024 11:11:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 18 Jun 2024 11:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718723472;
	 x=1718809872; bh=73GXPxWjGcGV4cl0m+OawWz9NO9L1RnHMbfSdPHUva0=; b=
	R8M1E4Q0lM3OFtjI4xr7tAo/WmuuARqbj5mI+CDm28QsDC1KGgWgUcqa7hqgKeyX
	yVXatEW3d9MdE/uiaN/LsMJAsUMujurPmNoWs/ZI41/QwgDVHzdIqP4ukxuU8Gy6
	vs2l8kWNK2wvBaXLrpR1aChvuOe+7PSt6jzgAqmSdWYJXXHH7+isAkM9+yYHpIpq
	0oZ4n7sM3zc8VP2OrBVQGbchgIOD0/ZNEZT+Uhu3w9Fla+hzRLVH+8l/YRA9DJ7G
	rSNp8MbHjSAaonueGniFjcyvaK9kJKBt6PyTnfi9OmlgGluEL85UOOlpc3bbQAHE
	iQQ6lDm/HnD5DOYu7+yt2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718723472; x=
	1718809872; bh=73GXPxWjGcGV4cl0m+OawWz9NO9L1RnHMbfSdPHUva0=; b=M
	513Q26FaBLuq/QfSjQP370IezmzNiG4dsUMb5zHVssqnMgfHxJO8V/DU6fP0iTeC
	roYQMwpxHBadRp0x2Ed0xqRIR2n3agaNwWXzm+NMO11miKP3b0RGXJE2vrAXUtD4
	iWUrdBzrMPbW6lmndb9iw7bFm7UBmMk8N49zmmK4xeI9MsBthJW7vmAjge4nS5/z
	KS320TXxkYjtqzug19U7Rid6RXVEJ8WH+Y+YKn+0+EfGjF/r3PW3cKcaEf/2oLUo
	vpr2H30h83nVmhbbISVxalZnM+4h40Zhw1TUZdu/jTeqkSQLPvMMjZ6sYSc6H1Ql
	YulxgzEwxmTODO8Th6JPg==
X-ME-Sender: <xms:kKNxZoFTTcV6HuG-WdIj2Dg3C7Z5uOGGjZwvzmeBPe7iYPAHdAxU_g>
    <xme:kKNxZhWQ1JsvH1AeA1ftMlM7o6uxTS7uNKXeBrTwH5b3xIxDAC_KPRUzO75V2LRZi
    QNdjwZD8mWK44E67aM>
X-ME-Received: <xmr:kKNxZiKPsFNEQYKS3ZxFL0FTt9bchwfHLwTxvTM8pk3_H6vHVbZDy-c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:kKNxZqHpAPdX2biL7gWg4gmPQ368qURn_kMawdarFtJ_VxsYK27A0Q>
    <xmx:kKNxZuXj-TdiWvSm6C2Mz1t8pAzJ6GxYZBalZaYIFy59NlKr7by77w>
    <xmx:kKNxZtNiKIa-A5wEKHj5wAEv9Dm3-KgGDK0bXTqZAHwe3NQYyAw-Rw>
    <xmx:kKNxZl03He_4ork381VStnGmJaNf1j-fRZLEYsKCAnAMZsnf9nKaTA>
    <xmx:kKNxZnM5Zd55_CzykzRlPvbCDwq5-YVbbNpdcoY7mdurBxM3YGp_UhEe>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jun 2024 11:11:10 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 18 Jun 2024 16:11:01 +0100
Subject: [PATCH v3 1/8] MIPS: dts: Boston: Add simple-mfd compatible for
 syscon
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-boston-syscon-v3-1-c47c06647a26@flygoat.com>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
In-Reply-To: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=829;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=YxzE21lNUaeTb0yp9pxht2aTui6m/EtqohrniRXP1J0=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTCxT2btWf9Y6tkYWdtCVU49t2/TalA2vSn6+9/mzom7
 AhRKVrSUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABNZyMHwT9HRaiXDby7RR8tf
 CU6aKjvBVJA9W7d84brJZu2zrvIGWTH8j9zbslvzT+dRSYtO+f6k1fdnyvxY0RQS4PkjmvP+naY
 /DAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

We certainly want subnodes of system-controller node to
be populated, add simple-mfd compatible to make that happen.

This is required by U-Boot.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v3: Update commit message.
---
 arch/mips/boot/dts/img/boston.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/img/boston.dts b/arch/mips/boot/dts/img/boston.dts
index 72f7605d2e31..f7a2c46f1eb8 100644
--- a/arch/mips/boot/dts/img/boston.dts
+++ b/arch/mips/boot/dts/img/boston.dts
@@ -203,7 +203,7 @@ cpc@16200000 {
 	};
 
 	plat_regs: system-controller@17ffd000 {
-		compatible = "img,boston-platform-regs", "syscon";
+		compatible = "img,boston-platform-regs", "syscon", "simple-mfd";
 		reg = <0x17ffd000 0x1000>;
 
 		clk_boston: clock {

-- 
2.43.0


