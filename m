Return-Path: <linux-mips+bounces-3690-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEBD909DB1
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 15:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37E85B21145
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 13:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DB2188CC4;
	Sun, 16 Jun 2024 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="WAJ/yBz0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WP5fnlbs"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0FB224D7;
	Sun, 16 Jun 2024 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718544340; cv=none; b=BWqW8kUU8REB7y4ErfTLiucdNeu6YwFyVxjHjEdeh2ZiHY+n853EXL+bJSJZMPkMev63BjiX2JUJfQwEKpD5z1eb65vZGGlQ/tvu8Ue/IpUj5TfTg/zUuYRKWDHPd5mgNlbtmDZahrUMS6P0EslJzj045sssrz5R7U1UnzEZ3j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718544340; c=relaxed/simple;
	bh=jcvab4qNyZPRJXJUR0OD8iHkVWlo6fHs9gsEoSshqI4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=joX2/rRFHaZnjblRIf9awaClwQvezDk3/sfOYwWcuy53WFljmdZXVk1Y6eFuUur1bjyRxpp9kJqkEeNE/R9/uF+l48w7Z+ikqdTdM/sZOgDbdz57Ectbk0Ke42fkZi38LPzsMV64qb1KTvX3temEjs4O2nJPFaPAQUW5ehN81+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=WAJ/yBz0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WP5fnlbs; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id D154C1800089;
	Sun, 16 Jun 2024 09:25:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 16 Jun 2024 09:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1718544337; x=1718630737; bh=wz
	CJ9EN4r8KoXbh13Yn/ghh/ZjBSoqs08fLV+ve6cHo=; b=WAJ/yBz0jXp6NFyOku
	Wd5JpXEOV7oyOUJ2zMu+suBu8D33YPeXTxopmJwh9JGdlLcw/7UyAb5GaODWWMTm
	hQE2fUNP9/FZhxrxeHTPQdUVidbHNmyeTKnMB8yOpubmkpf5MY7FRdGy9M8Pa7CV
	xFg1EWaLQRwbuUeSNGm9N5myaFYxKzZrMDMZn7t+QwFsbR/H13sl/cvcYrF05llY
	DHXS+kCflzzhz/2Hiet1+SpnzlRZTW5agnZxKJCO0zzpIvfGIg4zel8CMGkCCQoQ
	ZISw/Rrmw9kPYy3Iip7Mt0YW6EEYZKxUuNCFYysgU/3uPSqAiPRjVybcTCniTj1q
	jwCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1718544337; x=1718630737; bh=wzCJ9EN4r8KoX
	bh13Yn/ghh/ZjBSoqs08fLV+ve6cHo=; b=WP5fnlbs/1TSuaunOI9GI1+iWEf7v
	0GR2z6n7q6cIAmFSXkCHBZuL59sfAxN2F5U8PzQD2mzo2bCbUbiSzYH39ISFSeUq
	tIktwco1+JLQbzMSA4isqlCqtdplyFNSEJYXp68sgP669bzl0JJz6XpecbebkfMM
	haa2YyQ4oRvWaXCFFqzqT6AdsCOoEKEEaIG8ldk06mmHIccTPrBTzfYc8G3D2ivL
	oojcGSfTIQK86Pc51ZRFwCY+0LLYyWPrYsdv0uUD/vQA6r7PhRslj2lCMbv7jrA8
	OWb/swRHjSu4TOzpcw1cpMJ+UW6Snvu5bn2prem3ZwjR7OBHoHgmoomRg==
X-ME-Sender: <xms:0eduZm0tRAMChbmbYt6ZlZ4oojaGS9J9Q5ayfbXDpyZB7R2GZDFiOA>
    <xme:0eduZpFhSVMPufUbCnkJXO-5nvqcpfVIg8ljXbgoNwjwFTtTRIHqaj5FpVN97F-uT
    -sl3gQebYHXxddfSYc>
X-ME-Received: <xmr:0eduZu4o8wpUzMMkzmi22XOE7JRlpZpOGbTTOch2jU2EUY-F0d7VGSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepudffffffhfeuheevhffgleevkeeugeetfeegieeijeehfeekheek
    veduveeigeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:0eduZn2tmYQ_Mm9e80d4y5N35MheSXxGzKnKvD3qBJO0b2iKdzZRCw>
    <xmx:0eduZpHwzBjAzpqpGsVFs2wlgsmG44yk1dkFOIFbPncrHqHG9I4eVw>
    <xmx:0eduZg9Q97P3dZ0Sg-X0BKCBA1UuLlCquw9e-aFAZlJR9Q5x2fyOGQ>
    <xmx:0eduZukhrBQMy5UVJdKZ8KHPCUo0hVCWCZCLIIVMUBbxqLNPOFQlaA>
    <xmx:0eduZiM2T4MgJPwbojbU7Vm_Egy8lEq6ZSTKrcu0GA7xwjZTkm0dPz7j>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 09:25:36 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH fixes 0/4] MIPS: MT ASE fixes
Date: Sun, 16 Jun 2024 14:25:01 +0100
Message-Id: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK7nbmYC/yWLQQqAIBAAvxJ7bkElhfpKdKjcag+ZuBGB9Pekb
 jMMk0EoMQl0VYZEFwsfoYiuK5i3MayE7IuDUaZRTjvcOQruJy58k6BVNFnnjbbtDOWJib5Qlh5
 +Gp7nBaf6BYFmAAAA
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=jcvab4qNyZPRJXJUR0OD8iHkVWlo6fHs9gsEoSshqI4=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS85xc1umoEz2Yaq29JmrNKYv5/r9NWHJxxZwxcBayTX
 z0JbiroKGVhEONikBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgImE9jL8MzOdluV6/CbbnIlq
 aRkfS64tsL0y+UTz/qqJpWGnPhoZxzH84f6WqeOuxHd3soeLfxT/zbqz12dO2x50qjlJee30/29
 T2AE=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Hi all,

This series fixed multiple problems for MT ASE handling in current
kernel code.

PATCH 1 is critical, although it's not causing problems on MT kernel,
we are risking clobbering register here.

Rest are usual build fixes for adopting toolcahins.

Please apply it to fixes tree.

Thanks.
- Jiaxun

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Jiaxun Yang (4):
      MIPS: mipsmtregs: Fix target register for MFTC0
      MIPS: asmmacro: Fix MT ASE macros
      MIPS: cps-vec: Replace MT instructions with macros
      MIPS: Use toolchain MT ASE support whenever possible

 arch/mips/Makefile                 |   2 +
 arch/mips/include/asm/asmmacro.h   | 241 +++++++++++++++++++++++++++++++++----
 arch/mips/include/asm/mipsmtregs.h |  42 ++++++-
 arch/mips/kernel/cps-vec.S         |  62 ++++------
 4 files changed, 287 insertions(+), 60 deletions(-)
---
base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
change-id: 20240616-mips-mt-fixes-50eb56d2159c

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


