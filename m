Return-Path: <linux-mips+bounces-7511-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1662EA162B3
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 16:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9A947A1CAF
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 15:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB431DF74B;
	Sun, 19 Jan 2025 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDSo5mAe"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B688D531;
	Sun, 19 Jan 2025 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737301496; cv=none; b=tMd2r4IGCBxvT3AvASYldBApzdK9T7C6U6jywg9Tv0nqwyVCZuzzViat0PhwUFxPqM48O1e5q2u7Fzgveog3d6tzjmQpi8dp1aHwTagz6fWPRziqBjZAs8DWLvDOokk474Cj9u2G9A9ujD4UtXl2hoOWvQ816nN2H5J+8pTylrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737301496; c=relaxed/simple;
	bh=Qj1Coxsu8hNs91CezBIgio6lHn8v51cfOLgCTu2vnSs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NJOaJUaMd8I3wszIiCqNxc9ZHz27HPNT3/sUq66+VPmE2vKDF5eVHOQnVdPFK/DGbNYStjk+gHSe15KlLIzOCKecKrSBvaknOilZL7kBJwECV2ZJfKyOACWcqvnZ0OXKeqA0Gg4BIXhgr0QdVM9OGIhzwRvbPL6aJu2UzW4T7G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDSo5mAe; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so41937545e9.0;
        Sun, 19 Jan 2025 07:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737301492; x=1737906292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p+MERUIEnot+0yVY7O4MlFPWOC/eemYOetoliqmoGKU=;
        b=WDSo5mAesoIw1uqThaB+S2qGh2ZOJxqUnSK43Z8Mq2+MeFHGFLsl8uVb42xU1NJFhw
         q1oD+8AQ31sKztXdwesXsvknqoSWJzGD91D/+J6ccpl3Gb27gXkdSUQXCUre1DBJ2KYE
         SayNN51cMkJnKHvBOSculkC9E3kWk7gy7HzH7ADqbhYvCuiiTy6CRDCmhZMpeKgqq7Ji
         PJywngJSWxCr5bLJnDGRDSK+uzKbuA+lalgmpK8wYvwFc5dNztn7VhL1XrYJO0XU3vec
         eVcSxc62Kz9oS+kFqAzrWfhkGD5GxRqbsUNWrRdI+uXOKpBfsOpbotZfxNk4Ok2akndm
         xDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737301492; x=1737906292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+MERUIEnot+0yVY7O4MlFPWOC/eemYOetoliqmoGKU=;
        b=jOlmmpkte5rZz0c5keqsqrGYOKfcEkjUZf7/FLos+NufhMtDoxjeGPIu37qO2+Km36
         M9bwDOoyTkI+vBdMoaNG7VcjE8qo7O/mzNk0571J2ODt1OZnl6Ehr3oyNlpY1iu5l5ka
         KJqRUidfCnlOblI8aUfKx01zVu9hO5ui8HtnqBlmudsMHAL/qQ2hbnWpac/eeYuAWUZp
         vs3o1Wyw5hlKpve0CkzwT0YTryCDVqUu/jWd+kC9iLu+8OdYirXGfEX1cDVQEfMh8F5l
         n/BhZu1Z7JP/sfbOeeCt5oChjpTabaEjRHoV1ZILwRqGoMC6fXiNFbOSHBQE2Vv1EVJI
         b4tA==
X-Forwarded-Encrypted: i=1; AJvYcCUnxOjFzqLGy35Wq/HIbf2LO6UH4ggj222Sg3/3kdvTtMk5QnYzbRszgDFnuvam4HXpAzGm1Ui8avolCHkc@vger.kernel.org, AJvYcCVlAVZ9f50NLSNwiI+tsP1KAXJ/yC67D++5A0Tf/TLE/+V8gmzB+m0AGt/8QowlcyYG+qAWAvWfHngF@vger.kernel.org, AJvYcCVpthN6hAUzNQYJdZbIxZ8+4BgVshUJgVFVU5KcBAsSAMJ9r6FnT4NFgfHX4SdrulUHtCiLzGBp4frOKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvIMCHj/r4jw4gMqHBc7e9lek/GKdjGMLPA2eOGB24hcv0qRan
	QXayQxjQAiUxuWjTrw+o7p2X9TfomrysOPAHwX48MoU7/BV8NzMMXi5zMg==
