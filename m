Return-Path: <linux-mips+bounces-11819-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88351BF7AD6
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 18:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4949618C7728
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 16:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831F034EEE0;
	Tue, 21 Oct 2025 16:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dd2WKl4r"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7829A34DB7A
	for <linux-mips@vger.kernel.org>; Tue, 21 Oct 2025 16:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761064394; cv=none; b=mRWzJNsXLfWWLkDpfFdqvFD2T/dtdwJDKsj3aHkcm9YQ4d3xf7uq2mKeD+WOtnd4hBjnnYEJeCXon1AqHsHRxfmGCYlni5N55aTXPMK08CKTOfdLylC0QNQREmvEXeXvGGFjkcQ+xaR+oL09vdTDph4wXC/qHKQv+3y/oUkY73g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761064394; c=relaxed/simple;
	bh=k4MMwotRueKQ73IFVBunfx4WBg3XwCGO4UhdsRh7hww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qn10JfWT+g7DjHQJTphwxwbXHK4UI8rkjOjikqxZzX448FUtrkGqe3us3QHevEcggkgLAZMmirRLFuDxOh4atUXhK4kATk8qkMP1t/D7BrerUfvWoufLO4rzz/RCv3UCdk/dO0PRXVpc7INeUGMLmIXfQWae+tBM9H+dAEKgYIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dd2WKl4r; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CB177C0B897;
	Tue, 21 Oct 2025 16:32:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66D0460680;
	Tue, 21 Oct 2025 16:33:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3030F102F2405;
	Tue, 21 Oct 2025 18:33:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761064388; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L/XpHoQ2KPQc9riZ+r/LMfIVvh/XodPx0VGR9VmHzQ0=;
	b=dd2WKl4rlX7iuNhneCMwl8/nGilha0A6oGI+pLtSZKJzGZRFeYUyZnpqOB9uBhZ2Aegwee
	FYSAzU+yRZcfq/RU0ZriMlXqtD0aNxcf4erzxc0wrUnFnCcWXfwYF6Z7at63J+0UnFyzDw
	AEvdOE2zCuZEg+ZmUaAX/+/oaaL/XedOyMV1M2AIPDliW0HK+b2lRy6aDJNWOmWBVYJDm9
	ZDa5cGU5rKh/T5heRPKK4ZGfLiTNTAhnbWNCDIVmL5FQj9n6IL4UVPlcQbwZaJufYUpSac
	J+zemdnErjqGuFG73uRCBlqLJlWyF+eO2ka4Ei9j11+TagCvmYxLXlo62RFyfQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 21 Oct 2025 18:32:42 +0200
Subject: [PATCH net-next 01/12] dt-bindings: net: cdns,macb: add Mobileye
 EyeQ5 ethernet interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251021-macb-eyeq5-v1-1-3b0b5a9d2f85@bootlin.com>
References: <20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com>
In-Reply-To: <20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add "cdns,eyeq5-gem" as compatible for the integrated GEM block inside
Mobileye EyeQ5 SoCs. It is different from other compatibles in two main
ways: (1) it requires a generic PHY and (2) it is better to keep TCP
Segmentation Offload (TSO) disabled.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 Documentation/devicetree/bindings/net/cdns,macb.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
index 02f14a0b72f9..ea8337846ab2 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -57,6 +57,7 @@ properties:
           - cdns,np4-macb             # NP4 SoC devices
           - microchip,sama7g5-emac    # Microchip SAMA7G5 ethernet interface
           - microchip,sama7g5-gem     # Microchip SAMA7G5 gigabit ethernet interface
+          - mobileye,eyeq5-gem        # Mobileye EyeQ5 SoCs
           - raspberrypi,rp1-gem       # Raspberry Pi RP1 gigabit ethernet interface
           - sifive,fu540-c000-gem     # SiFive FU540-C000 SoC
 
@@ -183,6 +184,15 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mobileye,eyeq5-gem
+    then:
+      required:
+        - phys
+
 unevaluatedProperties: false
 
 examples:

-- 
2.51.1


