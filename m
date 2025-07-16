Return-Path: <linux-mips+bounces-9828-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 44723B074AB
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 13:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B348A7A8545
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 11:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF422F3C1D;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0V8x6cz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CEA2F2C6C;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665139; cv=none; b=cPg46l4VRW5uInSAOCljGmFHplrlYmrytZ+xRImwF6bxyblqLinpnjx7jb3ZR5+rswwtKfCMSx028ks694f7BQmWYUWz+RIMY0gSHNOSt4RUKozrjBZFUvE/pqyJWkxpSKxcdYtWojEVLIWNpT2v5MBcfNe9PcEQMmMdQMB3SBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665139; c=relaxed/simple;
	bh=Vaq9rhbacIRpTCnVQQj4hQmXZaQtOw8bPik8zKW7I9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bDd/xgGik2ZP2XwwaAr98/aNm7toER4/BY//3DxyMgz3qJm0Oc8ucAZEyFk+ht+zP5DlYRU6zg/Nm688QTJGdVFsFMELDF7ugHuYXQ4QTaa3OGTywvFZx6NRj/gtwhu1rBQ7afsZINx4OJHV36FTh7XIP9TydpaLCUFIQb5tPb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0V8x6cz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC68FC4CEF4;
	Wed, 16 Jul 2025 11:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752665139;
	bh=Vaq9rhbacIRpTCnVQQj4hQmXZaQtOw8bPik8zKW7I9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H0V8x6czYfuEaG/HxBtUgIOLQ0u4mgoKSCqApKtLMmUedwcPv2ZCB91NQJfHYVPG9
	 9exeRpjZD0kViMgd2uwxVxAJwQ9xDfkJw131VtU1zCNCQN137K9Vp9BIOYLTZXIX65
	 wX1ybxzQC2VyDRui6bbDYatI4hFSuNH3hxRysY1zX0LH1xdzPKsfwuaf0w2SI+Vpmg
	 rf/+5RkBjBGmcxGDn7B3kivBFk3DnAvWJYy4ngqot7MsPtpJk/KKTUi7rucyTYAJWk
	 8oawkL5Ds5XXT7oEdN45w4tnrH3FtZFkd6kn7DNB173KRwOmvjKlNThSb8T3lX8oLu
	 wQO7+nMK3faqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC28FC83F22;
	Wed, 16 Jul 2025 11:25:38 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 16 Jul 2025 19:25:10 +0800
Subject: [PATCH v3 1/9] dt-bindings: mips: loongson: Add LS1B-DEMO and
 CQ-T300B
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-loongson1-arch-v3-1-d160974d696b@gmail.com>
References: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
In-Reply-To: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752665136; l=1139;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=BeFER/OTjUaBJU4oGgkzvKA9dNM7aAK4NJf5Ys8zrbg=;
 b=6NcprzyhHtqouLOk+dmcRREh3edSDZAcjjBl2aMyHDjb9/mrxGkh8j+6ktAKFqM1XO8mV5tnh
 4pXNBMzYFGsBf/Wq3+LlQy+c7NVgPC1kxfbjklAk69d3hGjDc51WCPM
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Document two Loongson-1 boards:
 - loongson,ls1b-demo: a board based on Loongson-1B
 - loongson,cq-t300b: a board based on Loongson-1C

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 Documentation/devicetree/bindings/mips/loongson/devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
index 099e40e1482d..ca66bc49c2d6 100644
--- a/Documentation/devicetree/bindings/mips/loongson/devices.yaml
+++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
@@ -40,6 +40,7 @@ properties:
       - description: LS1B based boards
         items:
           - enum:
+              - loongson,ls1b-demo
               - loongson,lsgz-1b-dev
           - const: loongson,ls1b
 
@@ -47,6 +48,7 @@ properties:
         items:
           - enum:
               - loongmasses,smartloong-1c
+              - loongson,cq-t300b
           - const: loongson,ls1c
 
 additionalProperties: true

-- 
2.43.0



