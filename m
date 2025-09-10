Return-Path: <linux-mips+bounces-11174-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DCDB50EDF
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 09:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26A5D3BBC23
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 07:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF163090E2;
	Wed, 10 Sep 2025 07:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JpNWy7tD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BA4309EEF
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 07:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488373; cv=none; b=ZmrKKSnSWydUMsgQlCw21VcRkDL4Mr14YdgzfYq8HNUOxCvqu7HDy+xvQHJCOMMQgMP3UXr5489QU7/6Oz6FSbIdZhd9TRcQzDwWFq+gtYMbkXrcywKzm4g22weBdnuypte7Zk1DN1cgL+EGNJr+bt6t62Y+hHXl+OzoeWZa+I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488373; c=relaxed/simple;
	bh=JyAo5aV+iTeMsqYjeANCAWBW2BQHi04qwTbY+uTHwDo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=abjA5MZY8l7hYew1H915o+VsK49ANTSG9KHyxWOZSTSojJLKCs97mr5/tCsVGpgN2Xkfk2rYLph/hB4woM9zmJYbB7jOmoyrGasjb+huAoz75u/PQvOyiGec0dtLV43/C//DT+I3x3ox4LKBpODuBk7G74/Dbigvhl8cVMEbufg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JpNWy7tD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so2822865e9.0
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 00:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488370; x=1758093170; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ugpSdYBcFcyjlnv74JOlVgnvN1MDgukOMIwUTusiLEc=;
        b=JpNWy7tDHkFMt1+zZbjtrsQiy44hxqN2exwsXok2Ip4tKLkfAAksnuw2SYICtO+BDM
         BbkmjrVSy7hgS0CzvPjg/ii2O1ymyc9y5l6UYt193R7XlJbeCxlSNbBVXHeCTmUglYOy
         6/h4izbTn2UoDxTkg49D2JLa95brt79pYdVq6nw2rxeKVIdY2U+fOpqe1pm6vFMAzzyf
         uTkGNjwCBiEpcK+JS4Zav5uxRGljVDZovT9kU6EW0c8dw0Szg8IQeJi7oZ1KSy3EtfYl
         +ratfIg8jTlNpMJiuKAVXm1ZP4J9onJF6WoZKbH6Gd8mP4rFe8PUplKA9nK5B2mVpiyo
         Yy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488370; x=1758093170;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugpSdYBcFcyjlnv74JOlVgnvN1MDgukOMIwUTusiLEc=;
        b=JFcb1rx/GeZbCvwHtyR/LwuOu8N7+KgpEK+3BL/B0mPY2lXCz2fA+wKupY7co047r7
         /gU2paOyJXAJM6x4Qn31iicUTHwIyWp1NnOgx8aeNLCH6tA8jyPeoZnrHc2IOn3AyPuF
         I/HjeIH3S3g7KUCdxEnXs0BkvR7lDm6rqNIKfiOhuXjWNX1whqNUVL05iShD7bCZ9Ql7
         QQFdHi6Vf5sneEftMM7QCSOJBL0OMcE3kpn+lFwqrCdrEWkRaEDFOq9nlXc6t3yzoBlB
         CYCCVvXJjsVHHDmFaNvwyBiDdj5cFP3Jsj7BajE+CvsamqWj/P0YpvVKveEYXI9NRqDm
         6Sqg==
X-Forwarded-Encrypted: i=1; AJvYcCVNZsbmz01xicZQ6q9XXDrhROK3S86x0rn51iz9Rxt6l2N/MVgwFoMVZYsPVEDKUzJ+CfbCWdHjYP8w@vger.kernel.org
X-Gm-Message-State: AOJu0YydKTcrn1DcArVLNIO4iB+sifcqm5e2XCu3jk0UfuR+w8qsEgT6
	XrXhLnmmqH44tez9q+C2o1T4yttARNah6PCAFtec8UQ9yyj6j31bla/x6dfhiDtl8uw=
X-Gm-Gg: ASbGncs8efPoNkYhJNpP51T+FBl2e+7U8zHbijNK/GtpgrN8fT9y2G1/9lBUlru8O2c
	vKkfcQrayNhgTVFvnZzcZCD62VysDqMOkyoBVQx6r2IvsxJx5yf5x5S6YCfaKYIK1M+F2+aHd1Z
	2H3Z8KMesr9SrtipnonbRY+5Xinlq+F5SQ0zXdeCJi89+85+AdQ9CB5jMVY2vnjhpbz26L+/q+C
	IXVRjlI57yFJWVZnzCzn02sT0i6ePRsT6b8OKDqKUHYsEiCm11/m8VJEFY9YpdjRRjvM3Vp1A0Z
	MJ2cpCM0GP0lqkUM5bODpyOzxtFnt3xGiRNuadKFk9mgfF3dy7b8PL6K0x6FawrVVW6f4rVkWWw
	BIX2jCNcBIT6+h6wQCiWQyqBJOZw=
X-Google-Smtp-Source: AGHT+IHrrMN+ADtOuKlQi9RGiDHXiREsYsKqapnsUjtggDFlAyfpxz5vaWXqjzCbBFJZxAe5DLXNtA==
X-Received: by 2002:a05:600c:354f:b0:45c:b61a:b1bd with SMTP id 5b1f17b1804b1-45dde220a2emr136724665e9.18.1757488369362;
        Wed, 10 Sep 2025 00:12:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:12:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
