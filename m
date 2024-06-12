Return-Path: <linux-mips+bounces-3615-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 837469051C1
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 13:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDB07284516
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4FB16F83E;
	Wed, 12 Jun 2024 11:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="qzsrfVye";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HN+rHjO8"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100D616F0EA;
	Wed, 12 Jun 2024 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193409; cv=none; b=jRF0dhhJca4R3R5Cu5/YY8tGDWTa79AHoeguw/m4RV3k4aZHJ3ua0bVeR240b8rxaOXHM6LAUiYxmbeYe8rtEZRVlmbnD+U8VYCFzYV++XX2L/VX11D4OmQgtXJpi2TS6T+orIspjXRo+AljYb6/oRzLCRrUJICJboRRgHsV0Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193409; c=relaxed/simple;
	bh=JSYhFbklJ21DX3+jgOTr/ABWpsu7gnUiobdTKgnr/SM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G450KUudIU+zcvarAfeKC3ytCqz8xVEVLk2/jyXfKWFEVv9cxJAe4MNvL1lJ7zqe7dpi1v8WRRDu0FziY0TlezVJKYS3qvXOMVUq1zrgqxnbF3NV1WVUOiFMfhuadVvWcYSBboYohMxvPPu8ZA1hBYcmSr4g0xamBItZTFHf8m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=qzsrfVye; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HN+rHjO8; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 1CAFC11400E9;
	Wed, 12 Jun 2024 07:56:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 12 Jun 2024 07:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718193407;
	 x=1718279807; bh=rQGXV91xg3Znz8sXoHGgtxMKbP9vrLOi7qy3n72Y0Vg=; b=
	qzsrfVye9IPKL00S918MbFJEHcwCZwbQKfPUMmTvEZBF/kkPHzUqefnEovcZFOc3
	+ytwG/0feVtkt4Yr6a920CCVFiqFtQnAZ66c1TdT66+jIlOugJiUw2VVqDU7NYuj
	0xYOfE1/qhVD8HOwWYgOlTqBkYySljTBmVpRXXNZyrIeUZDDViR40CMAU9TYAcbr
	vC5XOuwZE21pElswQC6PVItdAnZ9WhlxAdkoRMVDhlUL9958DQs+azrv3bXyeo5q
	LTGYysVFGMtlJq3OoaIXkd9HF/S7bSAjSrYGaKjZjfAaDmzrfmqbecLaj26M61+g
	GcT5Eonzp2KeT2DOSeR+jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718193407; x=
	1718279807; bh=rQGXV91xg3Znz8sXoHGgtxMKbP9vrLOi7qy3n72Y0Vg=; b=H
	N+rHjO8TSLMu1CCGPCRDojO7RkfSEx3L7Nhh3Zp3inXyU8wDPPCs1NRLIvinmja5
	p1j/JeE0U8Sz140Cc3ehfmIAtUGfr55VMt0bgpY4ejP19OwmGXxM37SSakL8cXTz
	mVZQGSlWT9/O4dXKsHwn9K6iGeyxD7ZMsMAcZWfV8qeKUKMPCyjD0z8nm8V1As4v
	/7Z6Y8B2MKgVcno3OB0z7WlIg1+ngo/KjGUAMgiQ2/7IUQhvE691Tzmusflapglb
	ID+rNCHAHGZTRIb9Q0NPcB7OQuy0i7BsmRrwmqVwsYtfgLh55sYEsn4PEe+Cl8Rn
	kiiUFgkejK89ExoueXBnA==
X-ME-Sender: <xms:_oxpZn4WxXY4AknG8TtZRFQGXkZFtOKon1cYOZaWzcDKzyMKEGKEuA>
    <xme:_oxpZs7jPex9B_azY4oGLWPJ4jKR7BpNdy8LTjbv51qKC-iYgWrO-qNzvsQ-WSO-B
    jdYFrdNXJCKJbJmvx4>
X-ME-Received: <xmr:_oxpZudqTc7nl2GIGzUi6fFo4hpWgx5OPHWT1Y2QdpJr79m17jZpC-E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:_oxpZoJ62YiR0n-saT86wfDl1IkLAXXNnGaR_y-x9JFtrELvsxg0KQ>
    <xmx:_oxpZrK5xZD_nf6qw_Uo-C9iGtznCBXt3BNSzbHo9CXdwF-x04-EvQ>
    <xmx:_oxpZhyZBFbVBOxu8zn3NwerPhCABJTEJyQyq6DEYd0oWZEsCS7OUQ>
    <xmx:_oxpZnLq8aH6AZ6-v7ztifzW4WRWx5bwIO2Zgt7eFuJYw7StHmBu_w>
    <xmx:_4xpZoActsKyL9n6XRdNZVEgTrogFLUeD1bevmldQnwnxBAKVFZLMD0e>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 07:56:45 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 12:56:20 +0100
Subject: [PATCH v2 1/8] MIPS: dts: Boston: Add simple-mfd compatible for
 syscon
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-boston-syscon-v2-1-9f8e1a07fa63@flygoat.com>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
In-Reply-To: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=JSYhFbklJ21DX3+jgOTr/ABWpsu7gnUiobdTKgnr/SM=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMnj97Q53cvx4IWHQmqWRdql+cMOv/54GicgoaTNVKf
 dfPnvrcUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABO5c4/hf4aO14HmUMXlHMJ5
 O1y/hpi5+PQEz5ueyf19whn2pr1nBRgZ5nmWqikZm9fqabVMfxLQvf3hDB5JDeX+V6Efnjz8Nfs
 fLwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

We certainly want subnodes of system-controller node to
be populated, add simple-mfd compatible to make that happen.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
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


