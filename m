Return-Path: <linux-mips+bounces-10295-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A84B2615F
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 11:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 048265A34F4
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 09:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE882F5323;
	Thu, 14 Aug 2025 09:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="morrRifc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619472356DA
	for <linux-mips@vger.kernel.org>; Thu, 14 Aug 2025 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164243; cv=none; b=dZnTIFLfbZudFLx6IL/BCp/N6CdTEGdTxaVDfIYkz/Vl+Tr+/vKwNtMz7vL0xGQQot9qbiMKlfCGKUgwQ6Y5dLg7GITJAVefN3S/HBW4IvlL0W6PCPToinW8bl5xCV3XiEKAYBeaioTOKkjqRjOjHagL0/rBfx0DuNryDcm9zQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164243; c=relaxed/simple;
	bh=dW/xr3vfgNuCDhueJr+yTDWl3zvG+UZlbW8h3X4Hqv0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=YF5VPvVXObM9agi5K9v4ZgU0J3pnU/DgLP6dEoo7QEZkFhzLjFrTVF3CF9Li3XFQp+XIquDTysgVFYyfP8kb6OzDcrOZ/MMscWZxM0sph3Et5smd0Nw6bmuQSCP8iiLCzO+fzsXaauJghECBsbNYvqtPit4Gzyg41qTD7TrRuzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=morrRifc; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 31925 invoked from network); 14 Aug 2025 11:37:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755164233; bh=8l/lnnXu3QrQ/y3L8Ck9okdvOOxwUP3ntLh2uTCv6t4=;
          h=From:To:Subject;
          b=morrRifcFiLjgI8tlOVH/IO6VzZ2+UvxMUlyNwVZItlB/yO3Tj+W3fqHPaUdvmF95
           ZLOiAZ9gpweBhGcG+LTmFqpO37QinW7175luAl7AQWUc6ednBBk7pZp/BVxON+M7KD
           Y+T2OdYk88A5LBu2YXmTUfKxQW5UmP4DW/neMFsPPN8PoophtNl53NaH4DY9slkvRi
           xfFW1t8Zy2JpU2zcMurXfm3Rq9L9P0xhEOg7r8A+FFNp6IXemJ4R7ACj3lODTIhbc/
           2CSFyuZC3X2Apc8eFu8czTacDdhci0J1QgAt3XiDzTw9FX6gANb8ARYwpqHCbd1L05
           NXqH/sHJNT6aw==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <tsbogend@alpha.franken.de>; 14 Aug 2025 11:37:13 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	olek2@wp.pl,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: mips: lantiq: Document Lantiq Xway GPTU
Date: Thu, 14 Aug 2025 11:36:59 +0200
Message-ID: <20250814093704.3197030-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: b0a65c4fa6f64b97e001525c45aeb3b6
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [kTNU]                               

The Lantiq SoC has six built-in 16-bit general purpose timers (GPTU).

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../mips/lantiq/lantiq,gptu-xway.yaml         | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml

diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml
new file mode 100644
index 000000000000..fcfc634dd391
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/lantiq/lantiq,gptu-xway.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq Xway SoC series General Purpose Timer Unit (GPTU)
+
+maintainers:
+  - Aleksander Jan Bajkowski <olek2@wp.pl>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - lantiq,gptu-xway
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 6
+    maxItems: 6
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    gptu@e100a00 {
+        compatible = "lantiq,gptu-xway";
+        reg = <0xe100a00 0x100>;
+        interrupt-parent = <&icu0>;
+        interrupts = <126>, <127>, <128>, <129> ,<130>, <131>;
+    };
-- 
2.47.2


