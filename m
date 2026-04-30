Return-Path: <linux-mips+bounces-14400-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLIiCjZ082nQ2wEAu9opvQ
	(envelope-from <linux-mips+bounces-14400-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 17:24:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 238144A4AB1
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 17:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8AB073069273
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 15:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C02472784;
	Thu, 30 Apr 2026 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="bQwd7/HN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA4E2E11DC;
	Thu, 30 Apr 2026 15:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777561711; cv=none; b=TPkaKyjzHsmpDW0bo1mV46mbN9LPFK98X8Cabuf+x2uzE9lMnq0X8F7/GFFxBD3FVnxNL+H1obFx/Fz1nGUqQqbb8lUJmhOa7jDgXEl1B1LNAmKcfRSy3dndx3RnvgxhiTDXPUeGElwFXVVIKJQbK5oGA7+bTd1LLEr7WW4ibig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777561711; c=relaxed/simple;
	bh=cOGzrvBieFnQ/f22HmbHKcPDCO4/gRdkv6dlyUbwMz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AsjzoIBYHKrWffESP+mBtoqmlb6kJ6+GYGgGdE19TobI+qZVdlaGGNLHlBN2kvNd4Nct9XigU6BuudVMGXuAf3Btvpeyu7j5MZVZnhnlSY0xP2vuMBVW6VmoXAmc4yz5mstmlenUGmBNue5OusxJeCd5Ec67wl74qQJbTdw09rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=bQwd7/HN; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D43A26F923;
	Thu, 30 Apr 2026 17:08:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1777561701; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ruLltXiItUNLs8wclsgxiGVNA+0wjR4TM+gWMSrLDcM=;
	b=bQwd7/HN8lFPLFYeUVlOVCZO90/6kWdCG6F/2aCXSK4YTI+jy4uWyY1KoFs63ZsOQUjKBJ
	b9kglcJIojN6aWFuH10sOSpQJO+MjMiI/q0O6gHTSE1e19OZCnrr7MfDYG2OAIH/QLlYtF
	VmIMFSChkNTEyW6LiEWasQ8Z254rNnuwoUzq2vmw0KI41DY5qPJiFHG6Vd8AT6oxnRCppD
	kyk4wn9vYmNwr4UzCYiHkNHKehwMnc8QUwM1qEuAJJd8GQUbX/gTVRyVYtHpmotikDTWPA
	T/cDAHYGMWvDg+k1dvoKRxDmzwSyFEFHyyheoulWrku3kaksujps6AGgLhhSbg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v2 1/2] dt-bindings: interrupt-controller: econet: Add CPU interrupt mapping
Date: Thu, 30 Apr 2026 15:08:08 +0000
Message-Id: <20260430150809.1827881-2-cjd@cjdns.fr>
In-Reply-To: <20260430150809.1827881-1-cjd@cjdns.fr>
References: <20260430150809.1827881-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 238144A4AB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14400-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:email,cjdns.fr:dkim,cjdns.fr:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

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


