Return-Path: <linux-mips+bounces-14412-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE92OtWH82mL4wEAu9opvQ
	(envelope-from <linux-mips+bounces-14412-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 18:48:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5984A5FBA
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 18:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 942FE308C43A
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 16:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C24478E25;
	Thu, 30 Apr 2026 16:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Jei/RnPB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC2E477E32;
	Thu, 30 Apr 2026 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567330; cv=none; b=q8VQ2tssDClSEQFI7ihWEniyvq3g3vW1A+SV0rtx+qpvlhwuIuuQWNQpW9oYU3uG6KzuXOsmm/iDlGAmkmc8QsTQn4emfmb+Y4hlJh0i3eGtWcUcbss2iSWoN7jzOb4UwCvSgQmqYu5tTYHR9qYtDoUdvEDdR31hTxq+1dPfUhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567330; c=relaxed/simple;
	bh=cOGzrvBieFnQ/f22HmbHKcPDCO4/gRdkv6dlyUbwMz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d515U4tF42rCLR5HHPLBhdlL+e45s9KRpjWGZZWANv6Ybissii4aqCSPMTsGJQEHfq4mEJkwqMsdM9bE56aQieepVKScdghssiiB68wajVSc34sEPFAgpWGvlqufCqyd5AQuFYpuezof012S4cguXbO2sKdjlIDyocDEzoUoB/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Jei/RnPB; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 799A527440D;
	Thu, 30 Apr 2026 18:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1777567322; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ruLltXiItUNLs8wclsgxiGVNA+0wjR4TM+gWMSrLDcM=;
	b=Jei/RnPB1A7fUAhdkYQTgBLKKWgee8c3iZxfV9zngsSwZseYCGPwNj8g1s1N8jLAqXYSk8
	fgpffjzAhO3ebxRIfH1enZGN12tyJvI0rrjNTqJaTBQjeft/3H8Qpa22Z4389TLmRI1bPU
	BYHezKRZ1YwP2TmvShB80ADCHOa2wCnW9UKrl4nisPIEAxmI91ek74ohcJHK1QbiQ7trw3
	9QtgxMuQdFwViRnHDKGzcBZGnddKykjYhaKxruj66RJGHu2hvFDe/lefABaoxJVJ8r00lp
	OATL54JmZeG8yc7ffk/OEOwNsCdK5PMynmhQHhKWOaELerP7iW8d/r4FeXVz8g==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 1/2] dt-bindings: interrupt-controller: econet: Add CPU interrupt mapping
Date: Thu, 30 Apr 2026 16:41:56 +0000
Message-Id: <20260430164157.6026-2-cjd@cjdns.fr>
In-Reply-To: <20260430164157.6026-1-cjd@cjdns.fr>
References: <20260430164157.6026-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 9E5984A5FBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14412-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:email,cjdns.fr:dkim,cjdns.fr:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

In MIPS VEIC mode (Vectored External Interrupt Controller), the
hardware stops directly dispatching CPU interrupts such as IPIs or CPU
performance counters, and instead it communicates them to the external
interrupt controller (the hardware described here) which prioritizes,
renumbers, and integrates them with its own hardware interrupt pins.
Interrupts from the external controller are then dispatched through a
different method via a dispatch table. In effect, the external
controller subsumes the CPU controller and becomes the root.

34K Manual (MD00534) Section 6.3.1.3 rev 1.13 page 136

Since there are interrupts which ought to be controlled by the CPU
controller driver - particularly the IPI interrupts - we create a
reverse mapping where those interrupts may be sent back to the CPU
intc when they are received. This maintains the fiction that there is
still a hierarchy, and keeps the DT the same no matter whether the
processor is in VEIC mode or not. The econet,cpu-interrupt-map is
optional and if omitted, it's assumed that no interrupts need to be
mapped.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../econet,en751221-intc.yaml                 | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
index 5536319c49c3..44c09785e6bb 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
@@ -52,6 +52,25 @@ properties:
         - description: primary per-CPU IRQ
         - description: shadow IRQ number
 
+  econet,cpu-interrupt-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description:
+      When running in VEIC mode, the hardware re-routes interrupts from the
+      CPU interrupt controller core to the "external" interrupt controller
+      (this device). It then prioritizes them and sends them back to the CPU
+      along with its own interrupts. The CPU hardware handles interrupts using
+      a special dispatch table (the normal interrupt handler is not invoked).
+      In this interrupt controller, the CPU interrupts are renumbered as they
+      are merged with this controller's own hardware interrupts.
+
+      This is the inverse of an interrupt-map, mapping which interrupts from
+      this controller must be routed back to the CPU interrupt domain for
+      correct handling there.
+    items:
+      items:
+        - description: The interrupt number as received in this controller
+        - description: The interrupt number to be dispatched on the CPU intc
+
 required:
   - compatible
   - reg
@@ -74,5 +93,6 @@ examples:
         interrupts = <2>;
 
         econet,shadow-interrupts = <7 2>, <8 3>, <13 12>, <30 29>;
+        econet,cpu-interrupt-map = <7 0>, <8 1>;
     };
 ...
-- 
2.39.5


