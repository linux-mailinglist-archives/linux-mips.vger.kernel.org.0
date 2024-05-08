Return-Path: <linux-mips+bounces-3180-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 292478C0299
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 19:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1E92B221A4
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 17:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5653E7D41D;
	Wed,  8 May 2024 17:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evUMIUe6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9680A1C6AD;
	Wed,  8 May 2024 17:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715188063; cv=none; b=VUGHO7OmakkYwsKi4dCEnoNqP7L5yHL3X7sLXeDJshRzqWEzPb0bDcWkZpyVoyBG6YF8ugnkE7e9yOUYJaCxACNmOf5ho60Ia1YShgs3h8QLr7HM0lxGc5CMLbGjwW8Q+8qL7aad6QE8AzR4XX+qoVXgzszSMooSRRDTbGzI70Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715188063; c=relaxed/simple;
	bh=2eVIc5fENzwBpkSWOlgU3x7rjIxr/PGmEdNBNcr3/mc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcomcuV90JgIvevbnqO/PnsN52jBPgN9hl5J2jdfqoUsDLSCWbNsjXv3GchTq9tHiGsUqdrNE2YSYHT9+AGi+AYZaxt3b9VzAqOKMgWVDZzLVdHDuEsGRWzIzz4I5uEDu3R74ovdr279fH9cvRG+h/9TqykpUEleOvYavXdzQFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evUMIUe6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41b9dff6be8so30630285e9.3;
        Wed, 08 May 2024 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715188060; x=1715792860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkgFILkgy7MLxAkStpqBLvwqkrHzWtH9sQndAcpGnaM=;
        b=evUMIUe6RToO1qGXTLhkZlf1m1xkxIrTCfa0P7PtXS9VHtM9j0lXlP2gWASRMCGjFC
         voPFj8jMEgUpliX8Rnz1OlALJahtX9eTEZvBdyVVwUVfvujWFnMIq/qOIiv+qVvjFd6Q
         /8eobAoicFrMPdGFrRDQI6xAO42puEwjMp4vDSmFdQQ6SYQknCfOQtCoKYUlnmn/wjC5
         h/7c5YhvE2NpanBcoo2uooDyRuHOQfWXYZ4AmfLExL/RVnZWO4Q8FC2mhGurlqfLFZaT
         ZGt63AAt83jAwMttFzFtPFzKvGTR2XQby8Lpuzg+s91lae0I9DpbYfv7G0/cDVCnpeNr
         Lgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715188060; x=1715792860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkgFILkgy7MLxAkStpqBLvwqkrHzWtH9sQndAcpGnaM=;
        b=Khsb6xf0j63QLJmfyhWO+J7OttuElrem+7E1BVs4onZxDtHLP/aebeYRuzM1whpIQ8
         2FZ1sOl7aUtHE8jrHaIKhR+9tfsH7/91pPALhFt6IkapPYraDL9OKPdIZWuCNMNbOMYP
         qWkQVjIqrC6dTo27c8ip+GxfoznXe30tlyoTt4brflObdIJehS2ck3NKtTTR6xFI6/N8
         YB6rRnPMLxZisiSTHGm25QvDzOmX8ww4e+Wo46ghydMLLOJYr1/LhwDzmFs1/oA8ARvw
         T5iCK+4zS9yu+6wWGy0E5UWmHIAmv+n7kwxyJT+O3ihPilWtWlSOt7gCdvUUV6kGMH/u
         Et0w==
X-Forwarded-Encrypted: i=1; AJvYcCUdruS8MtK3gQkC1fV0Vo5wzTbxPWYBZlKRChV5qA/o1menC1qQWw6z/XK3rIwkX7KAxpRolhHa1hEXV73WfynCuWxYoIrlhI3ZMDOYVrliVeL05+1unywW0cnKTYEIWNp2As7r6UUOsjSqQv3tu31gjNaU4xEUBCgN0MgQkvj5B1ZVgbY=
X-Gm-Message-State: AOJu0YzGv5Ue/60HTVFtPLpQ31c1Zr9wavlYm2z91XVyH20Il+aCe/bu
	j9itugPrkoXwwVF6jUbBUHfxZPGmkQrMeNbY+ibzwbM9MTN9wPYh
X-Google-Smtp-Source: AGHT+IE6+rk2tEzYb9b+uOaIa7QyY4uRENUe/qjg9lxOUFSyP857cDP5AxqRbAFmt3RRGyuqrInLXg==
X-Received: by 2002:a05:600c:46ce:b0:41c:97e:2100 with SMTP id 5b1f17b1804b1-41f71ad1ea8mr27244935e9.3.1715188059832;
        Wed, 08 May 2024 10:07:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id fk12-20020a05600c0ccc00b0041c130520fbsm2921555wmb.46.2024.05.08.10.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 10:07:39 -0700 (PDT)
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
Subject: [PATCH v3 2/4] dt-bindings: mips: brcm: Document brcm,bmips-cbr-reg property
Date: Wed,  8 May 2024 19:07:18 +0200
Message-ID: <20240508170721.3023-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508170721.3023-1-ansuelsmth@gmail.com>
References: <20240508170721.3023-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document brcm,bmips-cbr-reg property.

Some SoC suffer from a BUG where read_c0_brcm_cbr() might return 0
if called from TP1. The CBR address is always the same on the SoC
hence it can be provided in DT to handle broken case where bootloader
doesn't init it or SMP where read_c0_brcm_cbr() returns 0 from TP1.

Usage of this property is to give an address also in these broken
configuration/bootloader.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/mips/brcm/soc.yaml    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
index 975945ca2888..77f73ab48c11 100644
--- a/Documentation/devicetree/bindings/mips/brcm/soc.yaml
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
@@ -55,6 +55,15 @@ properties:
          under the "cpus" node.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      brcm,bmips-cbr-reg:
+        description: Reference address of the CBR.
+          Some SoC suffer from a BUG where read_c0_brcm_cbr() might
+          return 0 if called from TP1. The CBR address is always the
+          same on the SoC hence it can be provided in DT to handle
+          broken case where bootloader doesn't initialise it or SMP
+          where read_c0_brcm_cbr() returns 0 from TP1.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
     patternProperties:
       "^cpu@[0-9]$":
         type: object
@@ -64,6 +73,20 @@ properties:
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


