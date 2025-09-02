Return-Path: <linux-mips+bounces-10936-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1613B3FF56
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 14:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19804168280
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 12:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237BC2F4A18;
	Tue,  2 Sep 2025 11:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RYa6VL4L"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AF72F83C1
	for <linux-mips@vger.kernel.org>; Tue,  2 Sep 2025 11:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814364; cv=none; b=sxIYd1kMQeYOAqKN5vrjCfGfH8W7DToHcfq3eWjHuDJS2LwZt0IsTMYonvdTQ/hGLdNrRVyuGoZozhLbhqVE8RNOueTToWhx9v8MP0g+yDRmrShKHpSHmc7E0r4DdlAodAK/4yZydDEm04wqxoyFc/qTTsykHZAK/Je8zmVIN9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814364; c=relaxed/simple;
	bh=CWH6rc5i9GI8PJZq3Dd55C1qg3C/bWVVZKTApr6CYaw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NegOw0Pz5zeOqBVZhEQh/iK/G8lwz/qM5xO1KxVc/Tt4tcDqT3l0sKdkaq5soqKwXVLRfOpDCzhUuL34aVOE2oWIVg/6/0Wa6zJrHga0vIcxxiH562kLeHgc6s19UZyVrY74euQM7K2oUGNYThy+rwFZmL4gTqED8b+gMGgIQ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RYa6VL4L; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b7c56a987so16587365e9.1
        for <linux-mips@vger.kernel.org>; Tue, 02 Sep 2025 04:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814359; x=1757419159; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hIz/XRiJEn/7+SwD8TAyUuSqlFzhO8roQ0umvIvTvOo=;
        b=RYa6VL4Lrc4GeAVSauTTy5cl45JKndMsX97G2vWZtwYvgrN+dSnaHRpwO7/BWWfqCU
         N1kN8mQbmtA9azSjSvxfGexEL+MhTaK6GKW+Ez5/HB0titjRrUoTyzNi26XS9E/tE5I9
         5ORjkM+3u4uat7zsokZeCmAIADzEzFunNbKxcW1Tp0TmH9j7ekJi/GYYLx3OA4vKWg2c
         LQGv9qDPDAIsP4NCjm1ujceu32ifMo6Q5eus9BbjUe/b8vWanvzzF+6rmSc1sguGAM3j
         x5sRtMp49wcnr1HNFqQoRtul9/3RN/e0RrqeCi2KmvQwqgEWJ98btu/MPiN5uV84wn5z
         +rCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814359; x=1757419159;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIz/XRiJEn/7+SwD8TAyUuSqlFzhO8roQ0umvIvTvOo=;
        b=KgMTbYNF6nDF8caUKeqCo2oV1wiUjaB89HYLRK1YtoxIMicYWvLrSQPIUd4bLuqBjU
         5N3VzGj7ixeHOXQWIBO4qj5N0YJopfh1oRO6U8irLGgXRkH4529WJcNe5DzVKz7RUyW+
         Xf4B/KB7qfYTnexjtEMJPc7i16pKFThUQ3SB5i78RT8jP9wHSxPq+s5/oqfnVZd5XVvr
         zFsPDSp46BFThxlASPYxcV6LUnye6i1xKwkwhhVX3DvApIy4cE9VnFJRsfARcV6OJK+Q
         PyHj6OQ6aTJiQqJ/0ZCFc6WGry9ZtyI2GMGM9FTg8K3ihlQhqS6692F7V8mO9FZ9BP/v
         2cNA==
X-Forwarded-Encrypted: i=1; AJvYcCVn1e7VdGgSTuaubmB28fHIRFUPmwJNsWVA+bqCrEg/bG7Pri4oAE3whqb/mOuKTea9rlS4TznXtOzm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8kPHmMvC1mlJbgwYCQnRF6P7rMKEVsncHf7vfV72f03lfrTB6
	+Lw4eTn/VrR+T23kev6/g/vBDOXE5U65d3pnxc60AW2objRs81rn92nOq9S8wjiAuJ8=
