Return-Path: <linux-mips+bounces-14179-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE4ZI54h4WnMpQAAu9opvQ
	(envelope-from <linux-mips+bounces-14179-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 19:51:26 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEFF413533
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 19:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D344302EEE1
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 17:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5289302767;
	Thu, 16 Apr 2026 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Y1yHITel"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73091253340;
	Thu, 16 Apr 2026 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776361875; cv=none; b=d0WYoVNZJFFW4jo5znjue04xn+9oD7UUUAzIaZRiN774Gzf3Zq8oyBH06HNbDk1D72Jx0spP2+D3HNK9u/TQJNGg44YPxIdhLubi4z4/2E/VFw2vCI/zMzKZbJryk+oIt/3qCz0T0VOXWSoCus8dI3P3fCpePaBSXBqD1BgUxDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776361875; c=relaxed/simple;
	bh=LlTdgu7xpklfNJdbjEayTPx4kyGDXyAve+dyGyQtu2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FlcPed9/K/hlwbp3ngWITLN6P555R0PwuSEB2J1sIFlaGfDiZ2neVwmY9ZwEcG+sSPdG1uRkr/fN6TEJc0cuNGmyme21KKblMt4ZokYdSsq5jQzJGT9l9DPf6IN+qq9D4fzGkHyaPJ2lpvBhvYkCPy5yZB7talY8KXI4F0Rgg+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Y1yHITel; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1049FD412;
	Thu, 16 Apr 2026 19:51:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1776361867; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=AxfSVxs5649KBWpRUEZiLQP9o0YA4S8QqYmLn9Xyq2A=;
	b=Y1yHITelWp6jVww88es0vS1HHRoeFYM90+RfYNqr1HFn5MuzOAfDE0f5tTlXQtcXbwrpJ9
	xj2mFsC49ZipYZLkIrer+MeOHr51xI4bQIVEaZeBm7eqeug0dxR0WhenrhGLam9cSvu0ee
	Up+KCOLptCs5c/uC6ux3jX+VuVhajdbhyeFPHmO3ZJTVRQRUPjnnOKl/DwxURZtoRWMyyt
	VEzB2uHZPHP6CQM65ECbrthuZzI1UIlj8OB3Erho7Yc6f8K790JNrEcyYw+XvSxn00S25s
	2FZGG8yF9U+Q4RhvlIOqPWEkFTTAotYE0kP/ltZmRKa33bJhJe3ZP94Lsfc+9w==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com,
	daniel.lezcano@kernel.org,
	tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 1/2] dt-bindings: timer: econet: Update EN751627 for multi-IRQ
Date: Thu, 16 Apr 2026 17:51:00 +0000
Message-Id: <20260416175101.958073-2-cjd@cjdns.fr>
In-Reply-To: <20260416175101.958073-1-cjd@cjdns.fr>
References: <20260416175101.958073-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,cjdns.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14179-lists,linux-mips=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1fbf0400:email]
X-Rspamd-Queue-Id: ABEFF413533
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From conception, this driver supported EN751627 as it is the same
hardware that is used in EN751221. However, it was expected that
EN751627 would use a percpu IRQ as does EN751221, this is how it
works in vendor code. However upon finding that the "mti,gic" intc
works on EN751627 with no modification - but it provides a unique
interrupt per-timer, it is deemed best to make this driver use
multiple IRQs when on the EN751627 platform.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../bindings/timer/econet,en751221-timer.yaml    | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
index c1e7c2b6afde..f338739e039c 100644
--- a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
@@ -28,8 +28,8 @@ properties:
     maxItems: 2
 
   interrupts:
-    maxItems: 1
-    description: A percpu-devid timer interrupt shared across CPUs.
+    minItems: 1
+    maxItems: 4
 
   clocks:
     maxItems: 1
@@ -52,21 +52,31 @@ allOf:
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
         compatible = "econet,en751627-timer", "econet,en751221-timer";
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


