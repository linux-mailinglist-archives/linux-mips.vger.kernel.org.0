Return-Path: <linux-mips+bounces-12869-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 072F1D159E0
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BA1F3038058
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B942C08BC;
	Mon, 12 Jan 2026 22:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L05x1sN+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="q05biVCY"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDA7270EC1
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258133; cv=none; b=YaU9wM2aWnRWwfewJAxdggyfR3xbAkbmZxkmxp6jh2NDtfxGnSntXgB2f5UpulE5zjHXKV2Y3IAfiNjIG3NrR/uF011krocStydjodPHrwU7di234yiEQhOpBDSaor6yJq4gQhj8TMylVvRKHmJTQV9zG6SjmR/w0b/dsp0kIHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258133; c=relaxed/simple;
	bh=IR+TmzD0ysZ78J6bQx6x1iu6Ze00HgqHkro6FF8QR4M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ckwUCWhkqyGXfuectxypvx04YOEJcz3uNR9i4vaRGj9X8rPuyUNF/h9c8L+WVyzMdAOr7na9yzr+m/x+y5bgJpvzLSEtuzJ1ccv4XfnSS8r8HMoXmSBCuoq8f/INVqtUeO5IMhaL6HBsDcdce+R/X75KjWIblI8YXTZa4yWqhGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L05x1sN+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=q05biVCY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CDN4F6qUleOsb4lA4R6ey6LptN7RZrVSPyp7G30h+N4=;
	b=L05x1sN+wu3Bg1FqRHADVkLK9Z7BPsYYQSOAm32a/CmFQTNgiC96lkwbBSS+dnhy7PCUSU
	ft7RqXhtGkJFBFW96yZ4ehnaGWBi96vqTu32DLQeLllcM8s4AwLFRJGOZeAJlW5Exhq49I
	2wgQKrGIaeNeVnofswtAdWUAROEIkzI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-v6u7diw8OVWs7I17Vv3uJg-1; Mon, 12 Jan 2026 17:48:48 -0500
X-MC-Unique: v6u7diw8OVWs7I17Vv3uJg-1
X-Mimecast-MFC-AGG-ID: v6u7diw8OVWs7I17Vv3uJg_1768258128
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22d590227so856032385a.1
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258128; x=1768862928; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CDN4F6qUleOsb4lA4R6ey6LptN7RZrVSPyp7G30h+N4=;
        b=q05biVCYG6+s7QaO5S7nLdRHXx7NCnt+G6LSNJgy7kEFiUx27TXNGw3Dbudca43mzL
         CWjGW4wEBVzFxo+ZfjJqxPg/gnvGiDRBNZgsXzi1mEHuOyjOmKZsRqInK7Ex5kVFgsop
         bf2i048qUCkiOyHSBVJjiXiVuteBminflNwKZYEjqp3HgZ3uTg31h2MySVuYL9p3dknF
         gss7R+kd01WoAR2gTgyBguApi09IRCEpOm9nc/AMiN0xchQu6hpLztYul443ALjDhUkf
         iMeuI+EZI71yynVa+WX1IrbTj9sNigrjJeG2WQvR2aQix4HDAWzSqd59anNXGPB/lhLT
         UipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258128; x=1768862928;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDN4F6qUleOsb4lA4R6ey6LptN7RZrVSPyp7G30h+N4=;
        b=UKjEwy4TB288FuK2XveP3PuNpwJQUQrK6lkq4JjwCq1V9rQYhGWz29hfjJtGe0J08w
         VfHKcJhQ5YZHVX9225NwMaggT4hLY8pkGR+DprXQBeMEMx6LqHQSvK8jfwhSlMhVTbT6
         BrBxYhFkisdiHBQnudiMGXODOyXasCUROgr6NJ2DznLSl7sUGcMz+OdsjIe7ohH6vAVx
         IjfOw6jgJ6v4qqUVBhLpNuyG+7LkzIQ4PfowZ9so5sGhVW9U2xpIsy7O499ptrJSOFiS
         d8aGbW8ADQrk7j14EKRkl2/z4vcHzIalQ7Ujjj+tJDSfoOAE4T/x9z55gyrUlK1dwdZ3
         RIqA==
