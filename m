Return-Path: <linux-mips+bounces-12588-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB42CCDBEEE
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 11:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D147A30B96EA
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 10:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603D2336EFE;
	Wed, 24 Dec 2025 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hZ3MU06X"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B479D3346B8;
	Wed, 24 Dec 2025 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570881; cv=none; b=ecoYjQ8qY1yo3LG7ejRyVv16yoZESPL8LQ+2TsaX9If8CcquzxcGrDibb33R6vyp1uxHyYEfY5yGQt4QClXNWbh7Xl1ck6PL/+rxw2cdeFHecLpozKOCXl/7AZ0nf9QKvYnNIiJy8N6ufmYkh+1NaZniLgf2zZpz6GuS9vndlEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570881; c=relaxed/simple;
	bh=vn9WQj9VhG7AviNjexEImiEIi/iAGVf/ODoubgj8esg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kk3ygRPTPnKnPmxTotb+GXmNgf6FgwFso/7HIkQg0F2XRvFMayWRycyzTtolV49UWipSNMiYqVuCZUW47RnDxNUoVkaYMyL1rv1Nau8Uxf9/qC7XC4K7ONhpifLQfmaSWPBz9PUvkM0R4I66RExgQObZ2yGSWo5R6ThucX59iPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hZ3MU06X; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 251F5C1A5A0;
	Wed, 24 Dec 2025 10:07:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4991C6073D;
	Wed, 24 Dec 2025 10:07:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C94310AB110C;
	Wed, 24 Dec 2025 11:07:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766570876; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cI1JQH6Wxakl2cHxkxeZUP6cWNzaIt5ffNvTU0ZKfI0=;
	b=hZ3MU06XDk1/Oju31ZB8FqNiMG0Ume5mT/elnRRSpm/0dM+SQe5eShoZSacKqFNrDdVZ64
	KiSZEC/zRm2spkmjxgSdjHfIOlwTQN7JQtV4VvmhPaa+EtsIYPQw2Af5+FJb9nvwg8Lu8U
	ip3E9oGovdCGDfpFMtfjzENzHodkEoTGoqPQcTkE8Jb9xRzcqYT/t6I2XM7eyRL4AefSTB
	8ydx43jE68aSVIiAAcM2KX6+Aq/GwxHwuqX2PCRJ9ttL4//WN5XLMqyRkHYJVl191SPEy8
	Fd7bBUVuoAfRunSt81x8ted/mc5oa0aM7ybCdkEF77SMZsQZ2Zss1aoMiKKW3A==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 24 Dec 2025 11:07:23 +0100
Subject: [PATCH v2 10/10] MAINTAINERS: Add entry for Mobileye RISC-V SoCs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251224-clk-eyeq7-v2-10-81744d1025d9@bootlin.com>
References: <20251224-clk-eyeq7-v2-0-81744d1025d9@bootlin.com>
In-Reply-To: <20251224-clk-eyeq7-v2-0-81744d1025d9@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add Vlad, Gregory, Théo and myself as co-maintainers for the Mobileye
RISC-V SoCs, and clarify the dt-bindings entries between MIPS and
RISC-V SoCs.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 MAINTAINERS | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 670e93ddf2f1..bc675d62d567 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17601,7 +17601,8 @@ M:	Théo Lebrun <theo.lebrun@bootlin.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/mips/mobileye.yaml
-F:	Documentation/devicetree/bindings/soc/mobileye/
+F:	Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
+F:	Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq6lplus-olb.yaml
 F:	arch/mips/boot/dts/mobileye/
 F:	arch/mips/configs/eyeq*_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
@@ -17611,6 +17612,16 @@ F:	drivers/reset/reset-eyeq.c
 F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
 F:	include/dt-bindings/clock/mobileye,eyeq6lplus-clk.h
 
+MOBILEYE RISC-V SOCS
+M:	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
+M:	Benoît Monin <benoit.monin@bootlin.com>
+M:	Gregory CLEMENT <gregory.clement@bootlin.com>
+M:	Théo Lebrun <theo.lebrun@bootlin.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq7h-olb.yaml
+F:	include/dt-bindings/clock/mobileye,eyeq7h-clk.h
+
 MODULE SUPPORT
 M:	Luis Chamberlain <mcgrof@kernel.org>
 M:	Petr Pavlu <petr.pavlu@suse.com>

-- 
2.52.0


