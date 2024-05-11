Return-Path: <linux-mips+bounces-3239-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E9B8C3248
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 18:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 865761C20AAE
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 16:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA3256B9D;
	Sat, 11 May 2024 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="L/DS++my";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ar/3AnV+"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B2A56772;
	Sat, 11 May 2024 16:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715443216; cv=none; b=kUCU7D+mCPojx6m4LmjTOaWaHJ/EfqwAYq5Fwn39GjKknrJN5mGoHxQIaEltZUV79vHBB1tJ0sgcGNu3TVdJ36mEAf+PJmcyw1iXoH4hihacEKmdTjapqSgznLlIcaahkej70X0ELZ1gSVRPA3wxpSkOekkadiWA3u5wuX4Aim8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715443216; c=relaxed/simple;
	bh=TqxmhY10q+PpRT341sEWQQASzTDPa2i1/hqY6sm00Zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TCfzIM55YFIdRO6zpmqfLLA0ThTNvSUtZ3j5sHV+YsSDTd9ytOYWBsfi1/QFVNDP3JnzrepiCK0hnDplGMwuBDP55UzCDrHOHL3QP+mHxUado1NohJWCT3MNDOmYD/Iqb+7CoU4r7hML2FQedU3B+FU9Rmo0xgBNtTWvNsNadGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=L/DS++my; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ar/3AnV+; arc=none smtp.client-ip=64.147.123.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 55E4F1800121;
	Sat, 11 May 2024 12:00:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sat, 11 May 2024 12:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715443212;
	 x=1715529612; bh=7wgx+OXZ4hvwZVtI7mufV+v5kKWZRYdPaHf/bNfSZ7o=; b=
	L/DS++mydLkxMus+vn8bennJSWUv4IJg+U4S83viEWD3Adavv7GM7VZnaSyIuLm/
	19h4wdG5/kt4Hs+76+nI/CgC+tXvN5CfwlJn4k6A/xN72nss9O3Ae4S/tpfW6C0F
	YioHvA/rg1prTx4fifKzqYbEj0XHXcfYfOD45bmDFilf/DSsSRqOWeue4VLuJ2bh
	exjo1L+bHDKrqu9GC+Wwsbr3SHLqIw5DCgEaQvlhypmLjE2mCL+9MAiPla3xeiCN
	IxwC2rQXez9J2eM2aOqqlIBv3Xillitr2gN+Ly4Vuq2Un1LokzAoFqxEpXwwFhT9
	xpWKjtz057rVgQvS23mCeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715443212; x=
	1715529612; bh=7wgx+OXZ4hvwZVtI7mufV+v5kKWZRYdPaHf/bNfSZ7o=; b=A
	r/3AnV+9B0io20k52QE5mSyjby4SCWi4zDqrsflODKmC+3gSIvkfkRocN7/ym5Qc
	xnkOdr2HZsHtQq9q0SL1qOvJSDjvRgKD2HJKsCkXsDL/PPAWVg9qfCVlPc66RzYQ
	07qH/cLjJk1TDa6Sz3YEcwGsoxrn+xWs0vORZ/PfBp4PsjACctaFpFGZBvSCjN96
	lnU5N7nzDm/lIbzrclTfi2D9g0Iv3O58kiA1Mtlwy2wFyOpwYMZyvV8kA4Eysdx8
	3BJDA+IPsEOwjy6lPSSsh3YrpM4oKaDlf/NDZdZfWKOyXlQQSh1c3m5Fb2s75YPz
	damNhJDrePQUmjasK6GKw==
X-ME-Sender: <xms:DJY_Zt68VCGO92z8ZFcWHkFnpuxBitBjO6KB0MbN74hq6xaJPExjNQ>
    <xme:DJY_Zq76YTsJ8POWMhl5CMHIvRkGFkaKHIS6N5YNeXXf_rIfc8OGDAmTZwKIH9Ew3
    MZVmA0MbZDeogUC0yU>
X-ME-Received: <xmr:DJY_ZkdouEO_Ikme5x0MoFBMGKLu8VhunKw3YmpGSoWDl0Jx0Uy-ty8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegtddgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:DJY_ZmKci3sJcrL3rcjVXeiov6K-Sfq7fHlkedKvPrXX9yzRLU2IkQ>
    <xmx:DJY_ZhJmjWsLGWr9VqK7jZk6PhMGGGYMdRjwT9Rf5pJpFMz22kPSWA>
    <xmx:DJY_Zvw9Zwrp1WaWpdt0kRnboGGmQwBichwPm8NlksgcSRtwY1vuhQ>
    <xmx:DJY_ZtJdk04scZ9T8Luy2zonEgksPlhuiq7vmiP-JP5FnGyrxD1KAg>
    <xmx:DJY_ZmqMF6ESWUZZcepygrLBIeQ3tJOaZLb3UCzmF_HWqcDElST7cju0>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 May 2024 12:00:11 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 11 May 2024 17:00:08 +0100
Subject: [PATCH 1/7] MIPS: csrc-r4k: Refine rating computation
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240511-mips-clks-v1-1-ddb4a10ee9f9@flygoat.com>
References: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
In-Reply-To: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=TqxmhY10q+PpRT341sEWQQASzTDPa2i1/hqY6sm00Zc=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjT7aZwfpm1/2uLVem7fOyZzm3az/TtPivHURR6taLlcf
 /ySpdXSjlIWBjEOBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZiIgzLDP9OtLYcVSvL/BHPv
 Eq6ocirxEBE6zPZhf+i614vb3cwXvmBkmPvLJ+7VU6V8u/WhreknO7h7VnZ9/3Hn22amfJVVl+s
 /sgIA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Increase frequency addend dividend to 100000000 (10MHz) to
reasonably accommodate multi GHz level mips_hpt_frequency.

Cap rating of csrc-r4k into 299 to ensure it doesn't go into
"Desired" range, given all the drama we have with CP0 count
registers (SMP sync, behaviour on wait etc).

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/csrc-r4k.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
index edc4afc080fa..262896871351 100644
--- a/arch/mips/kernel/csrc-r4k.c
+++ b/arch/mips/kernel/csrc-r4k.c
@@ -111,7 +111,8 @@ int __init init_r4k_clocksource(void)
 		return -ENXIO;
 
 	/* Calculate a somewhat reasonable rating value */
-	clocksource_mips.rating = 200 + mips_hpt_frequency / 10000000;
+	clocksource_mips.rating = 200;
+	clocksource_mips.rating += clamp(mips_hpt_frequency / 100000000, 0, 99);
 
 	/*
 	 * R2 onwards makes the count accessible to user mode so it can be used

-- 
2.34.1