X-Gm-Gg: ASbGncux0yU0p7kdNE94AZrMjqM4SJ/x7ANaoPNaaE0YqhE886FBySxGE+U5TrbuxrK
	4dQOjwa+D8EK7M77Rz0Zk1Z7S6+vFWdwD3cW6poPJuMicUUtwxx3u5Jx3++ljK0HECYJjNtsN6/
	/LeUp2qnE7bRvezxUG9SMIIZbDFR63IZK8YStiwY0Lw/8p0gSp++vXao9v5NiMxHg/ktR6AfBKY
	qYsLNDSMXRHKUo3GdWiqnSAiJqwegfQU5lTXC3KeH0VE3nIILUwHXjaGXaJ4GxEpR83voMcfdb7
	3SeywKbuQOJcTPxRxTYESGvitc11ei6R7iIH0xlJtweLOF8TyFOEGEfWJem1owP12D0LWD60w/C
	GD/erHES/3qFJLkXF
X-Google-Smtp-Source: AGHT+IHEb67NsCixws3AlMbetsgwwrkOJ2GiErvkeKQVmwAre0r9gWd9J2mS/6+9UthX/DiYV4F4fg==
X-Received: by 2002:a05:600c:4e44:b0:459:dde3:1a27 with SMTP id 5b1f17b1804b1-45b855fc86amr84229755e9.26.1756814359143;
        Tue, 02 Sep 2025 04:59:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v7 00/16] pinctrl: introduce the concept of a GPIO pin
 function category
Date: Tue, 02 Sep 2025 13:59:09 +0200
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA3ctmgC/3XQS2rDMBAG4KsErauidzxZ9R6lC0kjO4IgGSk1L
 cF3rxwodTFa/gPzzeNBaigxVHI5PUgJS6wxpxbOLyfirzZNgUZsmQgmNDszTueY/L3c6DTHvIX
 xM/lKMQzCIVjrlSStdy5hjF9P9/2j5Wus91y+n2MWvlV/RdERF04ZDdhUNoIyA77dYrIlv+Yyk
 Y1cxJ6BHiMa4wyXmivwDOHAyB0jVI+RjbGjQgeSCQzqwKg/ZuDdo9S2jZPAjNc6mCOj94zuMbo
 xoDUGGBE4ugNjdowYeoxpjAfrnHHozPD/N+u6/gD0o9MaHgIAAA==
X-Change-ID: 20250701-pinctrl-gpio-pinfuncs-de82bd9aac43
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11464;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=CWH6rc5i9GI8PJZq3Dd55C1qg3C/bWVVZKTApr6CYaw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwRILGj4z+BKvkG/pnlYhotFV/2q7B3Ztx5b
 kRLUzfxkfeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcEQAKCRARpy6gFHHX
 cjNDD/490GfMC9cfjfyiE8eH99taaHl0P1ubLDIlbsuu+rTcrZvjgV2DlOc7EUFrD+nhT7vaden
 NZv61tK/ZLrZITcf7L7A90lu9I/kwsO5d9+KK+GysXBh5CtrZgmQbwtW3Y2u0s9H6+mk+yBP99R
 uLspFlPAej+fzDFQhYfs5PhTuZoKtR+0NQrlA8pXu2zZdUF9vvEAJNwND8xM/VlsAq636XN7QnK
 BOzQ+sH2NPeBsecOZLqrXNEuXt72ZnMuc+B45NyUYoHZOysbaiiyuQww7Dapus00P1rzoqO3VEf
 RQb0f4G4PODxTmILl8xjHEbbYMl4Dp6kLOVXFOEKemare3TKm90kpNXkJJwlD3o8aDFTSp/cGs1
 BWs6VpXkNUMlyigjO0uhOki5tZLS5RKGZcSwIaGfIV5+L91PfU5+xcvrzc/Qmir1H8PR6xw5gQk
 EG7RDDARx0OP7Xc6/NT/4B6CFK7dGPqiTVHlrr1OBQqG6iffwqLKmeL9tA5SMQbMbLtCE4YNP5t
 d9l7oB+GNcgGDqgjawEgb6J7yvCvMZFvfsgWsVju2cSdkNOz6rV4V6mNxR6NyFU5290URlyg/1e
 HxnI+YlopyqfdvqaYIvIPQVsqHKzqQ9m0iiz00+XdrnJbAofF+7H+JC76OVIB7/0mTvvKd9f0xc
 5o3/PYceuZ1wgQw==
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

