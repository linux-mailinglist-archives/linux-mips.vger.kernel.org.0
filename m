Return-Path: <linux-mips+bounces-10939-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C980B3FF67
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 14:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7B04161035
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 12:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08471311C24;
	Tue,  2 Sep 2025 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QOQwCFpz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79C230505C
	for <linux-mips@vger.kernel.org>; Tue,  2 Sep 2025 11:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814370; cv=none; b=f23LESqbcSIQaYOutn1z0lclzKGUhfjK/Dvz6SxZ/FIOSlaZ2Q1+64HRC0kj4TyZEfhg+8oj8J1fs11AHYe2FV2/QFvgYCvduwp8MkhqDBqWcCaIM3IZRXCzvsuB3Y/MCB/FkUL/00FvSEYqgl2ny9mlGqZixJpClBHv/wYhPBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814370; c=relaxed/simple;
	bh=pmvjkEgGCE/8cGbODfJJcVWmMiP4NpTASf/F/GCdDQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ewtAZFZs1XSXwQek970rZDsFno25dthdRdr6Y82jrOLcj3dkL129XwXhuS4cYRUXvFml033NQoMYJepuzqE4XEtbPLib9e9vdm+0XMjRqKxNI9rVh/ae5gv37lVXC5ubBAcR02ydaSeA9pXySs+CA++CMTu0aI7lUJ0xou7vlso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QOQwCFpz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso2766835e9.2
        for <linux-mips@vger.kernel.org>; Tue, 02 Sep 2025 04:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814364; x=1757419164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgFR4JYzku3DnxtnEcUmOfGy601E4B4cVXuLJg4blgE=;
        b=QOQwCFpzzE2onGnK+sFMBFMRdtvOUx5lISlbQrSI/wlL4e5jsq7cztAynMv1BkgUZb
         APZ8IFWob4K77sXefEDHoJfIxe17yU6PCH4oHADCyJCixm7QibH+V4NwwlDjXOErnGco
         v6KJPwxbJ9JcOb+aipJjJy9Ha13aZJS2q+bBK8z3XCnuqlcedQF4W1mOpCapia/gmdhh
         ordAvd+ysZ57gDeXRBiJhSzmZCZbkfAonjPj/hlMcs14g9TjcsNJfJOy6laPXILYCDCI
         wQkqqM6XVOua8t213L8RwVW6iiMuxfbTTKZYSYEECNcmIvwUkcyGRNGGdyQVx1iEzUeO
         rTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814364; x=1757419164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgFR4JYzku3DnxtnEcUmOfGy601E4B4cVXuLJg4blgE=;
        b=IBmxNzrjKqpEsqMENIdpIkcUnL7xerecqMKP2NRlhZm9QAPHNuVDC2pg/PAlAht4c0
         nC1Bh7DAzVHPq7i37wUWF6HobmwQfT8+WdQxjMzg2FcAPlzyhouwvusGjBQvjsFXyZK1
         HrniTLsGk6G4sc6b1TGJ+/H1iwHbGT+yEnATyp0j658t8wU5TxV4Ah008CpTnbE4j6gm
         wNAVtgTyBnWTQ8vlnkJf4WKDfmtqafadfVIJMnQXhLNTSI0fnVc2EARNssXWAF66rihf
         dmMLnKgMbGVlL0qRQdScCZD0O41LSxx8cgBOFZN3OLqsqJOwtxNz6AVX63at+jkcJLAb
         sxRw==
X-Forwarded-Encrypted: i=1; AJvYcCUb+/oJqizzGin3El7zXyF1JmThtbnr48IYrrGe/R6KnNbfbdZkiksXfJpmnsZ2zhJj5leabJb/U7a7@vger.kernel.org
X-Gm-Message-State: AOJu0YxX0HOxTEP6Mdh7oMAhGKotOtKua96xsI5rMl5o8NiOBq2mfRSY
	Z32YdwNn5pvoj2oUakREtQIe9Td5MKpQxaA1JfI0MCk3KBfygXQLdXIA0PG++q+szD4=
