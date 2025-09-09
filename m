Return-Path: <linux-mips+bounces-11123-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA5B4A7B3
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 11:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70CB03B4798
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 09:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0885A2D6E48;
	Tue,  9 Sep 2025 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iH0gXyKH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1A02D6603
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409346; cv=none; b=uz+Wdcd9FzJ7DxbQv1f7zhbFkB9YHh2caf9lGVsupq/R5cbZu6V3Jqiai7cdEZjSGSRRAu4uP23CWk/RcXq6L6Jjqqk09goMe8OCQz4EW7Kn9G4mhwnf65FkWSUAifnuoINMaik3thJbYtk4VKUBm4hPtuVCUG5uWs+5Hqe0B6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409346; c=relaxed/simple;
	bh=sVPlOFYsePlUlVyNjlOXy8QPDA01db/Wvcm9y2+eUf8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mHrBiY7nu1+FGDGZcnL/FGH6CiQqUWV9M8Wf7HF4abJBIIAmL00qR07Su+LcjkN2Mcrde8Hy+AGrfyPyiUEs82I6WGOoJiZbugvasMnaKveqShkTOx5egMo40QJXLYgOBHHhpuKBYrxppuvb/u3FXwrFA6uDiRk4ysAytcXCuOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iH0gXyKH; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3e5190bca95so1860749f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409342; x=1758014142; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tP+ETbVnBSQFrRZK3WwBGuGE5HSVEMwxjNtKrFEHY8A=;
        b=iH0gXyKHBnyb9tjp6vpWY6VlMKF9VjNqWlXcNzWKwy2TsIqGZBr9gVvwaerHG7s3YL
         llS6Po+PrsliYsRPf36fLQELla1i8Ez23T1TnmL/NiS/kbZNYaaTQmanlMyb4kSLoDFo
         oYu6GwgL8kAiWfxCUXMrc6pUl9pSxc9schRCdYfXEch3LrPfGpHBw2cKWX/6WmSwik47
         gMuMFr0YQ4Ce47tGt6UpXP4iTdtp/iA/DHKBjCRSVCKZSGlIxuKcc4cJ9vdjathWgh4F
         kWeCRbMfrYHHdMagV7naFnIfMjWaFCh0X8yy6XOLcb9mDk9Vrzrc9tqDDIZAorgPDnoQ
         MdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409342; x=1758014142;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tP+ETbVnBSQFrRZK3WwBGuGE5HSVEMwxjNtKrFEHY8A=;
        b=Npdk3uZMqTbOgN8SbVsleC7hDZNM8h2lQb/7cc+GSSVXZIwerAIbXQYts2lGhvCLhF
         oh+CGRn6STvnZRLCiEmM2kP1D9QFs8zLn4+2Vdf2OFy+5636vJ3jvXFnH7D3RkFKTXzx
         xfVdZqdkLbTfaddY21yWn3W078Nr3bXih1TI0ULUAeCTIJ89ZC4VVrXPWAzLhRJMJnr5
         oVBW6VSZibXpNqtP1sUVuZ2gLloHhMgkocTjbFl2IphVPlePdLE8Gf6Two8ctHFVogs9
         SyYYsovh2LaD9eFWr+If4x7YQxomBGRN13YA1OfyxPZSCpnX2bp7GwiN3a/BhdIE30tu
         zeUg==
X-Forwarded-Encrypted: i=1; AJvYcCWD71FryYqolTjZf283471aDNtb2WlY7MZmOmiRsJNEOo3KrU6EBjqfU6o3iA/nK1wdXvbwZqgt5J2z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+q77Epvxtw/0s3fC6dNbR78c0myNMmwLKBKU9hFIzn8bzFlp6
	XJPX6BXypO7QcYTYaqpiIywaA7gaS1Iz+DhoQE/1ikJ0/VPlYsL78P+ZZ3qJzLbNWaE=
