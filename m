Return-Path: <linux-mips+bounces-3618-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A93199051CA
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 13:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56C691F244FA
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFBB172BD7;
	Wed, 12 Jun 2024 11:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="sOXRLn/6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ur4caY8p"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89647171672;
	Wed, 12 Jun 2024 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193414; cv=none; b=Fr8RYcZJmr0che3oNAg+WmfWfXmVzCqliFbg9yCQ2B9Y9LcJsmiERvTpEo4O2qkhCja2z4g7rh+74laOOZktdlNyCGFv0Q2bIsKnSXFBSxok+XPw/pcpSTo3Bn690jB9QiXz3XkHVmXyv238IqqVDekri2Ct6XEa6h60oaqt+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193414; c=relaxed/simple;
	bh=5EpbxR4MUh18s4XgICrDVUAE5ueseYJolA1frVio7oA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=li34Vl69H4KgKXnBctGHkgSs4zqVV8DzrWLHwuw3qDiNqtAIXBGabVs0+czujsTgBG+/4zzUY2kqBtXJUFYZrPCcaTcZjRd32utX4+fR5lAzfXl40/qthssEbRn0vXHwg461IRUf+qlphTJ0LjMbIzqdx4LpokvNuVHb8H1jsXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=sOXRLn/6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ur4caY8p; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 9E60811400DD;
	Wed, 12 Jun 2024 07:56:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 12 Jun 2024 07:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718193412;
	 x=1718279812; bh=fEW3YtWi3Yg+vFgcBh8mB/3pIKTW6OZx4cB24ypp5Rs=; b=
	sOXRLn/6ciFGFXq7Ksm4HZiMvvRRAZ4lau2dtXvTx+cen0aTs0PRY0/Wn4YobS3F
	P1hJcWTuOKcpA0VLP6d7BCHqJjNiC7+qAnPEH6s6Tpfg/tI5gWUJlJQf74snTG58
	KOTkl4kfZ0PTd7pZmYqod2KeS6f0JOygwrQzjg1ybib8GLv/QJtMFkZkYdON0VRw
	fahJkYkMcbhORWf/hKia6BB8FDYewv6aqctAJloR9HdFxwGovcy1y0Vvhp+rIV3f
	dg2GuRvUKKfAoC64n0yFIpuN1Vp2FIbrl5ahopB2LxcCozINcwnAeTrJ2pZwj8rX
	eI2jpp5PczH7z4BYWOIBjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718193412; x=
	1718279812; bh=fEW3YtWi3Yg+vFgcBh8mB/3pIKTW6OZx4cB24ypp5Rs=; b=U
	r4caY8picL60LP9xIegqCllg9lAWJ/tDSukPc6ruyDFjlGwIFCx/KnBOnC1s0LrI
	f69RDR4TLoLXU8pLeMjwsNTsR3bLmxO9iy2uJU/Gw+gWF8vFRlNerMiJjzBr6+r5
	nrZEJU8WJq2PAagmPj7ULS66I5m00ZnFEigq8Wq3DCV8+4/j5slI3HyMHb5r3yaL
	tIswdyi4Gqol3/vUthMpjozu1H202PD/IC2WHFwFtoey9IXPBZUWl6W0WRF2dwiu
	m62eBVdJzDOTdmKdVTdMg8zb80svQ+UAgmT8NGryNfOmNn8meTJ9AcoKpdMFqMR5
	h+/u1c0FZI5sxfvcJ40sQ==
X-ME-Sender: <xms:BI1pZgKxQISaEc__1LhMaB38gAC1XPUogKzsfBWdApXi0vum0Sb52Q>
    <xme:BI1pZgJGYaB76TbPw2INQzpImAHOEfBYnWC7i05zBk4RanCjlvawBdMhHYwKSUgBX
    nAOAYlOarAirD6oHyU>
X-ME-Received: <xmr:BI1pZgvziOvzgFxpW0QVFaZPGIDcRXdTBRQt1lzo860eO8in2QZxbNI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:BI1pZtbJsjDuPeTBdHLsETepGMWnz0DRgcJm3dFfgeGZQgGdDVkkig>
    <xmx:BI1pZnb4AT-PTLRMrMhqM1B7ukul0pNq-lr4SOd20bfAU0UUATtghg>
    <xmx:BI1pZpBqv3re0Ij3UpGZBK0_HsctazZe3Kcxr2t-PFdORX8hdbbw3g>
    <xmx:BI1pZtZQm8yyetPvzSht-kwEpRRgmZl5y_s11YRHWgcWfbkqxNQqKQ>
    <xmx:BI1pZkSUT2k2LnbwwEIfToZN2vU69bykZC13ohb-qhcfGNxha3c36RYB>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 07:56:51 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 12:56:23 +0100
Subject: [PATCH v2 4/8] MIPS: dts: Boston: Add model property
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-boston-syscon-v2-4-9f8e1a07fa63@flygoat.com>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
In-Reply-To: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=575;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=5EpbxR4MUh18s4XgICrDVUAE5ueseYJolA1frVio7oA=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMnj8iBadnhbA6RG57m/DHqZSLnz17z9U8dZWCyKkHt
 11YdKClo5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACbS7cfwV2ztyQmbLy1YuJGT
 t/qKSNsr8Q3mBzmish36d12YYDxlgzIjwyLdM17/661spjDVTDqx6NXn+99k7q7qccm6OlvQ91p
 tJxsA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Using string "IMG Boston" from bootrom.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/img/boston.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/boot/dts/img/boston.dts b/arch/mips/boot/dts/img/boston.dts
index bee5bd0655cd..85d4255cfbb5 100644
--- a/arch/mips/boot/dts/img/boston.dts
+++ b/arch/mips/boot/dts/img/boston.dts
@@ -10,6 +10,7 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 	compatible = "img,boston";
+	model = "IMG Boston";
 
 	chosen {
 		stdout-path = "uart0:115200";

-- 
2.43.0