X-Gm-Message-State: AOJu0YxKDNc9UKy7rjdeVwKoHeFx2Rb4bLELp5PtQt8FNU3FyP/lSQ2j
	+B3/fKoAf/nHJ2PwN67ZlBwCkMzCOvncLvJ3UAvZd5MSRsId4iW+HeVsvrOl0Nnq9a3TW8lZof4
	nBz5eFlyVPc0yTlPLjoaZ/G1mCtFyfuWRqzsR7iVCs6p6RRmV1Z/HbPLwbB+/P4M=
X-Gm-Gg: AY/fxX4b0EIqrQ/Y248EhSSqsIeZXxJXczAn+D82EyaUrfgmZ+f6vf2P+wR0VwJ3YDS
	5LAZnXTP2R0EdcIwxGbQcPiqEhxT5H9TotPx+2Omb2mPgAkTmN9yE+4/btEpPMVvWSsBrQQ3q1Y
	f43Yqn9gP7tO6zvReqKJ/6JJQwhlst9oF4u//1utMwRV4xK0ObVACFHeEHygw/Vzx2RJzq4ouZt
	F6lokeklfHFl9maw4HxuBsmH0aPGKkuYVCqZwbuIEttYBnNCPxqgPnq3/jvHASWbtnrIyu934m7
	cFBbd4uEolRvGuzwg84pW3ppHccwhQzAk1b6WdcyBxqPSbWAybnUM3+7oKP44omB6X5VTYfg6ph
	iSM3TfF6wZLVuaPH8/ImUVrIrVw9lm3OzMczP6e4b4ZX8Mcwesg==
X-Received: by 2002:a05:620a:7006:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8c38935623bmr2691045785a.6.1768258127760;
        Mon, 12 Jan 2026 14:48:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPWoMDwjxnx/GbtLVN9v7SkK/Oem+cPThs6QHS1OCzHbaG/d9S6MNcqujdu0QuZzSKVaAHBQ==
X-Received: by 2002:a05:620a:7006:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8c38935623bmr2691042185a.6.1768258127283;
        Mon, 12 Jan 2026 14:48:47 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:48:46 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 00/16] MIPS: move pic32.h header file from asm to
 platform_data
Date: Mon, 12 Jan 2026 17:47:54 -0500
Message-Id: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7ZhSUqCuvIdhMWlHOwsoaUmjI
 dzdygVcvpf893fInIQz3JodEhfJEpcK+tKAC7S8GMVXBq10r1plcZY14yqu0xiYPCecY2HsyVn
 bG6JBEdTxmvgp7zP8mCoHyVtMn/OntD/7N1laVGjtaKwzZhg7f0/sA21XF2eYjuP4Aujw+zW9A
 AAA
X-Change-ID: 20260109-mips-pic32-header-move-6ac9965aa70a
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-rtc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4095; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=IR+TmzD0ysZ78J6bQx6x1iu6Ze00HgqHkro6FF8QR4M=;
 b=kA0DAAoWt9LdJ11+wIcByyZiAGllekmh22P+k6CeusMIsB362YoldoNTBXKzHnQigMdhcoiqY
 Ih1BAAWCgAdFiEEpG0ycFhlqj3e3CkEt9LdJ11+wIcFAmllekkACgkQt9LdJ11+wIceKgD/SEAc
 bSRBT/Jj0eRj2tXH2aaKIXYIIMlFs1D6D5TiKGwBALz0AAkbBM0CbyCjIuHXQecAXPi/aSbVCNb
 /4zNda2QI
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

