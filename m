Return-Path: <linux-mips+bounces-3233-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 478DF8C3178
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 15:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E642820F4
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 13:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BBB50A6E;
	Sat, 11 May 2024 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLL1w7yt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ACE17C8;
	Sat, 11 May 2024 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715432651; cv=none; b=nru3UyqwAcJeQ2+DOJ5vzr+GyQQxpqEkD/29oWJCXDL7/MhcvpjgLrEG3H1ItSSlAMoTUHTc4ZJILCi/kX84+ame9J1vlkiYQI+eaQ5nx7Xg4MwKiSlRR3uFkB6Zk3OcxYNnCCOL1uwq1uxQY7nOJaptvPJNfmKgmFGj3KrIy6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715432651; c=relaxed/simple;
	bh=HIvvKpP+r4JGhKo5aeayHim2SHY7uJlT5rklGmr0n6o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CnyFcLBIbWv3FHU9AFtxvkYrPfM7myAFz0aZn3CkOE57uMvl9ISeIu0s3y1Zt1eb+/onCD66xO5dSUjAHs/X93eF3XjLtIFcF30lCfGA+75ZjTm/oib/MnblDvfV96G+aEr7JOa9RjvpmjEywwFWwJLyTfTyNUj/EM8eHLj6pvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLL1w7yt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42011507a54so945385e9.0;
        Sat, 11 May 2024 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715432648; x=1716037448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ab0OpQz+PDGrpkyp+S6EfjD7cebAVBpt7nobtJw6rE=;
        b=YLL1w7ytU9j/Aarj+i8BMLmDqQv6mWAR1/GPw7I+KtTSSkJEHHg6j/9Z8a68sbySlP
         5cL4Hb0MNtzLYuQnnTh1SIGgjDXBHBM6dCFAUQgbAzkaQrTP/Rx+BRPgXtd+UiWiTOZL
         BpTx6tJ0PInAtdh+rN0YbFvbXKsmgi8IYmAud3q5T0eb+oZ2FrnS8GPElFjuaAd4jFHB
         x5iyMkBoWXg799k1D+feNDLYrZPWnQPThrMuTSdSKZ2C49gFJPR6BmaM2CdilN3MLhcd
         3Wd1ZzKwcPGH3KXi4DkvdkP5mUMgAVOLtaMnxq30vnz+4HBT6P49EYb2FT4anicy5gjo
         8/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715432648; x=1716037448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ab0OpQz+PDGrpkyp+S6EfjD7cebAVBpt7nobtJw6rE=;
        b=INgjdDck9gZgpOP2/eDqZ3IMmSIzneckOrK6c0h06XM6bE7R8ddViMP/wJIfjGEVPu
         CgGSbVBFycOwnm7cZzhS5sUJyGZccQ6JPBlH+mLXf9HqE4J7sAqztxRCz2zdiJjltpBn
         wk93kmPVYWibR/TVSG9jWRzpjWW3OQcZbH7hHvX5P7B6Xh/d9Af64rgRkR1bL2kQ0p0y
         bVmifGmTBCI46NKGB3hrlNwUbv8OiW+VgbjzYk4uf4txS0TPNNwSEX62PySkn2idcbWG
         aoNoheYOLW8FMXatoFWc7QmkPqpz7Sk2u+dJ1Qtl0vBtGYReR7Yrxjqd1V/0yzl3XUpw
         Zs1A==
X-Forwarded-Encrypted: i=1; AJvYcCWt0E0JUsrs9NBb8dI9SZBjjECF5oVUNBnPwqJGO6FtrwD4jMAwXbe06ysnS3T0sez43rgmQNOx/sgIbLXcGlbqa+uhKuA5GRuXp5l7T9tCAVk8iyi7cvHSQc/MrnwoR29L/4iUXS0kQI5GoGNcwtbmNqU3bF3/e1uJjyNhmj4l9jylpeA=
X-Gm-Message-State: AOJu0YzpBK/FM9LR/vnE+c9QRDq0OagBFUSwKkd8GR4w6KCZ6aeO3zPq
	L9JpRaPPgTJmrc6GFQHbVPBda/bJURhQ4GzIOozvKLfIXJ+fgHjF
X-Google-Smtp-Source: AGHT+IF2NXO93qGWTgDW6HeP9Ucpu7FcFq7KL8YgoQUN46avyZ0mqSwYdSSXOrlHtKzfLpGr5GTkIg==
X-Received: by 2002:a05:600c:450b:b0:41a:7c1d:3326 with SMTP id 5b1f17b1804b1-41feaa30479mr46740845e9.8.1715432648039;
        Sat, 11 May 2024 06:04:08 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42010ca475asm15995495e9.16.2024.05.11.06.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 06:04:07 -0700 (PDT)
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
Subject: [PATCH v5 0/4] mips: bmips: improve handling of RAC and CBR addr
Date: Sat, 11 May 2024 15:03:44 +0200
Message-ID: <20240511130349.23409-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

this simple series improve handling of RAC and CBR address and try to
upstream these simple patch we have in OpenWrt for a while.

The first patch fix a straight kernel panic where some Bootloader might
enable RAC but misconfigure the CBR address. The current logic only
check if RAC is enabled but doesn't verify if the CBR address is usable.

The DMA sync function cause a kernel panic for invalid write. (as CBR is
0 or something like 0xa)

The second is preparation for making the CBR address configurable in DT.
Since this address doesn't change, we can cache it and reference it with
a local variable instead of calling the register to access the value.

The 4th patch make it configurable with 2 DT property, one to actually
set the reg and the other to force set it.

The first property is used when CBR is set to 0. The second property is
to force it if the Bootloader sets it to something wrong.

If the CBR value is not 0 and is not forced with the second property a
WARN is printed and the DT value is ignored.

The 4th patch enable RAC on BMIPS4350.

These has been tested on BCM6358 (HG556a) and BCM6368 (VH4032N) and
reported correct functionality.

Changes v5:
- Add Ack tags
- Improve DT descriptions as suggested by Conor
Changes v4:
- Fix compilation error with legacy brcm target
- Improve property description in DT commit (give
  CBR meaning and drop reference to linux functions)
- Use only __read_mostly as we can't add variable to
  multiple data sections
- In patch 4 use local cbr variable instead of global
  one.
Changes v3:
- Drop broken-cbr-reg property
- Fix anyOf+const with enum
Changes v2:
- Prefix brcm vendor in the added property
- Drop last patch (cpu switch from DMA sync)
- Validate CBR addr from DT to be outside DRAM
- Reduce indentation in DT CBR check
- Reduce delta and use local variable for CBR where possible
- Fix and improve typo and spelling mistake
- Use 0xf instead of 0xa for BCM6358 RAC enable

Christian Marangi (3):
  mips: bmips: rework and cache CBR addr handling
  dt-bindings: mips: brcm: Document brcm,bmips-cbr-reg property
  mips: bmips: setup: make CBR address configurable

Daniel González Cabanelas (1):
  mips: bmips: enable RAC on BMIPS4350

 .../devicetree/bindings/mips/brcm/soc.yaml    | 24 ++++++++++++++++
 arch/mips/bcm47xx/prom.c                      |  2 ++
 arch/mips/bcm63xx/prom.c                      |  3 ++
 arch/mips/bmips/dma.c                         |  2 +-
 arch/mips/bmips/setup.c                       | 28 +++++++++++++++++--
 arch/mips/include/asm/bmips.h                 |  1 +
 arch/mips/kernel/smp-bmips.c                  | 27 ++++++++++++++++--
 7 files changed, 82 insertions(+), 5 deletions(-)

-- 
2.43.0


