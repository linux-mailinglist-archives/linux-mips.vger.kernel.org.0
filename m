Return-Path: <linux-mips+bounces-4027-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6487D91C378
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 18:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2245E285376
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 16:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4911CB339;
	Fri, 28 Jun 2024 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VoJAHBvY"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29439158DDC;
	Fri, 28 Jun 2024 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719591123; cv=none; b=WZOQkGTbwHv+e5UosobdWIhkc1jlcmTE3cPNABr1ZnqFGlmESIvo5gaGDYP9baMzm22XfBAjcnhiHbvoVlES8YQOYFz1ViSTaRwXqPm12wjK0t8amfKShqckk4zoitFImL6OWCvSAmEwwrvVjKOhmW53leBr3lSBRIVRqk/B3ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719591123; c=relaxed/simple;
	bh=nvuGFq7viiCmUzzdZASK97mwCpK0qNQUOS8MBZluUkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Es3NOFJZs9z1wTt6KrdSLRTE9uFcuozIjVphk7hxS90vra6Dt6QSMbgX52CDYIfP3u5oBxqOAM7dpliFTfYz+0fT1T71UkwfrMRAyRwTdJSIHdf4bJGK5xlBLipS8p8a0j30LiqMWPmoF9ooKLArGQvmfI2VgYJPH0R4Dv9G9h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VoJAHBvY; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFEA41BF204;
	Fri, 28 Jun 2024 16:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719591114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tz2vT/oZG6SWYh6OdnXILH4h+RDaqZezQzWQ9iPCvbw=;
	b=VoJAHBvYfj2mrNJ8NlPxptnNHkabiZRfSWe33h6I5K0kQzb94En2Yq5J0TyrLFXwnpc0/+
	Z8edMApK/lkh8G7duZNlseWKwj2ZjS7MwJJ8aM8HSc4J1tauunL97NnyUUsf9GogBQg7zO
	YxwcdrBU/FmlLV6YmwduCHcXCrmuHv9FOXRhASiWsN3FNlPr9hiLY3eytu83r3Y7+aUqw9
	pHQSAa70vjGmLAjj9yB2O85Pz0FPqZsCChcRV/nfhsNVLIARHggAcnviWML3/NUvAXqpc4
	PJeRA1N/EsWXWRe2IXoimklirtTAkD9KzCe60xWp/adO16lgbQgzKE54+yZ/DQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 28 Jun 2024 18:11:52 +0200
Subject: [PATCH 3/3] MAINTAINERS: Mobileye: add OLB drivers and dt-bindings
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240628-mbly-mips-v1-3-f53f5e4c422b@bootlin.com>
References: <20240628-mbly-mips-v1-0-f53f5e4c422b@bootlin.com>
In-Reply-To: <20240628-mbly-mips-v1-0-f53f5e4c422b@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15-dev-13183
X-GND-Sasl: theo.lebrun@bootlin.com

Register OLB-related files part of the "MOBILEYE MIPS SOCS" MAINTAINERS
section. Those include:

 - drivers (clk-eyeq, reset-eyeq, pinctrl-eyeq5),
 - dt-bindings (mobileye,eyeq5-olb.yaml file),
 - bindings includes file <dt-bindings/clock/mobileye,eyeq5-clk.h>.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ca8f35dfe03..b3732165b824 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15194,9 +15194,14 @@ M:	Théo Lebrun <theo.lebrun@bootlin.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/mips/mobileye.yaml
+F:	Documentation/devicetree/bindings/soc/mobileye/
 F:	arch/mips/boot/dts/mobileye/
 F:	arch/mips/configs/eyeq5_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
+F:	drivers/clk/clk-eyeq.c
+F:	drivers/pinctrl/pinctrl-eyeq5.c
+F:	drivers/reset/reset-eyeq.c
+F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
 
 MODULE SUPPORT
 M:	Luis Chamberlain <mcgrof@kernel.org>

-- 
2.45.2


