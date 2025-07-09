Return-Path: <linux-mips+bounces-9696-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48160AFEC26
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 16:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A55B1170717
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 14:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBE12E54D9;
	Wed,  9 Jul 2025 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lbpJ+dQL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141EB2E0B6C
	for <linux-mips@vger.kernel.org>; Wed,  9 Jul 2025 14:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071948; cv=none; b=DISS7EG2E5ZDJFqVkLgzd59yez+WJse2a5U+l3YoWOhOlvghYNhlNIfoiwe4wlR4xqbBc3FbieyBG/7g/JxSxYF2NtAMgFa0FslA7Fv3GkjL87yLwsLaA9ZNIN1Z9z1TDWwbarOwDJ958fu4CBl20WJ7dgrT2ryF5uPZ2ph6GOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071948; c=relaxed/simple;
	bh=w2AMNntG5JVT3VerofkPkRvA2VCCC+PT/juzVmGpslY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J3O21x4C/LlyXEaZrHtDdy8TSe/Xn9FA9YHtN/+q4vL25xIXkDlhbJW1EHkduADS8GX5yVxoj5IxtK0/8kz+A/Wx7LmMa9t/LltgRWkFT/XAzgzJ39tHEj0SxAhmPnqs9HFWAPwgbIwhi/0HB0lgFDsAQhSH/VbKlFCMzn9pPwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lbpJ+dQL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso200f8f.2
        for <linux-mips@vger.kernel.org>; Wed, 09 Jul 2025 07:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071945; x=1752676745; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGW+WcdeiRfvOUE6wxK/N2/741CbLaR8Z9s9+1BfVcQ=;
        b=lbpJ+dQLpOB3TaNT+JFabnHKu7xaUFI2eqgJt7eUjMhwtZ3QZ02VzXydrpg82DXrFw
         OH+i8PIJTQTeiIX0KWQp3m4eBlsJ9IdvszvAocmyeZHobZXLcF9kMur4o9l6XDLasSp6
         ICUMh+kCWMex5SgAgtS6ROTrWz8sgkHfS8Of1nKbUMpyc418/Ir30ddrCdzdXtTaF8fk
         392raCg0gU2XFiE5NcSgHbeBUc/HeOmD2Dy6WJp+cj43R7VfTW5rBdGFsyTsYo5XSsC4
         HCxVIXc32hZiYIxvFB30/61IiVkwAuonzmnPCpkf9F2DDvmeQP9Ggy8fh8QXSfRt1QND
         FC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071945; x=1752676745;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGW+WcdeiRfvOUE6wxK/N2/741CbLaR8Z9s9+1BfVcQ=;
        b=oQkimGbxNsuIUOs+6aWr6iwTpntzVkFsk/GzNsGISEd64GSrcVP8hpbtewXAqS5XkQ
         8JKvV7+j5gRHyYRz9iBZokKTJTO6B3hrDTHL0WJ/xFcCkc6Nrm1qygutqq+rRurexbcu
         jeBAQiAx1iykX0DtT5kFrRle9mxHemX4HHnW3RbMxvZ1FJCN8XzeZ/w7998IGOCqlfsV
         xZV62Yu/b+LwPJhQRC5AsFC9AhUJqNVlhkCC7m6yaqxIAfHI3GBmFtkRkeD1WdRYQzFm
         uioTeBVEO5C3oEZR/Ztxr1zp1X4q4/Kc0WWfsx3wAZzZVjrQkM4uTuvlq20ztTvwZGbP
         gPoA==
X-Forwarded-Encrypted: i=1; AJvYcCUZJEYJVKsdSQU9k5whcqlzizh3fpAcwPeZwmBMxpFjC/YJSEy+n4jAIFzBz8EHFMSaVGXx+rKAGYGV@vger.kernel.org
X-Gm-Message-State: AOJu0YzzouLIRbihUi9enhEy+oqviOsbLh0Z4p1qIsJRdEMFPCEPzevL
	tp5B9rj0gH1XbZNHcY6ghE8BnV+OgCq6eLDtCIjbK6jZIUPQ99zLEq5WhzcIyH1TORY=