Date: Wed, 10 Sep 2025 09:12:36 +0200
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOQkwWgC/32NQQqDMBBFryKz7pQ4RoJd9R7iItWoAzWRiYQW8
 e5NhW67Gf778N/sEJ2wi3ArdhCXOHLwGehSQD9bPznkITOQolo1SuO0csBlyedMffAJVyubxtq
 VozH0sIY05P0qbuTX6W67zDPHLcj7fJXKb/uzNn+sqUSFzWioGvqqJm3vT/ZWwjXIBN1xHB/PY
 dBnwwAAAA==
X-Change-ID: 20250904-gpio-mmio-gpio-conv-part4-5e1f772ba724
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JyAo5aV+iTeMsqYjeANCAWBW2BQHi04qwTbY+uTHwDo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTsfveREK3RfOJAEIf0cSogVExhpgipmMQB5
 UgOmXH9YSSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7AAKCRARpy6gFHHX
 cjQRD/951b9jN+lUGU25q/53L+OqAp7X8jNaGL7UM5d73EDzwETM5aeZAWTLO6xSYgnBu4XrJfA
 KyTKV/h9kNYKSZwJKhbKqP7ryv/4pgxffVYB5cbhaP8L/YqXqsLPHJQn5NXMkyoTBko2GZabHBE
 gE/FBE7+4FiIIKMd5CdwDAX0k1sRXnBep9TfjkhVfNamCcGFdcA+Ud3Vd6p5jNPp0bDt6Qb/M/7
 CbqQnyIOli8R6vRIlA/1FnwXH7VyBVPdfj6PSx01TVf8jq5ilDfdKopcPepNNMqzA3iu/4kAMbT
 5pA5jJJxpwMHrpelV6b0GJqAdTWeyqvev1CAeBih5gniwCQzokIPxQjLTq54+LboVWEEwH8mln2
 CskVygblEQHxAMHc+yodrd5UPletfslt0qEz3JUWLVMx1KKp864HX6StNfWnE1quJA5r3JDyojk
 jODmFFGWRG44nc4qSeH2+oDQT0NBQyZF0UVxmQswipM+TDkr1pfYsvhhc22u8ePrXKUWqpoeUXM
 YKPM2XqW1orlSHHg73NptBhhRlKXZsRJgSuqYk83GlpnFFBWC957OnU7bz4CgwvWZC1hFzj84i4
 5NiJNHhBjT5ZCbmkkv4R8jrCnl7rvqhK7KT3XcI2ptR5NBSXeSDG6pEqutZ0Uw2pJ066vq0xJXI
 rKKKTzEqGg5AWqw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Here's the final part of the generic GPIO chip conversions. Once all the
existing users are switched to the new API, the final patch in the
series removes bgpio_init(), moves the gpio-mmio fields out of struct
gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
the new situation.

Down the line we could probably improve gpio-mmio.c by using lock guards
and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" or
something similar but this series is already big as is so I'm leaving
that for the future.

Tested in qemu on vexpress-a9.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Use a more common syntax for compound literals
- Link to v1: https://lore.kernel.org/r/20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org

---
Bartosz Golaszewski (15):
      gpio: loongson1: allow building the module with COMPILE_TEST enabled
      gpio: loongson1: use new generic GPIO chip API
      gpio: hlwd: use new generic GPIO chip API
      gpio: ath79: use new generic GPIO chip API
      gpio: ath79: use the generic GPIO chip lock for IRQ handling
      gpio: xgene-sb: use generic GPIO chip register read and write APIs
      gpio: brcmstb: use new generic GPIO chip API
      gpio: mt7621: use new generic GPIO chip API
      gpio: mt7621: use the generic GPIO chip lock for IRQ handling
      gpio: menz127: use new generic GPIO chip API
      gpio: sifive: use new generic GPIO chip API
      gpio: spacemit-k1: use new generic GPIO chip API
      gpio: sodaville: use new generic GPIO chip API
      gpio: mmio: use new generic GPIO chip API
      gpio: move gpio-mmio-specific fields out of struct gpio_chip

 drivers/gpio/Kconfig            |   2 +-
 drivers/gpio/TODO               |   5 -
 drivers/gpio/gpio-ath79.c       |  88 +++++-----
 drivers/gpio/gpio-brcmstb.c     | 112 +++++++------
 drivers/gpio/gpio-hlwd.c        | 105 ++++++------
 drivers/gpio/gpio-loongson1.c   |  40 +++--
 drivers/gpio/gpio-menz127.c     |  31 ++--
 drivers/gpio/gpio-mlxbf2.c      |   2 +-
 drivers/gpio/gpio-mmio.c        | 350 +++++++++++++++++++++-------------------
 drivers/gpio/gpio-mpc8xxx.c     |   5 +-
 drivers/gpio/gpio-mt7621.c      |  80 ++++-----
 drivers/gpio/gpio-sifive.c      |  73 +++++----
 drivers/gpio/gpio-sodaville.c   |  20 ++-
 drivers/gpio/gpio-spacemit-k1.c |  28 +++-
 drivers/gpio/gpio-xgene-sb.c    |   5 +-
 include/linux/gpio/driver.h     |  44 -----
 include/linux/gpio/generic.h    |  67 +++++---
 17 files changed, 548 insertions(+), 509 deletions(-)
---
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250904-gpio-mmio-gpio-conv-part4-5e1f772ba724

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


