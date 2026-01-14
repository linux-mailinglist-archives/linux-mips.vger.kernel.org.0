Return-Path: <linux-mips+bounces-12928-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EE2D1DD3C
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 11:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17E883017023
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 10:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED13A389E1D;
	Wed, 14 Jan 2026 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hdfbGTc3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15ED38B9B1;
	Wed, 14 Jan 2026 10:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385154; cv=none; b=T6abvNN6hDvh4KmZn7uDGBPthocZoxjcd2thGLSZ1sPnrtJbU/6PU25xKErrsQPl6XaCh9dZHAUjDogTPLN16d+y9hrl5vw0Qi0q3TZeiFiCm+r9/vtITZ4q0kZdDq35xcXqg80LSZAQ1AUz2yfMbkFaqryODN9YnsZjGAbk+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385154; c=relaxed/simple;
	bh=vn9WQj9VhG7AviNjexEImiEIi/iAGVf/ODoubgj8esg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VksiZuWNt4Hx4fcVdWCWcje6uPOs4rfHo7N0+jePM37R9xBUQLNhgBUdwGotO6TIF43tLoEdlLF0eyfKXOt+UkK/8cGtcYVHTF+WN66dPqek6mw77Va2oepI5SNOAdJQEIkUI9HGNlVAK8tiT9UVArJnX11XU75DXdyaknj0PKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hdfbGTc3; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 848B64E420D4;
	Wed, 14 Jan 2026 10:05:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 593046074A;
	Wed, 14 Jan 2026 10:05:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0045103C89F6;
	Wed, 14 Jan 2026 11:05:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768385150; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cI1JQH6Wxakl2cHxkxeZUP6cWNzaIt5ffNvTU0ZKfI0=;
	b=hdfbGTc3zLFHQsrfj3a+R/1bCMFqPb2m7wcFInciJspN5WcU5JSXT3D4chNPvKJzivJ0Fi
	xqvT3gV1gz6Nu0Ld6ASC2Ts2u4399zJcN1U7iuWO0uS4Zxm6QGut42EeIPOULga6KjJhfA
	Ad+ahGuY44dNAdOu6QNH0nJ0tmb8WORG2EA6QWyzLi/yWvdPYEv7zpuCVHDpHu/nQeRiMA
	vRHXlSMmHQ0kLNgGG/JtmX8UzpmrdIrW6ZpY52yfE6ekJhnGR1NWg2K18eFCbWhk1eOVch
	uffXSwxrf/8CQMS8xFWp8ymBm/5lx6LTIe8GHo3KIc7VEQmGP0Xf1D5bTU3RZw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 14 Jan 2026 11:05:14 +0100
Subject: [PATCH v3 10/10] MAINTAINERS: Add entry for Mobileye RISC-V SoCs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-clk-eyeq7-v3-10-8ebdba7b0133@bootlin.com>
References: <20260114-clk-eyeq7-v3-0-8ebdba7b0133@bootlin.com>
In-Reply-To: <20260114-clk-eyeq7-v3-0-8ebdba7b0133@bootlin.com>
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


