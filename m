Return-Path: <linux-mips+bounces-10745-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1353BB3A549
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 18:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8196161BF6
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 16:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D258269CE1;
	Thu, 28 Aug 2025 16:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qcfbxmAS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFD92609E3
	for <linux-mips@vger.kernel.org>; Thu, 28 Aug 2025 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396832; cv=none; b=NJd8vV37a4WC5ceERiPDd9xO1QcubH2A5Bc7zodxQVYEpxWJ1Z+cgaE76q1eQMJHOoWlsrTYQVcAT52JzWHMLKxMk+/xf5nT9vAY+bLv1bvBnzTk5F51XCdintUN1mRRp1jbOCDTsiMAKftGGZb/lkHraWcu62JPM1HHRoZQNec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396832; c=relaxed/simple;
	bh=CSmJ0hfP8RAK5IyMLaW7Q3B8iAjyvA/90HhyhsBSBCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G23mW6ACYD1oZB3ccO0+XnTsBks8OswmzBfgrXCOaxmW6ElZcKxJFRRS210Cnh9zu+zOF5bzqSoReIgjVksOarcrjrYhTZKoSP4R6AG1hzLXxsNMxB6HMOjzRPuP7mgUT1x6xkExBfgrRPQFX37YvmcbeDrMdtFQR+CWMEMAY90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qcfbxmAS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3c79f0a606fso714357f8f.0
        for <linux-mips@vger.kernel.org>; Thu, 28 Aug 2025 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396827; x=1757001627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lc0/t4Iv6hjqG5kcGiM2/0kFYGiYqDN1ZHyY/21Fkb0=;
        b=qcfbxmASvKGh9PXmssrOfMeEKqnxGWK8m9oBEKLOvn0k/WkPj+oB96UFI442YmgA9o
         bLMzyn90q/kK/it9+t6ehNe6HfANBdrKoykG8Mk0Z4sYhDXf605i5000kTJwVLPTfyHu
         ROyn7yVMO2JKRxQS4/8KnMWLB7Db9I6F2ZhHINLurPcIzyAL49Z4q3jstWMeSlaiF6dx
         yvHo0eyDDzzv60hDorVRm3MzMpj0PyrkglbB/IFzfFM0YcmuxZPh5Ib/0w3dVITBISk/
         v8vwEJDBh68mF/l0jIAKyS1cJu5W2avJwRS+1uZttVT3xwoRV+fNvF0VUgdaNoAjlH4B
         pLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396827; x=1757001627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lc0/t4Iv6hjqG5kcGiM2/0kFYGiYqDN1ZHyY/21Fkb0=;
        b=RiAtz/6bazsmsLCbgR+0Nf6BqJimIT4dZ8yxRj0Dd0/CGggozaPVJuicFruo4nT31a
         jUDsaTtdfRE97NI8semmx5biGDQXigorIkRBIZsJXYiO7UVSqQMCeMK8REa6LtaDsoES
         RCMGf2yGEBlZXjiRhvWO4uxhZe0zTBPEABsCjPfJi6EGwbYsnd2DZGcUo7y58C8TEij4
         98RJtGr9x9YsclKkSzaL61v4hHBJhk5JG/NPNb2yD3IhOIRCut4dKg9N1jtktP8EwKAW
         tRnKPVeP4BhIBzqehsW85me1+dLEj8A664s+ABsBfXVfNOGybLopGkUY00fXX+Xy9+JS
         Je8g==
X-Forwarded-Encrypted: i=1; AJvYcCWf42BV+k1xPB3tfam1UZpptN1jRq+Mu28ewvbpp/0K/giJC53S7ZDUDe2nn28JYWpRHiatiImy3m1l@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6twgDrAuhWUiUgiAm6PKTOuvejT8kpGc13MLAs+u1IdzAK35X
	2Ti0voNMZrQa90GKE2R7R63kh2/xW7X3eh99PikEC+U5kjUwmcjoMoldPv0PUNUa52A=
X-Gm-Gg: ASbGnct0LXTi4yX2xH9BoiAQ7gUk+W+uBcZAaNDu0MjwG+NYKM9pJIlfWzywSZZLNTG
	gFgyNMsDyl1yLqzu0jMIEQwlyO0tvR/b5u43SxoDK9lxZeST9nKQ68/9hXHM3YcvQemH5kU1mJt
	SfdIYfRgI8fVIQZVfbtE70R+2qdHwSQ32os3f9XAckEdDYCdNmpANyKY5HowGf4SJLW48N7JnyB
	0TM1YdCulTE4208U2mvjUMMXCYOOmxBW3xd4pT/xdyof4zcCscQy4ZOUDNyjl95gGjIQgvbo0S6
	6RSqGEjzXhWpqfDp53JC618fiRVkprptC460dFcRNMn9hkzo5HlLdYZd9c+PelWy2r6CEjA53rC
	zpQd6p0w1/5iwsin9UHmHaEwq8E81
