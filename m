Return-Path: <linux-mips+bounces-8528-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DFBA82215
	for <lists+linux-mips@lfdr.de>; Wed,  9 Apr 2025 12:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84F724A6B04
	for <lists+linux-mips@lfdr.de>; Wed,  9 Apr 2025 10:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD8425DAF4;
	Wed,  9 Apr 2025 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4MnY6+4"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6110C25D906;
	Wed,  9 Apr 2025 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194600; cv=none; b=NH23zH8Wh3xNYqK7LA82GYH5uhWUAeNnZWP8/jjyBdjSrjL23Y+i9Cqxx0lAc423weSDTzJHEeY75V2xZwljdU2/lc8Ndjw4Bhthucmr0vI3Vb/7uhS29H+B5oF3WmlgFr2eHHWtEDAFiYDpHFm2ueFFFHLJm+DfrcFCHHPSvF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194600; c=relaxed/simple;
	bh=DmaRNEqkn33tK1KyhWscuMaW0CDgFKlbhAXbdO81nrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BrQI1Tn80iIzWGhmzzL2S47KZ3wqA8zJMKW8Hp7yBA4Uq5qaXFzrFGvMW0GQ2m/yn1t+pB1lwXFfeyFggrahEWC0E7gkvrSBtIKb7VFnB+FAzQARIhLRQapZGXuSdMvDWXBCYFirgSKoTux5vE0djQQRvwCWS5SjDYlNCScqtQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4MnY6+4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C84CEC4CEE9;
	Wed,  9 Apr 2025 10:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744194599;
	bh=DmaRNEqkn33tK1KyhWscuMaW0CDgFKlbhAXbdO81nrY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=E4MnY6+42NV8ZU+ectuR9ulv6U+fJ40wxKsFvpOuGvhDvM1xNbsKoaynb00QkgNG+
	 wQFE9kstdwpcICNdDuT8Jyk0PBZ2Mf28l0Q4xbfK57i3xPevo1kALXx8jiDWi3DNHL
	 FekAH3Jlnf6vOtRWDHMe8P/ZL5pZSvTSVKckJXFw8sLMiYPYTbkxecfrZVQBwCrmj1
	 hT+qsfoM3GnaZ2nf7BNxMJHZ6uQpbHb33TWYNq+//YLoVX8QKJCiQLuMV2wwLxq0hV
	 IcBR6ncybYHMW/ZNSl0PvA7f8LFzhXQogKcDbVBy+vETnPx3yeRY0UX6XNMI9pOZ8P
	 zszDVUZxgX5og==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7371C36002;
	Wed,  9 Apr 2025 10:29:59 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 09 Apr 2025 18:29:32 +0800
Subject: [PATCH v2 2/4] ASoC: dt-bindings: Add Realtek ALC203 Codec
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-loongson1-ac97-v2-2-65d5db96a046@gmail.com>
References: <20250409-loongson1-ac97-v2-0-65d5db96a046@gmail.com>
In-Reply-To: <20250409-loongson1-ac97-v2-0-65d5db96a046@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-mips@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744194597; l=1302;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=h9YvTw5F9Wtnl599wtDrdz0c30PdvsfKgqV7k12OPHw=;
 b=mI0wZTnHtMEM3KavyZiCrK3UKfE0HfwHt0VSNTwz7agWTw+g+M28Ss3AM+OVn6rW7+S497Pv9
 hvrPgUoehc0Cp5l2XI7gUTi8IL2ayB51NQma8yP1bAxAlEvuv5jpCzr
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Add devicetree binding document for Realtek ALC203 codec.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 .../devicetree/bindings/sound/realtek,alc203.yaml  | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,alc203.yaml b/Documentation/devicetree/bindings/sound/realtek,alc203.yaml
new file mode 100644
index 000000000000..6b90788b45eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,alc203.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/realtek,alc203.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek ALC203 AC97 Audio Codec
+
+maintainers:
+  - Keguang Zhang <keguang.zhang@gmail.com>
+
+description:
+  ALC203 is a full duplex AC97 2.3 compatible stereo audio codec.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: realtek,alc203
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    audio-codec {
+        compatible = "realtek,alc203";
+        #sound-dai-cells = <0>;
+    };

-- 
2.43.0



