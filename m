Return-Path: <linux-mips+bounces-3875-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3901F913FCA
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 03:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9715B21A8D
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 01:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E579E17BD8;
	Mon, 24 Jun 2024 01:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Lw0zyX3Q"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EC58F49
	for <linux-mips@vger.kernel.org>; Mon, 24 Jun 2024 01:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719192198; cv=none; b=VBWc06ycXb0wteMvnGcu/YVKlz5GrAYtQeJBmDSrn5ngcipX3Zo3BcNL1XslqYAU4ZHndUrvS/YBQZZxUIHrU4fCbptJk825A0zx7sUlssZS3pPxz2iLCCRRVXBg4WJo+xyEa1ddpkB7AGDEsZC4EK4OHKTZRMXpx9HXx7dlNS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719192198; c=relaxed/simple;
	bh=ncaGmT807eyy1KpyYIyWpWEGYItlTqWLhq692WwmvB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hB/U+DMivMjlHWAJUreUd2hX4NaBHs965X4xMJIbNwHpdKXUYw65A4yibo5tEI32HjoWMMEv6nC5wMNa77pm97duJ+zHnqXvB2n22kQwIBxLCzd55sJbR8E7FySXOKczLz5ontYpEb6z0xaONTs8z80pm+LqafQ5qa5Mi2V5/kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Lw0zyX3Q; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id EFC9A2C09AD;
	Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719192189;
	bh=wQ5+ZjJH1L5Cmj5ap3W708tiPoOChv3FK8WmdMcQVBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lw0zyX3QlA+Zn/L0EvXM/CDisg9xjexZctgNdR+v/A+Ct/Pl+TyEo+8RThWUoIu2V
	 othQeEkJOh6t+Pkz8LfoJWS7oQbxggz9HbEaRJZs0WvqD5HIS0mOESINgGTzwp9er7
	 Y/Jt8OzjKcMQdt66gZUsJV8ptsQyy9gMJdnjNrSWk0rHxKNGcoYRQoizxIQcOKrhXK
	 eYYm0OrqT0bILO8vU4osRbZVXpsJ2v6hpFIRNP9Gt9zPS/wadxBkX/qaQizEXk0QN+
	 Z9/nESzgjuuKE5fQwERNxJkH5c7+576Rco6NqpegTODpMIUAINNGhiMIGb9cfdsDoT
	 fxz9WXl9M0KFw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6678ca7d0005>; Mon, 24 Jun 2024 13:23:09 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 40B5A13EE6D;
	Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 3CA7F280AE5; Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	paulburton@kernel.org,
	peterz@infradead.org,
	mail@birger-koblitz.de,
	bert@biot.com,
	john@phrozen.org,
	sander@svanheule.net
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	kabel@kernel.org,
	ericwouds@gmail.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 5/8] dt-bindings: interrupt-controller: realtek,rtl-intc: Add rtl9300-intc
Date: Mon, 24 Jun 2024 13:22:57 +1200
Message-ID: <20240624012300.1713290-6-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
References: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6678ca7d a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=mHffw17e-fG4m7FRVmEA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a compatible string for the interrupt controller found on the
rtl930x SoCs. The interrupt controller has registers for VPE1 so these
are added as a second reg cell.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - Set reg:maxItems to 2 to allow for VPE1 registers on the rtl9300. A=
dd
      a condition to enforce the old limit on other SoCs.
    - Connor and Krzysztof offered acks on v1 but I think the changes her=
e
      are big enough to void those.

 .../interrupt-controller/realtek,rtl-intc.yaml  | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/realt=
ek,rtl-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller=
/realtek,rtl-intc.yaml
index fb5593724059..ff2f2acea87e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-=
intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-=
intc.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - realtek,rtl8380-intc
+              - realtek,rtl9300-intc
           - const: realtek,rtl-intc
       - const: realtek,rtl-intc
         deprecated: true
@@ -35,7 +36,8 @@ properties:
     const: 1
=20
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
=20
   interrupts:
     minItems: 1
@@ -71,6 +73,19 @@ allOf:
     else:
       required:
         - interrupts
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: realtek,rtl9300-intc
+    then:
+      properties:
+        reg:
+          maxItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
=20
 additionalProperties: false
=20
--=20
2.45.2


