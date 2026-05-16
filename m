Return-Path: <linux-mips+bounces-14609-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAEuElDoCGp4+gMAu9opvQ
	(envelope-from <linux-mips+bounces-14609-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2026 23:57:36 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B304655DFD1
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2026 23:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DB2F301485F
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2026 21:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550E438656D;
	Sat, 16 May 2026 21:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Fjivqysl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61B72236F7;
	Sat, 16 May 2026 21:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778968652; cv=none; b=V4qnyMH7IrBv677rTuFfiY+zolBXVygg8YMr3hZO3VjQM94gtgqfdDnu0si2ZKZllUVBMi8gAuWEvenHy2YoUC14vZ9NseMjQ0vXuOBaR99wCiy2WHQ4ttSvPo4BQhQacsPwTdZfFHWTTKSf+IHnfiICwhe9Yfh3dPoyPvHQ8EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778968652; c=relaxed/simple;
	bh=4AHVPOm7Ty5OQDgZI6VyLTMWXgglLaOgL2pOBQiHUM0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NU2JK04pnbGWF25BLC7Yf3W23H57QBfE8agko0pA+pPej7vv88TV7GKJw/GG8YDUoF7i4Teeie6RR/bkNnyJYQWyKZFa06VF2E0ScgWrDmNGwegg7lHahMz9NQKabati37FRXSs7Kk8W08GgMiFXRel311pFVLxb/Wg84TWYTSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Fjivqysl; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F7E13FA12B;
	Sat, 16 May 2026 23:57:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778968648; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GHkeIisOHTKNaeFYyyTywb9lsuelDoJrv0RnP6LCepo=;
	b=Fjivqysltti9GfGzX6HINw04golNoBfoyr4xvWDWKTbe/7TA6pEl34it85XVpKWml4V42Y
	avYBntZfOBOZl9rXHL29M4EDLoXeQctJP9DEbpQDZA/DB/ZtS2PmUhKXZHGCdPmjUDf2Xe
	NA+mMBscYCqWs+NuxD1j0za61ITaqRqA8tam3aLH8d/zAANI4t8lA0OiY7tVzples/wKtK
	wH+U4lnfPsMDXTaoflofekk4HIabRmcnb0AOMEwYEJOAxpT+GJMDHI0TD4lZS5XXfYNUS2
	xzca4p8ngG4vt10a025RG+3DFoNiVdcaMaFpbjMisYL78rTyu3J3YUyMrJc+LQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org,
	daniel.lezcano@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	naseefkm@gmail.com,
	robh@kernel.org,
	tglx@kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/4] dt-bindings: timer: econet: Update EN751627 for multi-IRQ
Date: Sat, 16 May 2026 21:57:17 +0000
Message-Id: <20260516215720.4160831-2-cjd@cjdns.fr>
In-Reply-To: <20260516215720.4160831-1-cjd@cjdns.fr>
References: <20260516215720.4160831-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: B304655DFD1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,cjdns.fr,microchip.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14609-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cjdns.fr:email,cjdns.fr:mid,cjdns.fr:dkim]
X-Rspamd-Action: no action

This hardware is found in the EN751221 SoC family as well as the
EN751627. The former uses a percpu IRQ for all timers while the
latter uses an individual IRQ number per timer.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/timer/econet,en751221-timer.yaml | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
index c1e7c2b6afde..16f32741473f 100644
--- a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
@@ -12,8 +12,9 @@ maintainers:
 description:
   The EcoNet High Precision Timer (HPT) is a timer peripheral found in various
   EcoNet SoCs, including the EN751221 and EN751627 families. It provides per-VPE
-  count/compare registers and a per-CPU control register, with a single interrupt
-  line using a percpu-devid interrupt mechanism.
+  count/compare registers and a per-CPU control register. On EN751221 it uses a
+  single interrupt line using a percpu-devid interrupt mechanism, and on
+  EN751627 it uses an interrupt per VPE.
 
 properties:
   compatible:
@@ -28,8 +29,8 @@ properties:
     maxItems: 2
 
   interrupts:
-    maxItems: 1
-    description: A percpu-devid timer interrupt shared across CPUs.
+    minItems: 1
+    maxItems: 4
 
   clocks:
     maxItems: 1
@@ -52,21 +53,31 @@ allOf:
           items:
             - description: VPE timers 0 and 1
             - description: VPE timers 2 and 3
+        interrupts:
+          description: An interrupt for each timer (one per VPE)
+          minItems: 4
     else:
       properties:
         reg:
           items:
             - description: VPE timers 0 and 1
+        interrupts:
+          description: A percpu-devid timer interrupt shared across timers
+          maxItems: 1
 
 additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
     timer@1fbf0400 {
-        compatible = "econet,en751627-timer", "econet,en751221-timer";
+        compatible = "econet,en751627-timer";
         reg = <0x1fbf0400 0x100>, <0x1fbe0000 0x100>;
         interrupt-parent = <&intc>;
-        interrupts = <30>;
+        interrupts = <GIC_SHARED 30 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 29 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 37 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 36 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&hpt_clock>;
     };
   - |
-- 
2.39.5


