Return-Path: <linux-mips+bounces-7830-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A0BA3A76C
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 20:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 762433AD4CE
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 19:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFF721B9FF;
	Tue, 18 Feb 2025 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iPi9xbFX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9500B21B9F1
	for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 19:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907037; cv=none; b=JfPH2HDTjHY0+4izePCNU0LIMcGZg0JCTRwd1vzOgLnWR84EuQYM4FLjZHllsvtyVuyXTaoSp1wgjbe+ht6bBUz1m1+dMJ6G1vAhhDaRVQXoWfovI5dh2x645V/zIeIQP7yDtMnDbG1Mq2AV8kMnNk6G2tyP20h1NlKspT7WKK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907037; c=relaxed/simple;
	bh=5jr0njrsEqh+gx0/hryuSdGRgOG6j3FS8QheXHGTwG0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CzA0p28eQpaBkvbLF2dtach/S8bP0tFNKdEW3SjLLA2bO8tF2AZ8+S3oljpbPPdxG8TA+ySTxbLdwOXufq5FGEe5mnWupxErBmLudp9DeT4m0SOdWBarb5uHLH9BfhITnntNI9o1HEJIU6FJKSdr+Ydk6Kecbjze5lCtNve5b9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iPi9xbFX; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so8514045a12.3
        for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 11:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907033; x=1740511833; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mIW3Tj0XdfJSfKxjiYcsy2cS5srx8ZXffTdS0QjWZns=;
        b=iPi9xbFXoFkuOB38lOMznWFcQ1MAMFKqht6vye+n3Kr7WYFLum3f5AyOCyMLjolYZb
         Fpp85jTyXW1YczDxyrarLt+y1OTok1umGN6VdANm+G3B152uaDNvbSVo0psYdpfzZgqZ
         U1V+bhTqhffnsmDklmKh6bWKjBLirzdisLJL8LDYUp6IWExy+G1YvNyRBQSqKxf/04+0
         FlBh2y6DPVxJDi8NuFN04mH4NjuWF4S8vxwGvwdzy3xSoCDXmrVNRADn6q8lfoK2pXYX
         MXzR4tnEn1nyGHXtaBSgZhzv6i5fO0wD13ecDvXJkqIHTPSRAX/mlUObCmJK6gvN203H
         WW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907033; x=1740511833;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIW3Tj0XdfJSfKxjiYcsy2cS5srx8ZXffTdS0QjWZns=;
        b=jZ7EKo42pzqmHHe5eT4G4E+wwrKaLBqYQGqPmYMvRARRvnSuFqnTCJnSZaC3GhtO5A
         3P3HGlKBDkgoLGcDCp7gUd/Vf/fvuUD8MBL7M8b5sL8w3YYw1jdAJt9gmlTaF6Vp9wzL
         1jbIQ0J/sPFYdjuvNdMrmI9sBBwBSlrrzzCT+y6aEWznM3H4neDKIDHQHggmyjNFBtCZ
         sLK8aFV3a3h+A4JBYkQZ87LOtKveqVuNBdhlnmpdwNaFHpBOBNoIT+x3sb/Er3O7+tOS
         0yfSM5N9i8TNSpUoX22ntWFum8zx2AkhJbVty7iVItTgoNgaDnFNq9a/2IO+v+Sk74Ar
         55Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWbf71/xCaX7qlFUyoDTJadmQBeLK9FCKNX9CQmIB/4NNJ9VagN+Ue4x+y0VlA8yd6tdTFlFiOgfeCZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5raQZG+Um2j29acN/SgpkKNBw1q9Wn13eR6rATqD/b609Z/UC
	1uUWu8ReiGgihjOiXNl1F7fTHh3nrMDWAK+wH2p39xLDy/n/BZ1s57ICmGvrH18=
X-Gm-Gg: ASbGncv0zUHTYKuAvnuXUjadcGbm3xz7nwyT3yXsmMOUoWAPhLIJtnFMIcqwgWcI3Yw
	tYFG8LTbp0xZVksR+31yLMKd1QsrXunAG4iNonF6LFZ9zz/ACfOpQFttkpmhV1aXzbnphUmUVEj
	R+8vfFkmch5N3HFxySAwuz8C5KUn0/2gJqRpdzjXAesRtqXBY8SbgMd7IoXoQghTXWp0l3pBKtJ
	UQ7NMPAxk45drP0FliLEtgauhcudBfJ8Fxlo690Dxm1q7kXZPPPawR/1fioX1XED2/nNAMZ/nlg
	HtuZn1VqeOW6NbdiQckCOwNZS6kn
X-Google-Smtp-Source: AGHT+IEsUkQkmLnMxncHVAOTmPsKmvVPSTaQR78ji9vJrVN7d833EMl3VWJfxC45bU7tBdks7OZrJg==
X-Received: by 2002:a05:6402:51d4:b0:5e0:51a9:d410 with SMTP id 4fb4d7f45d1cf-5e051a9d59cmr11065896a12.25.1739907032830;
        Tue, 18 Feb 2025 11:30:32 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:32 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v4 0/8] driver core: auxiliary bus: add device creation
 helper
Date: Tue, 18 Feb 2025 20:29:45 +0100
Message-Id: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKnftGcC/42NQQ6CMBBFr0Jm7RimLbG48h6GRSmDNEEgUyQQw
 t2tnMDl+/n//R0iS+AI92wH4SXEMA4JzCUD37nhxRiaxKByZUhRju6zYpOKntELu5mx435iwVK
 ToUIZLpSGNJ+E27Ce6meVuAtxHmU7nxb6pX9IF0LCwtpbaxpb6tw+arf1oRa++vEN1XEcXzgI+
 /LDAAAA
