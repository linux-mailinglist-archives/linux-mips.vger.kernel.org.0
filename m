Return-Path: <linux-mips+bounces-3574-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA4B903A7C
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 345E11F24A27
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B9E17D354;
	Tue, 11 Jun 2024 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRM+dW2A"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA69B17D34B;
	Tue, 11 Jun 2024 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105768; cv=none; b=rJxrD6n9X3Qz2WQ/4fWJM9BN9ecjwwI+0wHfkEGyWGAXwy719nDB1T96jm5De4cmYWUkw+asO4L9cx4a3igolsajQG4+9Xe0T2zqitDCzivPu9cm+JqqoFUNWc1uE5sOjtZ/3zLTIDWCu4qBBT7l0CPcTCi7cOv6udISK7TeALo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105768; c=relaxed/simple;
	bh=h+vhXAhkOCpSj5Kv8dcb58y7LBKSabqi9wb7z+oKe4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UdE4Kzpxa6Z8aXR0qfcT+1l3XPx0PbGcBwXtB39KwGAv8VcxKBGxY2OtV5DYMjDUjaP6swzTT9osjKdDlX4rURS6XcxvWqacwOpDBvqAjQlMmhPkcqnoYzxarvuZiy0wHqkOREFn2V7lsry9HtsM2Rqky7//6LBPnZA4eucL9N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRM+dW2A; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2c2ecbc109fso2194255a91.1;
        Tue, 11 Jun 2024 04:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718105766; x=1718710566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtbIuDbi1rFp385y8o4NUYKHVeIOAyZ2XdjR6SSW7u0=;
        b=NRM+dW2AjGpItINxXwdXZHvZvCwZUkhwR1SFwn9UFfnufAbAdBvQsWGcF1JvOa2W5i
         99ATOJH+Nu1ThgttrEiQvsr9NFt/6J+uM1dDtQWqGmy17v2bCErH1p9VEUBKU9sZnon8
         sCZCgP41dA41DSHc6zfsavMsEx72aA+Bk+sNKrsE8FJoCqCzsaAqUdZwBZh9St2fAVv6
         HToxQxU1CzrdUSLw/VdKhe8E9ErbR6RzRuGMi2gguO8zmCGNa329v9WdoNIV3StMQ7m6
         n5a+poCDNoYRG/7O/I32fRJNcONB3XrZ1iztVqdmqMmuTjv3PaKJl8E827z3X1NCPwRx
         VQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105766; x=1718710566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CtbIuDbi1rFp385y8o4NUYKHVeIOAyZ2XdjR6SSW7u0=;
        b=TUeNjeIiA2kUuRBE2fJMbGGvYQycDhZnlTS0kfX9LmFdcRFQeo0uilYuIlZjP2w3j3
         e8ecBKzQrsaWQL0ESNJh0BS/Nk87c8lb5TANYjC5XE7dE6H5fhfAKp8w8QNtmkIdUAg5
         a9ZjTw/S0i4fsKAcFmuQk8SiVh/dbWMbrTyFntFsa19Q9gILy08cM5eusMfz+zK9GRqW
         0BOzPZqt+u9Ws6bknI5N5BG14wxFE43Q4z+/zqOR9iJyY0cDOaKJeqFZjN2HrljbOf89
         FqhQhNz9oJzWoNrk9gXrDwva/oWCslJGq+daFLHvPuGsYRQD7I8RPzgVVD6mF2mIaYCd
         LIrw==
X-Forwarded-Encrypted: i=1; AJvYcCUi9H3Pwruhz4APVis7YwKwK/RCM+CIVGiFKSlU7X56ehpNLoCv3HoVGqd2bPEdv9vEqDCHjko6Y91zOmSdW3yE4UbHNiRSLfQbkXua6vttmyUTYWn819yiG0Z7lO1kCorfWIM2Q3ATolt3+TgwGme47Xf2U+yZccVtjhyJA8skIhhZprU=
X-Gm-Message-State: AOJu0YxIsmksNSvsHZBXF439MuU1vXwjySGrIGLPCqNfS4PDQ0TYV8V0
	dWGE0X9luuMfNFGSKq4CTQ2SzBo82tELJ3bqTyXyMjciqynaDDzE
X-Google-Smtp-Source: AGHT+IGPTCSC1q1VukMuRNWxpATn8r6NtmLJpdNRuhapoT4TaQ0Ev64loRYcE7t5Fv9tbm1mA7ScdQ==
X-Received: by 2002:a17:90b:515:b0:2c2:792c:b618 with SMTP id 98e67ed59e1d1-2c2bcc6335dmr10568487a91.33.1718105766139;
        Tue, 11 Jun 2024 04:36:06 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2c2dd785762sm6705086a91.37.2024.06.11.04.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:36:05 -0700 (PDT)
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
Subject: [PATCH v7 3/5] dt-bindings: mips: brcm: Document brcm,bmips-cbr-reg property
Date: Tue, 11 Jun 2024 13:35:35 +0200
Message-ID: <20240611113538.9004-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611113538.9004-1-ansuelsmth@gmail.com>
References: <20240611113538.9004-1-ansuelsmth@gmail.com>
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
2.43.0


