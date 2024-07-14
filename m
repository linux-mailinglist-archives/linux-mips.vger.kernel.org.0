Return-Path: <linux-mips+bounces-4311-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9385D93084C
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 04:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4484B21A0A
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 02:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB38BE4D;
	Sun, 14 Jul 2024 02:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="TajlTtWY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BPE/OYpI"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543D779D3;
	Sun, 14 Jul 2024 02:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720923675; cv=none; b=NUEd34GovJ1ZXFwoQstuCBVYyO9CTdY3R3iYaUlzzpkVJf/wZ8AYxykH1o1OdQE8fRzrl+ARvIwGSqau1F1GlSZxSnuBkvFB2VfiyixZHWOgfl1PBbeKb/Dsl5Vdv4B0TjZx/Qtb4E2j5SvH0pxwtHirk9WXaL6HanEsnfKd3vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720923675; c=relaxed/simple;
	bh=8Zz1gtQOM14FxkVL02pEqH05+satoREqDWGz74XJ3DQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t3UY8mYn+tYmnQR9ZN+f4hpc3p8r8dAzxGnXFJsEBl06u/z5enKnnfXJsiSTVwN2kFtiwCfW8pWufndG0ge14iOK+JkYMb3pBBMlF1VHr024JDIXutChe/pFOtdAn16JFbbrZswRHrdiFQnZGsuey4UEttRiv/M1dwDAesLmMS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=TajlTtWY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BPE/OYpI; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 650E313804C5;
	Sat, 13 Jul 2024 22:21:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 13 Jul 2024 22:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720923672;
	 x=1721010072; bh=MPVth0DwNASTAUSFrhdnn3CEQXBZhSKrHxGpLm802CA=; b=
	TajlTtWYAME0DWK2Lzg0rmcxXa8bjv3O9flpzUnD1PGo0rxfXNaqjMur1+22Fp0g
	xCBWoi/jWWKBsUL+yJR0U5OCDT4G+zQUGcvbfY5BQI4zc0Vb5XeRV2X32RG2wsNM
	H6A7arSzWITP52sBX28cKySsLIKqP4DdwVD1M+Ds6bYUj1tO6gWa7OlCZtErEgrv
	kFRJaB0CVCGZdDHitdTpXtZ2kg5Zh2mLxVw0kpwZd3/QpcMxNXeZmI1bjRb7QVpE
	+WsGtveKKPrehh+MWnT4aEW7LyhVCDaWybl9rtrSTqeN6i+zf6ouXRy6vEFfK7d0
	1GwtU6VHjEou7Rj4lnpQcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720923672; x=
	1721010072; bh=MPVth0DwNASTAUSFrhdnn3CEQXBZhSKrHxGpLm802CA=; b=B
	PE/OYpIeFmX7nrUh+kuFJpw8Vurm27PKLDCf8S64wUi7zrQL5uXAPCNhM6qAjnO3
	xn39hSE246JpkFgSno7595R1yukdlYvE6tyyNBS4NUGLa3AWQeTNZoFOs9BcwgDe
	p0y4Umt6jOecRM2y9CdvJBLZXlEgjOLx4rD/8Fy/1tEtd6TpECvNXncpfq5BkR1g
	GGhwY85A44i2HHZjm9U9RieqHHrN1sm5ba2yztiG3XxiK3R0YHAPtxqqOkrObnQs
	FTWemubaKIM/7C8pF+wrH/3jvSXVvZtkRAVxevuSNT4MwP0RjnXhYLOlsYBt0OQT
	frwozD5kQK8RMOEkzeJNg==
X-ME-Sender: <xms:FzaTZvZD3-uomkyL6kXVdhRbewbPBNs-nDKjh4J4kkd7mnVnvqcwEA>
    <xme:FzaTZuYP3UdCjWwfSNyhTBNRf2yy7G8TguVLvBUFEzpOnbXBYghxi10g_6GtE6Jpl
    Q7Vgs4hGnJxyNswPQA>
X-ME-Received: <xmr:FzaTZh_B0EgH3mt3oZqqj15aZW62IicR9G1WzfrZilbYIRXkvCedAg3WiLawPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeelgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:FzaTZlqA2702ADCXShyGIBOdaC0qfH6czvqjL1T9ZANMCXWtLbg07g>
    <xmx:FzaTZqpGAqfSTnxE86EpTdG-ypwgcj4CYtOSCMV3F-Q4cnBHrYlTTw>
    <xmx:FzaTZrRuEzkhzXai_BnHPmGLTFM9rEc6Nh8Iu904T1X__5cxdD_Gzw>
    <xmx:FzaTZipsSVsKLDfPlMWLrv3p6sDzKNR9vFTF2tbT8O09LcCqBCNNHA>
    <xmx:GDaTZjmWqGvxjg8LJhVxslUuPEps8SMqXbxjzVjEzXrEvT6FMhzVGPHr>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Jul 2024 22:21:09 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 14 Jul 2024 10:20:47 +0800
Subject: [PATCH v2 1/4] MIPS: config: Enable MSA and virtualization for
 MIPS64R6
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240714-config-refresh-v2-1-33f1649b2efc@flygoat.com>
References: <20240714-config-refresh-v2-0-33f1649b2efc@flygoat.com>
In-Reply-To: <20240714-config-refresh-v2-0-33f1649b2efc@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=645;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=8Zz1gtQOM14FxkVL02pEqH05+satoREqDWGz74XJ3DQ=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTJZgJCbLctTn52umF2aHVQt9dbPyszxf8VmZqL/KVl9
 rtsM/rdUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABNJfsPwT6fn/f0LxgyBgkzR
 k0/MsRWKn7hGpf9T2NKclwdiFzMs9mVkuPrz0naPWwJdQdcbbWt+t/asXzpD1lHHl2/S102b3h6
 o5QcA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

All MIPS64R6 cores so far supports MSA and vz, so it makes sense
to enable them in 64R6 default config.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/configs/generic/64r6.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/generic/64r6.config b/arch/mips/configs/generic/64r6.config
index 5dd8e8503e34..63b4e95f303d 100644
--- a/arch/mips/configs/generic/64r6.config
+++ b/arch/mips/configs/generic/64r6.config
@@ -3,4 +3,6 @@ CONFIG_64BIT=y
 CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
 
+CONFIG_CPU_HAS_MSA=y
 CONFIG_CRYPTO_CRC32_MIPS=y
+CONFIG_VIRTUALIZATION=y

-- 
2.45.2