X-Gm-Gg: ASbGncvsodLCUTav/425Awp60dMDA3UVtbRpOJJ+cGe4c8L88hYwrg8XuqwAAvY6a6M
	xAlc7CMnycIMf8SBKGsRzP20AilDoWjRWSjRP1+zH/y49/8VAnv1oPPjGT8ViXpwesP6zY6u0sN
	LtrBuOtNqczT4lEWxtuusLrJgOphWjvF+KcqqxNvXBE79GMloOyABB4gIhJJdIkls3rAOyhmTI9
	dH79VifkHtqSi3HJLKCwCitlucFetjlIwJ9ZycENXCcad8UXS0R9KAnNPR9n4u13Djb6uIwQDgK
	DIGOXiccwIf58by8VyrGYN3w0zjM6CLL0qEVYjZO7YhE2CUD7ZN4qJ8C1VCGABHLH1fmslZi3nF
	nISjkynzAM7G0mOSd
X-Google-Smtp-Source: AGHT+IEKXsHjEUhuH6wRWLK489irD13ITqJD/VynaOuVYt4g+rvkQtR7GAX4bOkX9Wr9zTMFFREQDA==
X-Received: by 2002:a05:600c:524b:b0:45b:84f2:76ff with SMTP id 5b1f17b1804b1-45b8549c809mr92371695e9.0.1756814364206;
        Tue, 02 Sep 2025 04:59:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:12 +0200
Subject: [PATCH v7 03/16] pinctrl: ingenic: use struct pinfunction instead
 of struct function_desc
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-3-bb091daedc52@linaro.org>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9044;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FkLrNkeOzJSHzI/Py7RyDUr6KQps7dFmE2AsFFRpc3M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwS1UKRgkb9ccIEU3IZ3aW5VjhJjzIWrcLvA
 hZ9ye192huJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcEgAKCRARpy6gFHHX
 ckpiEADcWoZprO9Xud4RwPgcecXpho5pCPR8wMVVtHaWIF3NsJfE2Kjy2nGdi3EpUqADsyOJnnb
 UJYIoAWcyM1Umxp4vDl5gaQelD8e4X3w3aFvpSYpH29Myl8Vw3K/UWIfrgz0CZv9OEJvWDQwXT6
 K664I284sIKrYEtXGYTUZ8H2Ffj7OEF2Ts221vDtkho1puGzJX7qzs7Fdf1Q27mYeVvhL9892gm
 atbQcnqjY/a/8xKwCyJJmaDmrnLnFoReX/tB9MEWiYLKK6KsQXApTqPgAQJ4hyQFwYGZI/UbNUE
 O4RnB5pZ3IbLMWdn733nIeeUbBywAKt92kxjmv/N0Ovl/8cwQwmNMwqJkvhZKdJ/KCmxhr8Xp38
 zYsfy6+sY8+dbnRYqDcXxOlZcWMegK1eKgyUc6OEEktog+JNGoYYeDGsILee2KqX7N4BYCP4a4u
 VuJfCSLrgH3iNwUTINLmcIYULAebuoq+BdjBKhPLlma8tq2jy9DRoM05S9gxvcr6ShCo1X6yiF2
 v10RD0B9g6NqC4oN7ovyMhSdts67P1P0E5cDbF7q9b5XaHWokUaarYXFUCu4O8aMrDGu84GkkUB
 j7GGq0nJrNfm5dsdUSpwJSnQR7bqwb/F23b/cCfFSEe69ge2KLJiQiEl0/teWhWx7WKIr89iWmT
 JyuUv2S5n9ijytQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. This driver doesn't use the data pointer.
