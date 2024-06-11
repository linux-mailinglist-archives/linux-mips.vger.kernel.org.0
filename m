Return-Path: <linux-mips+bounces-3568-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 202F2903A2B
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1FF6B230DC
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A7317C205;
	Tue, 11 Jun 2024 11:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QN4UGpph"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240A017B432;
	Tue, 11 Jun 2024 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105541; cv=none; b=HDzaZFF8StPG8vNyAxlHw5LyiCuqd8A0C5zBf1oz4YWx1tyBHBPcAdSsfJZaRIAhl5sMi4xb1ZsDLjvltCVoD0muc8YjB4rtI1iA2HklYn5/idWSAqossdBCmvMIrOCLnE+On6tgw17zXvVFZjBaX3i11AhAWPIUr/wsE/k7ces=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105541; c=relaxed/simple;
	bh=gv41QnGuL3jI/gVRVtnJx1R2yj7C3H+kX785mmi4vKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VpTOa3H1pAVe3KZ4F06bBoZ3FcNasx/QMoXt1torWu67zx+iKh/XX91WG/n12/ZE+U5LwGeEmjID72+BnZA5P8U7TZiNkzfGWxKHsz0Q49+PFqgbaLIuBfRmzCvPQlKZGr4plXBevs2Q4n1gruYOtrQjZN0u7E2Pj3qvnasKA/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QN4UGpph; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so108615261fa.0;
        Tue, 11 Jun 2024 04:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718105538; x=1718710338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTcgQRsbJEb2Rnar/XuE9VELae9XVv3MdL87p5ovNkU=;
        b=QN4UGpphMgQeoRL7jYmMnAoi7YmFwYyENl48C2LEkwIggDGE27lsG7SfPWlj+xb0o+
         q146fKSa/o7WrDUQm37PF5b6NgC994Ic+qHDWAf8Bxv9ve27AAWhBTJxhQVirgsbQx3y
         9neoSz1nU6fhtHnG4+Zbcw6msNQXvtvXnIxdz/Z3gSJ6CRQuiTRujcXWflQo7B/urJ5a
         C3gWxpmLsePEHDxaiM7syoXK9VOTFQtj071jZJhMRJ/7AvKKnQ66CpgL0TY+fpihgAOV
         1B9KcZoj8P27Flm73QrOQZedd+fwCXo9WyK1/pY5myIZn7eQGvuy2cWITlv7HWkukJXq
         BkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105538; x=1718710338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTcgQRsbJEb2Rnar/XuE9VELae9XVv3MdL87p5ovNkU=;
        b=eMbUtjb57pQb9f7RUUG4ivYWzHKZddMLKmRgYnQfdhtvFAG4d1c9wgSl5Cbv5g2m94
         CAgkMr2jmX+NXLoYuviaC+X+9AYut2TlGThU2omOitO0x+Ix9Hq9uEdfr4r1Xn8A215k
         0jhDoUhyFfZD0aTGXNi7VvuEuQCDH971mWchOmMcmCmb80VKGbdJ2NSBWte05tBpNiNf
         oRMi9RK+WapI1RxPZCTB/JWR4En8P4T/QOiMEj2G2bzz9HKlMGvt7QjZ+PJ2wgPGVByZ
         GNZKg7ImDTU2HTad+wRBwQB4lskhNBvE2FCfOm0/5ZvDm0TMKHpNlLu1c62yPzxfST3B
         jI0g==
X-Forwarded-Encrypted: i=1; AJvYcCWI5rlkA+B3BhK1tCvU7d1FrT7RU/hOLKAKyNEkTNbXE9dF9BcFbSoOTEsI6I87Y1Ig0lNDtlqZUozycsKzj+j7ELC7aG1segZUdqcvqcB98TgPHADQx1kIvNnIpn1b/LjHkRE1y2VIPD2WT88z3CFprLuyFu3FVDkMTEtLKYj3XlIaiJA=
X-Gm-Message-State: AOJu0YxQqR3QxkGTFnQMZa22nj/fzOvA/LtcPeL6wqfa1lPCfjq3nt9n
	t0ExzF3wd+dLTpH4zSGv/tJrMHOFie/4RimhWQdQcAnsNuyhS73p
X-Google-Smtp-Source: AGHT+IEXq1yuRAnXyUBpgYoMbndq1AzH96Xgtj1NJLXOb5I98HHRuDqTssxZikN/xDiSziax3zcFig==
X-Received: by 2002:a2e:a418:0:b0:2eb:e7dd:1f88 with SMTP id 38308e7fff4ca-2ebe7dd2244mr42073671fa.25.1718105537886;
        Tue, 11 Jun 2024 04:32:17 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4227467990csm2473505e9.1.2024.06.11.04.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:32:17 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 3/5] dt-bindings: mips: brcm: Document brcm,bmips-cbr-reg property
Date: Tue, 11 Jun 2024 13:32:06 +0200
Message-ID: <20240611113209.8142-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611113209.8142-1-ansuelsmth@gmail.com>
References: <20240611113209.8142-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document brcm,bmips-cbr-reg property.

Some SoC suffer from a BUG where CBR(Core Base Register)
address might be badly or never initialized by the Bootloader
or reading it from co-processor registers, if the system boots
from secondary CPU, results in invalid address.

The CBR address is always the same on the SoC.

Usage of this property is to give an address also in these broken
configuration/bootloader.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/mips/brcm/soc.yaml    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
index 975945ca2888..0cc634482a6a 100644
--- a/Documentation/devicetree/bindings/mips/brcm/soc.yaml
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
@@ -55,6 +55,16 @@ properties:
          under the "cpus" node.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      brcm,bmips-cbr-reg:
+        description: Reference address of the CBR.
+          Some SoC suffer from a BUG where CBR(Core Base Register)
+          address might be badly or never initialized by the Bootloader
+          or reading it from co-processor registers, if the system boots
+          from secondary CPU, results in invalid address.
+          The CBR address is always the same on the SoC hence it
+          can be provided in DT to handle these broken case.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
     patternProperties:
       "^cpu@[0-9]$":
         type: object
@@ -64,6 +74,20 @@ properties:
     required:
       - mips-hpt-frequency
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - brcm,bcm6358
+          - brcm,bcm6368
+
+then:
+  properties:
+    cpus:
+      required:
+        - brcm,bmips-cbr-reg
+
 additionalProperties: true
 
 examples:
-- 
2.43.0


