Return-Path: <linux-mips+bounces-3773-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C7910CDE
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 820381C2366A
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 16:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5805E1B3F17;
	Thu, 20 Jun 2024 16:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4F+Vx1z"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B71B151E;
	Thu, 20 Jun 2024 16:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718900761; cv=none; b=DA40yLpLrXrzdj7A5IJbsRkVsl/6eiwP0v/srmlByDbVHpFoFWVJF8dA5AAN2zd4SKymOKbYm/UnkR5oL1YqVHB/blqqAWstPxRNRDPcj0Cq41J3ytA12fLz0ZY72tNB97ywluFbvoS6WJ40JgDBMnCeTZvZW+60S/qaEM7yu0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718900761; c=relaxed/simple;
	bh=XjtJ6HmPGJo89edbXyv0JLcPDu/QZ5gEhbsVCK0sZE8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eoTPof67GLdx545rxgZ699ZGbFg86EBtoO0enEm9HmalBj6pnj2Y5IqmhYNBqurIEugenhDJ/A4ZU/k2lGC+NkDFIh/aq8eUKyXvtXMibha8+X05dp0c3KJ5PPMBv9bShlaz+c3fAZERl47kVbiq5xHLi3bK4BWKnnoBEROnyDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4F+Vx1z; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52c94cf4c9bso1367484e87.2;
        Thu, 20 Jun 2024 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718900758; x=1719505558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=833+zfxmz9bbSWVcLfQEhMlqBmI86SR0QRSphxPu4F4=;
        b=L4F+Vx1zQkdqy2rE1/f+2XSb1I0YJ7V63uc7twyK2RSO37kglriz1MY1gZ3LP++yuI
         cdE318bQImDkjiV2TzJT9wx09uzeSejAAiUrtZ3qzaOtNXkitZbCdXf58h/Ttuwxsq07
         BjW9XCbVTub4eC75DfcYKpXtHUsO7syMPrv0/f9NBh3QZOGe+88j/vI/CUH9gjmHWHMD
         AKlHiBUAUqvWwOk3mwp2F5Tb8xH+A9zhposs9NXcPPKHP2coki+TDjqmm2WKxkjewFZt
         zC0oPhtQOxqHp69T5dt1qlRUZICrP/m3oub3+XvmjDxyEcz3ygutyF/A6oteAEiD9qSr
         mqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718900758; x=1719505558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=833+zfxmz9bbSWVcLfQEhMlqBmI86SR0QRSphxPu4F4=;
        b=WJVAtzG15DtawDYxgClNPqad+p9O16Ezx9HjEudRZ6ui6bXN7C+oPCE9Ss1KN+FrH0
         GKNmCQis+8Oh9oA23K34Q43eadS0lozxK9EGEkO3may8VAF9Ga9cLLzpem19SvDzy1Va
         ou81SlWYNPymwr/E+YJgtWVcGZDtw5hknL3jJ6ccoBWKTSTyCW8CagVZ4JGSDhg8wfsa
         13KzQIRSKxU4S5DXnpX170gYf7P07mbEGZOgcUQY0J9vT8YVoXiUy8tlKLKyAOrr3zpP
         9vQF8mhwXDU6S2P0fZXrcT3/teYQGidoKelm18igjwrmxZhJvE6ADQHJLBTr5JDMDd16
         QfAw==
X-Forwarded-Encrypted: i=1; AJvYcCU2sBs37Gl6c8A7Tqn5VJlM2LJGpCQaTEf9chzWG+hvW52ouRKluUVXeeIvHeCkkQtUKu1QzpecgKZ0Y6S4x8yGSk83rv/DGRNvzZeWufJyuV2ETGI5GJRBwv9F5WcfBkCUiwTxf/kJngDuSe0MyQpZ7RTG3Y6gLHV+kYq/Y7vagpktREo=
X-Gm-Message-State: AOJu0YxPj2fy9eiRX3O40qOGuyU0x3FJJOZD2ae9CQud1StfU3749Ifc
	Z6K2KHvKl/YpMyXvVf91uHfXLpAF1yAoA22MjqW+WoQTLgE1AFUd
X-Google-Smtp-Source: AGHT+IG4fUEcQ1XtBapKtLC13TFzZnyP1UyME4SroZvARrkhCU7E+1ynQ6SkLGUkQ46STojhKaaEQQ==
X-Received: by 2002:a19:e01a:0:b0:52c:bd55:5b21 with SMTP id 2adb3069b0e04-52ccaa33e30mr4035766e87.24.1718900757687;
        Thu, 20 Jun 2024 09:25:57 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-362c7c2dffdsm6277480f8f.35.2024.06.20.09.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 09:25:57 -0700 (PDT)
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
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/4] mips: bmips: improve handling of RAC and CBR addr
Date: Thu, 20 Jun 2024 17:26:41 +0200
Message-ID: <20240620152649.994-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
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

Changes v8:
- Drop fix patch (applied to mips-fixes)
- Rework CBR cache patch to handle bcm47xx not compiling smp-bmips.c
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

Christian Marangi (3):
  mips: bmips: rework and cache CBR addr handling
  dt-bindings: mips: brcm: Document brcm,bmips-cbr-reg property
  mips: bmips: setup: make CBR address configurable

Daniel González Cabanelas (1):
  mips: bmips: enable RAC on BMIPS4350

 .../devicetree/bindings/mips/brcm/soc.yaml    | 24 +++++++++++++
 arch/mips/bcm47xx/prom.c                      |  3 ++
 arch/mips/bcm47xx/setup.c                     |  8 +++++
 arch/mips/bcm63xx/prom.c                      |  3 ++
 arch/mips/bcm63xx/setup.c                     |  8 +++++
 arch/mips/bmips/dma.c                         |  2 +-
 arch/mips/bmips/setup.c                       | 35 +++++++++++++++++--
 arch/mips/include/asm/bmips.h                 |  1 +
 arch/mips/kernel/smp-bmips.c                  | 22 ++++++++++--
 9 files changed, 101 insertions(+), 5 deletions(-)

-- 
2.45.1