We're also working towards reducing the usage of struct function_desc in
pinctrl drivers - they should only be created by pinmux core and
accessed by drivers using pinmux_generic_get_function(). Replace the
struct function_desc objects in this driver with smaller struct
pinfunction instances.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-ingenic.c | 45 +++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 2900513467fa4e2e9374946fc9c7a30d48aef9eb..af9d2f3081859bc4b22f6820f3b3753eba36f959 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -96,11 +96,8 @@
 		.data = (void *)func,							\
 	}
 
-#define INGENIC_PIN_FUNCTION(_name_, id)							\
-	{											\
-		.func = PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups)),	\
-		.data = NULL,									\
-	}
+#define INGENIC_PIN_FUNCTION(_name_, id)						\
+	PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups))
 
 enum jz_version {
 	ID_JZ4730,
@@ -128,7 +125,7 @@ struct ingenic_chip_info {
 	const struct group_desc *groups;
 	unsigned int num_groups;
 
-	const struct function_desc *functions;
+	const struct pinfunction *functions;
 	unsigned int num_functions;
 
 	const u32 *pull_ups, *pull_downs;
@@ -263,7 +260,7 @@ static const char *jz4730_pwm1_groups[] = { "pwm1", };
 static const char *jz4730_mii_groups[] = { "mii", };
 static const char *jz4730_i2s_groups[] = { "i2s-data", "i2s-master", "i2s-slave", };
 
-static const struct function_desc jz4730_functions[] = {
+static const struct pinfunction jz4730_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc", jz4730_mmc),
 	INGENIC_PIN_FUNCTION("uart0", jz4730_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4730_uart1),
@@ -370,7 +367,7 @@ static const char *jz4740_pwm5_groups[] = { "pwm5", };
 static const char *jz4740_pwm6_groups[] = { "pwm6", };
 static const char *jz4740_pwm7_groups[] = { "pwm7", };
 
-static const struct function_desc jz4740_functions[] = {
+static const struct pinfunction jz4740_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc", jz4740_mmc),
 	INGENIC_PIN_FUNCTION("uart0", jz4740_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4740_uart1),
@@ -474,7 +471,7 @@ static const char *jz4725b_pwm3_groups[] = { "pwm3", };
 static const char *jz4725b_pwm4_groups[] = { "pwm4", };
 static const char *jz4725b_pwm5_groups[] = { "pwm5", };
 
-static const struct function_desc jz4725b_functions[] = {
+static const struct pinfunction jz4725b_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc0", jz4725b_mmc0),
 	INGENIC_PIN_FUNCTION("mmc1", jz4725b_mmc1),
 	INGENIC_PIN_FUNCTION("uart", jz4725b_uart),
@@ -606,7 +603,7 @@ static const char *jz4750_pwm3_groups[] = { "pwm3", };
 static const char *jz4750_pwm4_groups[] = { "pwm4", };
 static const char *jz4750_pwm5_groups[] = { "pwm5", };
 
-static const struct function_desc jz4750_functions[] = {
+static const struct pinfunction jz4750_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4750_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4750_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4750_uart2),
@@ -771,7 +768,7 @@ static const char *jz4755_pwm3_groups[] = { "pwm3", };
 static const char *jz4755_pwm4_groups[] = { "pwm4", };
 static const char *jz4755_pwm5_groups[] = { "pwm5", };
 
-static const struct function_desc jz4755_functions[] = {
+static const struct pinfunction jz4755_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4755_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4755_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4755_uart2),
@@ -1106,7 +1103,7 @@ static const char *jz4760_pwm6_groups[] = { "pwm6", };
 static const char *jz4760_pwm7_groups[] = { "pwm7", };
 static const char *jz4760_otg_groups[] = { "otg-vbus", };
 
-static const struct function_desc jz4760_functions[] = {
+static const struct pinfunction jz4760_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4760_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4760_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4760_uart2),
@@ -1444,7 +1441,7 @@ static const char *jz4770_pwm6_groups[] = { "pwm6", };
 static const char *jz4770_pwm7_groups[] = { "pwm7", };
 static const char *jz4770_mac_groups[] = { "mac-rmii", "mac-mii", };
 
-static const struct function_desc jz4770_functions[] = {
+static const struct pinfunction jz4770_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4770_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4770_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4770_uart2),
@@ -1723,7 +1720,7 @@ static const char *jz4775_mac_groups[] = {
 };
 static const char *jz4775_otg_groups[] = { "otg-vbus", };
 
-static const struct function_desc jz4775_functions[] = {
+static const struct pinfunction jz4775_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4775_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4775_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4775_uart2),
@@ -1976,7 +1973,7 @@ static const char *jz4780_dmic_groups[] = { "dmic", };
 static const char *jz4780_cim_groups[] = { "cim-data", };
 static const char *jz4780_hdmi_ddc_groups[] = { "hdmi-ddc", };
 
-static const struct function_desc jz4780_functions[] = {
+static const struct pinfunction jz4780_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4770_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4770_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4780_uart2),
@@ -2211,7 +2208,7 @@ static const char *x1000_pwm3_groups[] = { "pwm3", };
 static const char *x1000_pwm4_groups[] = { "pwm4", };
 static const char *x1000_mac_groups[] = { "mac", };
 
-static const struct function_desc x1000_functions[] = {
+static const struct pinfunction x1000_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1000_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1000_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x1000_uart2),
@@ -2341,7 +2338,7 @@ static const char *x1500_pwm2_groups[] = { "pwm2", };
 static const char *x1500_pwm3_groups[] = { "pwm3", };
 static const char *x1500_pwm4_groups[] = { "pwm4", };
 
-static const struct function_desc x1500_functions[] = {
+static const struct pinfunction x1500_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1500_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1500_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x1500_uart2),
@@ -2562,7 +2559,7 @@ static const char * const x1600_pwm7_groups[] = { "pwm7-b10", "pwm7-b21", };
 
 static const char * const x1600_mac_groups[] = { "mac", };
 
-static const struct function_desc x1600_functions[] = {
+static const struct pinfunction x1600_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1600_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1600_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x1600_uart2),
@@ -2779,7 +2776,7 @@ static const char *x1830_pwm6_groups[] = { "pwm6-c-17", "pwm6-c-27", };
 static const char *x1830_pwm7_groups[] = { "pwm7-c-18", "pwm7-c-28", };
 static const char *x1830_mac_groups[] = { "mac", };
 
-static const struct function_desc x1830_functions[] = {
+static const struct pinfunction x1830_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1830_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1830_uart1),
 	INGENIC_PIN_FUNCTION("sfc", x1830_sfc),
@@ -3225,7 +3222,7 @@ static const char *x2000_mac0_groups[] = { "mac0-rmii", "mac0-rgmii", };
 static const char *x2000_mac1_groups[] = { "mac1-rmii", "mac1-rgmii", };
 static const char *x2000_otg_groups[] = { "otg-vbus", };
 
-static const struct function_desc x2000_functions[] = {
+static const struct pinfunction x2000_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x2000_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x2000_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x2000_uart2),
@@ -3449,7 +3446,7 @@ static const struct group_desc x2100_groups[] = {
 
 static const char *x2100_mac_groups[] = { "mac", };
 
-static const struct function_desc x2100_functions[] = {
+static const struct pinfunction x2100_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x2000_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x2000_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x2000_uart2),
@@ -4571,11 +4568,9 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < chip_info->num_functions; i++) {
-		const struct function_desc *function = &chip_info->functions[i];
-		const struct pinfunction *func = &function->func;
+		const struct pinfunction *func = &chip_info->functions[i];
 
-		err = pinmux_generic_add_pinfunction(jzpc->pctl, func,
-						     function->data);
+		err = pinmux_generic_add_pinfunction(jzpc->pctl, func, NULL);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n", func->name);
 			return err;

-- 
2.48.1


