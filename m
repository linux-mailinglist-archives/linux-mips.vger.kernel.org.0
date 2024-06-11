Return-Path: <linux-mips+bounces-3565-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B96903A20
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A1191C22012
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE408178CF1;
	Tue, 11 Jun 2024 11:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaOvJfi9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBCB171644;
	Tue, 11 Jun 2024 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105537; cv=none; b=UDihHFFiigH+RuRqebJjkWCq2wAvRwSW7A3lCpHbj5WZ33XvAJmsRlVzemO44pZxP/UQ3bou42fbjwuevhrsbogwEsXGEiMRzHysAJMzhEiW/LFRyWF7I8AGqU/MmO28D4TRwGk01ftXVEB7VW716jDy4oVH1xl0ZCP8OcTkOGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105537; c=relaxed/simple;
	bh=R5AWGqF7+0BvYL3AmgE6VyRPPP37Za3cS2p/DkO8jjw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EnTugtMHr3qZWlc1MOKom6tZUoD8WGLL4Sb9cEqEgzDVPvKyhKxooLQGEu97UeuJ7vfjavw4RKUC4AI4MtlLV8vvI97D5fVDqka0qrqqSCAejYkphu2g//vSJaO3zsW6miiS+SuCyYxziQigqGP768qG5POgv9CLU63RFm5Jugk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaOvJfi9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-421a1b834acso17601485e9.3;
        Tue, 11 Jun 2024 04:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718105534; x=1718710334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iAmwsFns9JAnMUeW6MOSQ6NrqNWyIGTK87/ABQlpO6A=;
        b=TaOvJfi9aYox+64Pu4BTmwCn5ceMRpM+2NGx+vdMXIZmzxvGMH9TAoemM2TjXlsB37
         PT60YsKKSHe10vNvAm8lp6LB3d45sEOxKbkMTPpZR1V/Yi+bq3u9wCjl0fjXuWzWKMWQ
         hSqNivu/hAQW9a89LBT74J5iFzpQjexJSS/GJEmURi54M6w2DAYtWZM1F18jfDdGcp0o
         ZfwHh75Ao7S0KhyZdKwo5D1+EktcdbaWVH3ZoXMMseNQ6g0uTAmtCGLl7YveV2nFhyWD
         4y/DI9mIG6QVOnEranJTgBhljGdX1W1L1nDzw/gUQ8Cm7j+xgQK+sJp/3yfaOAx9bwkQ
         MARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105534; x=1718710334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAmwsFns9JAnMUeW6MOSQ6NrqNWyIGTK87/ABQlpO6A=;
        b=MkWHDA2nzbMBZptw/M3hMREYkZvaRPy2LYWgxkVHgOjUzKq5KkBfz+szA7IGfOAyNh
         mZqwuiThdBCo2pYXCpMmYKmwwUBgHJTt+bDM1Ftj9XbwgKej0cCKq7oPTBDGxD7hx5Of
         iLGzRhysnz6JGuIQWYvy6FJk2xsVI0iHzQmo3CcPzh6QGYFy+8NCIyQWBZLl9nZ+gon+
         4p+u6MXuco8gnN8PgFwyoSuzbWjAsVQSYsMhP2UVvvzmahrb61pP2U0Xw8Y6MKUg2IEw
         Rhv48yuZWjrwmb/TrrhJ7clYqjMIYaqTzPMHNUwRIIQfHeLMj/OLRzXRNGEmajTbXAIA
         CTDw==
X-Forwarded-Encrypted: i=1; AJvYcCUmsD7hb47a0GBBt7NjCO5OnvzZSLyACFcxC7oK0wc1RxFd87QKogd4EUFs3zxJWcefaocw+dd2dss/Jp2/pFkE/nhqKJZi/1htpY6U6LFsk6u7Y23foTUYTko8+lsdwAvjn70Qnnn0PJxQUACdg0tm2a6ztdBDaaMjyytITYglvdf2f54=
X-Gm-Message-State: AOJu0YwsF1sXL5RtIsU3AjlIE2v5WTpZEzcHA7/o13Vdp+nWKWkBBN1b
	UuYyQ0D5s92mZ9b23plkpyo4wKpF2CHsAZhe1If06Czc4eMtd3Fq
X-Google-Smtp-Source: AGHT+IGLBnPl5dIR7IwVCK3ZBa00jbrkeJrUN1XCn7y9FxUH8UbesX6JRCJmiWP+MXr/tDMzkJCfUA==
X-Received: by 2002:a05:600c:3ba0:b0:421:78c3:9d11 with SMTP id 5b1f17b1804b1-42178c39f55mr71836115e9.1.1718105534028;
        Tue, 11 Jun 2024 04:32:14 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4227467990csm2473505e9.1.2024.06.11.04.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:32:13 -0700 (PDT)
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
Subject: [PATCH v6 0/5] mips: bmips: improve handling of RAC and CBR addr
Date: Tue, 11 Jun 2024 13:32:03 +0200
Message-ID: <20240611113209.8142-1-ansuelsmth@gmail.com>
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


