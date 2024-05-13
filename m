Return-Path: <linux-mips+bounces-3264-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 613608C474A
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 20:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9289F1C20E31
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 18:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6DA5914D;
	Mon, 13 May 2024 18:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="P2Gs6F4k";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jaoiE/KA"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA1057C94;
	Mon, 13 May 2024 18:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715626700; cv=none; b=Up3YifoKACAU25MdnS22ct5iv7AEh2Ccwugh4xbct8gpz5Vn9UVLP580KNAGnuwgnigJ3j4T7afhYkJFocdjPk6h00MSLhX+0PrhICpNry3LiHCM/FZinOXbntgEIqLj0A7AyMGzt5Dhql3kF8ckpefkjPmUnJ6RLn3cD/zhzJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715626700; c=relaxed/simple;
	bh=AxqJL6jRCqV6vjY2t6hZsW6Hct2fql6azgLtT1kWzBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iaj5ZOlzQ3SiPymPwAFwaY3nzgRcgro8yEgELR8rP8aD+18kwocjXzpmH/ewR7T7Lj5N5eyqJynrFH/FOwq9O55Xliehu7YXv2E2M31iQWKGr/aPT8H/T+1KcEOsmloMzLMwnPf/nqfXLWe/aFh86WfRWyNYePzrNwQvKWCjb5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=P2Gs6F4k; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jaoiE/KA; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 778E9114017A;
	Mon, 13 May 2024 14:58:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 13 May 2024 14:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715626698;
	 x=1715713098; bh=VDFbaTESjI+KTwwEwgBDTk2QVAvlm0Ozsc93TRmAp1I=; b=
	P2Gs6F4k8JzfhAxBW1F+KApwfLU+Estb8+Lv8EDL1MfyJEPr3iklD23T0NBljCOD
	xgZjr/7cfz66dxarVBYLYqpSj5LVQCGDiqhwqgaSMFcvJIskU47+pFyZI+Wkpmp+
	Iksq3j49yz29oeBtbfDGGpqtY1iMQtBjdzYpv5ZFOgc4CBX3eW4JJFIeHbg8N28j
	cx84ncKLfvH5GtZtYSsYMpZzQ94xV4ZzfZ50zer990NxS6Ri7ZGBPxQ6Ebt/sy9e
	telf4ihevfEjrSdoRurJu96a01y9PrP47YsqiKWI/CGdzGPQug3WlIS4PdQ1MdxP
	fOLC9yv0izuY9wgPa90yhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715626698; x=
	1715713098; bh=VDFbaTESjI+KTwwEwgBDTk2QVAvlm0Ozsc93TRmAp1I=; b=j
	aoiE/KArf0rNW+jUUQ1tJQCtQnWC2vrjM4wJ6fPMmk9PpZhyFeQr6ABAl+Z+7goI
	IbrrJUoB76DWTdqXYJEXs4mWefMdIRsh2WL4wUcX3ypf+OuQvJklpPV4TM9yAaeH
	jp6bIVtdbOP4FPUbOzbJrDodziCxzPt10nx4qHEGcCd8wcVVsosyKxMuGsYXba4v
	+eg06yn9n9dUB/jbuODIVYmnWhcqygDTHbItd9JLuD04xsytdEUvfQ+GehulOkp9
	cwBATst179iH6fzIX4gq2s5x+L6BJKpNV9JMKWPV3srosN9QcKow9+X4N7+xbkhm
	MBuJeACWkXfcgaDaktJdQ==
X-ME-Sender: <xms:ymJCZvsma4gIGFpafHjT4bQBlXmMrlOJROYvIOqWYd9E2X5mNb5Now>
    <xme:ymJCZgc3_zscivg3BWHJ8151AS_BAi9hfSvtV83Y7k44puOqYDbe6C9BExxA1ul79
    TJf3YbjeJRFMBLVpSk>
X-ME-Received: <xmr:ymJCZiwQ75o_R7g4cYfJbb-zvkqCmqad1xF1BAsKswxjtLutvcAjS-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeggedgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
    ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:ymJCZuPWxBU5hKlfiWZFQQWjHqw1_M_qySR-bHnrRXM-tLX0lccYeQ>
    <xmx:ymJCZv80Z02dqTn6ZxxQFnaVbfYd3lD8x4YO6yHu8F9JtbebJeRifA>
    <xmx:ymJCZuVGiSyWQQVa3CGLcETEgVKEtWie3FUp0NMVbzL2LQhrOY-eDA>
    <xmx:ymJCZgd_3q9iZMVyVgQqUNnuXHpl7lNF5Kn0ESKkpD1Kor5dx_WDwQ>
    <xmx:ymJCZg0FkalagIgjED6vFTPK7QtxSw9O8LW3jltMVt_RvxH3nGRStAMj>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 May 2024 14:58:16 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Mon, 13 May 2024 19:58:15 +0100
Subject: [PATCH 2/2] MIPS: dts: Boston: Add simple-mfd compatible
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-boston-syscon-v1-2-93ff557d3548@flygoat.com>
References: <20240513-boston-syscon-v1-0-93ff557d3548@flygoat.com>
In-Reply-To: <20240513-boston-syscon-v1-0-93ff557d3548@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=AxqJL6jRCqV6vjY2t6hZsW6Hct2fql6azgLtT1kWzBE=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjSnpOOu7s/PtvVUXBRTMtpl+GEZdymfitjGldzfPgkvU
 qqILT3dUcrCIMbBICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABM5yczwv1pzncXze+dcPvhP
 vewtIfqFyVlTvLvsyg0jkYzQKN/IRQz/PU86LpjoFtwY4KevLX1lc5e4xJ/G7aXBU6yiWUK221i
 yAgA=
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
2.34.1


