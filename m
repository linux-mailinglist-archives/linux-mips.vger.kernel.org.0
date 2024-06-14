Return-Path: <linux-mips+bounces-3686-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F13D908F22
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 17:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAA491F29A09
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 15:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2D819FA81;
	Fri, 14 Jun 2024 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="XKTY6eAc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gStCTzTn"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296D319EED3;
	Fri, 14 Jun 2024 15:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379651; cv=none; b=e9r7C4QDdulkGvlJG38zEgexHGAkGa3q0eW7E7FYWInTxckJJK8uggZsyCoWSzo94yOMmuS89YL1bJsRC0zhGSfdhW0E9HfD+rFL7eNseRT72tvjPxFqGHRginQV0InYkj4as3qi38p+eGBSJXu0VUblyHKkiRcG6OHyhSjuKsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379651; c=relaxed/simple;
	bh=mDNZV8S6GguBwk49tXWFcS19TCMW1r+BkvsTc8f6t/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BdBdmPQ0iyYhsYIh+SIUtqqDNRC4hPYZi+PeYMbE4LDjHPdT+lcNbnofC0KOcwas9/Id9PlxDjT+efcpfQczyKJG559azRf803Ian+5Z6LZnPrCf/wLO2veXYBX9proDbs8laA+FrgPonNFtWYiR6wwv9ghgM5HXrrjbj/Zy5po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=XKTY6eAc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gStCTzTn; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 83FB51800172;
	Fri, 14 Jun 2024 11:40:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 14 Jun 2024 11:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718379648;
	 x=1718466048; bh=RsH5+aKFeqEyn84yNLCa1gnWP6M1hKm8siby4cLDQpM=; b=
	XKTY6eAc5f51x0HIJtphCfdZm3YK508Sqblm1fLDi1P7qB83Qh+DxB1+gIdXUcoO
	0wGjRRGBeLuyegdrZDZ0+rF/Fr6mHEHUfxWDdGJyesXWk0sgsQK/CX2Byud23B89
	1WUxXK0/FUt/c0n2gG1s9ywhR10rEYtlY9mi3m5PfQP0s47+gQjAYDLdOHsB13xx
	1x9KluvZQiRASRRrec/8ch1uxhHlJB1Q/4yzw3Jv/wdas83f5U/a4BbKdzaGeEMc
	ltbryScwbGYgUGXerLIyfLsfFLZCr0GYDd+cxmjtBMkKW4RXLwiZhVG4R/t0YtaI
	1y/4GRae6+vidbWHt6yDeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718379648; x=
	1718466048; bh=RsH5+aKFeqEyn84yNLCa1gnWP6M1hKm8siby4cLDQpM=; b=g
	StCTzTnq326kmIMzjHDGO4vb43YA5pU3D7gWtWju9wt4dLzz5TktoCz5hHQdDrqY
	4jHbJWzMsVt+p1bOSmFdOacgPnRmnP3+BQE1kJ3p+aUDFTRQY9u4cK0XC+Yl7jp8
	ReKNBLdeG9rgQsQDldk5KkTCwKQMVe8Pm8iqbcdz4nrQubvrvMTmLU7VFgDjYEcQ
	XtMkaBMIMulXfUvQj9lZIO8EmeigO4Nj/VL2Hdcmzt4lh19MKsjeqmTaBJo/F/Yv
	lLrixqYbRMP1tD2w+eGdtEc2dCwfh9Sg2f88hFpezQhw/rHvFm8VxDk1asSk17vj
	BFB2JcpieQtQUew8183Jg==
X-ME-Sender: <xms:f2RsZnbm-wfL95qK-1g4tgnT1z0mUpIJct5GOInHLMvxWMrnCFqUQw>
    <xme:f2RsZmZADcjByHzcrNChNeZak_jfjO_tXyxEtJnh--F-YZPhFA8D3Wi52cEN3zp3D
    5PdgAAY8hO2t16JVhE>
X-ME-Received: <xmr:f2RsZp9n6N60QqtxRhs4v9r5oztpEa_7k7EvQVMTpM4RTG9a8gYjMUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepiefgleeivefgieejhfdvhfdvieeiudehvdevfeetveetieek
    tdfffedufffhgeehnecuffhomhgrihhnpehslhgvvghpvghrrdhssgenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:f2RsZtpkhGMX4ug452gjXo7BbaUD3UrMjQw3kdPws8pECg673Jgd7A>
    <xmx:f2RsZiqRNpPDRTgCpNVln-ocWJFi-DGc_O_7aYhNQNnmKzIjR2MmyA>
    <xmx:f2RsZjQnRnSEcaD3oX0r4PV7YvjaTcMVjIQQ-Ym5cFFWH2YGIWHxnA>
    <xmx:f2RsZqr6pDcdDglecl0ZNxm32LFnku0FqGRjhknLi68hJRrjK7tYTA>
    <xmx:gGRsZvRuRJTNX99l15IubGtFxJInnDZGb-r25xaQiKunBye3tlI4Z-mj>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 11:40:46 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 14 Jun 2024 16:40:17 +0100
Subject: [PATCH 09/10] MIPS: Loongson64: sleeper: Pass ra and sp as
 arguments
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-ls3k-mips-v1-9-7614340ace7d@flygoat.com>
References: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>
In-Reply-To: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Qing Zhang <zhangqing@loongson.cn>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=818;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=mDNZV8S6GguBwk49tXWFcS19TCMW1r+BkvsTc8f6t/0=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSclLjnirJy6Sc6nL2N2xZzvWnbPjN8kfaVz4F6UdPMZ
 d7PurWlo5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACay143hn31L1aqKw7+EYz82
 mE0rl9HbxNhnwrfjcP2koN0/GHRvrmP4H59979yXpSvfFUo1PV5/WKOfqVpEcr1cXOCz8rIzzxZ
 5MwMA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Some firmware implementations require restoring ra and sp to be
passed as arguments.

Passing them as necessary.

Fixes: 68557c59a550 ("MIPS: Loongson64: Implement PM suspend for LEFI firmware")
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/sleeper.S | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/mips/loongson64/sleeper.S b/arch/mips/loongson64/sleeper.S
index 04874b9bf430..cf16877409e2 100644
--- a/arch/mips/loongson64/sleeper.S
+++ b/arch/mips/loongson64/sleeper.S
@@ -11,7 +11,11 @@
 
 LEAF(loongson_lefi_sleep)
 	SUSPEND_SAVE
-	jalr    a0
-    smp_slave_setup
+	move	t9, a0
+	PTR_LA	a0, wake
+	move	a1, sp
+	jalr    t9
+wake:
+	smp_slave_setup
 	RESUME_RESTORE_REGS_RETURN
 END(loongson_lefi_sleep)

-- 
2.43.0