X-Google-Smtp-Source: AGHT+IFw6qjlDrmse6RIf8UYoO4kDt63oBcAlQpSlQsPEor2cX/h2xD8mZ55YTiA8r3CiuSEB2FkQQ==
X-Received: by 2002:a05:6000:18a8:b0:3c8:e9d3:c392 with SMTP id ffacd0b85a97d-3c8e9d3cfefmr13313662f8f.19.1756396826703;
        Thu, 28 Aug 2025 09:00:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:13 +0200
Subject: [PATCH v6 05/15] pinctrl: mediatek: moore: replace struct
 function_desc with struct pinfunction
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-5-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7850;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9BKGEvZq/gbYunbAXK1ZCTf6DpFoadfRkbzoE0vKzXo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0NGnR/oaN0Wnl61ZnHBstpsOmWiljwo2l0c
 m+BpaVFx3GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DQAKCRARpy6gFHHX
 ctZDD/9arpiDD6mR+QK7mS35XxuNAxcWS+ucQzkDk60d4EWb3psp4VvaVeZ1/IUU630zQgfjTV+
 t8aXJb1zZTpyRic7GCOOuf1+bIBvDH8W7iOX/fgOfp6ekoa4e2r9SG1TAKkLlNtWiRSD7kTvPll
 hqZ/DVYo6WsZSaEJWD7S1YQX8spONqMCw27NzpYs0/GCrRRu3wKcemsEEtsZTfGnqOs5PyLOhOr
 mJzF7oEgPL8Z+Tjz0VbSghib7drK1N2+Nv6vXAxMf2B/Y6yfQHldQrgh+Ck7L/ILDzHNwh0qR4n
 LmfSVoUXKYOkpqH37fE2kXKTqGkaD8XksLO6dLEyMLpwhAEc4dmcAJ5XqVN8eUjuruuAmn4a98Q
 1w+kacPImscDwDmEDXZmZIOLzC3JctbrU6im1b83JR4sW2+is22ir/s/gD4Z91esiFPnvy7kKdH
 SaDnpou2t0/PngZP5d9dZntxi/1FvyJj0OlX2yDxfS5QzrkewdS8kGOkStkdNt27UVqWnNb2yCM
 ZlBarFULOF621HTFSzpty70XsCw7I9ez21QupBpDOUmv2KDTcbcm8iijkGyxtFqeHpy+HJv9XD4
 do4x5A6LTUDY+JBK10h9X3tLsDc69G6w4vnGcuSQ2XD8mNJHPeK+YpFObvarI8Rht67YImonRX3
 sKIK4iijqJ/NJaw==
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 6 ++----
 drivers/pinctrl/mediatek/pinctrl-moore.h         | 7 ++-----
 drivers/pinctrl/mediatek/pinctrl-mt7622.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7988.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 +-
 9 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 6e4f6c07a509326a8a7e88b2dc32635b22e7b965..982b9887521d036538f67e9919de444693c458c0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -622,11 +622,9 @@ static int mtk_build_functions(struct mtk_pinctrl *hw)
 	int i, err;
 
 	for (i = 0; i < hw->soc->nfuncs ; i++) {
-		const struct function_desc *function = hw->soc->funcs + i;
-		const struct pinfunction *func = &function->func;
+		const struct pinfunction *func = hw->soc->funcs + i;
 
-		err = pinmux_generic_add_pinfunction(hw->pctrl, func,
-						     function->data);
+		err = pinmux_generic_add_pinfunction(hw->pctrl, func, NULL);
 		if (err < 0) {
 			dev_err(hw->dev, "Failed to register function %s\n",
 				func->name);
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.h b/drivers/pinctrl/mediatek/pinctrl-moore.h
index 229d19561e229c77714e5fccb3d4fb68eacc77fd..fe1f087cacd0446e40628cb4fa35a135496ca848 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.h
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.h
@@ -43,11 +43,8 @@
 		.data = id##_funcs,							\
 	}
 
-#define PINCTRL_PIN_FUNCTION(_name_, id)							\
-	{											\
-		.func = PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups)),	\
-		.data = NULL,									\
-	}
+#define PINCTRL_PIN_FUNCTION(_name_, id)						\
+	PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups))
 
 int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7622.c b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
index 2dc1019910662a2a52e81f277a10a32bd83b33d4..d5777889448aab86e82fa6821fdea0d30a5a7246 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7622.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
@@ -822,7 +822,7 @@ static const char *mt7622_uart_groups[] = { "uart0_0_tx_rx",
 					    "uart4_2_rts_cts",};
 static const char *mt7622_wdt_groups[] = { "watchdog", };
 
