Return-Path: <linux-mips+bounces-443-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3039F8009A3
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 12:15:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6258B1C20EB1
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 11:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B27219F2;
	Fri,  1 Dec 2023 11:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BIhj3Ksc"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D5E10F8;
	Fri,  1 Dec 2023 03:15:36 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A02620002;
	Fri,  1 Dec 2023 11:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701429335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5J0TpG59q99eDXCElU/oJiTiWId7juQenPAyUFsRAno=;
	b=BIhj3Kscw/JiWDMfKWgqTiSqw1HgtuSAykJ1n4spcM6C3RL3in6je3ikqzYL+FK1SphKba
	X8fW0/qt2q++/zMANvsP/GxKyNdlFk3wHOYe9+b/A4c3wgO52umgx1MiRSaq7AARr6SlO4
	qdon6sJqtcGv6l95384v4YCVttKVJAHNABnnQI8dtie4FcpwHTnZhX3H5yxy1Dn16z20DG
	IF7SMUrhy62KkubaHR2CYK3E1X+n59zSSvLutdKmgGwNynmo0G5GpiZwCpOHkwwk0y1qIK
	qHNq7vw5cSU5PK+W213ek36yte4R+dz0g+ZnCbgGf6RUVdBunpa8Tf2h0GTUAA==
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
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 17/22] dt-bindings: mips: Add bindings for Mobileye SoCs
Date: Fri,  1 Dec 2023 12:15:00 +0100
Message-ID: <20231201111512.803120-18-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231201111512.803120-1-gregory.clement@bootlin.com>
References: <20231201111512.803120-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

Add the yaml bindings for Mobileye SoCs. Currently only EyeQ5 is
supported

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../devicetree/bindings/mips/mobileye.yaml    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/mobileye.yaml

diff --git a/Documentation/devicetree/bindings/mips/mobileye.yaml b/Documentation/devicetree/bindings/mips/mobileye.yaml
new file mode 100644
index 0000000000000..831975f6b479f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/mobileye.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright 2023 Mobileye Vision Technologies Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/mobileye.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mobileye SoC series
+
+maintainers:
+  - Vladimir Kondratiev <vladimir.kondratiev@intel.com>
+  - Gregory CLEMENT <gregory.clement@bootlin.com>
+  - Théo Lebrun <theo.lebrun@bootlin.com>
+
+description:
+  Boards with a Mobileye SoC shall have the following properties.
+
+properties:
+  $nodename:
+    const: '/'
+
+  compatible:
+    oneOf:
+      - description: Boards with Mobileye EyeQ5 SoC
+        items:
+          - enum:
+              - mobileye,eyeq5-epm5
+          - const: mobileye,eyeq5
+
+additionalProperties: true
+
+...
-- 
2.42.0