To that end: we first clean up the drivers that use struct function_desc
and make them use the smaller struct pinfunction instead - which is the
correct structure for drivers to describe their pin functions with. We
also rework pinmux core to not duplicate memory used to store the
pinfunctions unless they're allocated dynamically.

First: provide the kmemdup_const() helper which only duplicates memory
if it's not in the .rodata section. Then rework all pinctrl drivers that
instantiate objects of type struct function_desc as they should only be
created by pinmux core. Next constify the return value of the accessor
used to expose these structures to users and finally convert the
pinfunction object within struct function_desc to a pointer and use
kmemdup_const() to assign it. With this done proceed to add
infrastructure for the GPIO pin function category and use it in Qualcomm
drivers. At the very end: make the Qualcomm pinmuxer strict.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v7:
- Add a patch checking the return value of the get_function_name()
  callback in pinmux_func_name_to_selector(). This fixes a NULL-pointer
  dereference on IMX platforms
- Don't assign the number of functions in pinctrl device in the IMX
  driver as it's done automatically when adding the pinfunctions using
  the provided API. This fixes a warning from pinctrl core on IMX
  platforms triggered by the conversion from accessing the radix tree
  directly
- Link to v6: https://lore.kernel.org/r/20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org

Changes in v6:
- Select GENERIC_PINMUX_FUNCTIONS when using generic pinmux helpers in
  qcom pinctrl drivers to fix build on ARM 32-bit platforms
- Assume that a pin can be requested in pin_request() if it has no
  mux_setting assigned
- Also check if a function is a GPIO for pins within GPIO ranges
- Fix an issue with the imx pinctrl driver where the conversion patch
  confused the function and pin group radix trees
- Add a FIXME to the imx driver mentioning the need to switch to the
  provided helpers for accessing the group radix tree
- Link to v5: https://lore.kernel.org/r/20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org

Changes in v5:
- Fix a potential NULL-pointer dereference in
  pinmux_can_be_used_for_gpio()
- Use PINCTRL_PINFUNCTION() in pinctrl-airoha
- Link to v4: https://lore.kernel.org/r/20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org

Changes in v4:
- Update the GPIO pin function definitions to include the new qcom
  driver (milos)
- Provide devm_kmemdup_const() instead of a non-managed kmemdup_const()
  as a way to avoid casting out the 'const' modifier when passing the
  const pointer to devm_add_action_or_reset()
- Use devm_krealloc_array() where applicable instead of devm_krealloc()
- Fix typos
- Fix kerneldocs
- Improve commit messages
- Small tweaks as pointed out by Andy
- Rebased on top of v6.17-rc1
- Link to v3: https://lore.kernel.org/r/20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org

Changes in v3:
- Add more patches in front: convert pinctrl drivers to stop defining
  their own struct function_desc objects and make pinmux core not
  duplicate .rodata memory in which struct pinfunction objects are
  stored.
- Add a patch constifying pinmux_generic_get_function().
- Drop patches that were applied upstream.
- Link to v2: https://lore.kernel.org/r/20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org

Changes in v2:
- Extend the series with providing pinmux_generic_add_pinfunction(),
  using it in several drivers and converting pinctrl-msm to using
  generic pinmux helpers
- Add a generic function_is_gpio() callback for pinmux_ops
- Convert all qualcomm drivers to using the new GPIO pin category so
  that we can actually enable the strict flag
