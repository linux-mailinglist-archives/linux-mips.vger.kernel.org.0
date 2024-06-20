Return-Path: <linux-mips+bounces-3783-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C61E3910E9C
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 19:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 701CF1F22BD9
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 17:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF87C1B47CE;
	Thu, 20 Jun 2024 17:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gLR0Uf47"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1350A1B29BC;
	Thu, 20 Jun 2024 17:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904706; cv=none; b=uUQL4Csrd0Rh/8gE0AB6onN2yRLjAmxsD02aopxESHl8u3NnFBR0CiBnILlosqfTnJaHdOrNdIcA6ufDZn+KpMinLYIdm1Uq/faNS6ddRjXvX9LnGQQa7UBrh9zJV3WYeVAkZ34DXz56RxOaLKUPcpCFJn+zDwsFzIGajkRZjfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904706; c=relaxed/simple;
	bh=f4prdbODISVP5IgWhvHP57aG7DMF733IVMHNadX2TTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GkJtSTdI5KJfdbFIk242/p1BwUfvLex+MTuFKu+7ofkjf9SqjEbyU2YlvObOpclUZFPttJuzVB83/xyVzQmTU41/0TJh/EcQqUL65Y6T2VLoUi/1REMAHM/rzCjZNPfTpEfpMguX5li4mG9OE5ZZrVZtkcHMRr8IDKIV3FxBgNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gLR0Uf47; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 908F81C0005;
	Thu, 20 Jun 2024 17:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718904702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWDpGsl1SACX7oEjoSVfleYk6kOWYJEjB5tUkjVdnr8=;
	b=gLR0Uf47zoN1uvxHU8NRc7xWs5rTHCIyzhkVoh30rWA4SZQxir+r1FeU/Tqb0GYw1/uWob
	Z0sVmQLqEPPlKTOmMsMANc4Vv/LRfmofFlhcZG6OVluQ/qEwzsYO7fNBbYluk4vTw/mny5
	d6Cznxuq/5ISsr34rWKDzUOo3xq1ZyrXUM6WKX7Y32oQ2mINvUVFphZ4hrgzpQcrU6t4GI
	bG5bdBF+HH3Mt0HziQbGqUZFjQ+VIxDdu38DYJIjJT6izn8E6qnkB3xXi2FUrS/8DMFl3l
	uCzgkBl6W8dSzZ6uW2KFear5nF/kvrjZyS6/vnWCGmd/7jR5mne1g5IZGmThgg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 20 Jun 2024 19:30:54 +0200
Subject: [PATCH v3 2/9] Revert "dt-bindings: reset: mobileye,eyeq5-reset:
 add bindings"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240620-mbly-olb-v3-2-5f29f8ca289c@bootlin.com>
References: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
In-Reply-To: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: theo.lebrun@bootlin.com

Switch from one sub-node per functionality in the system-controller to a
single node representing the entire OLB instance. This is the
recommended approach for controllers handling many different
functionalities; it is a single controller and should be represented by
a single devicetree node.

The reset bindings is removed and all properties will be described by:
soc/mobileye/mobileye,eyeq5-olb.yaml

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 .../bindings/reset/mobileye,eyeq5-reset.yaml       | 43 ----------------------
 1 file changed, 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/mobileye,eyeq5-reset.yaml b/Documentation/devicetree/bindings/reset/mobileye,eyeq5-reset.yaml
deleted file mode 100644
index 062b4518347b..000000000000
--- a/Documentation/devicetree/bindings/reset/mobileye,eyeq5-reset.yaml
+++ /dev/null
@@ -1,43 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/reset/mobileye,eyeq5-reset.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mobileye EyeQ5 reset controller
-
-description:
-  The EyeQ5 reset driver handles three reset domains. Its registers live in a
-  shared region called OLB.
-
-maintainers:
-  - Grégory Clement <gregory.clement@bootlin.com>
-  - Théo Lebrun <theo.lebrun@bootlin.com>
-  - Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
-
-properties:
-  compatible:
-    const: mobileye,eyeq5-reset
-
-  reg:
-    maxItems: 3
-
-  reg-names:
-    items:
-      - const: d0
-      - const: d1
-      - const: d2
-
-  "#reset-cells":
-    const: 2
-    description:
-      The first cell is the domain (0 to 2 inclusive) and the second one is the
-      reset index inside that domain.
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - "#reset-cells"
-
-additionalProperties: false

-- 
2.45.2


