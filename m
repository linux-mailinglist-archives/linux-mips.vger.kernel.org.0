Return-Path: <linux-mips+bounces-3728-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6203690D6BC
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 17:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 790E71C24013
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 15:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C91345949;
	Tue, 18 Jun 2024 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="SsdONBW2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nGP8jPkD"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A983D579;
	Tue, 18 Jun 2024 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723478; cv=none; b=DKPZuFeZvjO1/if/TZWlvrS0Tf5YXpCMqBHYiSK2y6Fe41WXFd7DeGFfENFGvCUgaUDConhPMePVhTaoPtSOkLl2EDU0OMikwAbCydKHDSlAJ4hMWtqHomdDAjzp1i4aiqFliXj0xveGtdJ9B6xgp7vXh4vo2dkathgETSMmyCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723478; c=relaxed/simple;
	bh=d0ExPZqcfwVr8N7ohOVjrEi6ygZ7pTpHkwXRWnWH1Gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+b4g+vY2GDtCraG2AbmgajKqxL8/tNmXIntU+fG1SP5zgHwVqIE9n44dxTFKNGUrc3kziorSRb9KoI5MhXJP2K58lYL3xFzqVPVZZGyvghk13Gi6ms62UkAEG2Fjckq6wef7JLt0rSslYmc1ojiFwGcuYKakSDs30A+hXYspcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=SsdONBW2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nGP8jPkD; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id BA8FA18000EA;
	Tue, 18 Jun 2024 11:11:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 18 Jun 2024 11:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718723475;
	 x=1718809875; bh=BgpLjwJpdOMdWq7wp4KtiMEySdHq+1Z9/3xL4EU0/zs=; b=
	SsdONBW2/qB6fezi2zcbzGWqhYNY7iM5mYBI6XUeKaBJuYfUwrC3pDnlcDXX+Vdz
	RfSAoxIuEEMOw+sSCH4wXdBhgHySgzn5RM3UUL3hVpsIr5e0GlBy9PesZ5aV0xBh
	N6G3iBNV9pj900F7enJzwTuzMqAm5bHeTH7754UUFi67V2HtqZSRPjQm4x5ogS/4
	h3wiz4wK2HTf/uAk7RzmIOp9IentSTYX0BENZaKNnPYb0P7dA4cG6vRXCCvAjkTB
	0uve5bjBVQsbbY7axg0G/rQY3LO5FN2/YZnEGG7/gHJx0zzIrGc6fal8KyiFre4n
	Yx7rPK/iPGjg0QhoU6CJMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718723475; x=
	1718809875; bh=BgpLjwJpdOMdWq7wp4KtiMEySdHq+1Z9/3xL4EU0/zs=; b=n
	GP8jPkDOXwR5xBU8j90QEh/65IShq87Hyk5VsTgMmF4Fvx12CNYgwFC1Q0RyH8Bv
	3h2PinW7YmyxirU2c4CxSjwJQptu9i8JhuGGEXtNOSQTwC+IhU0In44m1kNJ8gbt
	60UOi7DZQzfD9y1VXoG2vOsYPbwI5/X6ZWhzE2JI6US/ycZvPt7UEYCN6YTqYrCb
	zHgFECrfm+pKW9IwjtiEDgcEpFMTRJo/jyFVL4K73ThhWKZu5wgPRZWdqtgq9g8G
	yZowTHAN9ZCcyh6Uj7qJYw5ZIGIpM48WoJsuUDIOItzptKrckMfg9VgKhK9ywJaQ
	ifnJi7mA2DiMBh/5bs0Qg==
X-ME-Sender: <xms:kqNxZn6kuibJ2w0KkcDsXLqVit1mjewfmG6FN9nvUpknqjioUl5CXg>
    <xme:kqNxZs5ZX11R2QH1GHYQgo7TIlSOoD6-8CTOsVWo1piXnASHJiOXwGeFgv5Nz4Bx0
    K6mIOdJO4c42X6wGJg>
X-ME-Received: <xmr:kqNxZueokNGhn1EbgJBkPOzCGMiT98hWcVL6rYWBREH6MZUnAS81gwY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:kqNxZoLgLn6BMHdIvoqGnUE9IICA0UvjvbJcrYFZq80EsSba6LvJtg>
    <xmx:kqNxZrInxsccTtyuW3Z1WeaPdzpdu0Sh11cQqYL0btC-gnAC5tgAJA>
    <xmx:kqNxZhxvB4zvmSt4gmHC_rjlzSt9Tm7Xeb0MupKPESz87iTqO0VUBg>
    <xmx:kqNxZnIIa3XwnwBGKx3L62OUUFppAP8yXlWDzO4X4gxKWp1ohY3Tyg>
    <xmx:k6NxZoAKrpLtryIwPXf68iewKHECyzTIrGw02glkTSyWY0_fagsGsNLR>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jun 2024 11:11:13 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 18 Jun 2024 16:11:02 +0100
Subject: [PATCH v3 2/8] MIPS: dts: Boston: Move syscon-reboot node under
 syscon
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-boston-syscon-v3-2-c47c06647a26@flygoat.com>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
In-Reply-To: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=d0ExPZqcfwVr8N7ohOVjrEi6ygZ7pTpHkwXRWnWH1Gs=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTCxb37baYlbJI195ec8a7FyynObbPvN7H94g4ZvrX3+
 +31pR07SlkYxLgYZMUUWUIElPo2NF5ccP1B1h+YOaxMIEMYuDgFYCKpbxj+J+6wWXST6/LPGdNW
 7AkWDr7jvdj1lcOkwMi3BRoXNn5zqGX4Z6LzeJqt//HDidGRx888Nm61clx4XelIS7z5x89z5qp
 85gEA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

To match actual hardware topology.

Also rename node to "reboot".

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/img/boston.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/boot/dts/img/boston.dts b/arch/mips/boot/dts/img/boston.dts
index f7a2c46f1eb8..f465079d3085 100644
--- a/arch/mips/boot/dts/img/boston.dts
+++ b/arch/mips/boot/dts/img/boston.dts
@@ -210,13 +210,13 @@ clk_boston: clock {
 			compatible = "img,boston-clock";
 			#clock-cells = <1>;
 		};
-	};
 
-	reboot: syscon-reboot {
-		compatible = "syscon-reboot";
-		regmap = <&plat_regs>;
-		offset = <0x10>;
-		mask = <0x10>;
+		reboot: reboot {
+			compatible = "syscon-reboot";
+			regmap = <&plat_regs>;
+			offset = <0x10>;
+			mask = <0x10>;
+		};
 	};
 
 	uart0: uart@17ffe000 {

-- 
2.43.0