-static const struct function_desc mt7622_functions[] = {
+static const struct pinfunction mt7622_functions[] = {
 	PINCTRL_PIN_FUNCTION("antsel", mt7622_antsel),
 	PINCTRL_PIN_FUNCTION("emmc", mt7622_emmc),
 	PINCTRL_PIN_FUNCTION("eth", mt7622_ethernet),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7623.c b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
index 3e59eada2825277b3d7500cb1f2cf740242a4a8b..69c06c2c0e21e4ce785f65539254eb070bff9a0d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7623.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
@@ -1340,7 +1340,7 @@ static const char *mt7623_uart_groups[] = { "uart0_0_txd_rxd",
 					    "uart3_rts_cts", };
 static const char *mt7623_wdt_groups[] = { "watchdog_0", "watchdog_1", };
 
-static const struct function_desc mt7623_functions[] = {
+static const struct pinfunction mt7623_functions[] = {
 	PINCTRL_PIN_FUNCTION("audck", mt7623_aud_clk),
 	PINCTRL_PIN_FUNCTION("disp", mt7623_disp_pwm),
 	PINCTRL_PIN_FUNCTION("eth", mt7623_ethernet),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7629.c b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
index 98142e8c98011d17339da74f61d6f917372dfcd5..cc0694881ac9dc536db0e46eefe5eb7359735a60 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7629.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
@@ -384,7 +384,7 @@ static const char *mt7629_wdt_groups[] = { "watchdog", };
 static const char *mt7629_wifi_groups[] = { "wf0_5g", "wf0_2g", };
 static const char *mt7629_flash_groups[] = { "snfi", "spi_nor" };
 
-static const struct function_desc mt7629_functions[] = {
+static const struct pinfunction mt7629_functions[] = {
 	PINCTRL_PIN_FUNCTION("eth", mt7629_ethernet),
 	PINCTRL_PIN_FUNCTION("i2c", mt7629_i2c),
 	PINCTRL_PIN_FUNCTION("led", mt7629_led),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index 83092be5b614cc164590fe5ec2b756fe6579b263..6216c2e057f6499b32741b6bd3a4854878c061c9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -977,7 +977,7 @@ static const char *mt7981_ethernet_groups[] = { "smi_mdc_mdio", "gbe_ext_mdc_mdi
 	"wf0_mode1", "wf0_mode3", "mt7531_int", };
 static const char *mt7981_ant_groups[] = { "ant_sel", };
 
-static const struct function_desc mt7981_functions[] = {
+static const struct pinfunction mt7981_functions[] = {
 	PINCTRL_PIN_FUNCTION("wa_aice", mt7981_wa_aice),
 	PINCTRL_PIN_FUNCTION("dfd", mt7981_dfd),
 	PINCTRL_PIN_FUNCTION("jtag", mt7981_jtag),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index 5816b5fdb7ca918486f57a890f73543b3198c728..2a762ade9c35505505c932b6fea75fa0cf77d961 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -878,7 +878,7 @@ static const char *mt7986_uart_groups[] = {
 static const char *mt7986_wdt_groups[] = { "watchdog", };
 static const char *mt7986_wf_groups[] = { "wf_2g", "wf_5g", "wf_dbdc", };
 
-static const struct function_desc mt7986_functions[] = {
+static const struct pinfunction mt7986_functions[] = {
 	PINCTRL_PIN_FUNCTION("audio", mt7986_audio),
 	PINCTRL_PIN_FUNCTION("emmc", mt7986_emmc),
 	PINCTRL_PIN_FUNCTION("eth", mt7986_ethernet),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index 55c8674d8d66f12d2f2246c215056d4e51296a9b..9569e8c0cec15fb6a4a8e359d6483fa163487b0c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1464,7 +1464,7 @@ static const char * const mt7988_usb_groups[] = {
 	"drv_vbus_p1",
 };
 
-static const struct function_desc mt7988_functions[] = {
+static const struct pinfunction mt7988_functions[] = {
 	PINCTRL_PIN_FUNCTION("audio", mt7988_audio),
 	PINCTRL_PIN_FUNCTION("jtag", mt7988_jtag),
 	PINCTRL_PIN_FUNCTION("int_usxgmii", mt7988_int_usxgmii),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 36d2898037dd041ebc7e06526ebc085eb42f2828..fa7c0ed49346486ba32ec615aa2b3483217f5077 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -238,7 +238,7 @@ struct mtk_pin_soc {
 	unsigned int			npins;
 	const struct group_desc		*grps;
 	unsigned int			ngrps;
-	const struct function_desc	*funcs;
+	const struct pinfunction	*funcs;
 	unsigned int			nfuncs;
 	const struct mtk_eint_regs	*eint_regs;
 	const struct mtk_eint_hw	*eint_hw;

-- 
2.48.1


