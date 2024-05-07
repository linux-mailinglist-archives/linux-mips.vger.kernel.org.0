Return-Path: <linux-mips+bounces-3133-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9313A8BE74E
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 17:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6CFB1C21FD3
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 15:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D00D165FDE;
	Tue,  7 May 2024 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="lL8ITcWp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ek4d7dsU"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F027F1649CD;
	Tue,  7 May 2024 15:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715095336; cv=none; b=YMcPGGWYZj0Fcekm/IZgJVjBV3xRcAFE1v+Sg2toCY3sJmpiTyAcFhPRq+X1KYq7JrYIqXzsW4KbRogg2w7q4MA3f61ah0XW08Ba3duyAvaBE9XyDqOfiNRVgwKBE0cRePTmG2/OzgRn85FU/2YdOn2IBgVFKbsuSqdpq/aNA0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715095336; c=relaxed/simple;
	bh=aCG31ggx5FwnkAw89eRrVEa5H/1D1f/hLv5GcL5wb5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2QQnRwv2UXpnoVMMz6Dwym/ip0K3qE2r1eeovZnllOGdyC4eSBrvuTWDyHTS40Mo0xt62JfVwe//rjxCSm6ua/b2dVB2D9glZPK5Y42Y/rp8iwJo70sqTPDZZGEZjaPDvFzw+LiK0QhvyDucWE1k6aEkLiD06Lq5b+/tOyUxUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=lL8ITcWp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ek4d7dsU; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id D97331C000E3;
	Tue,  7 May 2024 11:22:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 07 May 2024 11:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715095333;
	 x=1715181733; bh=TjtLInAZcfnZsukDv2PQiAwljAXLKqwg2HYQT5PZI7k=; b=
	lL8ITcWpbUaMIEiza+q8ZyNjs5XXZm85axAgbkFYJbahmgHlGESHrRn4f/VjdYD0
	TskNcx5G2pFJEdrdirFnCu4rIvFMn0yGzHq3P3ckEedgM+VxGKM5dpy8sYmvuHQ0
	H8xfSyEfStsYKB6nYv+vdoC6d6nAO3/KEXMNQAw+tsQvZVlWk/2MpM4jxFujIZ2V
	8S6s1+cNCJ11dUVSY0qWxH5q4UcI2NFtj2VwG2YxcJf7+pA+tVeoctK0JS4XQyJn
	pu8Y2Vje6FbDnsOCfBgFo/NVxHg1rbpaqTJY3p1l8oZlH2Uf1euAR8YNH+cClmyz
	pA//6k4T8a9hbZNpnKkroA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715095333; x=
	1715181733; bh=TjtLInAZcfnZsukDv2PQiAwljAXLKqwg2HYQT5PZI7k=; b=E
	k4d7dsU/2VYIWc6w5jlq7qQtAlr6o9VaBM9JYbE3AxpbFMOfJAnMAh2v82hq/YWJ
	lzC4JHNvKpYWYEsSnp11dn/uH2utDBypFuXISAS/fwlN9TuTck5WQTZk0KLo0Kiy
	vFoJ7Ty31qPg/FaD8zUb98tLkTwgjSrmwqyCm5dfIZdVJpij3A636FhLd09JrPVg
	rEbe7bDTQrcXAVtog4pL/D1lGXzesrcWGfHHYurWGb8ZgGAld6iPjvjLOtFeXpnL
	Stv8afyPHX53he/ZoUw5DkXaKsYqMNRavTpaReLgkixGzMDIvXBpGb8VRfwpIbC5
	gZiz4h2JcKd5YcA9a2sxQ==
X-ME-Sender: <xms:JUc6Zsal4UqHpkfiIijViG_8h4ecPUMXRgx6sUT48dXauHIB6RrrZg>
    <xme:JUc6ZnaVgWs71K6acAqTLxAo0u6d0fj_iSULk6rUhA9JPHGSbPGR9FmMu7q9oBhTu
    meYDOIYJFniu8d3ci0>
X-ME-Received: <xmr:JUc6Zm__nEakCcaU8duR0GOS0r04U5iWpN8ND4BGtJhhyjPbqA0OIjI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:JUc6ZmrojR-U21xTvgNGT4qNm18_pP1kgiOX3yOAAGRenlqUvya73A>
    <xmx:JUc6Znr1Nlikwygc4BGfd7jSaDkeooweq8bAE-Q8ZSUDmx_eC0xO8A>
    <xmx:JUc6ZkS9UIkDgDEVRnnb3sNzjmKm2NeCvTs42Erz_aInmr_DCUIgdQ>
    <xmx:JUc6Zno_ueaA1ZKDV8UftxBXx17J02kiAB5xZXyH2CC-BvfAEYge2A>
    <xmx:JUc6ZoANx1e1dyxZ2IZ5OlKg6u3fnaXmAivxXeytYFUGh5xKV1U1CcJm>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 11:22:12 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 07 May 2024 16:22:00 +0100
Subject: [PATCH 2/3] MIPS: select CPU_PM with SUSPEND
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-loongson64-suspend-v1-2-534d92a4e09a@flygoat.com>
References: <20240507-loongson64-suspend-v1-0-534d92a4e09a@flygoat.com>
In-Reply-To: <20240507-loongson64-suspend-v1-0-534d92a4e09a@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=696;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=aCG31ggx5FwnkAw89eRrVEa5H/1D1f/hLv5GcL5wb5w=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjQrd0X5P9OzJBusvSOy+CZXX61Sej1HS+Mw08Wj/Vfnd
 1rVauzpKGVhEONgkBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgIl0WzAy9H46eNDTSden8efz
 e2rFziefhxx0ElOuSqmdv3uLdh8HMyND8xLrHTuv5vk+i76xSjle62p2NkfThYI7D7QetCmyNte
 wAAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Functionalities provided by CPU_PM are essential for suspend
to work on all platforms.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f1aa1bf11166..c5753cb0953d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -30,7 +30,7 @@ config MIPS
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
 	select CPU_NO_EFFICIENT_FFS if (TARGET_ISA_REV < 1)
-	select CPU_PM if CPU_IDLE
+	select CPU_PM if CPU_IDLE || SUSPEND
 	select GENERIC_ATOMIC64 if !64BIT
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE

-- 
2.34.1