X-Gm-Gg: ASbGncvzfp56zKwKRWf0qUYLy34YM3ABB3LmlwfYj/6UshxkjEaAU7cg+awy0x4VCJc
	uk+c+oGCP0yUWEgB7b7KHxN7iui5WPvAGPizy+DItYnpOoTEUvJ5xEvpx1ntrWbLbNUtdRL6ike
	on7EUPjKWoQCUPnxonHAoQevOAdjqU+ZdReYCnWh8glw4aV/JAHhPqjzdOTNUf+Yxc4eTby1I2E
	BuqxwtAm9B+69Jy5azjLgsgCcGkgij45AgfUOASc5YbreD0IBZOIvlTZU7X3uPzBu8Lle5yWYk/
	lF1nNvlGkLwwuYhV7JYUz+NmcRCn1KkAv8jTsMB0w8Lt6QyAOT5u6Pk=
X-Google-Smtp-Source: AGHT+IGlmNbINJm0KaMDSzduhfz+ShajpBiESmd1e8fY/sU5o0YXtokQMoXhTCKRgRKzszNX/KJjcA==
X-Received: by 2002:a05:6000:310e:b0:3a5:85cb:e9f3 with SMTP id ffacd0b85a97d-3b5e44e3b34mr2285526f8f.12.1752071945022;
        Wed, 09 Jul 2025 07:39:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 00/12] pinctrl: introduce the concept of a GPIO pin
 function category
Date: Wed, 09 Jul 2025 16:38:56 +0200
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAB/bmgC/3XNQQrCMBCF4auUWRtJY9XWlfeQLmIySQdKEia1K
 KV3Ny24dPk/mG8WyMiEGW7VAowzZYqhhDpUYAYdPAqypUFJdZZXWYtEwUw8Cp8obuFewWRhsVV
 P22ltmhOU28To6L27j770QHmK/NnfzPW2/kT1R5xrIQXaokrXNZfW3kcKmuMxsod+XdcvW1Uqa
 LsAAAA=
X-Change-ID: 20250701-pinctrl-gpio-pinfuncs-de82bd9aac43
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6786;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=w2AMNntG5JVT3VerofkPkRvA2VCCC+PT/juzVmGpslY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8FcI2D8a2Ufzx8VsJewJjibpjtoV8Anwj6Z
 4AYVKn2//WJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BQAKCRARpy6gFHHX
 cqoDD/964u1f+lWknrafDtpv0WfPWN5NREEtSN7drjx3BL14jCkt4IMpDUezTrfyJj51VERF0Wh
 ggzSBcZlFHXNCYl9m28YdowM3YiIZPiFZGhhNPLDY6x71wQWUv6Cb5WYgMror7IrwY4RQXdxmZL
 qy1UMm7AzAcfMIj8iCZ7i1RKHnVPUtgHoUdWS7xNWQFCp+N7P0sDz+KP0JlRPZOvy/i/fmjvvAT
 Wafa+olH9ayiJuPhhcv3Kc+CBVRk5/Xc6W5evNrwBGzeWmzmx5Ydx3673n4gcfwCzmwun0D1En+
 cQiRV3oWObr0AO+efugfncDZmZt6NtcG9LO01y+TZ3EazHqjEl04ftk26VWzjPd5fc+SRdS3C4A
 qW5LNAubEiaEs5ymQeisGE7MyJ1FYwwzuCh3nSfFIAvx3ayvGbyhAaamXDwLtRjwGr4awg9uZD/
 j37T+Lcg6gl+lG49b87QCUFwksuxw8okPKZfr18AZdj7z4fDxpyXWoyshHQpT9Me2jmI7AhtIJ1
 cgl1SWyPozFCx4xxUvr3CeRfDSnyxtK+H27o62hQchKsIfWV64N03z1mlqTaBu9WhJQ7TrepMQB
 NMxVE7VgSCIyezknKFPn0oPdeVACVbI8pRMiIU9HYSimjgTAUowd4kaZn7lOiLksBYinqp9B4BQ
 5/l/iNCr3VCCa+Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Problem: when pinctrl core binds pins to a consumer device and the
pinmux ops of the underlying driver are marked as strict, the pin in
question can no longer be requested as a GPIO using the GPIO descriptor
API. It will result in the following error:

