Return-Path: <linux-mips+bounces-628-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DB480A883
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 17:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 217CE281845
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 16:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03928374CE;
	Fri,  8 Dec 2023 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dqmVxkXt"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3404519A7;
	Fri,  8 Dec 2023 08:13:12 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8277D1C000C;
	Fri,  8 Dec 2023 16:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702051990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NF5qApw6fMhlr7kXSD5A4ZD9LfVmR7kuExevs+ZXZcs=;
	b=dqmVxkXtGUv26CssdUyeuf1JPLFgDmKsjtBsv7WL/HdvcXJLfqmSTUQxAV5gWXl9h6ErN6
	eMfASaMcWMvfVJxw7GzWe25oNdvTHkUOFOsrkKK/USboLo3QxEBD3izpo6vVfbABkp8pzN
	cCcbTmP0ZHnIWb8+LCOli8xdk5B6455aRy0g9QnICPOyJ+sYmrM/1l9SRLkmq5WM73cVm/
	GYGHPINXkwPsRPMFyXQUWlw3Uws+SV3QDUftGo1A4Q6tGFri87a8tri8WgzkwySDO9jrkN
	vgAnqNjKtiB424dikq1diTUVTPAorHR6kcRGckPSQCRi3GaPWgYKWZhK/5K2og==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir  Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v4 22/22] MAINTAINERS: Add entry for Mobileye MIPS SoCs
Date: Fri,  8 Dec 2023 17:12:38 +0100
Message-ID: <20231208161249.1827174-23-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208161249.1827174-1-gregory.clement@bootlin.com>
References: <20231208161249.1827174-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

Add Vlad, Théo and myself as co-maintainers for the Mobileye MIPS
SoCs.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 97f51d5ec1cfd..b9ddedc154091 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14607,6 +14607,18 @@ W:	http://palosaari.fi/linux/
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/mn88473*
 
+MOBILEYE MIPS SOCS
+M:	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
+M:	Gregory CLEMENT <gregory.clement@bootlin.com>
+M:	Théo Lebrun <theo.lebrun@bootlin.com>
+L:	linux-mips@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mips/mobileye.yaml
+F:	arch/mips/boot/dts/mobileye/
+F:	arch/mips/configs/generic/board-eyeq5.config
+F:	arch/mips/generic/board-epm5.its.S
+F:	include/dt-bindings/soc/mobileye,eyeq5.h
+
 MODULE SUPPORT
 M:	Luis Chamberlain <mcgrof@kernel.org>
 L:	linux-modules@vger.kernel.org
-- 
2.42.0