There are currently some pic32 MIPS drivers that are in tree, and are
only configured to be compiled on the MIPS pic32 platform. There's a
risk of breaking some of these drivers when migrating drivers away from
legacy APIs. It happened to me with a pic32 clk driver.

Let's go ahead and move the pic32.h from the asm to the platform_data
include directory in the tree. This will make it easier, and cleaner to
enable COMPILE_TEST for some of these pic32 drivers. To do this requires
updating some includes, which I do at the beginning of this series.

This series was compile tested on a centos-stream-10 arm64 host in two
different configurations:

- native arm64 build with COMPILE_TEST (via make allmodconfig)
- MIPS cross compile on arm64 with:
      ARCH=mips CROSS_COMPILE=mips64-linux-gnu- make pic32mzda_defconfig

Note that there is a separate MIPS compile error in linux-next, and I
reported it at https://lore.kernel.org/all/aWVs2gVB418WiMVa@redhat.com/

I included a patch at the end that shows enabling COMPILE_TEST for a
pic32 clk driver.

Merge Strategy
==============
- Patches 1-15 can go through the MIPS tree.
- Patch 16 I can repost to Claudiu after patches 1-15 are in Linus's
  tree after the next merge window. There is a separate patch set that
  fixes a compiler error I unintentionally introduced via the clk tree.
  https://lore.kernel.org/linux-clk/CABx5tq+eOocJ41X-GSgkGy6S+s+Am1yCS099wqP695NtwALTmg@mail.gmail.com/T/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Fix native MIPS build by updating include files
- Link to v1: https://lore.kernel.org/r/20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com

---
Brian Masney (16):
      MIPS: pic32: include linux/io.h header on several files
      MIPS: pic32: include linux/types.h on pic32.h
      MIPS: pic32: drop unused include linux/io.h from pic32.h
      MIPS: copy pic32.h header file from asm/mach-pic32/ to include/platform-data/
      MAINTAINERS: add include/linux/platform_data/pic32.h to MIPS entry
      MIPS: update include to use pic32.h from platform_data
      clk: microchip: core: update include to use pic32.h from platform_data
      irqchip/irq-pic32-evic: update include to use pic32.h from platform_data
      mmc: sdhci-pic32: update include to use pic32.h from platform_data
      pinctrl: pic32: update include to use pic32.h from platform_data
      rtc: pic32: update include to use pic32.h from platform_data
      serial: pic32_uart: update include to use pic32.h from platform_data
      watchdog: pic32-dmt: update include to use pic32.h from platform_data
      watchdog: pic32-wdt: update include to use pic32.h from platform_data
      MIPS: drop unused pic32.h header
      clk: microchip: core: allow driver to be compiled with COMPILE_TEST

 MAINTAINERS                                             |  1 +
 arch/mips/pic32/common/reset.c                          |  3 ++-
 arch/mips/pic32/pic32mzda/config.c                      |  3 +--
 arch/mips/pic32/pic32mzda/early_clk.c                   |  3 ++-
 arch/mips/pic32/pic32mzda/early_console.c               |  3 ++-
 drivers/clk/microchip/Kconfig                           |  2 +-
 drivers/clk/microchip/clk-core.c                        |  6 +++++-
 drivers/irqchip/irq-pic32-evic.c                        |  2 +-
 drivers/mmc/host/sdhci-pic32.c                          |  2 +-
 drivers/pinctrl/pinctrl-pic32.c                         |  3 +--
 drivers/rtc/rtc-pic32.c                                 |  3 +--
 drivers/tty/serial/pic32_uart.c                         |  3 +--
 drivers/watchdog/pic32-dmt.c                            |  3 +--
 drivers/watchdog/pic32-wdt.c                            |  3 +--
 .../mach-pic32 => include/linux/platform_data}/pic32.h  | 17 ++++++++++-------
 15 files changed, 31 insertions(+), 26 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260109-mips-pic32-header-move-6ac9965aa70a

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


