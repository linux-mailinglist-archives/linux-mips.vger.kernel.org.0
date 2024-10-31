Return-Path: <linux-mips+bounces-6586-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2449B7F1F
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 16:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3780D1C216C5
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2663D1AC435;
	Thu, 31 Oct 2024 15:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JfwVkLBU"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D41136664;
	Thu, 31 Oct 2024 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389987; cv=none; b=usz8g5n/8oC/gyFEXzjPiltqEdiZLfDWKkIuLym4XpQWAb+5mwx2HXPGIFTt1ERsOK4Kd57gQ4Qdjcg/8Wxx71KC+JGoH+5014/2qcIaUk6ye3zRLT7Y4n+JeJ9Ooxco2fhDmoQ5ssyRRT7HW89aKmZCOPVhHlUlcZu0amg6rNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389987; c=relaxed/simple;
	bh=NQyYaIjAovNh/+tjBANCN0ydFdN7FSPnUoW0X/BqvLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f1ybWOkm5GV/Sz0ZqSQ/HcATsALkTSTzO69SFkyN8Mr9RLBVaV92zsUrIwzQFR6UDsz2Cv/kiXAixgL+qA3lB1tQcUFd6OLNN17t4SRlLok9VlT41aW/mjEkh9O+ui+aMxNterMc/zEppXLjKLxZI1eNfpmTDAVakXqDC8Y6cuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JfwVkLBU; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC90E1C0004;
	Thu, 31 Oct 2024 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730389977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oJJl+SCCXVek7yuMPvftSNZQjg3UbRGAzz3320vEENM=;
	b=JfwVkLBUs+QGumSJjM8FQxLeQghqyBnmEAbsMdftmAQJ+/RyCITPQfJO4g/R/Q+lDTuBU/
	2Gi0r3sIoQyfa01HzFBePh5CZIuoSPgK3S50Cuv0zZkOR2jffcOLxwMKSNs8vg+Pv546aZ
	PoPM8YdwYX9TbWzQTSyIWXv36++nnAfkbLVUOowsrTQ4iUEO+Mz74NwXZukYC2AeOT4NyS
	E/sV3CedJsRmwzILc+noRWprud65IFtou+74CxR8cbrpoH/YZ6XIwN+OdiHUBAfs8BEChu
	PfLgLw++DCTExsceRYLCJNQLiV3j8cGDyeWfSOfx/ACyilslT/p2EoCg5QJgFA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 31 Oct 2024 16:52:52 +0100
Subject: [PATCH 02/13] dt-bindings: clock: eyeq: add Mobileye EyeQ5 core
 clocks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-mbly-clk-v1-2-89d8b28e3006@bootlin.com>
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

Add #defines for Mobileye EyeQ5 core 0 thru 3 inclusive.
Internally, those derive from EQ5C_PLL_CPU.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 include/dt-bindings/clock/mobileye,eyeq5-clk.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/mobileye,eyeq5-clk.h b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
index b433c1772c28fae818b3a6ba428d1f89000f9206..359f7cceaadb368998db714344595f0449963536 100644
--- a/include/dt-bindings/clock/mobileye,eyeq5-clk.h
+++ b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
@@ -19,6 +19,12 @@
 
 #define EQ5C_DIV_OSPI	10
 
+/* EQ5C_PLL_CPU children */
+#define EQ5C_CPU_CORE0	11
+#define EQ5C_CPU_CORE1	12
+#define EQ5C_CPU_CORE2	13
+#define EQ5C_CPU_CORE3	14
+
 #define EQ6LC_PLL_DDR		0
 #define EQ6LC_PLL_CPU		1
 #define EQ6LC_PLL_PER		2

-- 
2.47.0