[    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already requested by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
[    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100000.pinctrl:570)

This typically makes sense except when the pins are muxed to a function
that actually says "GPIO". Of course, the function name is just a string
so it has no meaning to the pinctrl subsystem.

We have many Qualcomm SoCs (and I can imagine it's a common pattern in
other platforms as well) where we mux a pin to "gpio" function using the
`pinctrl-X` property in order to configure bias or drive-strength and
then access it using the gpiod API. This makes it impossible to mark the
pin controller module as "strict".

This series proposes to introduce a concept of a sub-category of
pinfunctions: GPIO functions where the above is not true and the pin
muxed as a GPIO can still be accessed via the GPIO consumer API even for
strict pinmuxers.

First, we introduce a new helper for adding pin functions to a pinctrl
device: pinmux_generic_add_pinfunction(). It requires less arguments and
will be more flexible once we extend struct pinfunction. Next we use it
in a couple existing drivers (not related to qualcomm but I figured it
makes sense to add some users). After that we convert pinctrl-msm to
using the generic pinmux function callbacks.

Next, we implement the GPIO pin category functionality in pinctrl core,
and add local infrastructure to pinctrl-msm. Finally we convert all
Qualcomm platforms to using it for "gpio" and "egpio" functions and then
enable the strict flag in pinctrl-msm.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Extend the series with providing pinmux_generic_add_pinfunction(),
  using it in several drivers and converting pinctrl-msm to using
  generic pinmux helpers
- Add a generic function_is_gpio() callback for pinmux_ops
- Convert all qualcomm drivers to using the new GPIO pin category so
  that we can actually enable the strict flag
- Link to v1: https://lore.kernel.org/r/20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org

---
Bartosz Golaszewski (12):
      pinctrl: pinmux: open-code PINCTRL_FUNCTION_DESC()
      pinctrl: provide pinmux_generic_add_pinfunction()
      pinctrl: equilibrium: use pinmux_generic_add_pinfunction()
      pinctrl: airoha: use pinmux_generic_add_pinfunction()
      pinctrl: mediatek: moore: use pinmux_generic_add_pinfunction()
      pinctrl: keembay: use pinmux_generic_add_pinfunction()
      pinctrl: ingenic: use pinmux_generic_add_pinfunction()
      pinctrl: qcom: use generic pin function helpers
      pinctrl: allow to mark pin functions as requestable GPIOs
      pinctrl: qcom: add infrastructure for marking pin functions as GPIOs
      pinctrl: qcom: mark the `gpio` and `egpio` pins function as non-strict functions
      pinctrl: qcom: make the pinmuxing strict

 drivers/pinctrl/mediatek/pinctrl-airoha.c |  8 ++--
 drivers/pinctrl/mediatek/pinctrl-moore.c  |  5 +--
 drivers/pinctrl/pinctrl-equilibrium.c     |  7 +---
 drivers/pinctrl/pinctrl-ingenic.c         |  5 +--
 drivers/pinctrl/pinctrl-keembay.c         | 10 ++---
 drivers/pinctrl/pinmux.c                  | 62 +++++++++++++++++++++++++++----
 drivers/pinctrl/pinmux.h                  | 13 +++----
 drivers/pinctrl/qcom/pinctrl-ipq5018.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5332.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5424.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq6018.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8074.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq9574.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9607.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9615.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c        | 45 ++++++++--------------
 drivers/pinctrl/qcom/pinctrl-msm.h        |  5 +++
 drivers/pinctrl/qcom/pinctrl-msm8226.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8909.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8916.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8917.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8953.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8960.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8976.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8994.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8996.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8998.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8x74.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-qcm2290.c    |  4 +-
 drivers/pinctrl/qcom/pinctrl-qcs404.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c    |  4 +-
 drivers/pinctrl/qcom/pinctrl-qdu1000.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c    |  4 +-
 drivers/pinctrl/qcom/pinctrl-sar2130p.c   |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc7180.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c     |  4 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c    |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c   |  4 +-
 drivers/pinctrl/qcom/pinctrl-sdm660.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdm670.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdx55.c      |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdx65.c      |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdx75.c      |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm4450.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6125.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6350.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6375.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm7150.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8150.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8350.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8450.c     |  4 +-
 drivers/pinctrl/qcom/pinctrl-sm8550.c     |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8650.c     |  4 +-
 drivers/pinctrl/qcom/pinctrl-sm8750.c     |  4 +-
 drivers/pinctrl/qcom/pinctrl-x1e80100.c   |  2 +-
 include/linux/pinctrl/pinctrl.h           | 14 +++++++
 include/linux/pinctrl/pinmux.h            |  2 +
 62 files changed, 167 insertions(+), 127 deletions(-)
---
base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
change-id: 20250701-pinctrl-gpio-pinfuncs-de82bd9aac43

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


