Return-Path: <linux-mips+bounces-624-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1340B80A879
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 17:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44CCB1C20A7B
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 16:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE08737174;
	Fri,  8 Dec 2023 16:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fDepcN8i"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD861BCB;
	Fri,  8 Dec 2023 08:13:09 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5C6EE000A;
	Fri,  8 Dec 2023 16:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702051988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CCkW8mMra/OC394XuBHllm2zOVLtoeHjnt7KGkK+CU0=;
	b=fDepcN8iFOEiZlIGqEw/O7cXSU12iUI36iaNXlDN9wx0AssfVtfSTh1GNT9dv/U4SiMqSP
	REU3VVo1lO/nZAmb/tkgTbct5CRV9o7z6HEzyBXARlBE0Hy6riV3oIP5tKLKsPTv1O5n5r
	pZAKB3LKwGGEUgD1GO8qJfnJBY2msu3LeP486tuy4+ngHOB358q5lOWfHnyrLqTNaXdHan
	T3ZFcf9GV++tkkRdVw1tbcyDTEkyq8pP7Bqxd4NeU4SvoEgJ6H9GjXmQXDjm97EMOVDXTL
	c2DgEcpdL2MSkcg3feATH6qGI1NzVbiSl/YaEWYbzGnEsx1vhGPKlOc5Al0zDQ==
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
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 18/22] dt-bindings: mfd: syscon: Document EyeQ5 OLB
Date: Fri,  8 Dec 2023 17:12:34 +0100
Message-ID: <20231208161249.1827174-19-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208161249.1827174-1-gregory.clement@bootlin.com>
References: <20231208161249.1827174-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

Document Mobileye EyeQ5 compatibles for OLB registers that are
miscellaneous SoC related registers.

It is used to expose SoC specific configuration such as for example
reset, clock or pinctrl.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 084b5c2a2a3c2..c90633460eeca 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -55,6 +55,7 @@ properties:
               - mediatek,mt8135-pctl-a-syscfg
               - mediatek,mt8135-pctl-b-syscfg
               - mediatek,mt8365-syscfg
+              - mobileye,eyeq5-olb
               - microchip,lan966x-cpu-syscon
               - microchip,sparx5-cpu-syscon
               - mstar,msc313-pmsleep
-- 
2.42.0


