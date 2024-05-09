Return-Path: <linux-mips+bounces-3191-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F09DE8C17D8
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 22:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E72A1F219C4
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 20:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8598062A;
	Thu,  9 May 2024 20:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HY6q1azC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA5F770EB;
	Thu,  9 May 2024 20:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715287686; cv=none; b=gUX7md0IaIM55kB31kz7maAZJ2Ceq6nvrB/uwzOWDHy5hVrLv54Xg/4pbWOezL3Zod1A5xppTBUfve7gyikmPl85PfomhPquAwz5p5b+z9g2ojlS0kx4NZWXD5o/l9jLmi0P/tNxFcOZex7NwX0sUf4pTr4Jfsgd2QCdmcjvzzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715287686; c=relaxed/simple;
	bh=bPfwfGtUUAbKsRwmUNakzpzYYounVkoGJrqqKv10akE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Sf1f769pQcCaK5/k0UKFTjx+WISEe6vmSO9wI8zH/AQtsEXFd0s1QL7bl1f+1/hi/aAWKNP/VABaip28ljEfbWDnNk6toK8RJFShMl6NL+J2dDxWoO/DrFNrIOHyp1iGbOScpuxN0pDj3eLdH1dNJL/rO3aZoFZVcWdue2Ye/84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HY6q1azC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-34da04e44a2so871357f8f.1;
        Thu, 09 May 2024 13:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715287683; x=1715892483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIhJ2uqcfnSzx179NdZNb/jXDpfOuXacsoL5bKYKdrM=;
        b=HY6q1azCR8bodNtms2jYT+9VW16WhxKqgnM0YdD0AOC88f3hpjQPdjb78+Ioqzwj09
         F0bQVG48eosiUwvHUJbRIGojmXCDCoyHchzwzHhlCZkR90uoSCS5PdurDip/hKU13eS4
         NNFNGe+4prRnILZu0lL28CsFvYhbQoCXwzpYG62jxADtDMIrrjintNqNgjaBYh4MjnO3
         kINM9bQ+u/WW7wblfZWF0ryYjRRZftTvbbAElr7qv/IIRUOlBaAmDWcjq6K7LORVjr1m
         DOMIKj/nOTLauOFSENJiW3SwK1K+QM4Blxs30EkKzBp3cLmKD8aynZWVvDaNHKfAPtd3
         J15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715287683; x=1715892483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIhJ2uqcfnSzx179NdZNb/jXDpfOuXacsoL5bKYKdrM=;
        b=tUj5BcT28mrdhGLHgq4SfRHkeinmeVmF/NVy/enzq4hHk6hV6w9cOP4PG2hmox5Faa
         9T1mcAfdnUV4EXL2JTv4ldJLZGl6oKG7BVjxHyrU+MOQEXNvWvwitq+aQEdOEL6jnJCl
         DbXTcl4NdbN7+V9w0yDz3oAnVEvpRwb1IgZsunUiqNyWVkRRJeIhKcEfFu+1HIOqOWKz
         N6LlzwD1ZFxWKODfoZL/Shm1K8l+qPDBoNBMKOV8yle+FB6OpMzCw4kMetYx0L3o5NtK
         j77mk3LHVK0mBb+sjG0vTU+Hh9XoO3SqV0Gr5g96i4xPxYEYVV6/ChMhLwfsatbc8+Bs
         3bxw==
X-Forwarded-Encrypted: i=1; AJvYcCUPJMrcsAZMC8QMtqgLHXFn5AZAPmnZs5fzqhEIwUq1qYdQnPVCJezaG/0s73Snkj5x/MwsujF+sIJGLth8E868Htn0BBijMstXEfW6D/Chh9bJTeizibhQItQnaFf8iuqkgsn6cctyhLTrsdy7Giq155RGHOZZdEgVA2/lVhdnrMl0euA=
X-Gm-Message-State: AOJu0Yw0UBNANz2a5dUDR3vVjSdm6xAEz6pfBklmUBvVK8JIJEmq7IjJ
	wDYyS0NSVHYu9oUvcXb/3bkokY5CQqwJo/7Y61aEOAC/HdiKIj8G
X-Google-Smtp-Source: AGHT+IE6QuwvRB9pIhd6+zBAEZLwKTyH/jJjFlRTPattgAySp7+XJZnAqJkuFi2pc740kQpujvXX1A==
X-Received: by 2002:a05:6000:c6:b0:34c:f989:e4a5 with SMTP id ffacd0b85a97d-3504a96d562mr414645f8f.66.1715287682354;
        Thu, 09 May 2024 13:48:02 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3502bbbbf08sm2588185f8f.96.2024.05.09.13.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 13:48:01 -0700 (PDT)
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
Subject: [PATCH v4 0/4] mips: bmips: improve handling of RAC and CBR addr
Date: Thu,  9 May 2024 22:47:44 +0200
Message-ID: <20240509204750.1538-1-ansuelsmth@gmail.com>
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


