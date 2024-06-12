Return-Path: <linux-mips+bounces-3619-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9689051CD
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 13:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E1701F24C2C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B673E176ACD;
	Wed, 12 Jun 2024 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="poAhtBox";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f6ytLIJ6"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34345173334;
	Wed, 12 Jun 2024 11:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193416; cv=none; b=SGdUNXmY9z4XqeessvA1on6GTtm+dHIT6E0aGHrXTdzBfS5N9JSKoYjQW5+3RqWmAqbR1AHdUzxWdglEDEesgS1MFIzCtqiq1Z3DU9hDapiy9Hf2xe4Kq+RCi4GZ1KcD+3fsPZicBUS12AOegxL8U1PhnY91ejXb+WEw6fEO3DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193416; c=relaxed/simple;
	bh=tCzstnExLpC61VPiJB6NjzWIxOucF7gNCkbxJZlrcsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJsBkGfWvU5HSPwpNo7Zc6IQVCdO63no36xJ/tgI1wsj8g2ONbL6mt+XU+bGMw9Hj1s+JTV9yw7eWEhXbrpiuU+Hc8n+Pj4t314hdqOvk2BMHDGlNiMYGE6lf3wLE2flj/NXADvRtWBUKln+yEuDkqNtjFc8LE2qDKg38zGUn+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=poAhtBox; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=f6ytLIJ6; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id 45C5B13801D8;
	Wed, 12 Jun 2024 07:56:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 12 Jun 2024 07:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718193414;
	 x=1718279814; bh=FCs0YSQG+5DLaNGW1l/0rcXxeCTnhYK2Q6v+dZt+LtA=; b=
	poAhtBoxpiY5P2CDngXqHjLY4hjp0XAXviUacd1hbDf1J5tVjVMy6Pcs4OGsP4Nu
	WlKceujgGabS8bVGDevHXmnm9ucnnNR4DXYyKI19+updHQT9wqsIxcegRXt0LyDl
	JvQiG5KS1zWKeGncew7vkTCchkowTPoYLd8ivMgfh0feilBTZjSflc5c1WpTlXP3
	/vEY/rr0e6x0mnY/noF32ddFZrrwtCnpytZliSUtzwPgH2D/2wVbCSbAMDZHzGcJ
	UrH2uqHfmzRXLsajm1ac87np3dTFAP0CXpKNYmN/LAud0iRsPCUdohBXgSrk9ngZ
	SJFn7LHssw/+l+LrQqwmlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718193414; x=
	1718279814; bh=FCs0YSQG+5DLaNGW1l/0rcXxeCTnhYK2Q6v+dZt+LtA=; b=f
	6ytLIJ63uLFiAbG7y1GMj0i2cRsN4+UfP7HW1N7gxXRPIJD5kchmDmAPP4YXkAYm
	6PSdTdMfFQgfVE08LAoeDWNAFAbwChhTHw1PVW64j6F+6QQvGC1tmofebQyxRTrY
	XzT+qwrpfGzxxk/L6xWxrOeQgrlWtjOuChn6/NPMAs34qx65fRBOcg97+9t/Kalu
	c+ZwEobIt9l7X/463y+3u/Oab9CEULsQzGD+4C5Viwen8L16P1RoZEzXLiSazRWX
	m65VMxmLhWeKUf7HNZjhlZSlbccurtdsaBFjIViAIOwecKHsWIgm59bCYHyj5XdO
	NLp24U5TrzZUZ7NDKgn4w==
X-ME-Sender: <xms:Bo1pZnBXj22UCByByD4f3M95KJ7ECcPTFXuIos9SBReUqo0jxjS4Uw>
    <xme:Bo1pZtj2zHEK2wxMcT1Uecrq939cylOWXLkm5i9yDGq-p9hzJMpSOb5On5ySiioF3
    QpV_XKzc40kxqHLHAo>
X-ME-Received: <xmr:Bo1pZimCi3DIZ_XMxSJWKD__6Y12KDRofIR5ul4ENW4Qlq1pAJ9Cxsk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Bo1pZpytBhPgGCC8QsizGMGwvewoFwaU37_t0YkOVCqEhOStcvkJiw>
    <xmx:Bo1pZsTX5amybymm3jkQjUU1tko2sQPElk7QiUFpk4Yujks_sUWiYg>
    <xmx:Bo1pZsaSTThcZVQGFHgBmAQvvFfuKUlaihhaRCUmZgrsljxnRVAILw>
    <xmx:Bo1pZtTzCiCj28Rl8T8XZ8JeBAhnoEOE1YXbiCukHwvBQDl9ZFTekQ>
    <xmx:Bo1pZhLjQcT1bdjTPw8eAfh6MDOaxk9nhv1qCAskrglf2SK-ExpxgTQe>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 07:56:52 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 12:56:24 +0100
Subject: [PATCH v2 5/8] MIPS: dts: Boston: Rename uart node
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-boston-syscon-v2-5-9f8e1a07fa63@flygoat.com>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
In-Reply-To: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=823;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=tCzstnExLpC61VPiJB6NjzWIxOucF7gNCkbxJZlrcsk=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMnj/P2ndPD9Zdu6pk/kKuGdLrds4on3rgSPiHv1EnV
 yam/9Wt6ChlYRDjYpAVU2QJEVDq29B4ccH1B1l/YOawMoEMYeDiFICJOEYy/A9qSBcq5TApvMqw
 9EY4b7eL9o8Tj2XXSfVGFrGdPJxnuY2R4Wfb9r0vfd7dknxYs8Xg9pGLkiVJ7yNm75mQcYn7q/y
 fy8wA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Remove it as serial node.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/img/boston.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/boot/dts/img/boston.dts b/arch/mips/boot/dts/img/boston.dts
index 85d4255cfbb5..f1a026fc20e1 100644
--- a/arch/mips/boot/dts/img/boston.dts
+++ b/arch/mips/boot/dts/img/boston.dts
@@ -13,11 +13,11 @@ / {
 	model = "IMG Boston";
 
 	chosen {
-		stdout-path = "uart0:115200";
+		stdout-path = "serial0:115200";
 	};
 
 	aliases {
-		uart0 = &uart0;
+		serial0 = &uart0;
 	};
 
 	cpus {
@@ -218,7 +218,7 @@ reboot: syscon-reboot {
 		};
 	};
 
-	uart0: uart@17ffe000 {
+	uart0: serial@17ffe000 {
 		compatible = "ns16550a";
 		reg = <0x17ffe000 0x1000>;
 		reg-shift = <2>;

-- 
2.43.0