X-Gm-Gg: ASbGnct/hCyMQgSKJB96KH35WRP6NkgNx8DsiMRS7ix+49qNUK0z2mijZsl2CNUt3ys
	oeRrsZWin6piIgrks3UhfiXAEceXN2xlpWxi9SbToduuGZz97xCj6/dvWNTk3rAlP8qSc9c3wz4
	Jya86YRO480sbvEljrpcEATVPhOs5n7Tzs00kaWO6ZawDv4SDYyfzcVHgVcmJ3tyNcTFWi+EmAA
	1i+EiXW6TPdrCQhFTwezxrgV9jaJzFeUUArSTzg5niaEPs/fOHu9WP4RSJMjs6Hvn6HQe3kDd7p
	uML3VRMTZG3X5MBRQ+EBSAyLJiuJicw6ypsm5rXLjM0EL2ukInLGZuAz3Sb3SfDJMJeXfBU438L
	1GZyHn5EiJEJOlevCmg==
X-Google-Smtp-Source: AGHT+IFxM+HICQsKhDaBX2Rk22xBRkSqIHTShzXPmAQzNiNBdQoOhni1m43entJS3MAB8D5d0TZglQ==
X-Received: by 2002:a05:6000:3106:b0:3e6:116a:8fed with SMTP id ffacd0b85a97d-3e64bde97a5mr9793821f8f.45.1757409341378;
        Tue, 09 Sep 2025 02:15:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
Date: Tue, 09 Sep 2025 11:15:27 +0200
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC/wv2gC/x2MywqAIBBFf0Vm3YCKIfUr0cJqsln4QCOC6N+TN
 od7Fvc8UKkwVRjFA4UurpxiE9UJWA8XPSFvzUFL3ctBGvSZE4bQ8K81xQuzK6fBntRurV6c1Qb
 aPxfa+f7b0/y+HxskalRrAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sVPlOFYsePlUlVyNjlOXy8QPDA01db/Wvcm9y2+eUf8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/Ays28j7tkwm0rJbaeX4j6Qex2lOj/LqMAOK
 1PDzm34psOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wMgAKCRARpy6gFHHX
 ciEyD/4rjlTpLHFFOAETzbM8BZ7x3WlTsL5ofRL45hTWSkD3Bsd0OZjcixkAe0OHW2e3zFw2szF
 KeXpnt2sCS7J2vacxQtg0jH2fWZAf5bZ+OoGUTAieReshYzmxRi1YJFUgIrAX33d2SDzSvQrZvR
 VCG+aKnwtsgLIS3bpQ1AqNCIuxAy4Ry9lCAY3GF9UpNsbYioHxmLpykb53ferurCzD0dP9d2FfA
 qniXI92yE/VlFaWTo+gqGjUntxHg8iOH4ZhmUCDpE+Jd4zHfEBtw+OfWRmZkRnTp79FeNdacHx5
 p6k4r4XWU7dQ7BVOwC7MAvwAE8H7OI0viWBqD/6NVLyk6JNskJqsOwu8e94Ddt2gGDw0ARDpeD+
 I7mJlpyD/qmL48+7obrP2XRtew+5bs1uUUL9Agv17b6I59tLZFIO+8lix4XEyj9/Fg2w8cNkyZY
 c24JWXw0s0j+0JaiJKzZ5d6j7Bt4uYvxV2CCUoJ7bN1qi60NyHcPYrP2AwQ8sZKU1xtPedwTG+O
 KxwLrf9Cweg0/cRvkk6QQ82ss5f+Y7QsEwe7HuuKRKPRU9azoXk5BTPKu4ym9w5yjZDgjO+RreU
 OYdfHdNscHAHrLf43/UNtW2sSEmvItWokNn8tfM/e/oZXWUa6NjPf7lUXt62Wdv9ck60Df/2/bM
 oqEJP5tTEFOaNGA==
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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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


