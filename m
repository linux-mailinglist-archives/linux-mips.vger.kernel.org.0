Return-Path: <linux-mips+bounces-3571-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63402903A70
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69F2E1C23103
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F35617C22D;
	Tue, 11 Jun 2024 11:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8HUEhkd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8800A17B4E5;
	Tue, 11 Jun 2024 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105758; cv=none; b=dJvaW6lFG1ZnvyqlMyf+5Ugxy/Ne5bNGQ8n6iROKO88WVyInPc2EO3UZvYaybrufbCLJ6tzYWoamGHRQpftGj+PAXWLZrurc17dMK67qixreUgWxIkECIjGH9J6E5U1NZxsG23WXuYRAbbN5OrypOrAug4Ifbf9xfdCO7hkxVE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105758; c=relaxed/simple;
	bh=yDoO24qvTuhgGUdfFrkXbWtuRpVXIVPpmbEWjoEiwGk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S3NhMZ6JZLJBz/2pH8K1c33b1Raps97MC3ttoC5bispTKi2GKq6ORFYlf5vlJ0xQz/B/E14Bm9q+OD4bCkp6NCafWUHGYWJlpxgmGz9XAJQruy8TDAoa8CQ25jFpzYpu8ttVcxQSdovkYFlz2VYqmsMQ42LXeIM+BO2PaD/K77k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8HUEhkd; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-6eab07ae82bso788209a12.3;
        Tue, 11 Jun 2024 04:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718105757; x=1718710557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xthA1neqtAIy1s+U3YwosG2Zu0DE+Lu75xci6R4A3mM=;
        b=e8HUEhkd9uos5msCL/AdUR31xuPjRllib7ze3O+E8hFbmTQHXg4i8rfGH/jMwqIHyC
         06Y2b547U7Gxwo89oJ67dWke3wTsTr+++sJpzC34AAiM7mGi3Ujm+MsProsq+C3vG+lG
         i6sdFGurHF+4QOJ+tS8HLutuCq2zHW24pAxZZjj2ReFrlHLXssuzgFTXJ3U+sdWx4JHg
         YcohUghidqpohz36oBiQI5oBidhUzsPar+4fWkOSlrNveEv2QqurSP7S+EUtN/YR6UeC
         Hb8j7xvvT+ACDhXQGDbthtuh8n2mJPxnIVtNL+KZ8tU3qUMUCLCNNuWtUts4LGsxzLmV
         DzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105757; x=1718710557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xthA1neqtAIy1s+U3YwosG2Zu0DE+Lu75xci6R4A3mM=;
        b=BOwxc/GIUVwX7qh4RFhZzvmfJZ+wcpMuNnjvr1J25Y9VjAgF9dbBvdDznv9s71Gjsj
         KpIHbHry2mdMSXPmQuH7h0o6iOPA+cwGwL08tBY3nDdLt+ravEzmeLHERHzAbRqhNWxy
         FMhodSI4cGerSfxWOq83kaiutkWiKISHqdvikHbLI0Vn2/+aJCYOdhDrCK6oAN1r4jCg
         DyNoGH25LXy79R7AC4P0BsFhWgDGssmgWVR955wG5YYm2FdvIPRv/YqPIh3NSs3bg6ST
         H3WgbtwjRwj6VtoiaHr41r0sGfE4voaDncT/PE3eWOulN4w5c+o6rbOb7h/b13kdIJf6
         4VeA==
X-Forwarded-Encrypted: i=1; AJvYcCXyYkeUoNsXlJMGe/Sn835iN/Ijdp8aEeSBXxJ5TSoHmCYcDLjVuVbQe3XUtnuYO2y/SUUb8S9ZabYgicDa78Z2ljr8cLUuByWkNS/GgtI24/9uHEepts1jeEYDnyezdJxveUPNoP0Ny1rS4d+HhRNxTwhfD4RSXgrJm1bARGdQc4VjFpk=
X-Gm-Message-State: AOJu0YzRByLxOiZ+XBFHkuwwtrUO0j0jYSQwgUpuaqImR90TvEEMPCUA
	jigtmbTmq4TLT9mBNu1JhEhV1M1+TATuzX0vZvu2vCX7Muvgd8aq
X-Google-Smtp-Source: AGHT+IHWp1gLj32s/xAykHc3SASs/OqspJIgVNxZedMkIVemf9JK5cY34s3FhhQOh9pO04hMEdpJug==
X-Received: by 2002:a17:90b:1bc9:b0:2c3:16f8:b57b with SMTP id 98e67ed59e1d1-2c316f8b5b1mr3537795a91.25.1718105756605;
        Tue, 11 Jun 2024 04:35:56 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2c2dd785762sm6705086a91.37.2024.06.11.04.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:35:55 -0700 (PDT)
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
Subject: [PATCH v7 0/5] mips: bmips: improve handling of RAC and CBR addr
Date: Tue, 11 Jun 2024 13:35:32 +0200
Message-ID: <20240611113538.9004-1-ansuelsmth@gmail.com>
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

Changes v7:
- Add ACK and Reviewed-by tag for dt patch from v5
Changes v6:
- Add missing patch that got lost in v5
- Fix missing header for legacy bcm47xx
- Fix compilation error with gcc 10.2.1
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

Christian Marangi (4):
  mips: bmips: BCM6358: make sure CBR is correctly set
  mips: bmips: rework and cache CBR addr handling
  dt-bindings: mips: brcm: Document brcm,bmips-cbr-reg property
  mips: bmips: setup: make CBR address configurable

Daniel González Cabanelas (1):
  mips: bmips: enable RAC on BMIPS4350

 .../devicetree/bindings/mips/brcm/soc.yaml    | 24 +++++++++++++++
 arch/mips/bcm47xx/prom.c                      |  3 ++
 arch/mips/bcm63xx/prom.c                      |  3 ++
 arch/mips/bmips/dma.c                         |  2 +-
 arch/mips/bmips/setup.c                       | 29 +++++++++++++++++--
 arch/mips/include/asm/bmips.h                 |  1 +
 arch/mips/kernel/smp-bmips.c                  | 28 ++++++++++++++++--
 7 files changed, 85 insertions(+), 5 deletions(-)

-- 
2.43.0


