Return-Path: <linux-mips+bounces-3606-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B17904FA4
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C1E028339C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 09:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8233916EBE7;
	Wed, 12 Jun 2024 09:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="B8Tz9pui";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aF3fLhvJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C95616E87C;
	Wed, 12 Jun 2024 09:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186021; cv=none; b=Rp6zBzgzAftK8sAFEKscGCpIwcBTxyj5ZJzBYawYBKpZA4XeUPew1NGsObb/+5AerbOB/xO3R6NMb2dNSRy00WlzGyf7Gbkw5ziyDPsc0+7iSgUPpmlbdUcE0HwZzFpBaUJrYJTW4uwIXcXtD4OShoYc2d07pfGeh4HS7+KEOS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186021; c=relaxed/simple;
	bh=NSrQU7oxV782OTF1pzPrNXGHVTnX0ocauyLrs3G9UWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F65hmWHQsfGf897GL33IIc3SxQQSAMPHEvlb58pRvttcE/zKKhKbTmSX7IlZShcOEkxW2TuRK7K16x7PdUf+WajaciBI+S29z6D5FLTZsvr0/zbqYr6vu+mkqkrTrNNjicT7rrwk6/ENm3FDY/xkmPZcASPFqb1H9S76Nlza3a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=B8Tz9pui; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aF3fLhvJ; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id 250B213801B6;
	Wed, 12 Jun 2024 05:53:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 12 Jun 2024 05:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718186019;
	 x=1718272419; bh=eTw/3uGoMaLNBc00Ig08jpj75W3u53E9jYmieBPTfWU=; b=
	B8Tz9puigFIHyA4uL2uLeAZfR5lVpixa3qnlj0f8iVSo2xuQ6PyVq0U+eVdfdy0K
	T6LFgIX7Xu93MmmogGKW04YQNo30yW4cvAgCE1311fWyNufwlndNLkZsaJO0PKrk
	N6IaBDChMRC3PhZHxUsdOtIcQFMkvtYegfr69EHfKLDRr4bi/jqa4nfq2Cb22Fkx
	XATiu+C0Lmug00xsoWhk2jUn78HCZrMT37wggG1tfR2zDErUnbKISOuTc62eliZQ
	Fsu9KxTEWNrIgQXE3ZNj0ND4FXZQ+8QKmvV5KdCpi9deEIXDOzQHXGDlb9PhVelb
	bv3P82pEa6CGx/O9lyG9MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718186019; x=
	1718272419; bh=eTw/3uGoMaLNBc00Ig08jpj75W3u53E9jYmieBPTfWU=; b=a
	F3fLhvJqW/Z7Erq9KoHi69WfmcZiFoRLrH47iSyzZ9USw8+xdHoTXB9yGNUED/Ur
	yxyjtmUa/qj27URKoDAickrTmzEKVvz/4gUxHYYo3DVFhK/lsr+k4FMRd6oHCOMp
	KuZMDkV4V5yk9JoeGW2HEGBHyEom/Aas/05oatWq4socA6hBFnk45hpTilX86prx
	MPYZ7+ddM0ZVtF17b3NskroogylaHdxNWL5bqZ3dUd46CAHvVHVPVctdz3Yo2YNc
	PD0FWfoPML6szVJoPc9J5cSmQjIRZcM97HFxTdvnLPV8DHm8Er/qB+1H6lnYJtmx
	Qneq4Gx87ef9epqLu1Z2g==
X-ME-Sender: <xms:InBpZlssg7QkE_g5N9CEIUe5Tqcyrn1H-13e2pDmZqMtzp5U213rHw>
    <xme:InBpZufAjcuyZuDXJCbL-umv50h2V9p6xgjggbLouZ4X18sQUxPtapZZvbqix3jZ-
    AUYaBwi-8J69Kkk0JI>
X-ME-Received: <xmr:InBpZowE_yR0huv-pAXNBJeXofSOAo3rnTvgBiTTjKRQOOIzB7GlUuE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:InBpZsMjnry50j_-zi2NM2uQExsp-_4o9hlfWvqgOmgIUkSp4olo6g>
    <xmx:I3BpZl8wfrH6sc84ZGFTSoqx7VUGn8Z1shcjVU8M3cwQw7tiog8U8Q>
    <xmx:I3BpZsWOqmyt2PSJ0saV2WJm-67tFdewwSFZEp2BB6P7kbW8pS1fFA>
    <xmx:I3BpZmdZHWchKWtZwGOPk5DS6rqXJyS6wMWysXS2DXwSRshgd6pW_w>
    <xmx:I3BpZlxeUMDcoxkN4uSDMEVeBeUJ0ezvam7bCfvD52lz4su0Jv2LufGi>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 05:53:38 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 10:53:32 +0100
Subject: [PATCH v2 4/4] MIPS: Select ARCH_HAVE_NMI_SAFE_CMPXCHG when
 possible
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-mips-llsc-v2-4-a42bd5562bdb@flygoat.com>
References: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
In-Reply-To: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jonas Gorski <jonas.gorski@gmail.com>, 
 "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=635;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=NSrQU7oxV782OTF1pzPrNXGHVTnX0ocauyLrs3G9UWw=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMAlmP7QHTs8w8JoU2PjhS4ayfIDfz4xHv5T4Xs7sUe
 67evtPeUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABPZVsbwzy7v9w6uKzPjpN/v
 P27M5mi+4rKHY+5enjJVG43WdIvt4owMkxn/hv7bqGjLerummSdQWWT9lMs9mueW739k1HH73Sx
 3TgA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

LLSC based CMPXCHG is safe for NMI.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e83036580a47..1bb274c50636 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -17,6 +17,7 @@ config MIPS
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_GCOV_PROFILE_ALL
+	select ARCH_HAVE_NMI_SAFE_CMPXCHG if CPU_HAS_LLSC
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT

-- 
2.43.0


