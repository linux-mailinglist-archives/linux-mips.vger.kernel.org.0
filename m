Return-Path: <linux-mips+bounces-4169-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD949929108
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 07:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65D5F1F2313C
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 05:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C68117BA4;
	Sat,  6 Jul 2024 05:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="c2CZSvDX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kxt580Xg"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC9D134B1;
	Sat,  6 Jul 2024 05:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720242495; cv=none; b=CFVerclHWSkcjFFnS4kVTEfbU2VCsS5MzaJ6+knQxKt7oVH8Sc3asBO3NTkT5JpCzhG8WXpyi/iHUEK/sZ9PTTchCDbA4fyszWcUheUsUvDfanTiL3dwIaL6koijAXmqj+EaIK2br45dNF9TWVLc7jNzrZZ4y3GyYwrfkSN2UUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720242495; c=relaxed/simple;
	bh=RHprBMyFIlB5kWKFPNMAh7qgLWpRswrguFEUppwq0Ys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kC+60GqmJw55kzUpcwI3Tu08iu654nRvOYmErxbEri8+scauEI0CLDmwu8COzNPelpY98VEbk0eJlcYzE4r3W5umgZs0Sh7oVPDhA44ljRHEbRS4TQGXyeBvicT+EkIfpmRLy1c5zCfdNKrjcQi8DzC84xZH8OviXhD8aNXFniY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=c2CZSvDX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kxt580Xg; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 4905413805DA;
	Sat,  6 Jul 2024 01:08:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 06 Jul 2024 01:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720242493;
	 x=1720328893; bh=M7qJdEe0lxetPk1MkGdiCrY4NRjF5bBATjUgbjmvH3o=; b=
	c2CZSvDXYB6edtsJT2l35WXKJMV4wjAFZx6Md9gXGEiJuK3STUL0y0dLjhagAVcR
	ZWkjIgCOMOhtiwo8l77QR6WXCZlmMHEw3s/YG66fsLePDzCuLXKNHggB+NNRmYVY
	PyXQB6OdxigB091Z7p+5UH76QqVionLsK9/nSXQR5z4dEU4jWzeqUDBbbHGOXj+s
	brBwN0fioJ7rgcCEdQ/qdFWofM9J9I6voBVZEz3GNiVbQBnqVjEzj60cTH8TY7Xb
	tgbuW9SlmcokgLZnJ3WZefHjsio9ZVIyrWzU9ShvPSJxe+M9nOX3V8WA2f0NxJt/
	8ZHgd5vGxWFJU5+2nFaWkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720242493; x=
	1720328893; bh=M7qJdEe0lxetPk1MkGdiCrY4NRjF5bBATjUgbjmvH3o=; b=k
	xt580Xg7JBMzroCd1J1e4B2z60rlXFrEIS4+5Rr3E6+wS/ASFnR/X5DEOJrfh0OK
	yQa9looGI80nmv2y4EvuXYcunJ2rSL934VbzVbKgJl2H6O9qvnmTXh70M34/Piu2
	Up1w/N9IM8cIVUoG75zH3ZvAk28k1eqq51ZbtPYMTYk1KHzVxst+R9o8b+wK1p6X
	SL/HQClI9j/dh82QM072vsP5w1IIcUPSxGCLy520Vdh2ip8FpCyOhy0sgxaAqAw0
	ERDZMXXfsDmfsiSvPWcZ65aiT1SS8XGyaVdT+B5Zh13j0sJikCHwXertBG7rL7gT
	S6/yx/vTPGCDRUTUgJkUg==
X-ME-Sender: <xms:PdGIZpQS0Zc1b6i-bikyBt_lgCvgmJacZCmAqRd-pjZWX3c1aN1Y5Q>
    <xme:PdGIZiz9Gzt0lixOZUEUa0s5c5WBldRqvUsQEchLk9cvRvnqpXPLMA2pA9hlil93h
    xI2gSF4XVqygCbMPxo>
X-ME-Received: <xmr:PdGIZu2rUNRkBxubQgBrqz_et0eTuFOvLfMhGItABCz09R-86Kc__45xLdMlxvZ6OzI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:PdGIZhCOLyr6jc34vptQ4Q1W-S72tFRfZBL8F0JB36DRB5S6bkzp6g>
    <xmx:PdGIZiih5cKeiZTFMHrI78NTXULhm_v6v7-0CTXAqO_C_ECzmWNWrg>
    <xmx:PdGIZloqVgz6USeU3orjt4yT0OndNlT27tj2wH7jX2nNex6LREaeLQ>
    <xmx:PdGIZth1UjR8VTKTztwglciGaqHf6M9WNEhx0CQ93YtmtrQ_4ZLUoQ>
    <xmx:PdGIZqfn-3qz99S_Qat4Kk_o-yNp53orMD39XM-Pw9Ht5zyxJbQnQEcd>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Jul 2024 01:08:11 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 06 Jul 2024 13:07:58 +0800
Subject: [PATCH 1/4] MIPS: config: Enable MSA and virtualization for
 MIPS64R6
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240706-config-refresh-v1-1-5dba0064cf08@flygoat.com>
References: <20240706-config-refresh-v1-0-5dba0064cf08@flygoat.com>
In-Reply-To: <20240706-config-refresh-v1-0-5dba0064cf08@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=645;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=RHprBMyFIlB5kWKFPNMAh7qgLWpRswrguFEUppwq0Ys=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSOixbrtXjE7E19S/fMfZ93sZDx+dtzs6Veah2f8iO3N
 +qf8e20jlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZjI7j5GhqPmou3LdgpG8q5m
 9vh52VHU3pf/WrTK4X2ul87o7NRrO8jIMGtiT5Xq1f9tXjKrA5nMMyRTXHkaKxWkRcT8arcnX/z
 AAwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

All MIPS64R6 cores so far supports MSA and vz, so it makes sense
to enable them in 64R6 default config.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/configs/generic/64r6.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/generic/64r6.config b/arch/mips/configs/generic/64r6.config
index 5dd8e8503e34..2a2036abdd2d 100644
--- a/arch/mips/configs/generic/64r6.config
+++ b/arch/mips/configs/generic/64r6.config
@@ -3,4 +3,6 @@ CONFIG_64BIT=y
 CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
 
+CONIFG_CPU_HAS_MSA=y
 CONFIG_CRYPTO_CRC32_MIPS=y
+CONFIG_VIRTUALIZATION=y

-- 
2.45.2


