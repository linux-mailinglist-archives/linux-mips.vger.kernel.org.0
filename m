Return-Path: <linux-mips+bounces-7457-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2499A12200
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 12:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66417162982
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 11:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103141E98F2;
	Wed, 15 Jan 2025 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n36KLwX1"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D458B1DB15D;
	Wed, 15 Jan 2025 11:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736938992; cv=none; b=u0O0cQhIDZq/Ro+p9jLYxQL59L5W+SYzhu1TE1YpG/4DCp4uIJZu1lcb05tTW/R4kwiV6q4rocdJveAHcsM4netYNMp/Fr7ugFInJWdFQ+yoHCaysB+yNZWh5Ty+U3Z0ahlMzDBewEqacSC1ZGsm0HkKEhFHO+7Rq4cMQKvzQsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736938992; c=relaxed/simple;
	bh=QKENepp+rlSH6WZ4tcGtMCN8Ho7Wn7/+o8HWHt/jW5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YxVezltpXJA9CLLtQ/39PRiq4hunHSehL0XqduCzC0pxTpb7v/plWx2vsvg/BUmsSfZDhu3H0IPtQOWFmotR7ajwEFBbH9xUcgMaSKA7J1sgEb8DU6xDQigtb31Mb2PYDJX9V/CRt55ePw1PiK4ZN+ZUgs8xNEHolTwKQA8U6P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n36KLwX1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 842C3C4CEE2;
	Wed, 15 Jan 2025 11:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736938991;
	bh=QKENepp+rlSH6WZ4tcGtMCN8Ho7Wn7/+o8HWHt/jW5w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n36KLwX1I6vwAHq0TnDlA6mqqqnPY8FNk0pSluum+3cchJbYP2VFJyoPjGtUkBnW/
	 X+V3wLKlK8Oc+lPbmk4KbdB7Z/x7O2lOVFG0l6A2D8ipLvLsYFT6S2O0b9PBl43nHg
	 7neSvSemgAVTYBydTrcsHeG1TPBnpkWj4YQmDgoKLblUCDAdryJlsaWM1OKhtqKDK9
	 VKOm0ouDHgfHz+wGEwrivZSGTiaV1EIrqqvP5+KrgKot10RU7D3K1m7m+KYkJlK/OC
	 L38H/zV1ZQL25+6K41BHaRg2IWeryzAoYFQhwPv9Td4TV/yXKG+k8k8jDlPpas7uaI
	 vtVPPIbupJkpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721D6C02185;
	Wed, 15 Jan 2025 11:03:11 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 15 Jan 2025 19:03:07 +0800
Subject: [PATCH 1/4] ASoC: dt-bindings: Add Loongson-1 AC97 Controller
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-loongson1-ac97-v1-1-2087b04dcd7f@gmail.com>
References: <20250115-loongson1-ac97-v1-0-2087b04dcd7f@gmail.com>
In-Reply-To: <20250115-loongson1-ac97-v1-0-2087b04dcd7f@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-mips@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736938989; l=2085;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=sj9gFgnj3eTfVF3m8C07vZrwbwVlXrglvLvbMnZ9jsI=;
 b=xIA/2qQqzVoEkunR/DFz1G4Zb+2kfDoAPliIuHYfHCLR2MfwsA+4jjLa7IX8iWby9ThVmDwdb
 5xsGMr9QsW7Cit8s1ma6T6KsZQ7XHbmBYSLh+9IcFwc9cFhJMhUKJeB
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Add devicetree binding document for Loongson-1 AC97 controller.

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



