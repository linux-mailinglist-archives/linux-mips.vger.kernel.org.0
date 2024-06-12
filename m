Return-Path: <linux-mips+bounces-3608-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0A0905017
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 12:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAA021F21912
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0F016EC09;
	Wed, 12 Jun 2024 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="R6VtR+h4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o5o2ybuz"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5783C16EBE7;
	Wed, 12 Jun 2024 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186939; cv=none; b=MdPWTZhqh6Wxjg4oKhPXOjtdzKJLk0UMLsydOYshEd8hUUNK40tZpu8BROC5Lk446z2Yrn/Dg1Ug+HLOb1mh3j+JS6HeOABZZKAtrEImafQEZ2ElMowPiem0yg7Y1mZn2lf5wd5XbS1iBJtsF5QTwTVN1xbTQBHEDecxYnATuQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186939; c=relaxed/simple;
	bh=voKuxxI6H6hzGI213nmIUem7TQCBrF9kKfmcvE7bN6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c+3NoIF/VkhW82UyI5nKVswYjzkiF9kZ7eSSpZOywIFDwBxl3MlgvCU7zFQFdh++RN00hAwo6+4WiBByd+EKJbXwjTE6i7rmBfhWs/SHNXoa9Yftrv+7xphq/ajU9bgbKVJWOTt17VFpQg57R+fDT4/VJ4qjwSOX/EhqHpLl11E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=R6VtR+h4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=o5o2ybuz; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 694EE13801B0;
	Wed, 12 Jun 2024 06:08:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 12 Jun 2024 06:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718186937;
	 x=1718273337; bh=CiqfuQg7+Awtvvk00+xR7dgerLeRnYRgj+KbFfygLoU=; b=
	R6VtR+h4IK4uSTH6dmzkOiEJ4+r4N5IN4L91RNVnqFiNnGa0sTehdRqCzXtUBg1C
	Tp61v+pUdmcekK86IicYBUWJCeWx71Vxj6mrx1glHFZ+7PzRrAELzMi9FamUHn5C
	uto6d9t5qxXjuuj3X+iyXluOREtJWQHwEIMMQrxu96O18Pp5UDrZzhh25tivaGe5
	3ciSEMMmc5Wup8QNzE2Z4PNf1ZS+N0YCn/UCsI/aSLm1M9Dakr+gGckSO3Lh2V5O
	3Mi2DOx+zrACqe70lSsnaiQYbFT6G6AqX3Anc+N9B7FsGpQQXVJjESbFXYqMifFk
	1vGmR6wG9S3fBWzoITufSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718186937; x=
	1718273337; bh=CiqfuQg7+Awtvvk00+xR7dgerLeRnYRgj+KbFfygLoU=; b=o
	5o2ybuzyxz3aXU96eyAF5pu7p4BNbpSCofoU3xPo9/Vh4nqiIWxo2eKnUKgftV5V
	3mKSU12mLrPDJapcbZoQjX/Jmcc+4bPiBj0uAcgURopPMeRymDS2y9Y2DpGJmHz4
	FBBOttZzvCybtCBgwTys7iOL1djZ0cMLwcryFLUI2I+aG1JgwLw35g4jyhZzlTF8
	HokKta1kjA4/OzmJCphyxeZ9zajW3h7Bthi8Ct6ciUL/cjfHljTDptkuLgu61Uq2
	VifpyDHbrJr3tnpkd1RL12PgjKAK1CSvC7NIDmbvwrp5fyXG+hI0j0I9+RDrXm/x
	g/tbxEFHxdgMViPSgjLPQ==
X-ME-Sender: <xms:uXNpZqtRezFhQMY1VCjdh8gFe_7ohmfrcsqllsyYjD4e2gH51xPpuA>
    <xme:uXNpZveDe7h2fkAv0eRE3AgBmmhHtmfpUdXRqaCC5v9XlEofzemis69aOR5egehKB
    6V2EI580Qyh-mcaR58>
X-ME-Received: <xmr:uXNpZlxyO1atP2NpXltCVxNNkbJdwgYJFyWOIsmaQt21yhiIGVO-Hck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:uXNpZlPFwZleW0l-XH5uy8BRw-qRSO7lsWduh57fRnGCBXIJisQNeQ>
    <xmx:uXNpZq9aka2ilHysqWE_U3YXyv1Q_fNh_Our0kSSSwwm6Vp5PFyvhQ>
    <xmx:uXNpZtVyl1pewuzgb4vLfi9_C2Nn4to4b9TaVhrhD4nlZQL6ZXGZjA>
    <xmx:uXNpZjfUoKjOZgSvL307iiS93_kBxM1YfyaiPhYeXWq7trmIn-ufgQ>
    <xmx:uXNpZr32T3yGIJ6onEevaqy_n0jq51TRLmlkv7E7Xhkvwc5P6G4x3o7Q>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 06:08:55 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 11:08:53 +0100
Subject: [PATCH v2 1/6] MIPS: generic: Do __dt_setup_arch in prom_init
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-cm_probe-v2-1-a5b55440563c@flygoat.com>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
In-Reply-To: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
To: Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=voKuxxI6H6hzGI213nmIUem7TQCBrF9kKfmcvE7bN6c=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTM4m0+yvdaIwOf3Ji78p6TyZHbh+T/iT/lOzdPJMtE2
 3N9oeTTjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZiI8hpGhk7dTzzMO0sioiRN
 X2slswlcLzolFBB6eoF++3SrboZKBYb/0cw7U1ROXruRM0/lrMC8w5XsfPI/L36Z477s9UWOK3+
 reAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

We want fdt parse functions to be available as early as possible,
thus do __dt_setup_arch immediately after we get fdt address in
prom_init.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/generic/init.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index 1d712eac1617..9fd09061de78 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -26,8 +26,12 @@ static __initconst const void *mach_match_data;
 
 void __init prom_init(void)
 {
+	fw_init_cmdline();
 	plat_get_fdt();
 	BUG_ON(!fdt);
+	if (mach && mach->fixup_fdt)
+		fdt = mach->fixup_fdt(fdt, mach_match_data);
+	__dt_setup_arch((void *)fdt);
 }
 
 void __init *plat_get_fdt(void)
@@ -101,11 +105,6 @@ void __init plat_fdt_relocated(void *new_location)
 
 void __init plat_mem_setup(void)
 {
-	if (mach && mach->fixup_fdt)
-		fdt = mach->fixup_fdt(fdt, mach_match_data);
-
-	fw_init_cmdline();
-	__dt_setup_arch((void *)fdt);
 }
 
 void __init device_tree_init(void)

-- 
2.43.0


