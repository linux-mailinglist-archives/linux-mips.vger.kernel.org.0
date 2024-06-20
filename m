Return-Path: <linux-mips+bounces-3782-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F70910E96
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 19:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0C8F1F2341C
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 17:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3691C1B47A9;
	Thu, 20 Jun 2024 17:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jezLSFXZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CAB1B0115;
	Thu, 20 Jun 2024 17:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904706; cv=none; b=GiXic8z61xXib2SZgU0CkUdvJqNDmazaJRMOKWgxR1j8XQl3XqrIB3x8J2bQ7iQEp+Ubb1vZQ+C2dUkUaQ3+ZM0Q6uTwKH8PYRBli8LTtYZorwEZWbFwHKYyDAF/yJ75v9Y3VTBxvJK/I3ukmCVn8qvQbFeZrYJbrC+j96IKdqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904706; c=relaxed/simple;
	bh=7evSdNdfksg2ZhHrFJaFdIcdcFVuxjES7X/b71KMnxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oJZl3WPr/hrfYvme4UjicGg3YnM5lJKVdoKMPIN2ZiZp3bn9pHtgF53WuqK6SzAc1SKrFZAGyAdn4PaEtp4g4rxrRF+bmWG6CzFP92g9R9EkuMiKCp6BZHVgdA6+agtfYJP5arjki+/BaUZyMt9klaBTYKvhjSYkzXKRKhRMWvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jezLSFXZ; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BEA21C0004;
	Thu, 20 Jun 2024 17:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718904701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nGe7ZIxhTrUnLPx+BN4mjE44wlAohcewppaRa9xD4qA=;
	b=jezLSFXZWhWTpieKxaVt425ZwmDKwetPtpG8PLvc1ltklIKCqPohw2ikHrkCHck5it4SWr
	NIc/ToiemGZ6ZhaLBdGHmjH1ajmq32msq84hvDN8sjERPjwLY0DkVlclnujIWOtk6u/yXE
	wF2VWCj82710wTXuavNm0DwaN0sjWPfho/MzBN8o6c1cc7usASqldkwCP78h1SISZqt5Xs
	ZuZcJftSA1af708WoYu9UGgYtNdPUDpmCrJLUipFuLkJSku9hi7a4EL8GM0esQyI9Uq9Hc
	PM9Ri/dkBY3rhjw75DxNyKSjPb8PvKe3Im2nJ705uKwMPJ6IQDtzdzNzh3bfdA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 20 Jun 2024 19:30:53 +0200
Subject: [PATCH v3 1/9] Revert "dt-bindings: clock: mobileye,eyeq5-clk: add
 bindings"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240620-mbly-olb-v3-1-5f29f8ca289c@bootlin.com>
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

The clock bindings is removed and all properties will be described by:
soc/mobileye/mobileye,eyeq5-olb.yaml

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 .../bindings/clock/mobileye,eyeq5-clk.yaml         | 51 ----------------------
 1 file changed, 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mobileye,eyeq5-clk.yaml b/Documentation/devicetree/bindings/clock/mobileye,eyeq5-clk.yaml
deleted file mode 100644
index 2d4f2cde1e58..000000000000
--- a/Documentation/devicetree/bindings/clock/mobileye,eyeq5-clk.yaml
+++ /dev/null
@@ -1,51 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/mobileye,eyeq5-clk.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mobileye EyeQ5 clock controller
-
-description:
-  The EyeQ5 clock controller handles 10 read-only PLLs derived from the main
-  crystal clock. It also exposes one divider clock, a child of one of the PLLs.
-  Its registers live in a shared region called OLB.
-
-maintainers:
-  - Grégory Clement <gregory.clement@bootlin.com>
-  - Théo Lebrun <theo.lebrun@bootlin.com>
-  - Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
-
-properties:
-  compatible:
-    const: mobileye,eyeq5-clk
-
-  reg:
-    maxItems: 2
-
-  reg-names:
-    items:
-      - const: plls
-      - const: ospi
-
-  "#clock-cells":
-    const: 1
-
-  clocks:
-    maxItems: 1
-    description:
-      Input parent clock to all PLLs. Expected to be the main crystal.
-
-  clock-names:
-    items:
-      - const: ref
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - "#clock-cells"
-  - clocks
-  - clock-names
-
-additionalProperties: false

-- 
2.45.2


