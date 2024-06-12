Return-Path: <linux-mips+bounces-3616-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCB69051C4
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 13:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B632A1F24AD5
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68D6170824;
	Wed, 12 Jun 2024 11:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="KhzMx8Ow";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cOBQ/Qpg"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696BE16F902;
	Wed, 12 Jun 2024 11:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193411; cv=none; b=T03Rf7kDQf/m1LyQn+f5F2EI0+j5MliVUP8BbDOrrOUVD972UAv9jLKLs3cHHV1/WK88VbVp/DYaepz8P/QCYy/jEIfgdtHGzv30Lw/RdYrXBasmZooXPRJlrhPwUy7NPTzfY5oVxW8cTUrRntHQT07XFUgkC3j/bfy4utTvdmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193411; c=relaxed/simple;
	bh=Ib5Em0TWqjbDBBwR7LvVG+z4BvQZifAL7Hccm1zm8U8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIWIDUHDbQ0PGunTo8RLS/+3CxhsoKtLKPvIhZa3eR7n6RzuRBAlzVJd7/woshy+UjWi630hDneuA4UCsElG14mkEdhpnCP836q67oNA8LvucvidZ/bdZgwAR0gyYex6/dHInYW5QvrAfse5CUX5CXdTshEN3OpAXndF+rJdrIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=KhzMx8Ow; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cOBQ/Qpg; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 7C8E113801CF;
	Wed, 12 Jun 2024 07:56:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 12 Jun 2024 07:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718193409;
	 x=1718279809; bh=643RtZuFZs3vORSN7HPuX8/BrfnT6frE7UnbpKjPr1I=; b=
	KhzMx8OwQJOMEa9rDw8gzHRfBsle8DFbEwbors0/RwNCmdpSoIzOxrkDBBYgQxkc
	kLYGh/fmtrzT03pO1SQhbg0IbC1l5OIp/ieLvUHyKTe81+zieLAlbLTniX2DStYG
	smH7/LHYq+4Ih9OmuaePDKWuD3fxLRHJJlS4QppyseiKkCY3TSZd2yZ2YI0RSh4q
	zVutc6u/xi4t2PEVz3e1b25VxVa7Pthl8+ehzP8wUQ+2gXwsabXB32fy9G8he0jH
	oJ6XUhAb7LSrjoywHfdrynV85L6PIxi67UxaxctoxA6FKLXNWM3BYMMm5Hr4fwcl
	xoD/zcGpgGIkQhRZdmwWbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718193409; x=
	1718279809; bh=643RtZuFZs3vORSN7HPuX8/BrfnT6frE7UnbpKjPr1I=; b=c
	OBQ/Qpgi65R/AetRuJg13lEkP8fFfsb6uh5KDjNGkwxC9lMqrPMQzZJl8TBe7qad
	z7kuEYu2tHKy1a+IdtiRtL0QuUKbh3mKp4SsBBLMCkXHE7b8iBlE1n6UCqoJIZie
	/yeR30RCtzoy3aFUI/ZwpXlsNTF96q/Zn221ojE+dMus0+skqeZZLVcAnyKbIlbA
	HhDnPeTggFAGLb5wVdL0tnfhRpLmVlOuMycLyf5Fpg4y+wnjW0mREtfq2NemmIXH
	tr/AzuopYWXBH0BtNKdRWB9woQp/et+4QAFG9eprjiSdDG3m6Z4S2o4zO8PTXZsX
	OMwfm6D11m7BPztZatw3g==
X-ME-Sender: <xms:AI1pZn_yeLr7JmKktEH_JzveYQjhwH45pcRPsNUE7W7UyQHcxaeOyQ>
    <xme:AI1pZjt2ZwZmOL21OFFT11RAUnXrWXcG7apQi-v8DMPESAFF0iJIk0zz2wxEYqGwM
    30Y1XHkCOW3z252eiQ>
X-ME-Received: <xmr:AI1pZlCxCs4MyJ0b_PMzC2eWZ6pe0-R-nRK-eTvGfBc4sCNTyzWsW4U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:AI1pZjfLfnDjEaqQIT83uuNVy-YHJe3OzBLqqChlEzccIaVOhJmN8g>
    <xmx:AI1pZsO0hxVpPT2aVAcEuD6hEe4kNsNmJ7GBlzW3MaTLrDv7wARAgg>
    <xmx:AI1pZlnF2VW0vtKO_0X4EaQgXmVpS36rt8XTz6SjE9MUCFX11o1s7A>
    <xmx:AI1pZmuOsMOKhqbaUOfwI0VyVJBeiAna_cEHPamJaNlTtLf82YNnew>
    <xmx:AY1pZtH9oB9mpjgVjPVXwjCr33dAw8rzB66mOWwem4HzApg7uogj_f2p>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 07:56:47 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 12:56:21 +0100
Subject: [PATCH v2 2/8] MIPS: dts: Boston: Move syscon-reboot node under
 syscon
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-boston-syscon-v2-2-9f8e1a07fa63@flygoat.com>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
In-Reply-To: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=850;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=Ib5Em0TWqjbDBBwR7LvVG+z4BvQZifAL7Hccm1zm8U8=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMnj++u07OrdlsueGv8Lddtsvy54euXlblq7SRv+xCc
 2ebYuzJjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZhI1i+G/1Fe26yyLpg8Oal4
 qcrt0ecKJZek1LwUtmUrdujO/RKwQZ2R4djT1vMW6Qct5gp9tUp9/EPu+hVDATl1m7+KJ+b1x96
 VYAUA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

To match actual hardware topology.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/img/boston.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/boot/dts/img/boston.dts b/arch/mips/boot/dts/img/boston.dts
index f7a2c46f1eb8..7379be7d46e1 100644
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
+		reboot: syscon-reboot {
+			compatible = "syscon-reboot";
+			regmap = <&plat_regs>;
+			offset = <0x10>;
+			mask = <0x10>;
+		};
 	};
 
 	uart0: uart@17ffe000 {

-- 
2.43.0


