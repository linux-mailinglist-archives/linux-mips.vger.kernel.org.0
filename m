Return-Path: <linux-mips+bounces-6760-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 073769CEFF5
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 16:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A76221F21A97
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 15:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1771D61A3;
	Fri, 15 Nov 2024 15:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Pw+404mj"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1EB1D4613;
	Fri, 15 Nov 2024 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731684620; cv=none; b=uS5iylRImmXKwUIXZZqZE6uJJKFVGZQN934vV1LVwJRVPJS4M0nDcog+JUtFrlG5+FA9/7msjJBSU2oDUpObCmMVC8RDbRd33FzRywxpj8ObW41MbPXC3JUD9QqBjLS6mkB8jm9lzphC0GGi+Xu04ZzP5BkbMM/IwmZxU7CAzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731684620; c=relaxed/simple;
	bh=bb+PGPq+w9RrNa7FSPZJkEbu0nmc/XNXBgM+pNMhYMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BM47SI6wdOFI+0lt+Y3MD6H+y2k4BUTdazoDQg7z8ZS6gYUBPMTS8YLdXwdgTW3fM0UqHkmKJLjvLKJj8GXTETSEzNm3rFQZF+lDri6ENTcJ6tQRsjctgUF2pHatCeCqJrw06777FAZn6aI2mAWcsD8chzMF7BzfR0jiltwrCo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Pw+404mj; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FD936000F;
	Fri, 15 Nov 2024 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731684609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DsKZnU2R0DNxhIwwppCQVHZ0ePkW/J1Qsk/fOA0a7eo=;
	b=Pw+404mjCpeqzDrtxRgE1v4GNkZQjer90K7sSyb6iorHWAl5lg/phojX45fqdniWEBblGT
	gYcSEeVRLH3zeTpRv7ScqtC0wv1J9409RYay9UoDH+4VYCNgLjyF5XPc5/DHsOYrohDRkS
	s63N7pN2rkRL98sjKrdPx/j6asCoE6xksXKxeaBlgbrPdb4iQggGb78x5mnkXKR6fZ3dND
	HwWyNZS/uuMEpof9vPJAa2C2+xa6vrSD1MbaMoEogYdBhEfPBCLWZXnJWSjbHn/IPqcqnH
	/u+V2C42wVv1GMgDdb3/9wJA4NBgenLHg9i4ZAOSNFYPhUPQXkGORrI6KUgKKw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 15 Nov 2024 16:29:54 +0100
Subject: [PATCH 1/5] dt-bindings: mips: Document mti,mips-cm
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-cluster-hci-broken-v1-1-00636800611d@bootlin.com>
References: <20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com>
In-Reply-To: <20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com>
To: Aleksandar Rikalo <arikalo@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: gregory.clement@bootlin.com

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Add devicetree binding documentation for MIPS Coherence Manager.

gc: reg is no more mandatory
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../devicetree/bindings/mips/mti,mips-cm.yaml      | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..03a5ba5624a429c428ee2afca73b3e29127e02f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/mti,mips-cm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPS Coherence Manager
+
+description: |
+  Defines a location of the MIPS Coherence Manager registers.
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+properties:
+  compatible:
+    const: mti,mips-cm
+
+  reg:
+    description:
+      Base address and size of an unoccupied region in system's MMIO address
+      space, which will be used to map the MIPS CM global control registers
+      block. It is conventionally decided by the system integrator.
+    maxItems: 1
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    coherency-manager@1fbf8000 {
+      compatible = "mti,mips-cm";
+      reg = <0x1bde8000 0x8000>;
+    };
+...

-- 
2.45.2


