Return-Path: <linux-mips+bounces-6707-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC79BFE34
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2024 07:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A7651C219EC
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2024 06:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD2A194A43;
	Thu,  7 Nov 2024 06:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHDuSJVr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841A3191F88;
	Thu,  7 Nov 2024 06:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730959894; cv=none; b=W2fTlzfB8AM2aiEb64YLcLnLfwP3wVkuif59kHWnW+ve7AptuqBYHlQidMljzwHJZ3VAYaubRj+89Gnn4G1vTP7klhRaH4cRpPLDevSXe6CIZ0hLN0Za+qE+L03weFlqD2UoU/hBfvZ3k87HJ5XmXxJ5lRwVh0KH7oYp7TsQ0k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730959894; c=relaxed/simple;
	bh=43RcNsIvUGi4595SU91AS/BTSl3E6gi5tuIlWyaKPmM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IzCFemeS2uCASHIuRtdzW2ZRUu9MZXgl+RWp65kFWR2+6SstAE3XOwqd++u6oGlV9h8+orgMeAP1ciBEW0yMzes1eGDjuukx1/U18dELh+UA0OSZh/UmDyKbtVquTMlHeR3mbwDdaCERE29Ce/LZjlgeHsRqI2jUYolE3nz8ixE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHDuSJVr; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso6261195ad.2;
        Wed, 06 Nov 2024 22:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730959892; x=1731564692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALXydKzISbFOwh8LfCoyMfvmblNdzLozEw5VVs994Xc=;
        b=cHDuSJVrs4LDwWpD5R0UEz87PQ1ltSyOaf9/Xd8tYF6qOlZ07ewJklBupBPHtLbPH3
         R2DT0BmdrGP38XtufhuAwmx7KNwmd6/Q/NOAn7fFTSyi9NGPmqovHt6SdkE5fyBLnKid
         Ebi5rvKDLOlomKweru9QrfPLQLlVLwOw4eeluFABOTvqsgj+fqgyakEgfyf6ojgxqzwo
         4gWjK8XAZrpzhXAMukVVw3jXh1oDQbiIA5FqZnfQjk3eBnXbzCLS+n6ILnd1gGpWM7Hc
         iv8TrimEvHQxRfmLwwgQUIc4fYBpEQT3SIPWF23hi+QZDOl9xhGkmqyL93ZsWz+uMFeG
         bD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730959892; x=1731564692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALXydKzISbFOwh8LfCoyMfvmblNdzLozEw5VVs994Xc=;
        b=UN5LYsggqja3C13xVkvfwW9xfJjn4jKlXQLswP5B8u0JvgEa/xE6rte+qdoNaSBuO+
         qwuAFGb5qWZ4uHVi519N35dp8bq3xkRyez1XFCe0o12SAzS5Qfiav2cAK+brTl1CzX4V
         FTS3kCrSSEw5imClxRQBpoOxlAUmJnAxqq/4FdPByfW7aM+s0U99wkISOqvkbB96feLT
         bRsOl9LH8Qgw+WawLfALkxgYBbUr43A8YlfeuRCkYzHc6kkBy9xZnnHXxRERdly4Joq+
         qYk2fP+IGLgp8DOwBQ9vTLhtqrGzTSAqiNEdunRIQRzXfts4ftf0Lvjd4peZVrscwhTp
         Ik5w==
X-Forwarded-Encrypted: i=1; AJvYcCUO+FcJJJxGmuubzc1HIeuDX0JibTvVF1QGrT4grpiHu1d8rDaxFl42poIVaG+QGgAhgdv3jK2yAay1isxS@vger.kernel.org, AJvYcCUOY601pwxSl/t9tkieCoqBgglr3QgcG0WFFt264NoHvgxog6kP4eCgQ3ijhutsVTt1R4n5LuTg+cNJH/g=@vger.kernel.org, AJvYcCV6Q0jAjuRr5auXFdbAZHCilvNDv0dpoTErtTvZGlr036kRLB9sJ6BewKbCFXfFDu16GXb/Bim/VXsP@vger.kernel.org, AJvYcCW+WXgVXYk9MJMNzqFqjGcsHmNy/x6P2oi5x4kt/xcro61pRqWsjtzIcFQhdGKClSG6XLi9TDJ8X4+BEA==@vger.kernel.org, AJvYcCX01X+fIYqVP9DyrHOzMy2TqQH46sGfaEpvUHu7++kfyMMEtk6/8/IBFg6177f6zuHyOWjEiriiNI5Clw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2cKoTzjPLY8/e+ebL/x6eiVD/2vQ8jtd9GOEX6ikLiqWUEKs3
	M8jiynH2UCwvX8ChBboP3agRfB7E6dkp6za+OUOMZAHBPQOkjdnu
