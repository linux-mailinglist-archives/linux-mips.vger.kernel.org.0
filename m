Return-Path: <linux-mips+bounces-6589-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9689B7F2F
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 16:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B246DB2140E
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0BC1BC091;
	Thu, 31 Oct 2024 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VzskqY1x"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C691A254F;
	Thu, 31 Oct 2024 15:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389988; cv=none; b=Np2IcRkabBOKpVZK6UFYDcqUHGe6lNT50YNCQxG139N/7WbcO0NQ0ZB17t4zh+/AvPzycVegedq1/FEiNoM0Vz41iB+XLwiRX84a0kB7pqLvJHz2ZKWHWjV/swy3xH/l+DSJKMM4UT0LGxKCnbl6mnAYhHX/KGbBy74TBsOifbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389988; c=relaxed/simple;
	bh=TYPPcgAEVgmZNxDqH4msGR2AzYupIiZeXAnNVnKGLd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGe7beWEr/Rs/DMfiTRMVPqYnOKSxtD5qPwusBIoHvTBkbh/V48kM3LdX9/CRg26YGlRhcwxLTM2yM3F5ATh18eAl95O5OXzx9ZRRs6DNPkZAUmmdhsLCaL83XfMhIaVr9fHTHunyrXM40BBPgAR1eL9a58xTv9SZqpXFJVAves=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VzskqY1x; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29DDA1C0006;
	Thu, 31 Oct 2024 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730389978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YbogFrPuS1mbsrk3psEaApAX2/Cxw1n8kdmMlJcjLVk=;
	b=VzskqY1xDgxqfH7vk5a8oitglYo+yD/HFQkY/5KbgwrFfOKg16wsIk4hZFe3pXE22Uee+L
	Zwi8cjLZlhyGatNZ8B1oFtVar/znDbbu0sP9aE3hEj6+lVN8DJysStDmhe4kcqr99Bc502
	LLWmcXA7upszRTfUB4zx0hU27jsaDQmyUjnbIE2nC4r0p4vUKcmEmxp5+RAxu1fOnsZkLD
	jdq9XjuntB1sRYHBGyN2UANhQeGoB4+HK3bdezYsCesgXbI856avhroYB9dRVLRObGFwvA
	0iJzCZPA25fMgNvd0ONXXNsiqjNzHxrE51YgBBydskt00eRA0wp8u+IWKD7wRQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 31 Oct 2024 16:52:54 +0100
Subject: [PATCH 04/13] dt-bindings: clock: eyeq: add Mobileye EyeQ6H
 central clocks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-mbly-clk-v1-4-89d8b28e3006@bootlin.com>
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

Add clock indexes for EyeQ6H central OLB.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 include/dt-bindings/clock/mobileye,eyeq5-clk.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/mobileye,eyeq5-clk.h b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
index 7d9e700b5e59573c45919865d9c68a9e8cf6a9eb..2356bc52646df9cfeb93df8120eb8f0bf80d97e9 100644
--- a/include/dt-bindings/clock/mobileye,eyeq5-clk.h
+++ b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
@@ -34,6 +34,9 @@
 #define EQ6LC_PLL_PER		2
 #define EQ6LC_PLL_VDI		3
 
+#define EQ6HC_CENTRAL_PLL_CPU	0
+#define EQ6HC_CENTRAL_CPU_OCC	1
+
 #define EQ6HC_SOUTH_PLL_VDI		0
 #define EQ6HC_SOUTH_PLL_PCIE		1
 #define EQ6HC_SOUTH_PLL_PER		2

-- 
2.47.0


