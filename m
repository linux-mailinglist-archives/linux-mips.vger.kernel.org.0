Return-Path: <linux-mips+bounces-3118-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9AE8BDDA2
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 11:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B1B01C22F53
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 09:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863D414D6E9;
	Tue,  7 May 2024 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="dr1fBcRJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PQiDWfwC"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498D914D2BB;
	Tue,  7 May 2024 09:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715072516; cv=none; b=AqgsfpgA02dr7rcOpRddm6n5WLc+mjUqlb5p0aTiULVYqoTokLQCjPGJstKl42mTyY7TN/utiWTCIGG93tlLcqqhxWpSai2OmFKQmXITDVsxaZzDroosu+F8AHB1iRtePBsXyE3rJYaiXC3z9MwxI4X4CgQnJhrrbeDgdY7+K5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715072516; c=relaxed/simple;
	bh=EgYZHI74g5P3QvmuzwztTxZvJrgG/TaQMR9K1Fjgx+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2BLxSbYWYUeJJCp6ucJqfkfJOZrWS1fJY5Bh2IO3bXGsdMXq3DtvOunR11nH2EKvW8vqhBvXHsxKUOUNThgrfbQmJ35atQC8vcr4WTOZw2LBejROqoFLgOS9ijEAkHmnJACiUAc7VzRpmNUPvc/jg9yGO+azsNxDwdKM3KM+jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=dr1fBcRJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PQiDWfwC; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 357B91140190;
	Tue,  7 May 2024 05:01:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 07 May 2024 05:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715072513;
	 x=1715158913; bh=qTeUuc0bHz0cA/z8apt4p7R4A60h6gxbSGcpsvYvivM=; b=
	dr1fBcRJmVKVJgGRWDDXj14tGSz1V5uZCG02zFW2yjEXOSCE40KKkk+dID/RRFo/
	Fbzmey/U61Zj7pEqRK2dCdkifEA44uQ7nz/tB9O/0IrqMvL6W8Q124A9M1Sm9AXB
	EwSGRO4Hf2SURzAHzVZmpbToIfKklwKcpQFHHlhRn0r+m/OQOLnYEre60kn78CsB
	eUalnQbtgJoKFGopCsdk8B/Z5MZrJLHmOwYHwsMjhGRb15/wp+1fOG4N6LIu3EOP
	HymOVu7ffV/UMO3AVPJPtj1Kkl3r+yIF9ESZ/7D7+F42LfMam7cBA7sQvSiLOXcv
	E/mkCV6atlflT0QmvyWHNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715072513; x=
	1715158913; bh=qTeUuc0bHz0cA/z8apt4p7R4A60h6gxbSGcpsvYvivM=; b=P
	QiDWfwC0ZkNkNox3HRQZL2KZimb4hQll5S/gBo6ZYL1MPT3V1aRb3aN7zVNOAeJ5
	z7Crc1yr4tw9H9RAwLq+eBl5+dC0O6YVuiGiuJ/YA+Pra9P69yRoXudh2t/pWqnp
	e+PHBwWVpN4wXpt5BxiY4AtcZrdII+BgqcpuHzb0TAVplIL1XnSYzJpbqfHp5BE9
	DS0cmdeJ2JBIv0uLJR6vqC2XPU1C0fgGy5ZT6TLM+mVfUEuwD2JOy999OPcr/f2N
	TJ9KpLWZQUuxmolkXfxdIejI0jJ+s6T1+jEbtmUVo/vjW5VAXhjMYKXhXcnlveNN
	McZhKOmeC14SJ6DVbAhng==
X-ME-Sender: <xms:Ae45Zozv8vf-vuE7FDtt3d34HdCG2Z_bCK6IsdzBMrWPqJWVEhewNA>
    <xme:Ae45ZsTirVqYGbjWKZGIpUexgvB9d0MGWJOtFyVtgm5967K0wolPHKMJp6IL-kcTA
    qhGSe2exTyri4mUu20>
X-ME-Received: <xmr:Ae45ZqX91dGciaZSBLnSHywBUQ_qYiw2WwJYsFUXO25mczyGahX3sg0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Ae45Zmip_site5fQE5KQnzYv7WfuWPjftUnmI9conxBHusdkqF2Dwg>
    <xmx:Ae45ZqBVxfj-_M6CZxnaRx0te2gSI1Ryng2orcv5juCbAH7KnKSTpg>
    <xmx:Ae45ZnLRWWer4HoxrUsj0PSEAk8Sf2mUKtK5tN4yApwE6mrwDQv_jg>
    <xmx:Ae45ZhArIBe7Uw70diQh2AJBy0g9POwPFjuLa6BciVVzgzmDWCEQ9A>
    <xmx:Ae45Ziv0MOaESQEsFZPEAA_zIbPwEo2EndmXVEugckTSK0iYtTtT2nNI>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 05:01:51 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 07 May 2024 10:01:49 +0100
Subject: [PATCH 1/5] MIPS: generic: Do __dt_setup_arch in prom_init
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cm_probe-v1-1-11dbfd598f3c@flygoat.com>
References: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
In-Reply-To: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
To: Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=EgYZHI74g5P3QvmuzwztTxZvJrgG/TaQMR9K1Fjgx+s=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjTLt/8rOvT2nfHeNE1kY9HMFzPTuXaqOl8Okzi0f9lt8
 /OrOXZt6ChlYRDjYJAVU2QJEVDq29B4ccH1B1l/YOawMoEMYeDiFICJdMgyMhz9z+OxxMry9tuK
 uGhtV+ZXG3f/DIydFlB4tMckzl75xiOG/zWZnAH/pXeWGj1Z7Tqxz+bKuuQfhaJJ+bc7ha9o7JD
 8zQMA
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
2.34.1


