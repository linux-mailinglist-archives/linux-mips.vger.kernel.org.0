Return-Path: <linux-mips+bounces-6590-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E699B7F31
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 16:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AA161C21389
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DF91BC9F0;
	Thu, 31 Oct 2024 15:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WYgN5rUC"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CC11A255C;
	Thu, 31 Oct 2024 15:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389988; cv=none; b=f4av9hzpuHvgaUXMNIUmiXhaTZK/5GGC/Xdn2TshAy/r0Wx1JHUqVn8c1nSSPuPPrUbxpkWYGG8vcLueF/YfnGbPscnmRKX1aWoiF0Ta43ebeiG2CKpIglx8FYAK2QHe9zddpSzbS+h/gDrFm/RT8fQGQZjQEhmXsWEA+UyckF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389988; c=relaxed/simple;
	bh=6l0qZSHDsQnkRceIi1yCN9qKhJDbQDK/liFSP7R8KZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U2TrHnX0rrjlmG5MsCaToQQqJ6SzDO41qoxy0lNGjAezKv26k7Azo2epa9TA1YZbuVDJfQYPM+9GYOMd2tr7U9rkPnpc1vrdMCnEwgRdgMdoYMzgluvlG68zzEf3Tm3nmPyNkZwC7BvA1UwcmxBzRldRoYoYtd0cBPl60HAlhD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WYgN5rUC; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D05B41C000C;
	Thu, 31 Oct 2024 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730389979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duc7FXGhBJ2LaONO5SFmALxLdfb+2+axaT7TzFowjXs=;
	b=WYgN5rUCriEr7fSdHWBQAI/55MHYLnGXwMiSDtv+FgIc/WXQYQfyjYQgGt0Tdd41zGOS0/
	X6xBDGngGefQItDFx23isoWJ4LSIHg1ZRw0mo2mom4s49XieiFExlpIMKf4IG1uAkSHpwE
	nYBFRBqMvbt321SgmO2fzS43MUg3gPv/RmTLEW/KP6mqRWHi5Xq+/y/0WxrwXmHw0YJD8n
	lOBTrxGg1Kb/8hfAPmlqwDKYs2Li4Nig4+8xHX60Zc3qr15kgO0tV6GdHQM1yoE/RwWPBc
	senhRJXpNcPBs1MjbXxFGGjWHsGbzNeSIogGJq6h1W9tHvY4fZcxKGVMxVRqZg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 31 Oct 2024 16:52:55 +0100
Subject: [PATCH 05/13] dt-bindings: clock: eyeq: add Mobileye EyeQ6H west
 clocks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-mbly-clk-v1-5-89d8b28e3006@bootlin.com>
References: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
In-Reply-To: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Add clock indexes for EyeQ6H west OLB. Internal hierarchy is:

    PLL_PER
    └── PER_OCC
        └── PER_UART

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 include/dt-bindings/clock/mobileye,eyeq5-clk.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/mobileye,eyeq5-clk.h b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
index 2356bc52646df9cfeb93df8120eb8f0bf80d97e9..8efdf0feae8e43e7b84ff9ca12b8b90c3116240d 100644
--- a/include/dt-bindings/clock/mobileye,eyeq5-clk.h
+++ b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
@@ -37,6 +37,10 @@
 #define EQ6HC_CENTRAL_PLL_CPU	0
 #define EQ6HC_CENTRAL_CPU_OCC	1
 
+#define EQ6HC_WEST_PLL_PER	0
+#define EQ6HC_WEST_PER_OCC	1
+#define EQ6HC_WEST_PER_UART	2
+
 #define EQ6HC_SOUTH_PLL_VDI		0
 #define EQ6HC_SOUTH_PLL_PCIE		1
 #define EQ6HC_SOUTH_PLL_PER		2

-- 
2.47.0


