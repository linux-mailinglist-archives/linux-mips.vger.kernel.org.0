Return-Path: <linux-mips+bounces-3729-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B300190D6C0
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 17:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A01C1F2324B
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 15:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E37A4AEF0;
	Tue, 18 Jun 2024 15:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="WqXT5MRH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mU/W5p+y"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC371E532;
	Tue, 18 Jun 2024 15:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723481; cv=none; b=AdkhrlIddmzHvyaWJ7aag/Zt/C/3wPNQx+0w/74QFVbRluM3Ka1oAP8SCo/3gBcowUSj4FDhGoDQUSK3dvFzpB7KWw8rsfQUdaEApXqp6KovaNBS4gHj8IsynijoLk6ppr86NihTpe09kcYmSYl75pbaq6yCgDDIYkqUt42fR+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723481; c=relaxed/simple;
	bh=A58P6H0qREKq5zcCS0xUsYUJNRA1T01IHdet0BHbjK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f8ZeMcpXF2DEtRLzugM4BIVFoJJ7WDbq++6/H31bKcIy6y9SChvARrQTUGRnMYytOckbpwScjkzUUNNRKD8TH0kw4lMe+Qt21+9o5LOcBDX9AXz0xXtoofa+ryjSSzeJrd99+0OWq9GQUE0JFOiRhabuHshqSl5ns6Cmc3PAr1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=WqXT5MRH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mU/W5p+y; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id 86726180009E;
	Tue, 18 Jun 2024 11:11:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 18 Jun 2024 11:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718723478;
	 x=1718809878; bh=1RYETSf9eBGKcCbqH7yWpQ8PaQTaBYeOW6ONqLIQheE=; b=
	WqXT5MRHTF1QHlQuz2hk6QSxar2utASXSjEw5hf6C0x//yK+Wc8RJPHzUFHCZPpk
	VTQlZmLsUKMUN9r9zOOSGaAlHumiqrVo2hvJf9nkqKrX19JIWPKRiCo7Vy0EYR1C
	+E4pfXVQltLJKaeaTuJKj757lQu3wnHwtsjIN84iKRr2smwjvCYCwg46BTncCHjc
	a27YCvEoKhbH8BvcWqtJHOITcm5oGhK0klILmbC5TFap39hY0yRCwhZ1e8QsS7VK
	/TLiqQZfKsnhJQo0nUFObtdsVloXoP9yOS1HyWDamSZD9E/tG24JP7q5+EZnJYul
	tsDLhrCR0ZiX5o7xBYd49A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718723478; x=
	1718809878; bh=1RYETSf9eBGKcCbqH7yWpQ8PaQTaBYeOW6ONqLIQheE=; b=m
	U/W5p+yW5EFRepGJNjXj3+hhOSKDGKAxTHKH5GrIY4hRRmjout7Q/PHDrS3sEtne
	kJwFpC8lOl6oEbwVQVu8V7GCUYDITVDLsIkWMYtiQK+bRla7QgFSR0VKzgxjmgKP
	+bhkRIqUy2zuhAXKHSHfYfZCCgSfNUniMrwmL1/6TPXrIxvIGh7gT0Ye3X3ZI7tP
	sefQoBh4MqIq5S0+OMvceYoh8P1pLlAblwC6liSV53hxQcFyr0qh2DRqe0z6LV4R
	LbGFujSrSlkBW603Jui32Z5UoLOAFlVpmqkrrvVjVwVDhZ8AAWs2c97iZpGzdAc/
	6Lz7/3QVdaYyzU+TuV1ww==
X-ME-Sender: <xms:laNxZhqd2-R0b3mG34Q4H4wPkDPWJ_P3kIL9HWHhkWZvRmSlCES2QQ>
    <xme:laNxZjpclWhpg-rul_ofRps4iix_0GOnLuP4li7Xso3rQ9NzXJD_0EbZfBb_mQy5J
    BHo9UMGMuHvVMWRIHs>
X-ME-Received: <xmr:laNxZuO4TAGC79lGvAdRfOWGpyctXxGSBsIJ6Cva3YnKqWj7-ByrCdc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:lqNxZs4W7gsLwFm9uCCcNIlvqBELiYfQwYEVoG_4w9WR6ca-JnbtYw>
    <xmx:lqNxZg6OCOO0qkso6mbP6lITNjpxPWieAlOXWCL22zUTUF2RrHpfzQ>
    <xmx:lqNxZkisE_T_otkTZvI5ghnju-FQEiX_LuS4T_2ApouvX5GoL1MO6A>
    <xmx:lqNxZi6cJk7-mOLqvH5xYAzzhhtO39c-bkt3RmcSXNcpSbEhEJLO3Q>
    <xmx:lqNxZty_BuXPhQlvSb6IZr5KS-7ANQ32lvBgSw3gOzeDobhQOtD9V4Tz>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jun 2024 11:11:16 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 18 Jun 2024 16:11:03 +0100
Subject: [PATCH v3 3/8] MIPS: dts: Boston: Rename clock node as
 clock-controller
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-boston-syscon-v3-3-c47c06647a26@flygoat.com>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
In-Reply-To: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=711;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=A58P6H0qREKq5zcCS0xUsYUJNRA1T01IHdet0BHbjK8=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTCxb2CX36vv2aaHc/vu1frx4ZLxm83HNN+Gf3fvWMnf
 5i61QvnjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZjIpQyGP/z/CqzClx092jXh
 7WrXPTu8P2vnF7FE8aRseyk3tUK+Zz4jw87is2c9Mu/eKtIVenauMurjt4sGK75l1QS/ZZyRZj5
 Njw8A
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Better naming.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v3: New patch (Rob)
---
 arch/mips/boot/dts/img/boston.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/img/boston.dts b/arch/mips/boot/dts/img/boston.dts
index f465079d3085..337dac462e6a 100644
--- a/arch/mips/boot/dts/img/boston.dts
+++ b/arch/mips/boot/dts/img/boston.dts
@@ -206,7 +206,7 @@ plat_regs: system-controller@17ffd000 {
 		compatible = "img,boston-platform-regs", "syscon", "simple-mfd";
 		reg = <0x17ffd000 0x1000>;
 
-		clk_boston: clock {
+		clk_boston: clock-controller {
 			compatible = "img,boston-clock";
 			#clock-cells = <1>;
 		};

-- 
2.43.0


