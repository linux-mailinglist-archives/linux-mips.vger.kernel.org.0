Return-Path: <linux-mips+bounces-9429-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2451AE0EA3
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 22:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8364E4A0EC6
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 20:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD7025A63D;
	Thu, 19 Jun 2025 20:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="AAFDsD/L"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A88235360
	for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 20:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750365311; cv=none; b=RE4dm0qM/nRcomlNuAWMijlb7Z9Ht05ILV9+L+r9eOMmG1hIlBwQSPO9ZByrtdCJ3QkNqgbw0omcfhQTIeUbDX0HMVFDJbhdptUfDD7CZjX7SaEmXZkIjoSVtc4BErq62mXTkOdKJVO9udUV7k0ozHhwBDxsjOoIKMzRjdLwWgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750365311; c=relaxed/simple;
	bh=rrfGu2LJ2OtClukFLaMz3OSuKDiHws16AVloKFF4QMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4VBFSzgI+TAWd1oJPCKMTKEwI0S2jRUfLZT8w7YjdlOH9zfPdM5ZVEvjIRpCY5IBnHf6gu07LY4cbkhWbG17Jx8IboBU/0D691fo+DpIoFCiPt0h7Yu3qXfR+FgwptRBVuKgjKn0Fk/vO678pyR3PZCPGwxBMOAE9CARojZP3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=AAFDsD/L; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a575a988f9so663888f8f.0
        for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 13:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750365307; x=1750970107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAkuvKt4GmTdddDvwdv65ZLH6rzPjmV6ItyguWkU8R4=;
        b=AAFDsD/Ln8oZzEmSVAEYcDrx7xQCHCbfXzgWB0i1XWOtPHGuiLwFrAH4T2gFIfyRz9
         TepGwRwKLyd/vYizG4n/kqzyqlvo740Sp0riqr0NDH/HqYETJ//O7j3Y7zWX3HfSkna3
         FonAvQS4/Vq5JC4dXTrfgX2VMDN+x1w62Ya7XKVJaVRbOb8k3Std6KkrKM8dp3E/CnKA
         MbZcZ3mZLfpm8ytwt6O/LdzskI8ReqAiL05w8u7sh7wMBsEpit2GRm92G+5zaqK8uQrf
         KEkkYJeNbLwnDW0vF65tL9F1sHDnDaKpC7WKRDKhhW8wpr4BxHUXO9+DYINh1QI1OqYF
         CgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750365307; x=1750970107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAkuvKt4GmTdddDvwdv65ZLH6rzPjmV6ItyguWkU8R4=;
        b=wtbT4giWuii6Cbq+pyoRCKtt4YKISRtrL1dcZrmMrxpdewcSYq8q+mGbf7C5qCqHIW
         Ofj41pjFNLBT+VSLcsP6ZNo7Twmb0HuQMHlkSMaKRkyA/hQZOTLK3jEmby/gV8pQclc+
         EpylEdLQ8o6AckoIKnqNohbAHp6XmldJfRd6NZUMeSKiTM5bimh5jR/HmmwdPDrazfiH
         7UJWqSHZ8FHuL+p950gC825Me4p5eXCWOCpy7XVT8ZRjsKLghSV9s/6apwXwrTaODmBa
         NRF9+8M2Q2sE7wAz0O5xihF1icf5YUpd/sglVxcDmHZZbfQc77eNnteipwg/KRTTNOrC
         Tn7A==
X-Gm-Message-State: AOJu0YxoV/3KgH41SCzOXZUFblrricxItZQZY7BYIlAlgQpIaOeRVfaY
	dkEWjoHf0HfT/Y/o48rXHXIJJxgYBeQpnbNB55kBvHLwInob7JxDLSssogysuQvCKBBT2y80mRL
	U/PUF
X-Gm-Gg: ASbGncveFOiBGeWKXIoK+2QDJEjVofys/YkPOcDz57ext8KLIV6fG5mTpE9k71EojCp
	gCeB/QVFkG3EfSTKpFnlGYvmQC49iT65ZZdBK+vOODr37G2uqSkH1R3nOfbdW6q55TDxhp8q7fm
	M2XqyjlT3URSq8AxPH6fvmzJjCeUoPlr6Zma7xZ1vT2BHhjX5p8fCaE7vED3LkDog+AzclUiU59
	BNwJE477mZ0Dv0uN7Vh27lFbcOQTMJUF7yjO9YXYD6C0wa11jbNyQ14P9Zde18E/IloddBRt5+M
	pxokG6xlv5SH+4jPnSOYi2L3/XuusXLJ2IiK6C455+Z2oKatrnWnBvcLoPW0
X-Google-Smtp-Source: AGHT+IFiOlWQHccx3sczvywuojxYkzALaOePe8U0tOZK9JIQ8cFpHKFFlZjdE0rk8sqfHs/6a7RyOQ==
X-Received: by 2002:a05:6000:2310:b0:3a4:f902:3845 with SMTP id ffacd0b85a97d-3a6d12a0a0cmr323025f8f.21.1750365306687;
        Thu, 19 Jun 2025 13:35:06 -0700 (PDT)
Received: from fraxinus.easyland ([2a02:16a:7402:0:a60c:e454:f09e:79d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1d91bsm288495f8f.42.2025.06.19.13.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 13:35:06 -0700 (PDT)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Reto Schneider <reto.schneider@husqvarnagroup.com>,
	Rob Herring <robh@kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: [PATCH v3 1/4] dt-bindings: clock: mediatek,mtmips-sysc: Adapt compatible for MT7688 boards
Date: Thu, 19 Jun 2025 22:34:59 +0200
Message-ID: <20250619203502.1293695-2-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619203502.1293695-1-ezra@easyb.ch>
References: <20250619203502.1293695-1-ezra@easyb.ch>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

As the MT7628 and MT7688 are identical in most respects, mt7628a.dtsi is
used for both SoCs. To prevent "Kernel panic - not syncing: unable to
get CPU clock, err=-2" and allow an MT7688-based board to boot, the
following must be allowed:

    compatible = "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";

Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
---
 .../bindings/clock/mediatek,mtmips-sysc.yaml  | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
index 83c1803ffd16..3fabaa8acc10 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
@@ -26,18 +26,21 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - ralink,mt7620-sysc
-          - ralink,mt7628-sysc
-          - ralink,mt7688-sysc
-          - ralink,rt2880-sysc
-          - ralink,rt3050-sysc
-          - ralink,rt3052-sysc
-          - ralink,rt3352-sysc
-          - ralink,rt3883-sysc
-          - ralink,rt5350-sysc
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - ralink,mt7620-sysc
+              - ralink,rt2880-sysc
+              - ralink,rt3050-sysc
+              - ralink,rt3052-sysc
+              - ralink,rt3352-sysc
+              - ralink,rt3883-sysc
+              - ralink,rt5350-sysc
+          - const: syscon
+      - items:
+          - const: ralink,mt7628-sysc
+          - const: ralink,mt7688-sysc
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.43.0