X-Change-ID: 20241210-aux-device-create-helper-93141524e523
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3639; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5jr0njrsEqh+gx0/hryuSdGRgOG6j3FS8QheXHGTwG0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/OWNreQDN/vUjV7hrjtf9acN+LfunziKrQQ
 0+55m0edLGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7TfzgAKCRDm/A8cN/La
 hRMsD/9ziamapLyta7b2bnUpuc3WwKbKpFZ9GL/J7nw2y3cw/h5jQBYbDSF9JrRSKgzBbfv6Sey
 QRNn8YHjpUuiMQoo8wdF8JQAlfzz2s0Us6Or+rdpDD/QESOXyHDqj4MUG6FTXYd6FP3XToJ42vi
 o298p/RQJt7nZk755yQCNu+oz2gqK2ZaQnsfxtwRPjODRR7EFCDtt6GzOIQ6gMys62o6Mk/PRs+
 l1rKan/fK30ltLDStso25MaxLWBWV+npLFI35BMTlhMEwG+JTun3VMmjlWz9kiBjMqGBx2qiste
 CCASomjcV/H2nDkNLAKwD/UefscVOHz9VIb3RNV4bBZIaCNqPYvjtZw8poWesaxupOoNpkApV1I
 iuOjXT0pkOdE3AtkaBQ/6cVd15in+oW9zqTzplE86661VuagqxrOQ+l8pbmbmk0R89TtIXS6KLO
 hLZG6xJCG94i6UMTAU0hCmZlQU/CW22okUfGUHjgTYK6ptzPX+PDffsa4fBWg7IHfxtdZ2bKtln
 RgJlvATKPKlyz7ds7JlS5NJM9MAPT8rPBlDL08q9TxYGO1jW1mxv3I14XfLQ7XXv+yTGVoSNwA0
 XUgHQc8fDO8z2hMMyQDJqxbCfvG5BaZ42qT2FGwEEHgMmmQe7i0RN0x7Le1Ppt/hMQ35Cpsysif
 vfaUCrYJTwsPKFQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The suggestion for this change was initially discussed here: [1]

This patchset adds and use a helper to create a simple auxiliary device.
The goal is to remove boilerplate code that tends to get repeated for
simple cases.

Only the last change was tested on actual HW. The other usage of the helper
have only been compile tested with x64_64 allmodconfig. There are many other
simple cases of auxiliary device creation but those tend to use the
'container_of' trick to allocate the auxiliary device. It is possible to
convert these drivers to use the provided helper but the conversion is
slightly more complex.

NOTE: This series is based on -rc1. Only the first change is meant to
applied. The reset will likely wait for the helper to land in mainline.
Rebase on the corresponding subsystem will be done when/if necessary.

[1]: https://lore.kernel.org/linux-clk/df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org

Changes in v4:
- Added eyeq reset patch from Theo (Thanks)
- Changed returned value to 'valid or NULL'. Consumers should return
  -ENODEV if translation to int is necessary.
- Export the non-managed function helpers
- Default id to 0 for the simpler devm_auxiliary_device_create() as
  suggested by Conor
- Fix clk-imx8mp-audiomix config problem reported by Ira
- Rebased on drm-next for ti-sn65dsi86
- Link to v3: https://lore.kernel.org/r/20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com

Changes in v3:
- Implement Ira's suggestion to use KBUILD_MODNAME by default, same as
  auxiliary_driver_register()
- Link to v2: https://lore.kernel.org/r/20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com

Changes in v2:
- Add usage examples, as requested.
- Add 'id' as function parameter:  Adding the example usage showed that
  handling IDA allocation was not appropriate and making the usage more
  complex for simple use case.
- Also add 'modname' as parameter: Most driver have been using
  KBUILD_MODNAME and this actually rarely align with the driver name.
- Link to v1: https://lore.kernel.org/r/20241210-aux-device-create-helper-v1-1-5887f4d89308@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (7):
      driver core: auxiliary bus: add device creation helpers
      reset: mpfs: use the auxiliary device creation
      drm/bridge: ti-sn65dsi86: use the auxiliary device
      platform: arm64: lenovo-yoga-c630: use the auxiliary device creation helper
      clk: eyeq: use the auxiliary device creation helper
      clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
      clk: amlogic: axg-audio: use the auxiliary reset driver - take 2

Théo Lebrun (1):
      reset: eyeq: drop device_set_of_node_from_dev() done by parent

 drivers/base/auxiliary.c                  | 108 ++++++++++++++++++++++++++++
 drivers/clk/clk-eyeq.c                    |  57 ++++-----------
 drivers/clk/imx/clk-imx8mp-audiomix.c     |  49 +++----------
 drivers/clk/meson/Kconfig                 |   2 +-
 drivers/clk/meson/axg-audio.c             | 114 ++++--------------------------
 drivers/gpu/drm/bridge/ti-sn65dsi86.c     |  49 ++-----------
 drivers/platform/arm64/lenovo-yoga-c630.c |  40 +----------
 drivers/reset/reset-eyeq.c                |  13 +---
 drivers/reset/reset-mpfs.c                |  56 ++-------------
 include/linux/auxiliary_bus.h             |  17 +++++
 10 files changed, 176 insertions(+), 329 deletions(-)
---
base-commit: 0ed1356af8f629ae807963b7db4e501e3b580bc2
change-id: 20241210-aux-device-create-helper-93141524e523

Best regards,
-- 
Jerome


