Return-Path: <linux-mips+bounces-10213-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBABB220E9
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 10:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F35392A0633
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 08:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01D32E2DD7;
	Tue, 12 Aug 2025 08:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uh06br+1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3B92E2640
	for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987234; cv=none; b=maf4f2gDz8E3meXR8SgsrnSnWKlgN1Ap6vKOBlffOk8iKxToDo/Qn0ePPpSUkXCLeAd7oW9QDppsrY+5ASJtSqoViKZm3Ni4XfnkrG9V63OHlgX55S9tvynnslPcvHJW7ABqNHKcehTlvCdNJNLK0AyAT9HBF4n4xxjsjNYhmgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987234; c=relaxed/simple;
	bh=UDQSxGWEdaNlEt2M7Mav0VdZbGU+CXX3IOWp5CNXy64=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ShwKl8wvaFhlADZO/EO7YqgIupyMXKS2EEmlMwHhFJW2/6W2CIIH7l7ojyMhdSJbNpMOGGBA25snkY5eCRrjPBwlAtnBCgk7J++8E0CPbKcQ5+2AXnSU1yZ7MXLBAhtydnv0zoqDFA5uf02AaCp5XRE8llmBeOw40pP/yI3HTAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uh06br+1; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b8d0f1fb49so3071612f8f.2
        for <linux-mips@vger.kernel.org>; Tue, 12 Aug 2025 01:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987228; x=1755592028; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSqLNFw5ZoJT+eJ+R/4RbrBYWHEJxUchO4svyAYAyHQ=;
        b=uh06br+1hUHuDDhv+1MpaBvwx/eVDZjNM3nUeTrnjc5W0vKbVK83rgSCjAzcbPz04Z
         Y3omjAuijSPpKXRcAO9GnfVtKoTGPozFk5/dmcCvAn4wRoMXrlsgYf939BfNUdx5GVmt
         dQtyqM3ZgyK8QlJpczWKpnxmkZD1I66Ib6ujINItisGHFs258U78xkVSGpGM6DcmHU77
         NdzkiHquTC6c5j0brtrMOqlXcWO1QUdSIHQ+lQMocXFEewagg5I665Sn6k9i0ZEn6LoE
         S6SVcgOzfGjD4zxSiUdHjmKXxWDm5iyZG9ScSDj8QKcCy1JEmwyYwRJ/mN4oWnhDIWPd
         VOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987228; x=1755592028;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSqLNFw5ZoJT+eJ+R/4RbrBYWHEJxUchO4svyAYAyHQ=;
        b=M8vdNLJX6XfbOi9yJOCQYhPS3NVCpHYMsuBxCE4Cni+whEgBH29aLWMhSVBFsVcUHd
         tkBOxs1OZ0x02c+Bq+/tEAngJu//8KhCj9lQ9ypufVlzkvnnktGjVFe3q2tU+Bz8eXgw
         bxrF7yC9qi1lEVHgeEg8tormrVmdUdFlbYgDb0N3ZHaECBdIRFFEAFlYuaD7WUI/yVOh
         DPaD1mlmdkzjFdDL2j8NE99G0ndDU/64FT7GXntLr17y4kOO30IRs7ilJET6G5kjfXnI
         TqLckN2ZF5KZj42KTvmyq8LCJRIHj1utgNSdS1aPNA1Tkyo33B7Dvr+A8dj3VCgJugj+
         pqyw==
X-Forwarded-Encrypted: i=1; AJvYcCWBglO+BmqUf+PFi8P8xsA8ryfnbMeZJGA3txoi7rZY/nVZDy9n6OnqtpiDKaS443eVwzMQvhYLj2qe@vger.kernel.org
X-Gm-Message-State: AOJu0YyRk2VHyFikvjVV2RxKLfAp0i86LBmdO+qXi8GfvC5RXBsUrKA0
	owrZuTnrh2L2G2p3/k72tmCySs/6UjgTkmsK9XwUj4NH10KvoLh8Wma3RLTOAeR8QdHU8Wn+7cz
	fTajS
X-Gm-Gg: ASbGnctvNx8s+vyGfww/VOLhu+9Q+4MpHrTKUhOvdoqQOAEZujqnMEr8Pl+0F04GcOR
	EIkDkrf7ktLDoJrBn9aIHSrsfhTMrPyV0OKX+X9XCfsbOzFXsxfLHtu/0FJKZ30kHDNn359Z6Qs
	ES/7lUi5V39S907q5X/wF/AhPkmnkctpMM8S126EMz9l68Ziy0Wx2s890Ph6cZcfBgBumDOplfH
	BdXMiail4ynYQFSQjnLY/Yev8YCjrXi5eDtDRKh6+ItECy8eI1sGqPu+FHE0rRaw43SwoD0Ghnv
	URJWmgE1hnMs4quMKV/wDn8gXF8mJhjd+HKxEQ8Ca5ILS2tC3PSr6rIesfT4MQF8jVobEuujpJY
	VPEnkeh+3SAPX3xo=
