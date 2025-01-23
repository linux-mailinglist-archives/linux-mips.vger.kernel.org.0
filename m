Return-Path: <linux-mips+bounces-7582-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FE6A1A26D
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 12:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88B127A6393
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 11:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3577E20E307;
	Thu, 23 Jan 2025 11:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G6OsRrAX"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BAE20E021;
	Thu, 23 Jan 2025 11:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630129; cv=none; b=YeelTWXAqpaglkeu81Jkmcizmoj67UFM7c62jPdjiMUrPCe0lnNZf8RTkM8TvT7JnghnxrRUAkHFqewpBuHCPbU5ArD68S3Wv4WyyNXZIgNfkfJhyb4RblRO8+UuME5bCTLLmPcXTv+KvcQ4ysEvbaDCsq/MUxlRdZ0gvyDoeAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630129; c=relaxed/simple;
	bh=bCeIqKozA0uCUswQ7QSh5THPEiib/UKBFfZYY9bJ968=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ifE2jbdN65PNG202AI+FdR3aWBEYByhmymzOsYKQnLOaLaihy8jF2fy2H9zNLqxiZ0o6ek+AGMMwD+4sbWAK+ytmWFir2gVRbmy5kYyvl/UtxWHRY8lpGF+7iIGNarPbjLcCwc1CcDRIN956QbXoGzGlKFmsTCDInEKTZlWZkZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G6OsRrAX; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A54360006;
	Thu, 23 Jan 2025 11:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737630125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J4te1nDJuia8tlkOq1rs3PPQ64j4O7/bep+hWYRRNyI=;
	b=G6OsRrAXjbtf8NhXBpatCBrOs9jUHknyyCarwyWA8V98JCTy08cgwM8BsHwGBSSBqN8b15
	JuQNNTV/+6RT1KcqgPFO/LmHVmK/epyQkFtAI+c2oqZWzNqgMLgh+yOmuNQm6HWgRv7BjD
	3diWnBo+zo0JOaUr5pLy8JhqfVbz94lPhx5dYTSR2gLJt5P0KWTqqkhqix2ieurE9NLzgn
	Wim4CtrZRDH2eKzJZ2m0eRWlb6WPOoNdbdenN2w10DC3P48Jdw/rOhWufVONXDHVNYa5sZ
	/9peoqNCweQuLHiaoSWawQlo6iCy9rF4ZWTZbc65PcE6iyPxa4X+UD8NN9+/fQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 23 Jan 2025 12:01:54 +0100
Subject: [PATCH v3 1/5] dt-bindings: mips: Document mti,mips-cm
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-cluster-hci-broken-v3-1-8a7ec57cbf68@bootlin.com>
References: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
In-Reply-To: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
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

Add device tree binding documentation for MIPS Coherence Manager. This
component enables support for SMP by providing each processor in the
system with a uniform view of memory. The Coherence Manager is
responsible for establishing the global ordering of requests from all
elements of the system and sending the correct data back to the
requester.

Based on the work of Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../devicetree/bindings/mips/mti,mips-cm.yaml      | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4324b2306535f1bf66c44b1f96be9094ee282041
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/mti,mips-cm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPS Coherence Manager
+
+description:
+  The Coherence Manager (CM) is responsible for establishing the
+  global ordering of requests from all elements of the system and
+  sending the correct data back to the requester. It supports Cache
+  to Cache transfers.
+  https://training.mips.com/cps_mips/PDF/CPS_Introduction.pdf
+  https://training.mips.com/cps_mips/PDF/Coherency_Manager.pdf
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
+      Base address and size of the Global Configuration Registers
+      referred to as CMGCR.They are the system programmer's interface
+      to the Coherency Manager. Their location in the memory map is
+      determined at core build time. In a functional system, the base
+      address is provided by the Coprocessor 0, but some
+      System-on-Chip (SoC) designs may not provide an accurate address
+      that needs to be described statically.
+
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