- Link to v1: https://lore.kernel.org/r/20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org

---
Bartosz Golaszewski (16):
      pinctrl: check the return value of pinmux_ops::get_function_name()
      devres: provide devm_kmemdup_const()
      pinctrl: ingenic: use struct pinfunction instead of struct function_desc
      pinctrl: airoha: replace struct function_desc with struct pinfunction
      pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
      pinctrl: mediatek: moore: replace struct function_desc with struct pinfunction
      pinctrl: imx: don't access the pin function radix tree directly
      pinctrl: keembay: release allocated memory in detach path
      pinctrl: keembay: use a dedicated structure for the pinfunction description
      pinctrl: constify pinmux_generic_get_function()
      pinctrl: make struct pinfunction a pointer in struct function_desc
      pinctrl: qcom: use generic pin function helpers
      pinctrl: allow to mark pin functions as requestable GPIOs
      pinctrl: qcom: add infrastructure for marking pin functions as GPIOs
      pinctrl: qcom: mark the `gpio` and `egpio` pins function as non-strict functions
      pinctrl: qcom: make the pinmuxing strict

 drivers/base/devres.c                            | 21 +++++++
 drivers/pinctrl/freescale/pinctrl-imx.c          | 45 +++++++--------
 drivers/pinctrl/mediatek/pinctrl-airoha.c        | 19 +++----
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 10 ++--
 drivers/pinctrl/mediatek/pinctrl-moore.h         |  7 +--
 drivers/pinctrl/mediatek/pinctrl-mt7622.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7988.c        | 44 ++++++---------
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  2 +-
 drivers/pinctrl/pinctrl-equilibrium.c            |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c                | 49 ++++++++---------
 drivers/pinctrl/pinctrl-keembay.c                | 26 ++++++---
 drivers/pinctrl/pinctrl-single.c                 |  4 +-
 drivers/pinctrl/pinmux.c                         | 70 ++++++++++++++++++++----
 drivers/pinctrl/pinmux.h                         |  9 ++-
 drivers/pinctrl/qcom/Kconfig                     |  1 +
 drivers/pinctrl/qcom/pinctrl-ipq5018.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5332.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5424.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq6018.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8074.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq9574.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9607.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9615.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-milos.c             |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c               | 45 +++++----------
 drivers/pinctrl/qcom/pinctrl-msm.h               |  5 ++
 drivers/pinctrl/qcom/pinctrl-msm8226.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8909.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8916.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8917.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8953.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8960.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8976.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8994.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8996.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8998.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm8x74.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-qcm2290.c           |  4 +-
 drivers/pinctrl/qcom/pinctrl-qcs404.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c           |  4 +-
 drivers/pinctrl/qcom/pinctrl-qdu1000.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c           |  4 +-
 drivers/pinctrl/qcom/pinctrl-sar2130p.c          |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc7180.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c            |  4 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c          |  4 +-
 drivers/pinctrl/qcom/pinctrl-sdm660.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdm670.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdx55.c             |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdx65.c             |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdx75.c             |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm4450.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6125.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6350.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm6375.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm7150.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8150.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8350.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8450.c            |  4 +-
 drivers/pinctrl/qcom/pinctrl-sm8550.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8650.c            |  4 +-
 drivers/pinctrl/qcom/pinctrl-sm8750.c            |  4 +-
 drivers/pinctrl/qcom/pinctrl-x1e80100.c          |  2 +-
 drivers/pinctrl/renesas/pinctrl-rza1.c           |  2 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c           |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c          |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c          |  2 +-
 include/linux/device/devres.h                    |  2 +
 include/linux/pinctrl/pinctrl.h                  | 14 +++++
 include/linux/pinctrl/pinmux.h                   |  2 +
 80 files changed, 288 insertions(+), 227 deletions(-)
---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250701-pinctrl-gpio-pinfuncs-de82bd9aac43

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


