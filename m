Return-Path: <linux-mips+bounces-7460-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A967A121FC
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 12:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9765B188DC61
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 11:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621E2212B24;
	Wed, 15 Jan 2025 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fs9LPIZe"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D9B1E9915;
	Wed, 15 Jan 2025 11:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736938992; cv=none; b=LGSOzZFgOdPObPQn4nDuigtldjdyILxP5J/fmiHq6y1XlQozHPDv5ZR3lhgYFEtkHDNxhdyRorSj8jNAblkG3xcgufY3+D78JhGI/pKFHKat5gY8mrM2qvssk05kXPBT5q4RQj/n3Yw+XLEpnZ/l0nmLI1rIGpA5BgkkubOwk74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736938992; c=relaxed/simple;
	bh=AXY2pqOXfNjpLgRM81yWCwViVwuzN4z80XQbuR3cZYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6K474b1yXtswU6vxMw75/TKr4mcIKvmgoOA9AiMgvdbrvFI5TOvH1ObfLAcr0p6cOF+ESoTS8jzOnHLLozMYW070h5MnzRrwahAXmgBOyRpYn8ADA4Q2DZBiEGgl/sxmibAza5jsU4wlraejjVbF8TyCttUC1ss55X+aqS/5Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fs9LPIZe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C542C4CEE6;
	Wed, 15 Jan 2025 11:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736938991;
	bh=AXY2pqOXfNjpLgRM81yWCwViVwuzN4z80XQbuR3cZYY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Fs9LPIZeHu9OnNOWFEJnrE/n2SdTpzsD73W3TT4Qlx7ya+WiSrNlUyZEq42yBfNWX
	 jgLpI6HCyO1aLMEJ2+AKjeQmmvSRhKKF7nPAc3eV6gFmvTCyKurJXxsPUsp3+5CG/Q
	 6Y9dXEuxUvIP4zyre/HQ40K8OIBmLIjMUpdD0brnlSSx8pZEWvymZFysbNVFAMaeY4
	 kIsSnkBbh82tZpxm1evvbtVYwHVyA3/lOZONU3REcnjl52Pm6nuWiDnKPmc1HoI3GZ
	 guUDv+KpQsgReB3V1x8wilIRbu2PJrhvb5cW+Jl8iFvkrdvKZWjmbuu884KuotSF2Q
	 ieLWfhvf1wDhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F09CC02183;
	Wed, 15 Jan 2025 11:03:11 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 15 Jan 2025 19:03:08 +0800
Subject: [PATCH 2/4] ASoC: dt-bindings: Add Realtek ALC203 Codec
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-loongson1-ac97-v1-2-2087b04dcd7f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736938989; l=1261;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=RCYZ5LwKO9wo5eHWNA2+bL7kJQC8yTwQR/Y3fcfAXio=;
 b=W3ztVz5GeNHcTQgp9c+Ac07IJ+el8Q2afuKTc7RmJnXeWuVnE2RXiTOWWrV5cPCdZ2JaOD91T
 +l0p7EjqdnaBHZkGCeSGIMZ3gyWCCXvYMiOiVXaX12jdkMkq5JF6f5P
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
 .../devicetree/bindings/sound/realtek,alc203.yaml  | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,alc203.yaml b/Documentation/devicetree/bindings/sound/realtek,alc203.yaml
new file mode 100644
index 000000000000..5be8e9ee1ed4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,alc203.yaml
@@ -0,0 +1,33 @@
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



