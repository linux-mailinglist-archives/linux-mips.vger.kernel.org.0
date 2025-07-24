Return-Path: <linux-mips+bounces-9908-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE947B10611
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 11:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB3FB1CE4A6F
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 09:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD652951D5;
	Thu, 24 Jul 2025 09:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kbq37Ha4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC6A28D8DA
	for <linux-mips@vger.kernel.org>; Thu, 24 Jul 2025 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349106; cv=none; b=bw8RnGd0EHblT877V1fZmDIiPem5YoyCu7f35nggP21SrYRVVIq3SIaaR6TCjWHRy1cncURu7zp/pbeocSh/wI/T8yuWcDsXmdbD3DHTNmpNIvzmMr5Id/MI7euHKZot0BbOy7akmCEiVDKMKI/a1F1fBjnvUajIYI7PlJ6d+Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349106; c=relaxed/simple;
	bh=plZ1Vm1sypuKeTUPV0wUpXS3wYOgw+xh2WcUDF5pNJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRQmieUSZf77+6UHI02zFFHEp30SXq5mVbvAxHPuqxbMDORJ3Q0dCmVCBs0jxkJtaPQ4Pt7dNRtNlMeQ1FVlqZ/LvH+WiaW6B5DByO1F/U6RPR4TNCddKKeuJvdBXh/OCnc+lR7ypsWOm9/2rK8ZaUNQ2XHtPKRCW2c12F8Zmis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kbq37Ha4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so384769f8f.1
        for <linux-mips@vger.kernel.org>; Thu, 24 Jul 2025 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349100; x=1753953900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4qKUQTrFUgO06PuEy2CFUi9trDjc/5HjRv1X5gVEhM=;
        b=kbq37Ha4hcYsDkF4fsnj95W00/0InBevgCCSymQYM7c4PqSzHkQZ1hL/I5FdHaYKRG
         L9JrUpNIlcSF2ge1DVqjANzdYokmO7N75av78Dn7v6mTFLlBtTXbkeiJFKEehclsGuJq
         jFT8ZHj3y1mJe90TbFeV4iWCQznKImys9oByzI7OWcndcMK7CAVcJ+14vlf7SWZ8cTGJ
         RpSf5Th6iKGtJ/BuW6xcb5LKKe7XA2RLMGIK0KwVTnGVEPLBUFGwm5xOfj6G+OdpwQdl
         mfRdOGYjazDNAEZfI9VF6GVr7yyTuyAS+psuyC6cwQwRspZMIgB12W493FyhZZBveyyO
         6fPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349100; x=1753953900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4qKUQTrFUgO06PuEy2CFUi9trDjc/5HjRv1X5gVEhM=;
        b=eJbljPO9MaBWMaury08+c2BOhNxIinlG0Xkh6NyBxY+c47SkFipmJ/MLRaWPyC1i87
         TxNJ6DrRbRsAoAjHXlnGn2souy4z5ZVT0qIY3OLZLB31eqmZ+fdSec+Ibc/j8PD49wch
         mugjpAFELg+Xhq+zCkhDqe/RB4T5n0PaD5hXO/Pbw5UK479N47va1qXxmhTOyz7Uv6m6
         xeoleLc5yjwVXjWxKC+INFkLpmzZmgtDd4ZgwnLEpUALDbPy4FMadCTuLNmjzHMRlWdS
         tftQh278HtnbAihFY6EfT1bT3pf3hpdFBDDM+llx5c/H+cEBNhj09d3ag1pCGx3pLcKP
         96Vw==
X-Forwarded-Encrypted: i=1; AJvYcCW+kE2sPwMrvsAbHuf/a9dr+snJnYa7Vd/qKomVV7Vm4IIn0RMLx7kaEVuiEVRSM49hhh0RDA5uujg0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgg0bw+n48YPBuAlRd7oXlzyyXgCpiyFRt2u2+3jGj9nLnzUC/
	OzyCAVOukLHmewpnNz7isM1WBs+7KSTnY/IJ5mmH2O/D3X7L2BOwBPZZtVu/bpDJKog=
