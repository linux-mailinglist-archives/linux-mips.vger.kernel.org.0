Return-Path: <linux-mips+bounces-4168-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F21929106
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 07:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA5FE1F22F37
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 05:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C6D53A9;
	Sat,  6 Jul 2024 05:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="IqqWDIcX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A8HjjFB+"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55DE10A1A;
	Sat,  6 Jul 2024 05:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720242493; cv=none; b=sAuY+P+1uPXJD0vSEFUoBQ5lHUl5oMFrp2DegYP+8pj8fBHJUShm3225/iKoedvVscARMSYYQiUIsf3qHmw4qVkYLBnz01sDkBGKcox6383wJMQ95RTu8YFCJTS80F4zCgbn6Z/cs1DHcrCK+f6yRXaq5JvKeP5QNASltBY3uic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720242493; c=relaxed/simple;
	bh=BbBdnVo6VrQj0cl5yjuFmJPcMYZZ27cvSwa/Oi5fqMQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LIlOLus05kkAh4VanvNuh5QiRoy7G60WcFrKlikussYXMlVwj6xwN5ujZmi+E63LXppXz7kqubWD5X9JcBsogP6nyDIldnmi+++z5Y5EFRI/AGDRfU65/3d5vJCBjznehNdo9NKGeJ0pqLGOhrPN+J0xig//XLl+uNVkfmrkJmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=IqqWDIcX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A8HjjFB+; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id D789311402C1;
	Sat,  6 Jul 2024 01:08:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 06 Jul 2024 01:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1720242490; x=1720328890; bh=XW
	2dR4BWIgk1zkoc5NmumzZVGpq1RvZof2Ipk0Mbst8=; b=IqqWDIcXkKzWFEgFdY
	RWiXiPN4ihRZpMljaWTsZ96oZazgawFePIY71QYhbsg9QhHT56XiQlwmt3iXrpsP
	YfKo6F5Guobd3ykpjE2+bUaSQCrjBOXW6s0KatSP1KCBJfecZ68aZZzxkbF3bMLD
	g2vtTv8uYUMlKmCKbaURVXK5XrFtKiyDDb9p0SYHoSjd+MweKOiKX5VZ0HfktUjt
	LZ83XbJeMZnqc2IqsMIgw7oqQdQGcQ+bLFPBnCrojfkaZ6FHdE9YtZmhB/UTAZQM
	a7wJWiUzri4mYlnBa05OxeBSZMVUryRdCKmchArK8fBMfmxUj8fp8S+X6IwCCt8h
	6Tuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1720242490; x=1720328890; bh=XW2dR4BWIgk1z
	koc5NmumzZVGpq1RvZof2Ipk0Mbst8=; b=A8HjjFB+o65PArgz41eNR8nTUm5OL
	3pgvlTI2HY3f6LosChzI9+MsLjhrGHbZrY8EPv6fklSIkcqWUlyysP9+0cm4vd2E
	GAOliM9UNThVn/zSvwrOgIXjLeVM+Q+FsF3TFAYLOC2xaTbWtjb1koTz6Yv8RRdZ
	r/wFb0G6tks12aU6ZSprRNXZmWx7ECC6T2E1ca7l4Fi21XLPBdjQsyz2ET6l3ZDT
	lZ29oJcXtzvOpOR2ljRCI/5LBg4y71GU3B8gEAnRYnX7j57Cu4jxQ5ZmU9vDwHMo
	9pWVd2BhuypovmQdRcMt5xHHPqEpCgXgsI2fiNvqsKn76c+V/fvpszKkA==
X-ME-Sender: <xms:OtGIZhKkR9jpOJbE8v8aDSBRoMn0ZbjqqbJGpIa3H3hGR_lltmUL0g>
    <xme:OtGIZtIjd5jb1mLaBFWm9AYUYsslUCGqtBtzEeBd3niQLfeGvvlui0J92dVHmZiZR
    o8kCoBDBiJvm85hWW8>
X-ME-Received: <xmr:OtGIZptE4Q0PUbzBZ1sy7P6I4-Gw63djjSMES4Sacrlv6AsvtOHYihm91hBbxuzSJf4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheplfhirgiguhhn
    ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
    frrghtthgvrhhnpedufffffffhueehvefhgfelveekueegteefgeeiieejheefkeehkeev
    udevieegueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:OtGIZibkVDrxc1WQqIYmQcX-z587mg7hyP5vI1oxW8KF7CGdcxJ2ug>
    <xmx:OtGIZoYMa55jC0yJrelwbCeCMLRH5Tjxhimxg5FON0KrNGAAy3fHiA>
    <xmx:OtGIZmBVQ-FN1510m12RFoWSv9IUsH3D7Kfaacq4Id2UTu7CR6LqGg>
    <xmx:OtGIZmYrfc-YI3fRy24vAxcUnu5mY1t5CW4vkN-gRwK_m1GrezmjoA>
    <xmx:OtGIZvWAxnGVZ3YrCpC-2HyiYlisOTn-MglEqmbgP-5shAhlFqjtyXUV>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Jul 2024 01:08:08 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/4] MIPS: Refresh some configs
Date: Sat, 06 Jul 2024 13:07:57 +0800
Message-Id: <20240706-config-refresh-v1-0-5dba0064cf08@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC3RiGYC/x2MQQqAIBAAvxJ7TlArjb4SHUJ3ay8aK0Qg/T3pO
 AwzFQoKY4GlqyB4c+GcGpi+g3Du6UDFsTFYbUfttVMhJ+JDCZJgORUZmn2MNLjJQouuJvj5h+v
 2vh8sUiEpYAAAAA==
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=810;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=BbBdnVo6VrQj0cl5yjuFmJPcMYZZ27cvSwa/Oi5fqMQ=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSOixZLffiTr1u/8HnjLMz+6e3DsG1CvEdnWBTkF1y77
 Xb3dQd/RykLgxgXg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAExkkTkjw8LcDQFKm5dbpLz/
 1LBbZ0HwmZtKFz5P3LzQd9JlpR27L3Mw/NNjLItbPdGbv7EkJC3i/Y2Tjx6frqq9spk/ZtaO90V
 WvPwA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Jiaxun Yang (4):
      MIPS: config: Enable MSA and virtualization for MIPS64R6
      MIPS: config: generic: Add board-litex
      MIPS: config: lemote2f: Regenerate defconfig
      MIPS: config: Add ip30_defconfig

 arch/mips/configs/generic/64r6.config        |   2 +
 arch/mips/configs/generic/board-litex.config |   8 +
 arch/mips/configs/ip30_defconfig             | 285 +++++++++++++++++++++++++++
 arch/mips/configs/lemote2f_defconfig         |  54 +++--
 4 files changed, 318 insertions(+), 31 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240706-config-refresh-f1f87ddf3652

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


