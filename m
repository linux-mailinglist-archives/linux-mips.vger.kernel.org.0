Return-Path: <linux-mips+bounces-3193-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D87428C17DE
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 22:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15CDC1C21989
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 20:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8513B84D08;
	Thu,  9 May 2024 20:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVYe2zXv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38FC8061D;
	Thu,  9 May 2024 20:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715287688; cv=none; b=L8TDTY9RWVEzQpMXkhAhnjCS+fEHdTKn285JuyBIVC5HHAHesgl+Ca3JO4ifk6/7/2+XFOHwBbFFEGsb2fAqytvLz0bygi5AYxMzKog+PlkTdiuK11drLqn2Mr02pj7rBdDylvK2TWjeDJnMbU4Aqoy3jTnnOMUjVOEV46nKzfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715287688; c=relaxed/simple;
	bh=hhTWC8Y72QSXbJSR3al1BFLjfwhW4I8p9tc9X6Bap0Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AdbYWCf9Ewg+g54TxdsiIMIk3rh3EicVbkeZ9D8L41LyKOLyaRx4XPJGXgHFIv9ckyVi+NBUip3/XNVfk1JtHFieigbrnwXd+8aqcUnqOcA1EwvQ6V08q+HHCOr1N2TBErKRiRl5npXDN78gJf3PqGUcndoXoYlvUH4yicUA2c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVYe2zXv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-34f7d8bfaa0so958670f8f.0;
        Thu, 09 May 2024 13:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715287685; x=1715892485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxBYL8hPiYuGvO7wM7WBFjD6QAKSzvV2spQbRu/WWcY=;
        b=iVYe2zXviQZRCGvyDpN9hzDjfTSoTyk+8yF05nVeN/KlIcSAEfplEDLTTZuft9yaxc
         JdB8J3LmASZHkr1S5uvTL9E/Imax485C4YoUisl85xPEmXmoPbppJiVsd0di1wUskq9a
         k4nXnbSrdwHWpSHmjfDW4JKvQnJJ4Hr3VQne8hhNCaxKlBdVtralLrbeOk7IAP4LmdHN
         cKUdi3TgSkOWeiKg1NmWTtRvPzI3zkDn05CdkLvIOqD/aKb6xe3WoEFVQU4MdSFeiliJ
         Q4FijYWU9B++7c/C9qU6JEa/T2bJ8RlRVjwVd+JnOrD/lMyq3QouD4lNDm9tdehze1bO
         Beng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715287685; x=1715892485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxBYL8hPiYuGvO7wM7WBFjD6QAKSzvV2spQbRu/WWcY=;
        b=M5u7Im2oRvYro1NzOI/VUR/S7Vw7NxwI/ZStKfePHhP15bvUfVcc22cbEpYQYYq6gy
         4sniUlTn/oESB06xI5Zi6sKflPfp0KUtKdR+6kR8aY7pE+6Bwpi2/eREcl2P74GdbZCD
         QNJaTmEsCqCGsE8StlW8A1+dbQgEOym1zk6Ozg3rQJraKXBOR2Fh3xS6IjR69DYgmgA/
         CSO0O+rN9ErQjFg2+YZ4R3Sj67xYs8CmpzH6bND8/Y9hnWiT0oGnjGt9jWS1g3QccsHG
         k348i0gR+iL6o0kBT3kvzzjg2FFJlBUhnx9JC8F815VbKLw1I9+cmXQ2KH+ZXuV25shj
         dGcA==
X-Forwarded-Encrypted: i=1; AJvYcCWfGvHI3c4PxjhssqDNav8AAymKNo09dZFEjV/1k7KL3fGgAMZXuUIPbggKVjI2aHYJ+jOm6s5ajmGZr9jSXmcN0ysfFplDzm7eCIzdx+OAM9P3Z/Lj3kd/3EREy8BXKIJg0yMs+LXaxO+ujJh8O29hFk6HSNvPHRdb6eyQ1MYy9BBLjds=
X-Gm-Message-State: AOJu0YyOdBKPNHSO7VhKNyB04qHAEhLbMwLxcUUrVWjFiGNA/FB0M68f
	kiTWcnp5AsjPS8re5UX6csOegF3+/b5o0tjQed1yrOtPC85CWfhi
X-Google-Smtp-Source: AGHT+IHUYyhL1kCaBzIhl+J+cuRyggDpmVXaTwl9Ced++yLxB7yXS+THe3F32XsIfIzBp/t/b/kYyg==
X-Received: by 2002:adf:fc89:0:b0:34f:feb2:c9aa with SMTP id ffacd0b85a97d-3504a9694e7mr456318f8f.47.1715287685037;
        Thu, 09 May 2024 13:48:05 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3502bbbbf08sm2588185f8f.96.2024.05.09.13.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 13:48:04 -0700 (PDT)
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
Subject: [PATCH v4 2/4] dt-bindings: mips: brcm: Document brcm,bmips-cbr-reg property
Date: Thu,  9 May 2024 22:47:46 +0200
Message-ID: <20240509204750.1538-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240509204750.1538-1-ansuelsmth@gmail.com>
References: <20240509204750.1538-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document brcm,bmips-cbr-reg property.

Some SoC suffer from a BUG where CBR(Core Base Register)
address might badly/never inizialized by the Bootloader or
reaching it from co-processor registers if the system
boots from secondary CPU results in invalid address.

The CBR address is always the same on the SoC.

Usage of this property is to give an address also in these broken
configuration/bootloader.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/mips/brcm/soc.yaml    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
index 975945ca2888..6b961b62aff2 100644
--- a/Documentation/devicetree/bindings/mips/brcm/soc.yaml
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
@@ -55,6 +55,16 @@ properties:
          under the "cpus" node.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      brcm,bmips-cbr-reg:
+        description: Reference address of the CBR.
+          Some SoC suffer from a BUG where CBR(Core Base Register)
+          address might badly/never inizialized by the Bootloader or
+          reaching it from co-processor registers if the system
+          boots from secondary CPU results in invalid address.
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


