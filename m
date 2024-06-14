Return-Path: <linux-mips+bounces-3687-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 588CA908F25
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 17:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17FDB1C21433
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 15:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB2E1A01D0;
	Fri, 14 Jun 2024 15:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="0pwF5kFt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R6WGp9l2"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6251A01C2;
	Fri, 14 Jun 2024 15:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379655; cv=none; b=P0onZQb9ROBI8K7tmEw7k600hOlxK7XjyVCJz5IpZ2AcZFcy5cHcUnUdu+UZTDbVgipBRa0vhlys1ljGEgHg4tYIJHUUL57YpGSCiE55bJtHmsZChJirRCu3CkF8S5n19szju2fbMgxFALiq0FjPZVLNIyazJI14lshII5RZ1jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379655; c=relaxed/simple;
	bh=hUa02KIiNk89eWrUuZ0Hh+Lrvto8WgmmJoSQ1bJNX3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rf5hlyvrINcRUUwj4wkvZhD/dBag7DeySON8HX6mgknrTmGHy7wjjuCTtXmQvhi/ITj/31rwYm2StPUGyXCcB4l4TLajH8vqPd5R1Y3BuyOxweEMir9d42aTKAl48YdJra/7YisxlMCf6qQAWV7heTjxGirquFjfXO8IX92bGto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=0pwF5kFt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=R6WGp9l2; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id EF6101C0012E;
	Fri, 14 Jun 2024 11:40:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 14 Jun 2024 11:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718379651;
	 x=1718466051; bh=2/sTMv8UZFkz8aSewy9niIM+ZkU3d6RLLFbL22B1e4k=; b=
	0pwF5kFt2yXbFMkW2nPnpP8pWE4gHNsk0QqDCCCRkbFfyOMOSY5VpH605YZ071B9
	oMtcg2oMeuOkccnu+yCE17yaB+SamgbozPnA08MWJbInN7d4F5tDlVhcZqj/KBEp
	mGT70OeiN1cep8rxDgLhWe4RUSUcA2+cStyLwv2s/ZMeHUBoXUxJSWQ/SBxKEd8f
	dwsiJyuRnjoIvVX2mfFgdh+RlX4hjxzrRYuhCavXOhtoCzgZZKioFOV1Tsd4VTOg
	CRLMoJNi97aaYsb0pmVQVDO2KnZsRGtsHzlRDBM2irAuo8cWdYA0GAI7O95VaaNy
	wJp6FqemuGTTvHiFuttTuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718379651; x=
	1718466051; bh=2/sTMv8UZFkz8aSewy9niIM+ZkU3d6RLLFbL22B1e4k=; b=R
	6WGp9l2+ZV9xUOEluTLVVkZmFlZNYxaS/L3oyEhMiT9o7o3frjTHM2gxTx7jyqL+
	4g94xrukQV1u0XHxRcmNIjrkMBKHMS2AqOYaQATpj0GhBSsSFSjQdnvJEPEDAf6n
	eV8RrsQ7rHQ5bkRt3+XmcS401PKIfzYCMJsEtUInpNTTzWfhuOn3EK43scHBCDac
	zORUoBPHn53+67bTl/s+OwZm+OCmJU6ZSyxtJaWtazL6OQ1gwLzWzUEF7RluEXHp
	OLVIOaUS9XCzVHaQvPdJgMSt9OurGHcG0/8bnLGQuy09xCq6eB9W6WUxk0tVjCEz
	BmthRA2zuT9GVP7JaTVIw==
X-ME-Sender: <xms:g2RsZmkOPd9zOEBlVvQ94Rz4mFZDopNeX5_0IqEApANREC3Glezt5w>
    <xme:g2RsZt2Us4YHIrEO53Kg4h29ePv60dfvfROqODYlHOETWp5gaW_BF8HpeVktBdfpT
    5HGk1YryXf5DpW9vYs>
X-ME-Received: <xmr:g2RsZkpIUYvV_oh2w_VcNIE_Qi6SLInbnWtKIxgPVqHZk7mNa8AzClA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:g2RsZqmvqW1QNxxdxwz9qeypZpdKKmpJ9SNgYlFmvlGQjPfM641a_A>
    <xmx:g2RsZk1lId8-7pNU9BIJUHnJ0ckQBx1urvzzzsH3CXYfZgfKr1pmGw>
    <xmx:g2RsZhvsHayzxab2YOq_lJKrg9hYP9pjITBTVMvGGoIWgaDM_9U5bg>
    <xmx:g2RsZgVbX7DlT61GbZZV-K_D-KT-ub-2MkmwqhbOK4RTzWvH2BGemw>
    <xmx:g2RsZqMm3EufcFOO2wi6kccSHuPG6Rld4R07YyGvwJAomORdDXzEKV4Q>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 11:40:49 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 14 Jun 2024 16:40:18 +0100
Subject: [PATCH 10/10] MIPS: Loongson64: env: Hook up Loongsson-2K
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-ls3k-mips-v1-10-7614340ace7d@flygoat.com>
References: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>
In-Reply-To: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Qing Zhang <zhangqing@loongson.cn>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=hUa02KIiNk89eWrUuZ0Hh+Lrvto8WgmmJoSQ1bJNX3s=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSclLiJoqx3OQ/Mqnp9xOhAT/PGtBcfpa4XnDB89/fSo
 cyKDPnIjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZjIMz1Gho7DoebHv74u6giZ
 zLs7o5773t6OJwHLdjRodJQt3Ob4y4WRYbeVHJ/d3zUP1ua8XHPiL2Pi5G/uEze4n3c4e6xzOlf
 ZB3YA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Somehow those enablement bits were left over when we were
adding initial Loongson-2K support.

Set up basic information and select proper builtin DTB for
Loongson-2K.

Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mach-loongson64/boot_param.h | 2 ++
 arch/mips/loongson64/env.c                         | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index e007edd6b60a..9218b3ae3383 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -42,12 +42,14 @@ enum loongson_cpu_type {
 	Legacy_1B = 0x5,
 	Legacy_2G = 0x6,
 	Legacy_2H = 0x7,
+	Legacy_2K = 0x8,
 	Loongson_1A = 0x100,
 	Loongson_1B = 0x101,
 	Loongson_2E = 0x200,
 	Loongson_2F = 0x201,
 	Loongson_2G = 0x202,
 	Loongson_2H = 0x203,
+	Loongson_2K = 0x204,
 	Loongson_3A = 0x300,
 	Loongson_3B = 0x301
 };
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index ef3750a6ffac..09ff05269861 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -88,6 +88,12 @@ void __init prom_lefi_init_env(void)
 	cpu_clock_freq = ecpu->cpu_clock_freq;
 	loongson_sysconf.cputype = ecpu->cputype;
 	switch (ecpu->cputype) {
+	case Legacy_2K:
+	case Loongson_2K:
+		smp_group[0] = 0x900000001fe11000;
+		loongson_sysconf.cores_per_node = 2;
+		loongson_sysconf.cores_per_package = 2;
+		break;
 	case Legacy_3A:
 	case Loongson_3A:
 		loongson_sysconf.cores_per_node = 4;
@@ -221,6 +227,8 @@ void __init prom_lefi_init_env(void)
 		default:
 			break;
 		}
+	} else if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R) {
+		loongson_fdt_blob = __dtb_loongson64_2core_2k1000_begin;
 	} else if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64G) {
 		if (loongson_sysconf.bridgetype == LS7A)
 			loongson_fdt_blob = __dtb_loongson64g_4core_ls7a_begin;

-- 
2.43.0