X-Gm-Gg: ASbGncsFqSl5dCOlcPIQkq99NlX2vos2Ljx93nlMhroVVcUSC7fW8IX2csFsdOZXLMi
	PGpRgQSJTTKe4DtsowCiuSSdwIA85Yz0qDQOS0xzSyG5tv6YvH2hpKt9/RBorOpTxfKHTBv6SaR
	R1yPrw7DXFMJhIR7aPKScjPtOwIEKnOvEs2LtqQJiV66Mvt6mzUriaZnzMBc+A7AE9uDLoWmKPv
	728tIAbwC1oNWKbMbiTXsvvYFnXV3Cz3e0L5fAOGWtnrNoLaA1K/PfqdvOB2mfI3t5Z7TFw40KC
	l1wcTqElbu/4Rd/lI2WC0kzqfjdmzUUA4unP6B5o/2c3NnJnpFOWZi+zpulP
X-Google-Smtp-Source: AGHT+IG15Qvt/5O/PYnGgIxK8+GV2Xgv5LcJKxjXHVtJdvu4J3X5DQ8ZemKh0O+92Et5oYMWOtOIXg==
X-Received: by 2002:a05:600c:5486:b0:434:f586:753c with SMTP id 5b1f17b1804b1-438913ca694mr91282365e9.7.1737301491524;
        Sun, 19 Jan 2025 07:44:51 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046885esm104532655e9.36.2025.01.19.07.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 07:44:50 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: sboyd@kernel.org,
	mturquette@baylibre.com,
	tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] mips: dts: ralink: update system controller nodes and its consumers
Date: Sun, 19 Jan 2025 16:44:41 +0100
Message-Id: <20250119154447.462857-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all!

Ralinks SoCs have a system controller node which serves as clock and reset
providers for the rest of the world. This patch series introduces clock and reset
definitions for these SoCs. The clocks are registered in the driver using
a bunch of arrays in specific order so these definitions represent the assigned
identifier that is used when this happens so client nodes can easily use it
to specify the clock which they consume without the need of checking driver code.
For the resets the definitions are the reset related bits in reset register of the
system controller node.

DTS files which are currently on tree are not matching system controller bindings. So
all of them are updated to properly match them.

I'd like this series to go through kernel mips git tree if possible.

Thanks in advance for your time.

Changes in v2:
- Redo commit messages in all the patches in the series to clarify why the changes
  are needed asked by Krzysztof in v1.
  
v1 of this series:
- https://lore.kernel.org/linux-clk/20250115153019.407646-1-sergio.paracuellos@gmail.com/T/#t

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (6):
  dt-bindings: clock: add clock and reset definitions for Ralink SoCs
  mips: dts: ralink: rt2880: update system controller node and its
    consumers
  mips: dts: ralink: rt3050: update system controller node and its
    consumers
  mips: dts: ralink: rt3883: update system controller node and its
    consumers
  mips: dts: ralink: mt7620a: update system controller node and its
    consumers
  mips: dts: ralink: mt7628a: update system controller node and its
    consumers

 .../bindings/clock/mediatek,mtmips-sysc.yaml  |  18 ++-
 arch/mips/boot/dts/ralink/mt7620a.dtsi        |  10 +-
 arch/mips/boot/dts/ralink/mt7628a.dtsi        |  43 +++--
 arch/mips/boot/dts/ralink/rt2880.dtsi         |  10 +-
 arch/mips/boot/dts/ralink/rt3050.dtsi         |  10 +-
 arch/mips/boot/dts/ralink/rt3883.dtsi         |  10 +-
 .../dt-bindings/clock/mediatek,mtmips-sysc.h  | 130 +++++++++++++++
 .../dt-bindings/reset/mediatek,mtmips-sysc.h  | 152 ++++++++++++++++++
 8 files changed, 357 insertions(+), 26 deletions(-)
 create mode 100644 include/dt-bindings/clock/mediatek,mtmips-sysc.h
 create mode 100644 include/dt-bindings/reset/mediatek,mtmips-sysc.h

-- 
2.25.1


