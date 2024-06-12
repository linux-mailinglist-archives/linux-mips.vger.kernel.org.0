Return-Path: <linux-mips+bounces-3617-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A284B9051C7
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 13:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54689289555
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C0517164E;
	Wed, 12 Jun 2024 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Hut9KdXL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h9ViVlEE"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F332E17082B;
	Wed, 12 Jun 2024 11:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193413; cv=none; b=lX767GH26uywblDl+KZS1JqRp1oeeXwkNFcJApEjD6SrvNdzE40ZlHY/zzcsSnLo4SzZbF6kz764vLnWmK9MgRlYKj6FxS5FlqjRgk9d8BxMpBtn4LbkIs4uxU2cawtx/5DTU9crMQNWAwIxv2VDc4I4cQ6l0RCvpPbpTkbh9Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193413; c=relaxed/simple;
	bh=ucNOokm+BqbipXH3f1pK/co5d8rHxuTfKigD8DzLXwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQYjhTOpm/8alCO6kdeo+0G3xkr7kVWPlqeCDLmbmvRkWxkJeF5Sk+Vu/z9bddWMDdks2+w8w1g6sgYjN0A55S+EzXcaNEY2lQQLuChDKIfDJ50x2uIHwWPS+pa3+DkO8cRLitjTLg1Y6tVf4TEPEsypVimIsj+S4rf6fEyguBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Hut9KdXL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h9ViVlEE; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 140D61140116;
	Wed, 12 Jun 2024 07:56:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 12 Jun 2024 07:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718193411;
	 x=1718279811; bh=NboveGjMdoPaE3uhh2w67a5bhpM1+FIMNI71YEzkMmQ=; b=
	Hut9KdXLUif1+/dnNfMDa/+DKnovVfMbABxZvWohqMHYsMbg+Hc38OxjZ8EphkID
	L6mtmoVNKHri6+Q42hqmj/5f5xiqojFQBMfT1y7DGIUe2lQTcthYGzVpYgqKz4sO
	YlHe3Xj+BR+DgNscEugTtJxrEHJNjY+eIGglcoYfEWrMmYzg6EcuxrrksXmL31Gp
	E1+rh5oU3RW196PX0kf2ZFzosf+rpKFoNLkLXdareVdx4LPCx6z+/al6IVj6BpUI
	ORG6DQI6Mt8o++JJ18cTHJUU83ZKw5ZHCUeqQd9JYZUTsFHt+S6p7c/xyA0U1K9J
	rDVSFqfWouJA21gCK43QPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718193411; x=
	1718279811; bh=NboveGjMdoPaE3uhh2w67a5bhpM1+FIMNI71YEzkMmQ=; b=h
	9ViVlEE2lsXJOa1Fl/XPY5vleoDtPBk6aHq1N4A+f3JUxBq4+FX/9pDmhhAf2Uuk
	xB5bX9kDmSUZuDScquqtpTrXsa8Z+HAHTwa76yZlcS3kTmsvLyHUokhbf/I78Amm
	tU2akvDi21u5QhTAa5Zj+tOminzpm7YO+l3X8Y46ZxEozohRlxGmYZQ8fCZF4vV+
	ya/8CbOIk22wvUckS/lKKy0HRyr36x5KK857sG2hX1dENgtah9YCwi8an3y8Qk+1
	RI7em88UC/4qeZzmUg5vPYKryzzm8AQAMDhc1MwdP/Np6notWMHxpQO8xkmzAWye
	iVjeaGJK/sZhcKM8cUYEg==
X-ME-Sender: <xms:Ao1pZviU3LZsxUO8pEEGK5lM2-MTass9g1IY_25BjnYBpb-PuWm34w>
    <xme:Ao1pZsBZWLaxJcV8z1RYx173COxWUQmMtg72CrFLW07Y1-ZNEL0Lki1eiGcrjb9ed
    UULhQ8Rg647uwwVhbQ>
X-ME-Received: <xmr:Ao1pZvEOoTi4bNS9uj017lIMVp48WfEhZfS9eAh2GAZexVTPF7QuJ38>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Ao1pZsROD9l8NqpnqlsYUiKX3ckDUUWhEbmU61MPj6MxVsmPgZs1Hg>
    <xmx:Ao1pZsxlPP3kazOx8hbfflEwxEW0HG-FTFNcnY44agnDD_3Fp7UaSg>
    <xmx:Ao1pZi48I1e3Eba7iYNBZhqKac2ESRpeuwQiCw6ZpwxOIs9IMQ90zg>
    <xmx:Ao1pZhyFF5OnMkPVZGeeI3FuFkTg_k86TqxO3mXRehtYbuXwkKLzQQ>
    <xmx:A41pZhoD-PVCnC5pgIjl6E-y4O9NQhGOw8SICBNNXnCvSwmcGkUp5sUt>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 07:56:49 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 12:56:22 +0100
Subject: [PATCH v2 3/8] MIPS: dts: Boston: Remove unused #interrupt-cells
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-boston-syscon-v2-3-9f8e1a07fa63@flygoat.com>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
In-Reply-To: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=ucNOokm+BqbipXH3f1pK/co5d8rHxuTfKigD8DzLXwk=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMnj96gv1HbRXK3qdP0Nkikhn+9qT2u/vCDkwXDlzZ1
 WFovsGyo5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACZyioORYVONQPO+/Wsbvp5f
 y3RMfJl11sMTp08d/5jXeezyNM3X8ysYGS5deSD8cc4no0PiX2Oue7lEdd/k33jjwIY33bP2pL3
 6HsIBAA==
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

There is no reason to have #interrupt-cells node for a
pci device.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/img/boston.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/boot/dts/img/boston.dts b/arch/mips/boot/dts/img/boston.dts
index 7379be7d46e1..bee5bd0655cd 100644
--- a/arch/mips/boot/dts/img/boston.dts
+++ b/arch/mips/boot/dts/img/boston.dts
@@ -131,7 +131,6 @@ pci2_root@0,0 {
 
 			#address-cells = <3>;
 			#size-cells = <2>;
-			#interrupt-cells = <1>;
 
 			eg20t_bridge@1,0,0 {
 				compatible = "pci8086,8800";
@@ -139,7 +138,6 @@ eg20t_bridge@1,0,0 {
 
 				#address-cells = <3>;
 				#size-cells = <2>;
-				#interrupt-cells = <1>;
 
 				eg20t_phub@2,0,0 {
 					compatible = "pci8086,8801";

-- 
2.43.0


