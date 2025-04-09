Return-Path: <linux-mips+bounces-8525-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE220A8220A
	for <lists+linux-mips@lfdr.de>; Wed,  9 Apr 2025 12:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8CAC1BA049E
	for <lists+linux-mips@lfdr.de>; Wed,  9 Apr 2025 10:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A53225D917;
	Wed,  9 Apr 2025 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALQ21rtC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3434125D902;
	Wed,  9 Apr 2025 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194600; cv=none; b=NH+kX8XajhyKz5vGSq5oiwZ8+Kh/QxYMCo7qg8RnxCITtXMdQRBP8PoO6f2zsr2rC3avKObLI5kzfo8hEkRoZN1Qa9XUCJiaL6TnCLjwM7NeNKbZHjSITrOqowXIcHtJWJcF1XEIvGoBM3HiWcqcTqlOhP1XH+hcUFX32RAOPWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194600; c=relaxed/simple;
	bh=/0CqusxdTosY+7jmlkvRfHoOXqcAy++TyFyAO2t0MA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBN6yjdo2AC6NLMwsPvByITwcNEAGGsI+utoLLZAH3UK1caoirIMjlTkawq8TXxqYG++45/uNUT9SsrnvPBlX74c0m+8e0ioo5gEq1WqokNrkr6DyN65xije5zNjGzQ1JF9jnjrSSHPFwWyH7jpMqH8LKnOx29K9Sz/cEQmcxUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALQ21rtC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB250C4CEEB;
	Wed,  9 Apr 2025 10:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744194599;
	bh=/0CqusxdTosY+7jmlkvRfHoOXqcAy++TyFyAO2t0MA0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ALQ21rtCqvoiGi2Lln17KIZxUFg0R1PJzyqgHQsrpnfKpdf3UHNz1klHgfW3PyILu
	 3CTPVrIHV7/HOsTa78pwK1WG2PJctlTz+2CFQgHk0TNqTo/Wglx2novPHkoFxaKGMH
	 yUnrwY8/IY+/SyqGD+J26+RQ0qNaFYLa5+oX0+DR02xq1D5gOm2jxKqUTSTsFDxPQv
	 LAi510Iedygc9Chw/c98jvKRBi6ySHAXFhWdVZKWiHkhJazaTRv8J6Y4//DhgbYAsl
	 HQfeL2Pkh7OUmeCV/5Mw8gMEQoFKfb7vI+DcxgBFIXWKz0vUDWmGyQ2KzBMrhAhopk
	 Of87DrNxaQx4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C7FC369A2;
	Wed,  9 Apr 2025 10:29:59 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 09 Apr 2025 18:29:31 +0800
Subject: [PATCH v2 1/4] ASoC: dt-bindings: Add Loongson-1 AC97 Controller
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-loongson1-ac97-v2-1-65d5db96a046@gmail.com>
References: <20250409-loongson1-ac97-v2-0-65d5db96a046@gmail.com>
In-Reply-To: <20250409-loongson1-ac97-v2-0-65d5db96a046@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-mips@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744194597; l=2137;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=P1S4AuhzoXKqy79wJB2DjJNFjHpZ3nLQ0TPqe3hAemY=;
 b=nk5jaD70Ua88bs3L6xEm+55oKBloApPqbJfXiqfyyoxgswnxaU80LvjzS4RVZaVGRB3uxzG3Q
 NCGiEaFRqkIDJ2BbCqWGaG+TBFO1npkc57NGR35Gy6/F3iCPDQFXFFy
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Add devicetree binding document for Loongson-1 AC97 controller.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 .../bindings/sound/loongson,ls1b-ac97.yaml         | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/loongson,ls1b-ac97.yaml b/Documentation/devicetree/bindings/sound/loongson,ls1b-ac97.yaml
new file mode 100644
index 000000000000..1c6a2771f942
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/loongson,ls1b-ac97.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/loongson,ls1b-ac97.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson-1 AC97 Controller
+
+maintainers:
+  - Keguang Zhang <keguang.zhang@gmail.com>
+
+description:
+  The Loongson-1 AC97 controller supports 2-channel stereo output and input.
+  It is paired with the DMA engine to handle playback and capture functions.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: loongson,ls1b-ac97
+      - items:
+          - enum:
+              - loongson,ls1a-ac97
+              - loongson,ls1c-ac97
+          - const: loongson,ls1b-ac97
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: ac97
+      - const: audio-tx
+      - const: audio-rx
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - dmas
+  - dma-names
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    audio-controller@1fe74000 {
+        compatible = "loongson,ls1b-ac97";
+        reg = <0x1fe74000 0x60>, <0x1fe72420 0x4>, <0x1fe74c4c 0x4>;
+        reg-names = "ac97", "audio-tx", "audio-rx";
+        dmas = <&dma 1>, <&dma 2>;
+        dma-names = "tx", "rx";
+        #sound-dai-cells = <0>;
+    };

-- 
2.43.0



