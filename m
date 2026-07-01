Return-Path: <linux-mips+bounces-15401-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +KB2BhpPRWqj+QoAu9opvQ
	(envelope-from <linux-mips+bounces-15401-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 19:32:10 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFB26F05EB
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 19:32:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qD4CTrmn;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15401-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15401-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39BE63033A72
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2026 17:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9AD390981;
	Wed,  1 Jul 2026 17:19:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F4339023F
	for <linux-mips@vger.kernel.org>; Wed,  1 Jul 2026 17:19:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782926367; cv=none; b=SecBXgLDmIIQy4pkxMjnvMfO8enAotu56dHXnJG9hkoQfB8eFgb9EArQrLHfm4WzJspnYq7ANjwfpn1Z1j9Px/yKGy8ATqaUA8f3MEtKzF5tHxsox9r1cAgr/nsxFK9l2BWNwcrrEEb22WkaFZ+Kpm4dgEM3lc6bKeZlGaul3bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782926367; c=relaxed/simple;
	bh=5bhvD+nRcVIb8srILoT2JhrwKmYl6bpoUDx5N2ye8hE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uzPFb5F+KYYg8De/SQNCjiaXYqkVL4xwZcimoRF1bbXEh7DZO8aImhIMNWRWHRtyY3/xlxnS0e5TUd5RwhwMfz4VM+JYNaUXreXfa+AR87jIdmyW+52GH6+CNEmKsgzqWrfxgkjPSL2cO6IlcfyPjIsZQU/7aUZfABGHrooVI00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qD4CTrmn; arc=none smtp.client-ip=209.85.210.171
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-847a52edeb2so576943b3a.0
        for <linux-mips@vger.kernel.org>; Wed, 01 Jul 2026 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782926366; x=1783531166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tj4zAkM97ykSNm2NxrzOr6EmDioqKrT1a10snYm0euI=;
        b=qD4CTrmnKdKQ8e7YbnPbMttj2+NW66kyAZlUMZDTxXaacbJDNFs4lNd56CjR0def25
         pCNDBf7UbjG2A+bXFywKDRIGKFcV3Xwv1UAVvJqQxxowdoalL0QGj14PZKx/wz0MYFfM
         Qomu06GXqnDW2Cx7NGT1nz4M23lCui3Eo8ZLYMEto3VFLSYn8Bo/Xm8M41JeLNZAou5b
         WPAnxAMvPsuq/y3V7KzMQOSvzsAakZrq51Dyhu+Q1VphE3ltMv9J4awRv6TcT/4eDcep
         0K+LRmPWT9k7TvF6fFDYOQakQ2YmQLbCK3QhP/DVVLOWKzPLSd+8cQYN2E6/rslv66+/
         PiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782926366; x=1783531166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj4zAkM97ykSNm2NxrzOr6EmDioqKrT1a10snYm0euI=;
        b=IXdYE2ZsHDvPtLOCq/G4Okf6OC9jH/frLdmqQ0OvFYMBoWgNXgWGtUA/WuufZdRtMl
         6OPc09K2zMabF5mgUIvCktgK4432Q0SQRFbAtjBq+//TzGYAhUyoizpEfPAqJAU5Lk3Z
         NJ0lhcW77V8uNehwTUFWfSx/HOI5DzX80HSDEkUH4EB+ETOMXG4dIuKLu9ma3VBDmaOZ
         N4mvLZcOcsrU7ChlgtdMG6ft9JNsSzkyCTC4LTPF7aaEeQ2cFA80LOHE1S/o1IgBFfh6
         B772FVSOfWEZI/qwG3wroQM4PmzaogmWC2Ei7qeTCJvUQNVOPc5QjYXAxlU08bjBsYvw
         zwUg==
X-Forwarded-Encrypted: i=1; AFNElJ+2rtOEF5r9jAk0HWVJIshilR5xbRvAp7fvaFdm9tEl0GcKwgQ7YQJjwBJfe1tyF5Y3s2Tj3WDlV639@vger.kernel.org
X-Gm-Message-State: AOJu0YxMeJPw+tYy67yznE1Mj+C9QnQKQ/nwgpUI4HWbcSOZO4Ju76d5
	A6zzcAX8jUCk3/SzH5I0N/jpIl8CkJ7D8ewoz7YhhSRk1vzq6dolHTfY
X-Gm-Gg: AfdE7cmjNNQNUeMhvnZMWoYrFq0MOejN6JlHG6yw93cAc3Z4NTOf3Jj8fgT7tMkZnGZ
	8ti4T9D8fWx80r5D3LgO6VyLIOft0LWvepxryk/vM1we8OLnlaeXe8iyOiyjUDtcTBezouEkn3N
	bGP5BoC7ku4EEpYMcbP7qjcGaqk7m+dsiM7GRpIc/l99jm2zVt+eQVpzKAx/WJOzenJ+Bjjl+Yz
	jZn9jo4sUda5M24qeYaWrcEOjmEt6CqYljhWAG2gdqKBrDysRo+q0dTOTtiiz8MoEGZXi/CXaeT
	NubFzhcLVs7GKDasVKNfPQgXRTnzCeqTq9LO9LVOoUtuD2f8YNNIyUGR9JzPEvX3Bn9W7WcWNkU
	hg103PuvR9qecXsNXEhzk9jEkQw3+rkfRq4c3fbEwh3qhGBtehsgWRlvmu9bPs68VUC88CVZ9Om
	2qYR51+G8a3sQNforQOasPPpVewcMqzQ==
X-Received: by 2002:a05:6a21:116:b0:3bf:b4ed:5579 with SMTP id adf61e73a8af0-3bfed571ba3mr2768071637.59.1782926365419;
        Wed, 01 Jul 2026 10:19:25 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([49.204.164.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5c4c3sm22724178eec.2.2026.07.01.10.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:19:24 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH] dt-bindings: watchdog: microchip,pic32mzda-dmt: Convert to DT schema
Date: Wed,  1 Jul 2026 22:49:17 +0530
Message-Id: <20260701171917.263050-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-15401-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[challauday369@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-mips@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:challauday369@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EFB26F05EB

Convert Microchip PIC32 Deadman Timer devicetree binding
from legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 .../bindings/watchdog/microchip,pic32-dmt.txt | 19 --------
 .../watchdog/microchip,pic32mzda-dmt.yaml     | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt b/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
deleted file mode 100644
index 49485f831373..000000000000
--- a/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-* Microchip PIC32 Deadman Timer
-
-The deadman timer is used to reset the processor in the event of a software
-malfunction. It is a free-running instruction fetch timer, which is clocked
-whenever an instruction fetch occurs until a count match occurs.
-
-Required properties:
-- compatible: must be "microchip,pic32mzda-dmt".
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- clocks: phandle of source clk. Should be <&rootclk PB7CLK>.
-
-Example:
-
-	watchdog@1f800a00 {
-		compatible = "microchip,pic32mzda-dmt";
-		reg = <0x1f800a00 0x80>;
-		clocks = <&rootclk PB7CLK>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml b/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml
new file mode 100644
index 000000000000..01638624e334
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/microchip,pic32mzda-dmt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32MZDA Deadman Timer
+
+maintainers:
+  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+
+description: |
+  The deadman timer is used to reset the processor in the event of a software
+  malfunction. It is a free-running instruction fetch timer, which is clocked
+  whenever an instruction fetch occurs until a count match occurs.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    const: microchip,pic32mzda-dmt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,pic32-clock.h>
+
+    watchdog@1f800a00 {
+        compatible = "microchip,pic32mzda-dmt";
+        reg = <0x1f800a00 0x80>;
+        clocks = <&rootclk PB7CLK>;
+       };
-- 
2.34.1


