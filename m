Return-Path: <linux-mips+bounces-3178-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E5F8C0293
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 19:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEA72281199
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 17:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535BB10A11;
	Wed,  8 May 2024 17:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+4hYmbz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D36FD0;
	Wed,  8 May 2024 17:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715188061; cv=none; b=R+Z+b7JRA4lTq8xn2R1u0cDQlakwp8W+ENNj273akAlgyBi/j+aLcznR861Crok/QDSYWECSpLoSgpEgp+CSkLPT3jg/BvBQl9vy5w86gaGLLjE+wbQgOYersu54QifV3y2ZvFf/07BbIxr63UdYYH8VZCdjwEpz15SAzBMN6lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715188061; c=relaxed/simple;
	bh=TgcdtXtxI62R95H5BWg8ywLoEwBFqq2ooZE9ZRACGBc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kCR+Erjq2Vng/3rIS4NmQ8OD6yqKaK6VXiVjgBrfgDzIuf1aXhoj84Ce1qzPlgd51E+x8aTivJK8WhPyICGG2ixTdd/3o/c4c4Dzh9mapq8GkKIYx5Nxj5hPxmBpt2pnF3v822aUJVvKTRRIpa0ZXk0H+nvTkS0KuTeDNq3SpM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+4hYmbz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34e0d8b737eso666760f8f.1;
        Wed, 08 May 2024 10:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715188058; x=1715792858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7iywJHAkcG7tFG6+CpLm9F2F3QcvXhajnNv1XCFGvzA=;
        b=P+4hYmbzSGSz7c+sX6fNA382SgdBZjft8Q0Lmi6lO900rVFcm2nX0rdNcgrsoNTfF2
         txpmlOagdwEGaxJ8vBsMDlM/XqEWdQKQPQL4sLboWoDANS5HI7JvRbbTkb3RZQLttbpN
         P311P+ta+TfjyiYwhgF0NZVtSxH4NExy52BeCGMeXBSkmmkU7mrU2clzZnotvj8Kbjjb
         dVZAThSIfmH3sykhVSpMjvLImS7l38DrUoTwd1QWPSjN8tk+pXv1lDWpvtIhXos9dcwN
         EuWJagmSVsIucX9CrADjzyFkqpoybOPC+ifyq0f9DNmQj80Al0GLfVtWv2KXdx5CJJSl
         nr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715188058; x=1715792858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7iywJHAkcG7tFG6+CpLm9F2F3QcvXhajnNv1XCFGvzA=;
        b=U2BNolMHAb8JVEMdNtcRf10xTHt/4V1NinioduyVYZggjdkGInwwT07sEj1hjYq4KF
         kaTI4Y1owSerUznlPQmbk7xfI0LoktTUDsHSQOvfX89jacuTV1DVW2/RqPYjGeV3367G
         7qLCLmGLd040iPGMUMVuslNeg0eZnl+sIjwr++7eAus2YaUMdP+Ahk5vLSc5Nib9nskJ
         86SeQZIJz03t12LPP/jefQCZohJ8/HgyqrwmlVvzCSDR4AZvIYtgnj+qncg64rLDDkql
         uVQstfhgpm0Z0nQQqAcG11AqiPZ2o7HLIviQ7RbQpOjQpP0dgd+dmH+bXkSVg5JXE9ir
         RK0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrTTTWjfiUGMfFjYDqimu64HfTjdW/vZEie9ge7aOZ25uMyv8GL5zcYW517n+gqA1q4m9bwaAPBtlhr68GKVdZtdqF1NOzxV4sXFvnJKfSDYNj2mZTr0FCD6JNksFfljZ6C4GO+0pqDSHX8IlvUv7jpQyXMqg4SbzBbFp+8jGt9RC8OFE=
X-Gm-Message-State: AOJu0YyireNA+IH4ulwbwJ/PmJYljQrkej5Whjq44cAdwugOr4tOZk63
	GDNJ2IAN7Bm+5FaN/g1ey7VJZrnYSRsoE31VnPqR9O2xCVqRTeWo
X-Google-Smtp-Source: AGHT+IFouGf4+90tc1Nrm7lSg3uMFWPHIRxmbr/6ZfKwQ2Yieyl8tIMsjGqkbdJlAumP9prWdrCnFw==
X-Received: by 2002:adf:e58e:0:b0:34d:8206:e76b with SMTP id ffacd0b85a97d-35018117631mr207032f8f.9.1715188057526;
        Wed, 08 May 2024 10:07:37 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id fk12-20020a05600c0ccc00b0041c130520fbsm2921555wmb.46.2024.05.08.10.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 10:07:36 -0700 (PDT)
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
Subject: [PATCH v3 0/4] mips: bmips: improve handling of RAC and CBR addr
Date: Wed,  8 May 2024 19:07:16 +0200
Message-ID: <20240508170721.3023-1-ansuelsmth@gmail.com>
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

 .../devicetree/bindings/mips/brcm/soc.yaml    | 23 +++++++++++++
 arch/mips/bmips/dma.c                         |  2 +-
 arch/mips/bmips/setup.c                       | 34 +++++++++++++++++--
 arch/mips/include/asm/bmips.h                 |  1 +
 arch/mips/kernel/smp-bmips.c                  | 21 ++++++++++--
 5 files changed, 76 insertions(+), 5 deletions(-)

-- 
2.43.0


