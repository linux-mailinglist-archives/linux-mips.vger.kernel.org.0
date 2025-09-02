Return-Path: <linux-mips+bounces-10941-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C24B3FF6F
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 14:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4F5A168164
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 12:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EDF31281D;
	Tue,  2 Sep 2025 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MImH1aML"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4AC31159A
	for <linux-mips@vger.kernel.org>; Tue,  2 Sep 2025 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814373; cv=none; b=bqpFJtg4f+HlbHuu6UNzrtVc731clOoCRkAU/voHv8OqGcOeBPSwhXHEq3NKzzIY4Kj7F58aygO62eyrV3kloRvil8gdTmCUEG288RpGjwAj7/nyr30uID4WwZ1ugN/aPCOOmII2jV5cF7XJfz/bdcTc4y/5gqPhsnV86Ehv+Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814373; c=relaxed/simple;
	bh=h92VdWtTLApDByRSxs7zAl3zVEqRHT0PylmPFK+hu/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrKQzg7DSMYznkH0zTPGLTxMuJZIqgDQErXO13UIpSx/6KDyQQDeFfXErlMZkdyE8a4ke3J92adUheijAkSS4uU8wHCDmlle6Z/JbboMh3BYyXy/6lsaygl1Q0W74taqW3C9e9bwSDNCSqyloF5hsOOZyFxmbbtSJV0xTLH4wn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MImH1aML; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3cbb3ff70a0so3313711f8f.2
        for <linux-mips@vger.kernel.org>; Tue, 02 Sep 2025 04:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814368; x=1757419168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmF0qpL5oboyNo2+RmqzBhbIr3GiIG0yX04mHf79OJ4=;
        b=MImH1aMLfK5bAUgmcFlE5zi1bddkgZMJdo75IB/wCIzlWRgr7GycR+R5OOmIQiIZAJ
         tRAaV/aUK7uwqGgdO38MIOeadeh0Mt75IKkguKs4WKGcDpQqlRn8RSWVF+ejB46DnGz9
         bQoQb7OS1otBmPvKQUaVliYy7pp4esDqE3QTpzIwo1o9emmxBqZpQe3R28+AnvmbiAta
         RPDDPfa/TMEd/xS0EwDp0+xXT7RPzpPj4bvPUig2UJTeV89YNmouc6PxesKVVM+R4EYj
         /Jkx246E2WcTiClyCUVnTME3QClX7SP09Jei+e3n0aC8RvloDhM3la3SuVz+ucoJ67nV
         s6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814368; x=1757419168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmF0qpL5oboyNo2+RmqzBhbIr3GiIG0yX04mHf79OJ4=;
        b=k4FwGGmwN2Da4VHFT5ZVqk3JfhINjlRuUQkxBzVZxR3qRPujB8zYlDJA7sRpLUUK+V
         bnI5oXo50ZDTF35/GafxCStmVpEqAzOcU/FmQL9HTWPqa/Lsow6xcZIA8wM4qsjoUGk4
         KzVTlUXoxlFkfjm7GifkVPgv+6kNixQ5lFDBGw5sazkD+Z0AxJqZ7A/Z6o7K2Q7Nn/lw
         sQGbhDkVYcCAh4n1QsOz8FUYw+qg9csHFKN6fuZggQANCDGogiR+3xao0RHa1YZnDLt+
         ucIbwyxxr2oR8zTwzJv3le+EnAKUkmuX4zeid4EObP6KYQwHDknHWD5Fo/k+ULOnRPx0
         tZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO7hJ5smOFJFe7lSeTFrL8HIjnfhUMaycY6lFpXp3pb77ASfibFriu+zPTSjqE6VGhDEsLd0xcPBAG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi6s+5i3yt6dGxtPx5EPcKLfG+ok6Wc1j8EGEuswUhKYgvpicH
	S1IMv+kA5CDBGCWudb89hr06Hnc4Smxct80VZdrepcude+T+n6IPbOP0KnPKTrxAU+M=
X-Gm-Gg: ASbGncsJ9EKVBG5jlgh8TmEvAoInBlKj4vNdg5JjO6KRhT7W/1akYxPkwOHRcfHytXx
	nHpcPHuCe9q/wMc6TMoZSj+5gS4GyVomh5eWStSoot0sqjaQ6N5ihSTdZ0lvjKrlT/9La8S5nQq
	mHfXrfx0q47SI/pJC4aFSr9OxNfPpJvDr3mvc9W4qXXQM9uO1wlLnZJOZaLUV76CEnM3yjZHDq5
	J9uhhv8oqJLQEHxyA50QM5RIBwGZD99d42IGO1h3xZHmIaSQbP+LSyRKVCPFS9/+5racWOy0IT+
	dTaWtnSHTulVbANDwO2nzNV/qKk7usIZ+ipwbR3sX1P/LKnv9IpCSFeaqbuGrhm1OlCdGX+BlNB
	JxwFTmkWAv/J+QluAh6ly1VzpUMI=