X-Google-Smtp-Source: AGHT+IGt1Qdhl1SeHXbcRrXyromUYjuvLPhngmkyHILzZlpKPBo/s3ygqlYuwwSu6svvDg9bM89tcA==
X-Received: by 2002:a05:6000:400b:b0:3a4:ee3f:8e1e with SMTP id ffacd0b85a97d-3b911031495mr2033996f8f.39.1754987228110;
        Tue, 12 Aug 2025 01:27:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
Date: Tue, 12 Aug 2025 10:26:59 +0200
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANP6mmgC/3XNTQqDMBCG4atI1k3Jn9Z01XuULmISdUASSWxoE
 e/eKBQsxeX7wTwzo2gD2IiuxYyCTRDBuxziVCDdK9dZDCY3YoSV5EIoHsHpKQy4G8Gv0T6djtj
 YmjVGKqUFR/l2DLaF1+beH7l7iJMP7+1Nouv6FdmBmCgm2JqsklaKqja3AZwK/uxDh1YysT0jj
 xiWmaaivKRCamLkH8N3DBNHDM+MaoVpJCfMWPHDLMvyAQqoo11JAQAA
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10405;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UDQSxGWEdaNlEt2M7Mav0VdZbGU+CXX3IOWp5CNXy64=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrWB2qIjviAYzOzF9rGQxbtFl0bfNv3xt3BN
 hJcX75YR9WJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr61gAKCRARpy6gFHHX
 cnenD/9QVkiYWaN45se9mVCv1Kmd7fcDNhqOnqO5k+01l7TQAlPMrQt3gTyvoe7CiEK5dDfa5ng
 aIbDkSuHtaZBpDsgc/BXeJMoESoAl36UvqOBfrX/zRL+EXlA4pE843GNpasFYss8kGdRGKbtO4U
 gcJKcstwSwRux/gfffXVtbEZO+jh7/3gggLSCCZHX0R6kJJWHhzou5kJ0h6bek677sBClWVmoY8
 eysYG00x5CQE0RPIPIM+4S2fQfWfxzhhRWIEq/YuuvJ4CuJ3LFO28NteYEEc4Y765gqgO5aQ/Go
 cn/UlbQCcl5oTQDS++2t1KbaW3KN/GDVlTpprFJQPsNzI1LyfcnlvtpUkvJeqZgN6oh3GCf55Ss
 gI0pMQB3Mudri5qmQ/yBPMY9RoPMVyuVEEfItLwmQVPnFBCFaUtksAM7oU6HqbEoLI4QwIN9XsE
 CFIHwvjFLRP9nqeDtNCtAUwKro0rLOkIkDmnsCkXIIZnZfimLTmSyBrLTY/elmWUlxfkqfAEYKV
 +z4qBQkVA4AJg6liF53vwd12SvKxjZQ8h93srCOICJ9uz3tOlOm/ZNpgXBuy0xTOpxbL9hJk2t0
 RGNzvJ1D4MnTaRwEHz9bw+spw3G0XBBakwDrnhB7sOPsN9dUclNtSpGJxeVXc4cqeavZgYMr3mj
 g7yTIfabzK5/L/w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

NOTE: This is obviously targetting v6.18.

NOTER: This series is a bit all over the place and looks like it should
be split into at least two separate ones but I figured sending it in its
entirety better shows the whole picture - namely the fact that the
pinfunction handling rework is there to allow using the generic pinux
functions in qualcomm drivers without ballooning up runtime memory
usage.

NOTEST: I tested several Qualcomm platforms but I have no means of
testing Mediatek and others. Tested-by tags are appreciated.

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
Bartosz Golaszewski (15):
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

 drivers/base/devres.c                            | 21 +++++++++
 drivers/pinctrl/freescale/pinctrl-imx.c          | 42 ++++++-----------
 drivers/pinctrl/mediatek/pinctrl-airoha.c        | 18 ++++----
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 10 ++--
 drivers/pinctrl/mediatek/pinctrl-moore.h         |  7 +--
 drivers/pinctrl/mediatek/pinctrl-mt7622.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c        |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7988.c        | 44 +++++++-----------
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  2 +-
 drivers/pinctrl/pinctrl-equilibrium.c            |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c                | 49 +++++++++-----------
 drivers/pinctrl/pinctrl-keembay.c                | 26 +++++++----
 drivers/pinctrl/pinctrl-single.c                 |  4 +-
 drivers/pinctrl/pinmux.c                         | 59 ++++++++++++++++++++----
 drivers/pinctrl/pinmux.h                         |  9 ++--
 drivers/pinctrl/qcom/pinctrl-ipq5018.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5332.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5424.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq6018.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8074.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq9574.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9607.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9615.c           |  2 +-
 drivers/pinctrl/qcom/pinctrl-milos.c             |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c               | 45 ++++++------------
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
 include/linux/pinctrl/pinctrl.h                  | 14 ++++++
 include/linux/pinctrl/pinmux.h                   |  2 +
 79 files changed, 274 insertions(+), 225 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250701-pinctrl-gpio-pinfuncs-de82bd9aac43

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


