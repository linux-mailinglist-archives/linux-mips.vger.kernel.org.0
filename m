Return-Path: <linux-mips+bounces-3131-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4518BE749
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 17:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F9A41F2351A
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 15:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D6416192D;
	Tue,  7 May 2024 15:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="PMEOFJlh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RMoNftkH"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892B5161327;
	Tue,  7 May 2024 15:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715095332; cv=none; b=kANl2JaScCnYtBQWbFVE+1jp4Xr0/CwHYPmk1ITqrPms0k1bPeMfn0gYaiYr642p0O36deRb0/qsAA1bzbQm0boMdk3NNtiLuUhTE9PbrRpiCyGIyMyTPDAeKgsf91DVhnMb172ZYoRrxCeHgGDsY/PFGcNHWNGr3ak8NQg2OhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715095332; c=relaxed/simple;
	bh=c6AQWS2glne4iFtBEIBOtzxq/07owekE2Qt4WciCius=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B+KEhPoKda1yWqyBqsgmG71yKK1bf1rjXaSey1JaZcEDYg87YysdTPzgmcOUWIiboNzDgQs6jB5nNlPX6uX7xmCH1qaU0pl/7w8PsHTM0umxYzjJcM4qlO2Rw/ZOOyXfuwUQ1YEeq2P23/KBvNAUrVM5eT2wB1nXHoJXet66p+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=PMEOFJlh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RMoNftkH; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id 6C23F1C000F5;
	Tue,  7 May 2024 11:22:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 07 May 2024 11:22:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1715095329; x=1715181729; bh=14
	+liFH4kciElRMWnOwwZ4A459b5UafqmtkBFRH0DeA=; b=PMEOFJlhy58CLe7m45
	uvzbHtQOPgsagp3/E2k7K5pxGXG2hiAk+LFQwd4f+S0eWtZp3JR5TB+qpFZwD5a6
	iQzG2Vd4EmqEPx9aJL6CIAuV3nycE83t6Z4UJyHRdLbqzE7ya/8rOVOBkd4JYtXl
	sTe3aPAA/ZWbvmHcxlT3Zhx39AvT0uwrVoz1avCunfCbV9lyECeiil64S3flegsU
	R/Wdum510sv9ABqx3oC6LEYBNP8b0bVXx5E3D6LUmouBJODAz0YqukY3avwTlu7k
	bF+eBXaRW1XyBXOGFSKF+KkUXHgkuAHXQxCbZanRfKFm3DbjmesvTExDcU25eeg6
	DIvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1715095329; x=1715181729; bh=14+liFH4kciEl
	RMWnOwwZ4A459b5UafqmtkBFRH0DeA=; b=RMoNftkHttz9Lzd6vySppEHH8UlHx
	7TYnzQYJjDfLwmLh6Ph3sd1My8PDisWn3bUC5pNPwCXk+FCDDaMTfWsZebFq2IJU
	lQOJN0zGvO/36ut9nFmyrNk/ddSqtRe346uaqVEWe+NCXJA/D8uAt4uBSTct1PE2
	EKTpRUbWVk3s9W0/oWpvyHfk2ch1igmFwCqT8qBuj2PmLirKedpv8vfs5YAex3wj
	k1+eutmzZoi5OPqNtWjSgljmeIKxyJ5ZkHD4RY6LlXgS7zwk9Zd6sK1xMs+RJTdk
	oOEffUwWBvatQKDYGwvlz8zpCNoEAggDQwb92zp/ndk18q2uuiwOgYWxg==
X-ME-Sender: <xms:IEc6Zg3y2v1LOmX6djNHXIzHeNDit-ntFRjoj4oAK0HwFy2JofoG9Q>
    <xme:IEc6ZrHZon27gin_RxE7ojOqmYgNexDSuYY8HgzkBTsyqSDLTiMX0J6qt0dlBU3oI
    7qwZEkuXedvYTOrX-w>
X-ME-Received: <xmr:IEc6Zo4OePKk6Wu5ILOwtexhfL_QoioTQQT6r-4UvZm6rVEAnnDCEdo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepudffffffhfeuheevhffgleevkeeugeetfeegieeijeehfeekheek
    veduveeigeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:IEc6Zp0y_e3h2qGv80vMyRj9c3Mlk497BM-ZseXBAQoIFcxWvSIykg>
    <xmx:IEc6ZjFfR9sUEw5d4ONZoZ9QhWNLKD51nHL3AE4W2HVGiXZQwdRFpQ>
    <xmx:IEc6Zi8q_DxIRQgva5AB6RCHqC4S768E1NfvDhN7sd_NreLXbCL0jw>
    <xmx:IEc6ZonBNZ0zrAenVo3cFxdq6AQMdfjXEiKHeheG1sXm9nVAWxUtjg>
    <xmx:IUc6ZkOxharfZlyFyxC4rcQdzjxH_nBD-PHvMB8JKLOBpBQiZHY8tdwT>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 11:22:07 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/3] MIPS: Loongson64: Implement PM suspend for LEFI
 firmware
Date: Tue, 07 May 2024 16:21:58 +0100
Message-Id: <20240507-loongson64-suspend-v1-0-534d92a4e09a@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZHOmYC/x3MQQqAIBBA0avErBPUMqGrRIvIqQZiDIciEO+et
 HyL/zMIJkKBscmQ8CGhyBWmbWA9Ft5RUagGq22vnfbqjJF3iTz0Sm65kIPyrnPOmjVog1DDK+F
 G7z+d5lI+pyiAuWQAAAA=
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=862;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=c6AQWS2glne4iFtBEIBOtzxq/07owekE2Qt4WciCius=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjQrd0UjF0/mvk0s3hsuvz+v4dR++O9KZWmBvyZPzq7dn
 fc9wuNkRykLgxgHg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAEzk435GhkXyZpm/b1VN5e6S
 v7r6z2GO1cz7O87uXv3l9j0xu/SXYTmMDC3zOHSvtIj8O/+I760drxn7oxVOZ1ICsiQ81tnK7Ti
 +lA8A
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Hi all,

This series implemented PM suspend for LEFI firmware.
We missed this for long in upstream kernel...

Please review
Thanks

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Jiaxun Yang (3):
      MIPS: asm/pm.h: Use platform agnostic macros
      MIPS: select CPU_PM with SUSPEND
      MIPS: Loongson64: Implement PM suspend for LEFI firmware

 arch/mips/Kconfig              |  2 +-
 arch/mips/include/asm/pm.h     | 22 +++++------
 arch/mips/loongson64/Makefile  |  2 +-
 arch/mips/loongson64/pm.c      | 88 +++++++++---------------------------------
 arch/mips/loongson64/sleeper.S | 17 ++++++++
 5 files changed, 48 insertions(+), 83 deletions(-)
---
base-commit: 93a39e4766083050ca0ecd6a3548093a3b9eb60c
change-id: 20240507-loongson64-suspend-7535521cd01e

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


