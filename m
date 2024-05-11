Return-Path: <linux-mips+bounces-3235-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4288C317E
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 15:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25AB92820F4
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 13:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD4D524D7;
	Sat, 11 May 2024 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyMUOt4l"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B52551005;
	Sat, 11 May 2024 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715432653; cv=none; b=VabldPFpKgI6R0qVxA8dJ2SSPFTivg3WlzOv4b1x4mVGZECtt1pXW64U/GA+9B6lNQrtzQJ1ZLz6RzT3mYUEkLQnKF98DFgNgbkUBdXrbVMFt/zgjXMSQHykweRzj3rY285Eh51NLRbi7Jx9JI8qhmf7tLLo3cDhasUIhzyryl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715432653; c=relaxed/simple;
	bh=gv41QnGuL3jI/gVRVtnJx1R2yj7C3H+kX785mmi4vKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fu9jQn5zVQsnbb59iog0qzKiwhBgj/iNt9JfyreJT9SAb2qwRadKKWYVWXe36Yn6Bx5ZIYUwnbtc2Gx4iEF8Z14pqScRcvgVfNT+sGvYjdcQ8rw7lpds7y4GTmz1teZRSdpCRMuMsAjhoYZmSspFP712ULxnpS92G8HU8yh6Kz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyMUOt4l; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4200ee47de7so3826075e9.2;
        Sat, 11 May 2024 06:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715432650; x=1716037450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTcgQRsbJEb2Rnar/XuE9VELae9XVv3MdL87p5ovNkU=;
        b=fyMUOt4leRQvBRQ280+OEB4frCXW+zjUrP+hHH2il9XdOgAihUnzJv4f9HWEH3ttMk
         iIKe0DTVI6W9UjKdAMm/xyHtbNj/JxnwLNHYsPx9EOdtPLAGwzeI6bILupbj1GhT1qr2
         rjghwCOLdZb3mevU5czZ+mO/pxVtvENGzoqkOQ3akjFHT3DA4KJNjvAQn9fz8a/V5vr6
         nwWI4QWiGDSP7EDlhJeRmFjjgHJ4Qk+VOt8/SPbXwEhdRZHedGNV3+cY8BLMcng1Tr7v
         cZKx71SO2kfw+/P6yA4dJSFaPHvdkMa/fcnDkc8aAtdEVIVlDECGBAbbMZ4OSl7SWCWI
         NFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715432650; x=1716037450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTcgQRsbJEb2Rnar/XuE9VELae9XVv3MdL87p5ovNkU=;
        b=TWmWoY2uVSi5og8HE98WuEvh33M1OG4w3A8LsND1m5MKeW1iyr16P/L84d5UGPOMf6
         GfFslYgQ/EJYOKsf5ss/DcbK9ABoWLwTfYjZfnXlrKciTV/E0qrFLIQK93P7qDYkl7f+
         g1Js1Mv13qjOCW1yDK6Ikir1Mo0DVrFeyJ7An9Q7OdWxss0ZW9D8wHE0pph0Uy3Yk8H8
         VvKnNWbqu8PFtKmcwAFI79HuWXQ2RxJjD9M6r8bcYGEfqG34Tc1yEr63SxuwPnxXeHdi
         PCoKki46Cn5ZiAYVHS/BEfijdq7z+S5qctGz8sUO+DlOPH61WY2T++y5aaiZhCBW+ifN
         uCqg==
X-Forwarded-Encrypted: i=1; AJvYcCWLJfOG3E4EAKZQ4IgywuD6RIr0uacWh+odhDVuiDlaa/SjS/5mHNMKOkl+qHxz/vEMw+d38+C1RGzKZs0jJiHX9X+URj7SfyqtfTzC6qAk5Oyo1wq2e1+AuBAVKRbJEQdhWuO/EGiQU9XhJp3uSlGktErk1Av/LY7hVEj8mr6pVfsH6zY=
X-Gm-Message-State: AOJu0YzeOd/LOH48Q5uemLDx65UFIL4tDC453H82vW7kiLhT1YCXADw8
	ZuCAfAOgpeKHU2D30uc+tA+yoAd8MxucIeSt/Ctkp1xD6qUtRSQj
X-Google-Smtp-Source: AGHT+IE24mPtjzj/F9wod1AL9GtMA8zMb6O7tyNQp6M/AXNlr4c+qFI5OHx5ifPupKKK1NayapBrZA==
X-Received: by 2002:a05:600c:358d:b0:420:66e:f5c with SMTP id 5b1f17b1804b1-420066e0f77mr24934275e9.14.1715432650601;
        Sat, 11 May 2024 06:04:10 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42010ca475asm15995495e9.16.2024.05.11.06.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 06:04:10 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 2/4] dt-bindings: mips: brcm: Document brcm,bmips-cbr-reg property
Date: Sat, 11 May 2024 15:03:46 +0200
Message-ID: <20240511130349.23409-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240511130349.23409-1-ansuelsmth@gmail.com>
References: <20240511130349.23409-1-ansuelsmth@gmail.com>
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


