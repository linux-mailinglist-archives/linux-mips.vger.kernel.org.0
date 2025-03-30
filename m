Return-Path: <linux-mips+bounces-8407-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FF2A75B22
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 19:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 355187A39C0
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 17:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC101DB377;
	Sun, 30 Mar 2025 17:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="s8IiOi/G"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F02A1D88D7;
	Sun, 30 Mar 2025 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743354228; cv=none; b=Go1ptnb1Lj7JMG/EPx22njp0v8DmvqpVVuC/EgbwZM5CtVtF2k4B6+1uxO35EYyth8x2AQdURdtxh5xKXbWyhjiPWkQ/hge2R0jemOGWAiVspkKhjmfTEX826U1flHF3lqEgcHYlVQoQhAR4LrPx7Gvc6x+TULQzqTUj0Xn1Oyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743354228; c=relaxed/simple;
	bh=oNRaRLnfBnb1ZW6aGxeeGzxFOjGDwmSQYzr1X70JYlw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mi3ab3P5ZpFzmXAxi4o/dMKV7NmlpNxWn8qmMRvkPFPqutjdhwSabe+tVc9E5oF+My9PiHcFRzdS0gjQ+ELWeCheRHKEYRKhjxN+Z4O+EvyhC8mctD1AxahpyH12y89Sq7lNKWC5MZRj2D34Z6JJYzCMjExOrq/pUoMjlcwAHi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=s8IiOi/G; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D82782FA7DC;
	Sun, 30 Mar 2025 19:03:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354218; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=xKEBoXrCiMWH3OKIjSGQxmpl36DpxjBdQvVyTSGdPlc=;
	b=s8IiOi/GgrcHrUA/t0GlzR9VBCXstrqTZTxwDSzMPJEUfI7SDS/opH1WqBgRwxSlkQZopB
	fZueoo+4GziA7+NarQK2gKXrpgC8wvrBRmA+94ESQAWT3I2bUeMR4xwufRosjuM5XThEJX
	gBkYxj4nOI4oVapaqyL93IAebfPU55iyjwD1AxHU2uCywLZHXfOBNyrfwR/6TC6I2A9vpX
	xw5xzm/hLS+mjMrFowwYcdrncopodvLoWEhhoUK+6ifXjrTdA8GbEZJsZfCziLzIorybY3
	IYuFntXpvbD+8QCYbVdBzHsiidk4aLpyiKtqL3i/96Sr25Te84pix80Ht01/3w==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 01/10] dt-bindings: vendor-prefixes: Add EcoNet
Date: Sun, 30 Mar 2025 17:02:57 +0000
Message-Id: <20250330170306.2584136-2-cjd@cjdns.fr>
In-Reply-To: <20250330170306.2584136-1-cjd@cjdns.fr>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add the "econet" vendor prefix for SoC maker

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d1..371f6bb81f81 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -428,6 +428,8 @@ patternProperties:
     description: EBV Elektronik
   "^eckelmann,.*":
     description: Eckelmann AG
+  "^econet,.*":
+    description: EcoNet (HK) Limited
   "^edgeble,.*":
     description: Edgeble AI Technologies Pvt. Ltd.
   "^edimax,.*":
-- 
2.39.5