X-Gm-Gg: ASbGncueQ2FE/rO42pJ9wUpx287V8aaQSxBxdrnEd1F52RUpxnz2jOCoNFAC+iBJa/v
	dUoTlHexcnU9t5PV4mDjs47KXrZVA4zhtvAbzVOvVR/41JVZldeiu3wlJ5mE9xp/r5lltzqH8yF
	oOrp/kxGdmjXqQ/58DkcdpR6q0OpPEKZHKTP/Hch5BUQfHhfIwtRxJCbAU8dtq0xJgjFBFw4uVW
	/12DdJe8p7eBiiDA0pcZIm3rcnChz35b6eYv4gGhpLeEGPWrPoDSyn6y35E2fq5vdoG0gliQUA+
	PeZwQILZ/xOtdZnh3NjZDZfFuutjzSYx9PDovbwhqGYsQKD+M+6fNHrS4mh+b73f4oZ8GzQk718
	gp40HvTR7rUbiveN4
X-Google-Smtp-Source: AGHT+IFiU8ntOuIrsg7EJjoE+jgfBOjilWpCicMTZfx/w/wMWv+Cz6kJc3kzsI0KnGWbRP7+RQsGJQ==
X-Received: by 2002:a05:6000:2501:b0:3a4:dc42:a0c3 with SMTP id ffacd0b85a97d-3b768f2e43bmr4915869f8f.56.1753349099696;
        Thu, 24 Jul 2025 02:24:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:41 +0200
Subject: [PATCH v3 13/15] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-13-af4db9302de4@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
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
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=V65C7Z+Y1YiPq0OHKNuy9LXqO2UhBPC3XEUxRkkrR4k=;
 b=kA0DAAoBEacuoBRx13IByyZiAGiB+9ShUR1OAFnIEDQG3sNgilmhY7Ygh6t/KE+2iWaFhFUfQ
 4kCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJogfvUAAoJEBGnLqAUcddyCt4P/19R
 usVp59cB9gmeC6caTopbcbPlDN95WhxRPi8vVSM0eahgEj4xziYJs019xI4Vc/dhRXH9v/sv4w5
 5V/98wav2sHArJ6Fwyy4TwBH2Fi70PGrZodDBC+XRwDmAFxjjdb5ZC70EkBefPFgqgWBJLHFbYK
 ERwWpuTdOjV3bR68Y+BCsI8vh9Of0hQhF4gyJj6bIdvXvlKGmd/OXIrHJqeatSdBYMWebikfG2h
 Ow7xy/+iqq+i6p4tWOubxuQ+yrYyiPvnsRIQt7j74iJO9N8kHSdgg/wuwIOdNANPFp3EsoYL0kK
 qa1Qg1hHn2GdMMp3oOXDTybNepcTiMtdkbI4jPFrei5Wi/pAZRaEfYoCaBoD1AkhZwRaNOHQQH0
 ljr1wEhPIjnp+8blcIaYZq8yVYvpNFc2j8IExWEsIXNTWECihGJxSYq27Kekunrv/FpYmZEsi+E
 grHegZHLUs5t0APfof6gAM5Dk+slyYb/GNzK8F6racQqxoEnZy+zBj52YU4q+yNxNcwylSh1b3V
 i3FtgIvC0j4c004+Y+yGAVzok9hidlMxP6cap3zpbStLEDVEte286WULSaZ0EbdfNkU66NC+ACK
 G3w6qEcvTn8zHUugxupweSvuC6MxhTVRA8uH4BAoi3nN2mf0gl1xU6dJWdB8ZlrrKBCQUuVoGsp
 K1qEy
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
pin functions and assign the .function_is_gpio() callback in pinmux_ops.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 drivers/pinctrl/qcom/pinctrl-msm.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 965f0cceac56697bc4cdb851c8201db7508c042e..7010be8d1ace062fcf7743e539d2065d4aed856b 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -265,6 +265,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.get_functions_count	= pinmux_generic_get_function_count,
 	.get_function_name	= pinmux_generic_get_function_name,
 	.get_function_groups	= pinmux_generic_get_function_groups,
+	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index d7dc0947bb161868c8f433dc2536719b8afc8bd8..4625fa5320a95a4d24e3a0c98a249e4f163dd4c7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -29,6 +29,11 @@ struct pinctrl_pin_desc;
 					fname##_groups,		\
 					ARRAY_SIZE(fname##_groups))
 
+#define MSM_GPIO_PIN_FUNCTION(fname)				\
+	[msm_mux_##fname] = PINCTRL_GPIO_PINFUNCTION(#fname,	\
+					fname##_groups,		\
+					ARRAY_SIZE(fname##_groups))
+
 #define QCA_PIN_FUNCTION(fname)					\
 	[qca_mux_##fname] = PINCTRL_PINFUNCTION(#fname,		\
 					fname##_groups,		\

-- 
2.48.1