X-Google-Smtp-Source: AGHT+IFZ7E4qbu9GejC27onbw6mbXjiRANVPMdB54XgewR8O68DakFlPRZsFccnnckZXTOfFslbDVg==
X-Received: by 2002:a05:6000:22ca:b0:3d0:64c1:1a40 with SMTP id ffacd0b85a97d-3d1e01d67bemr9364150f8f.46.1756814367522;
        Tue, 02 Sep 2025 04:59:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:14 +0200
Subject: [PATCH v7 05/16] pinctrl: mediatek: mt7988: use
 PINCTRL_PIN_FUNCTION()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-5-bb091daedc52@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Chen-Yu Tsai <wenst@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3024;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8RlOPiRQytIjx4Cw4oHKC1GB2mrKTE7YNwjd+43Fzro=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwSF8whOHOZFyDolz0PilXXDCaAKXuSMNm60
 NzxyV+0c/yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcEgAKCRARpy6gFHHX
 cvhOD/0doe9DrmFXc7kS6/vcFyVXmEZSMqBFgmLcg4AZiHNYSGgE6MREhSdt5aBNKA7+rTuFQSi
 Y/nixATKCNYzUBUbmWqID2G2AlCMLLQF+VWSCfX96j9ieWw3V3tRY45UwvKNYSEI5W7wMZpg2ZL
 fGGgah3dEUWiT2yUVsG+X1PwKZUR+ocw23x6qt2tkI9gdKNBYBM6bbVnBdoob0hyIWU1FWq/ysj
 yu8gwxPTG6/t7oEbmaG0azFzobwcBLlkzhmh2ogg10CIoW1biAP1md+rFvJr8gkJ6AEMCn1KTea
 WxXvATAgG0gcYNkyN3NERiEgy2JVZeIYRuv0K7EBHjdLOQpdK4giSrbqvTT24ukwhxk3VA6jl4H
 ejWypun21rg7T47OE46nHQCqtQ2yXtCJm1igGFiO2iisi3fTz//i+JWB3HFjnENnD481g4p8Zia
 l0YU3rQjP6ZF5hhPoatjaPN3JFdOjiNef99swA2bw56a2SlzEhj942caTD93krzqPAB5YJtsEU1
 C5BK073g6ZsIuQS7ZTy5mT5vEJ/wMHxuEEoMlKMOVayopJtGpV+QRvurnIVM1XST8tvP9kO/7Rb
 xRGlJWaE3kTp+D03w1FSXjJl9hi41w95tXiebDHXYqVg5NOe1p3i352a2x6yvwfMSAsYY62sRx9
 sPSneWtt5XmEl7A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have a dedicated initializer macro for defining pin functions for
mediatek drivers so use it here.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7988.c | 42 ++++++++++++-------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index 68b4097792b88356babe4368db7d0f60194e7309..55c8674d8d66f12d2f2246c215056d4e51296a9b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1465,32 +1465,22 @@ static const char * const mt7988_usb_groups[] = {
 };
 
 static const struct function_desc mt7988_functions[] = {
-	{ { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
-	  NULL },
-	{ { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
-	  NULL },
-	{ { "int_usxgmii", mt7988_int_usxgmii_groups,
-	    ARRAY_SIZE(mt7988_int_usxgmii_groups) },
-	  NULL },
-	{ { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) }, NULL },
-	{ { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) }, NULL },
-	{ { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) }, NULL },
-	{ { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
-	  NULL },
-	{ { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
-	  NULL },
-	{ { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
-	  NULL },
-	{ { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
-	  NULL },
-	{ { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) }, NULL },
-	{ { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
-	  NULL },
-	{ { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
-	  NULL },
-	{ { "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) }, NULL },
-	{ { "usb", mt7988_usb_groups, ARRAY_SIZE(mt7988_usb_groups) }, NULL },
-	{ { "led", mt7988_led_groups, ARRAY_SIZE(mt7988_led_groups) }, NULL },
+	PINCTRL_PIN_FUNCTION("audio", mt7988_audio),
+	PINCTRL_PIN_FUNCTION("jtag", mt7988_jtag),
+	PINCTRL_PIN_FUNCTION("int_usxgmii", mt7988_int_usxgmii),
+	PINCTRL_PIN_FUNCTION("pwm", mt7988_pwm),
+	PINCTRL_PIN_FUNCTION("dfd", mt7988_dfd),
+	PINCTRL_PIN_FUNCTION("i2c", mt7988_i2c),
+	PINCTRL_PIN_FUNCTION("eth", mt7988_ethernet),
+	PINCTRL_PIN_FUNCTION("pcie", mt7988_pcie),
+	PINCTRL_PIN_FUNCTION("pmic", mt7988_pmic),
+	PINCTRL_PIN_FUNCTION("watchdog", mt7988_wdt),
+	PINCTRL_PIN_FUNCTION("spi", mt7988_spi),
+	PINCTRL_PIN_FUNCTION("flash", mt7988_flash),
+	PINCTRL_PIN_FUNCTION("uart", mt7988_uart),
+	PINCTRL_PIN_FUNCTION("udi", mt7988_udi),
+	PINCTRL_PIN_FUNCTION("usb", mt7988_usb),
+	PINCTRL_PIN_FUNCTION("led", mt7988_led),
 };
 
 static const struct mtk_eint_hw mt7988_eint_hw = {

-- 
2.48.1


