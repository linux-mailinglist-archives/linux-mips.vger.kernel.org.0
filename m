Return-Path: <linux-mips+bounces-9341-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DBEADC852
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 12:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6555B178F91
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 10:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA972C324E;
	Tue, 17 Jun 2025 10:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="sJyLcvb4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EEE20C48C
	for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156267; cv=none; b=fELTsexHOpIERfDXCB5AZkj1MN38OCTzA3dS4vGt8J02DX3vMMJVaI+N4h4Hpx4uv3XCIHOebjnnu6EKDK1zhPrd98Yua3yYUteID3jertrSOilB8B4qpjz36rmB3exeHxAAJTgrf+6SbRVwoJz3s4OahK75gO542VvRnispLMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156267; c=relaxed/simple;
	bh=w2W+a7ZuJe8FPbpYaxgD14dwPzRBuZguXtykQbsnYXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gh4lwXIsZNSqG1n7Xu3z3Et476MLcqhcr37nECvE3F0bzhti0CZoh89296i0yFYlviDGaVaQLmw8TQMEgx5Gy0Yk+Hig/+QwNXd8L7HrZII6KkL6LmUc6k2BOfOH2iPy7aKgATaWbFH0MbmGrcNcItepoiFXaCuxedTKQWPU7vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=sJyLcvb4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453398e90e9so29419805e9.1
        for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 03:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750156261; x=1750761061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hRfOEu471ZP+Fq1dUltM36H0O9UoIGuBZtAP9JnR5qo=;
        b=sJyLcvb4HjB7Lz9+CZaQEJ8rvsyNptSn634Q/6qhTQZj5DISeOtO4uVEvzNk5i4z4p
         v0g0eLVu7mvkySSifLef0P2M5eCJAaFANwOhLq9R63Of2AXjZk71KO1dOz41gMNb0nxy
         UCDXeDMxUDCKg4EYV0y8hUbdDhr5sogx+VHDBUz0sRzjYS+7k/BtPY1lS37hPrcwxhlY
         X1rH0e8Ow+FpX6n29MppMFbkoWO0Gcz+m2LyY8L2eZB2gwGs9X+QSRJ7W+dlhGICnPWl
         wDBidRO25V8cpBODZZ9OW63DJWUiYyTSJQ7ZQRD6R1zaIho+GrkJZHPpHLu/RxGnzBwn
         2Nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750156261; x=1750761061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRfOEu471ZP+Fq1dUltM36H0O9UoIGuBZtAP9JnR5qo=;
        b=qsEzrpwwNrwHkOJuf2cYrtGlej0xAlI+Buw+0DiIJsr6zvoqz4bsZFGKt1srjBAzHA
         U144jRUayVLswxdaCu+RAV87f2RtAF2j7/0H7qH2ExMdZHcdxmgPqPEO53coXUpw7J0B
         1BRHDZBWzTPyRIpd0oMSautcrAmKdL0o4Wb2zvqToCrhvusDupPMczCtk+Q0OzP911XS
         jF34x8kVXnCZmGdxeaLqRr5RhNOTNiOSTh/FQitKqYhda+AO1ZZ773P+sU3Vi5IgVnLt
         8Tj/vfjTuCTfbQo3CyGOdunoeyRTJQCA8j3rxQ4XP8WFvT70I9fTUIBrVYUqoqXrbwpz
         Hagg==
X-Gm-Message-State: AOJu0Yxyw9sSq2CpzI6UsLsSAlQMdFldqi6yxL8Q1ClTEoMQdV3XKA9F
	8H6h0wOwH6f9clMwkiK5NNQ3Pgp//95pC2i2bCfDkKAWaQjfC5eNXN9Qc+7hoByHeaDzL4ocZ28
	Dko7o
X-Gm-Gg: ASbGncv762/6pVC3I9GMiZChCwqPn0ZZdT0a+Uvc62MDd8+bRv3Hvs0C7ysll3MG8B0
	iyfgceMIUvAqRQIdLwbWlxctwHgR4dv0Y8vwxJlUP3AN6oFEmrqIYzXWDDeZR1q5D/c/NWf7Ft8
	TmbcFQGYGnnb7A73YXWoVtzP+jj1yQJ8ZRzz86VrzfxaGSpiEy8G7ZzEKV1znyfudO9IvEAvCTV
	RLPwvaGxyLWHptsLSvmrDxnSXwthIsrQp0KTxa5sazqj7O8DIu4K1f5bdTGNT2HTQFpVGy9urEL
	E95Sx9yB5tyIYrKFIapgdPsUaXdd/3ztPmpDOKh6TChNG8Jy6hFurXTt+Fs=
X-Google-Smtp-Source: AGHT+IHYHG8cndqPwafpQjRD9EUbG2L/pxbFOAX4rToacEG9GSUaTz4CsGD1Gpyjxtb1SkOeS/X27w==
X-Received: by 2002:a05:600d:11a:b0:450:d5a5:e6c5 with SMTP id 5b1f17b1804b1-4533ccbd60fmr58601615e9.26.1750156261024;
        Tue, 17 Jun 2025 03:31:01 -0700 (PDT)
Received: from fraxinus.easyland ([2a02:16a:7402:0:b1a7:bc8:262a:3102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e16a097sm176749215e9.33.2025.06.17.03.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 03:31:00 -0700 (PDT)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-mips@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Reto Schneider <reto.schneider@husqvarnagroup.com>,
	Rob Herring <robh@kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: [PATCH v2 0/4] MIPS: dts: ralink: mt7628a: Tweak for GARDENA smart Gateway
Date: Tue, 17 Jun 2025 12:30:54 +0200
Message-ID: <20250617103058.1125836-1-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

Various devicetree changes needed for the MT7688-based GARDENA smart
Gateway.

Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
---
Changes in v2:
- Add patch for mediatek,mtmips-sysc DT binding
- Add Reviewed-by tags
- Link to v1: https://lore.kernel.org/20250611194716.302126-1-ezra@easyb.ch

---
Ezra Buehler (4):
  dt-bindings: clock: mediatek,mtmips-sysc: Adapt compatible for MT7688
    boards
  MIPS: dts: ralink: mt7628a: Fix sysc's compatible property for MT7688
  MIPS: dts: ralink: mt7628a: Update watchdog node according to bindings
  MIPS: dts: ralink: gardena_smart_gateway_mt7688: Fix power LED

 .../bindings/clock/mediatek,mtmips-sysc.yaml  | 29 +++++++++++--------
 .../ralink/gardena_smart_gateway_mt7688.dts   |  2 +-
 arch/mips/boot/dts/ralink/mt7628a.dtsi        | 11 ++-----
 3 files changed, 21 insertions(+), 21 deletions(-)

--
2.43.0

