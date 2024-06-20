Return-Path: <linux-mips+bounces-3775-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A2910CE5
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC4541C2099E
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 16:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5581B4C2C;
	Thu, 20 Jun 2024 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODz+tOV1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBBF1B47BD;
	Thu, 20 Jun 2024 16:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718900763; cv=none; b=uIVZvepj+DyrFTkcto/pBNodAOUyn9jDHjjs/hEfqCE1t2wbvmSONUmuaLqSm/GRCJvsou3El6HArODqV3iqPQMbmJIT+vLUm1ycXYTsbAjQ+4h1p5Ilz26zQ+Yri0QReADmRJDJw3aF0e/izaAWJFXrRZChIgdptEs7NcFjJ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718900763; c=relaxed/simple;
	bh=xa/rJ0W9g4WnZPqsmGSDIBguUyf+x7l8jPjS4shUrK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W2OrorNwSyXwf3hs7+YFr9t15tdVd8hVHx1znU3C36wSnSVZYpnUR3g/vP6qrbmw3b2C3WDTqf3ZtfzRDnQ5O9+vMRmXh3MvYBnTDd6cx2xF/lf+fBP2LT2sN/v/MPacx36v1UWze3L0XmvHCLqGkQku/xfm5EIX7iZgs2eA/28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODz+tOV1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-361b376236fso785676f8f.3;
        Thu, 20 Jun 2024 09:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718900760; x=1719505560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tARMvhp/3+4yUpmQw4gHYcaHmKej4UxBMTwUpRUahB8=;
        b=ODz+tOV1KLtdSujalzipBedc24UZcKt5aSEhypDCCnXVo0dGwZaGSJ8gFHkNzZWPgN
         N25i4beJlAwsiP5h0DHor7byS9pOfgHb3+sbJYVdLUIFAUWN9vdTjZCVfawBsOIKcply
         7Lv5P/C3hNxzbuEcvnR7zDHJciiAqKKmz3XIPTXTTo1qQE8ERUf+8kiJouNM9gZ6I6nI
         fYqVR0LLIrFNVPu9E2PLGgxwYdjurtzkYqICEz4mmt/BsOcG1TsfVabZi0hU8v4KFgQE
         ItZLjQIc2sJaAEX9C3xtskwcwkX6XDBTOG0btULv8ZX6EaUbwdnhD1rb4F32Dr8QPQcD
         0UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718900760; x=1719505560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tARMvhp/3+4yUpmQw4gHYcaHmKej4UxBMTwUpRUahB8=;
        b=r05qQVSlNYgicI5fgznudn0OhNJ+8K68AU+OUI4WQwDIWls7TFlXCeRuwsuRLNq2Gs
         Rq5V4qZO3iEGBBtMHPYwXfeFG+jPgoXkRsGMf8kkiPCxbAzEVG2j5iGZUU+XFjRh5dGD
         +CSFoedtYP/ywrOUKxulDk03N4y3MER+C35ULfMdOKA37Dh2SfYPb/FJh9aDf006LFj4
         MxwQ7WaWl9Lw6kC/pohsZbLexIpkVU7JgfJ8bmAxaNGbBImRuZIq1Wn9bV0hggyTl+/h
         L9RUpLZ9iJEX5S6CenCzc3jXFEtw0PheFxv5r2Hn8IGq+vm4sbTMuvhQfisqO9AK7J89
         Pd8g==
X-Forwarded-Encrypted: i=1; AJvYcCVrw0ALTGUOinqWDDrAoz+IcLpm2weK6oc1PVy7/470yDVVhzeL1OMENr70vEenAmWbTB0DokkLwlujW6Hm8M27CRjeJAj32Upn4wmFIV9+aMeyrmSihkqMlH5BH3XyniysaZNL3GIxNfuw343pGhudwTZBy0VimBuvuZMubGTi32MkyjI=
X-Gm-Message-State: AOJu0YxrKsxA1oc4OFlyERir6N7oKxDwdid8RgF8cZN/BFIR2znMj6yo
	gHkPiv5G5vEk8Ebkk4bn8A7h8qDnTEwZyP9pDOPytcrL2AqvBlXtQ48UFw==
X-Google-Smtp-Source: AGHT+IFfziVs3sUKCwVyhIJSw7mLrcdyfeNsA7t9xHJ5//gJLVKS3FrJeL7m13qrlmnuwMY5xp4sHA==
X-Received: by 2002:a5d:694d:0:b0:362:a01:5f1 with SMTP id ffacd0b85a97d-36319c718dcmr4227577f8f.70.1718900759989;
        Thu, 20 Jun 2024 09:25:59 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-362c7c2dffdsm6277480f8f.35.2024.06.20.09.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 09:25:59 -0700 (PDT)
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
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 2/4] dt-bindings: mips: brcm: Document brcm,bmips-cbr-reg property
Date: Thu, 20 Jun 2024 17:26:43 +0200
Message-ID: <20240620152649.994-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240620152649.994-1-ansuelsmth@gmail.com>
References: <20240620152649.994-1-ansuelsmth@gmail.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
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
2.45.1


