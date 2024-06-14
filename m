Return-Path: <linux-mips+bounces-3684-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 169DE908F1C
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 17:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6207281AB4
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 15:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C5719DF7C;
	Fri, 14 Jun 2024 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Kb4kEvG3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QzS07UMa"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792DF16C878;
	Fri, 14 Jun 2024 15:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379644; cv=none; b=El77h8pZ2SxTwMWma6eV2mva5vOi4sUYHTbgZet139vFurFLc5uaWQgTH2DZMkqx4e15Hq5Qkj20suOcTWshN+Tuv0JlZxdQBZ5Oq916ycooGsM663XsGVqb5yeCSzHEO6ljm0VY8ETXp+fNOhPW/e/dOV+4k4iSip4rL+7sme0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379644; c=relaxed/simple;
	bh=T/l/PhBAZzTKaS6mE8YPGngsZJeCG/0PihztRUkYlkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kIk4FGH2D53dKNVCCCK+D597nzfy7kazWOxfDWxOGfpKMjG2JlG+Z3TWW8tJvqFosq/MtxwLKmBts65zcDHdPoeXYwd2FDwMKuhI5pJbVzIpROESkbiGr0T21ta3ort+PmdAXzL/RtFrxWY6ApMCKEo2JflZHrwUm9dUFfsyqv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Kb4kEvG3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QzS07UMa; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id B1DBC1800130;
	Fri, 14 Jun 2024 11:40:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 14 Jun 2024 11:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718379641;
	 x=1718466041; bh=zzZD4RryHF6UCwpX0CVsgzXHN5hz0PrmQFEM+kEC7W8=; b=
	Kb4kEvG3u/K2Oa8UQ5vwluPJITLbozdqTfS24twpB1+DvUkPXeBdnDU7h9UnStnr
	MnUygP7GIeCKMp7NysLJjU0OqiYTnBgr4exbZkyPtac4it4AmPcrgxBnT35GQpaq
	NegLhblgmAdkR9Dz+f+4t1Mp98fMSnzlvp6vrdh4uJcBTMwUFezdUJUuid4w0Mtt
	CIzdx5NYX8hpDNHnAlNU34XlI7vUyW+qLSlJsmC2vyDiAPjL6t66ASsAgYCSdyeq
	K5BJxIrCoeWASwrQbgaie739OGhhxbRoMlXqEh4QowB0vC9yyIQSdgoay93Q8lj+
	DkOFr48eEvoIc2hoUpUxDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718379641; x=
	1718466041; bh=zzZD4RryHF6UCwpX0CVsgzXHN5hz0PrmQFEM+kEC7W8=; b=Q
	zS07UMaKd/WAq1L5RkzXH+DB6b0IyBgs1CwcluiJ12ILxT5ksC/I3ajBRwKBuTk+
	g0syxHKkcDEo6/zZV52qp4O59yv2z/hYCufLjQMUiRw4+EwyKQkc9yO2xfr9W/U5
	I0h0fWykauW4V09+DaG07N1QhMwsKdRfSKidj/DXhS1iMLbEb4tpIqV3OV+VyYPJ
	eSRKLvbIPkZ6BrjUDmKQdp1rgSoPopMzPiLALczo9ZOIGaYVKNM8oxHrhC2/gb4j
	7qUqfzM5GNCtxhx9EIwE4vqvp5TjBlwIZ2iDYAfH6pXD+0q45Hq6RlT2Beq18Y9s
	USD+mHbM2Ksy0XcQoTbPw==
X-ME-Sender: <xms:eWRsZvLMink0cilF9BjmR3pUE0YnD9Q5AFn2ZjOn2iXffi9r7HVacg>
    <xme:eWRsZjLLSIcVteOAAl5hMq3j0Cvs7NBKH-SpEUqNMEA5mpke4ufgn9l4uW7DxHchq
    UGDjpLvCK3yn0rRkV8>
X-ME-Received: <xmr:eWRsZnvIBab47lYQ-SWYEDmffvUwvnEEdPutyC_NLz619R5fgHcP8eM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:eWRsZoZK3KIPmntGpHRW7yeDAOQRnivm2ADVZSj55joejqBBcD7Jgw>
    <xmx:eWRsZmbji2b2C2hQTkPbna3oxNoQFfWOkoszc5iOxXecWn_TRCxyGQ>
    <xmx:eWRsZsASzO6A69xjW7YoRUY0A7fz9jQyE_jerTK5_RPjJEiKK0xSlw>
    <xmx:eWRsZkYNWkHSdOZVgirV4yXj6XHUjQvB9mZEOZ6vls-YsaRQCIK1ew>
    <xmx:eWRsZiTrWzZdHJpxgsnJnsFm_ecys_RyrNy1dfyQhZIyYjKpliIapBtH>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 11:40:39 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 14 Jun 2024 16:40:15 +0100
Subject: [PATCH 07/10] platform: mips: cpu_hwmon: Disable driver on
 unsupported hardware
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-ls3k-mips-v1-7-7614340ace7d@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=783;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=T/l/PhBAZzTKaS6mE8YPGngsZJeCG/0PihztRUkYlkM=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSclDiZb++8J0V58W00s5jo9Kqx+f/Du06XCxS7//FON
 hX9P0myo5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACZyaCXDbxaeiF+3DnZ1+cx7
 LOrYuKL0/YajbQk3TM2kWBrlTSYe1GH4zVo/QfEE12POv0s7kwPfP6maGvNuutK9nAnSK86l7ng
 exwgA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

cpu_hwmon is unsupported on CPUs without loongson_chiptemp
register and csr.

Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/platform/mips/cpu_hwmon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/mips/cpu_hwmon.c b/drivers/platform/mips/cpu_hwmon.c
index d8c5f9195f85..2ac2f31090f9 100644
--- a/drivers/platform/mips/cpu_hwmon.c
+++ b/drivers/platform/mips/cpu_hwmon.c
@@ -139,6 +139,9 @@ static int __init loongson_hwmon_init(void)
 		csr_temp_enable = csr_readl(LOONGSON_CSR_FEATURES) &
 				  LOONGSON_CSRF_TEMP;
 
+	if (!csr_temp_enable && !loongson_chiptemp[0])
+		return -ENODEV;
+
 	nr_packages = loongson_sysconf.nr_cpus /
 		loongson_sysconf.cores_per_package;
 

-- 
2.43.0