X-Google-Smtp-Source: AGHT+IH+74hwtw/dolRKBe95lMKx0IkBL+BrHnQnQvcxznJIGMkm653MQz7fgmgSPs8j9V5HslOTGw==
X-Received: by 2002:a17:902:cecd:b0:20c:a97d:cc7f with SMTP id d9443c01a7336-210c6c3ec78mr584066825ad.41.1730959891752;
        Wed, 06 Nov 2024 22:11:31 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc7cf8sm4652465ad.34.2024.11.06.22.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:11:31 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH 1/2] Documentation: dt-bindings: Fix repeated words
Date: Wed,  6 Nov 2024 23:11:23 -0700
Message-Id: <20241107061124.105930-2-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107061124.105930-1-xandfury@gmail.com>
References: <20241107061124.105930-1-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix unintentional word repetitions in devicetree binding documentation:
- usb.txt: Fix repeated "two"
- mvebu-devbus.txt: Fix repeated "from"
- gpio.txt: Fix repeated "Both"
- pinctrl-bindings.txt: Fix repeated "device"
- cavium/bootbus.txt: Fix repeated "one"

These issues were identified using the checkpatch.pl script.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio.txt                 | 2 +-
 .../devicetree/bindings/memory-controllers/mvebu-devbus.txt     | 2 +-
 Documentation/devicetree/bindings/mips/cavium/bootbus.txt       | 2 +-
 Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt  | 2 +-
 Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index d82c32217fff..530420475a4f 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -304,7 +304,7 @@ pins 50..69.
 It is also possible to use pin groups for gpio ranges when pin groups are the
 easiest and most convenient mapping.
 
-Both both <pinctrl-base> and <count> must set to 0 when using named pin groups
+Both <pinctrl-base> and <count> must set to 0 when using named pin groups
 names.
 
 The property gpio-ranges-group-names must contain exactly one string for each
diff --git a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
index 8b9388cc1ccc..1983d7eabd2b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
@@ -43,7 +43,7 @@ Read parameters:
  - devbus,bus-width:    Defines the bus width, in bits (e.g. <16>).
                         Mandatory, except if devbus,keep-config is used.
 
- - devbus,badr-skew-ps: Defines the time delay from from A[2:0] toggle,
+ - devbus,badr-skew-ps: Defines the time delay from A[2:0] toggle,
                         to read data sample. This parameter is useful for
                         synchronous pipelined devices, where the address
                         precedes the read data by one or two cycles.
diff --git a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
index 6581478225a2..1bc655d285ce 100644
--- a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
+++ b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
@@ -15,7 +15,7 @@ Properties:
 
 - #size-cells: Must be <1>.
 
-- ranges: There must be one one triplet of (child-bus-address,
+- ranges: There must be one triplet of (child-bus-address,
   parent-bus-address, length) for each active chip select.  If the
   length element for any triplet is zero, the chip select is disabled,
   making it inactive.
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index 6904072d3944..500b76ba2ab3 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -18,7 +18,7 @@ states. The number and names of those states is defined by the client device's
 own binding.
 
 The common pinctrl bindings defined in this file provide an infrastructure
-for client device device tree nodes to map those state names to the pin
+for client device tree nodes to map those state names to the pin
 configuration used by those states.
 
 Note that pin controllers themselves may also be client devices of themselves.
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt
index da13999337a4..682db2b561bb 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt
@@ -3,7 +3,7 @@ Freescale QUICC Engine USB Controller
 Required properties:
 - compatible : should be "fsl,<chip>-qe-usb", "fsl,mpc8323-qe-usb".
 - reg : the first two cells should contain usb registers location and
-  length, the next two two cells should contain PRAM location and
+  length, the next two cells should contain PRAM location and
   length.
 - interrupts : should contain USB interrupt.
 - fsl,fullspeed-clock : specifies the full speed USB clock source:
-- 
2.34.1


