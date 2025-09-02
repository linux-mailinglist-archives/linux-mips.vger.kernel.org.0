Return-Path: <linux-mips+bounces-10940-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9EEB3FF6E
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 14:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63DF7166027
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 12:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1939E30F926;
	Tue,  2 Sep 2025 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OGLS5Sd/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B64310650
	for <linux-mips@vger.kernel.org>; Tue,  2 Sep 2025 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814372; cv=none; b=JhzidpIrovw4gPKmxMhWqB/+iAfNVDI5p0GlfNQWnxCYfYLcSwpZ/4J65Kg+J5cARdVNkRLnIU5RWIpDDtAzKz/SDc0rmx/HeZx47T6Q7MaEq8FQ3r/RVwVhPDiRvkPjKfm4nkwJyMsNYGfl5rLrRFmTpEcKHhe/1thdTsn1PWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814372; c=relaxed/simple;
	bh=aHa7QDQXdvRJHCS5VwW5A1Z7LGJqOK6WHJc5wmX+AzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=relVMRBC2qU+F0w9uSFNJrQoCO5NvtFoOChbwDC62HAjJFfdymgGORb/LwPldzR1xcI24tr53yYY+p5WHJ5Tk8ZZ2XL5NP9P0HYpNdmXBK3k/QUD1f17cjI4Tz+/JIC0EORi0ClVmMyCOGXYKlK6Eu29nDtW/Bw8L9lpCyXaU8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OGLS5Sd/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b83ae1734so22472495e9.0
        for <linux-mips@vger.kernel.org>; Tue, 02 Sep 2025 04:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814366; x=1757419166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bswhw1GYJgLkiQcdAy82i30rP02s8V3NVyufQL1WnW0=;
        b=OGLS5Sd/xU5AiH/eFyr8y66c0htDYtoNyN4gvEbsXdN/I2eox1OE9K5MKzf3pcskRs
         1R4z1cFPrxyGwjsP/OtIZffhBrR048fgeotPSB5sXzKjzl8gVJwb5VP5yiO2UXxW6oc+
         uVI0lytnwJrwPYWYg204VqUYDLW/ab0/WxSBRPmy2vAUHsbyKJIuymziFFIz/e7Air2T
         LcLT2Cgw0XfxfUY7vlAIjSpjDaFWVcExjFxE+L99TznE+IiwxWcLNNjElkKQ0SaZiqhS
         tgE+v6/0bxsLLDfbBH4maBkxHNl1POPgfW2W7qrsWvLB6YDYKjlWaS2DPRowA/vA/xZD
         e3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814366; x=1757419166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bswhw1GYJgLkiQcdAy82i30rP02s8V3NVyufQL1WnW0=;
        b=rKQXoAlXm00rZ0aEsk8jvzTZ6OZhDuOgyD/9ZUS8q5EU974CUHN1qQ43NOAU8telUF
         ALGj4Leta9huKgG6p5iTGMPFDOPfaBpZMpBkooxmH9ANSI+piSyG2n9wJhXZI7+aHEcq
         zypacd+BfPXFfFsx4wqt8MVhyIhbktk5P+Aqff/4WE3P97/aykmhiYvbgLspCB40d2W9
         WInSFjzLxiMjtVoiaf7dXuYS5vWUniizJ3RaCd1D3mRKmVtpYYSfWeYD9ctBMnlKsmC2
         CGMRhlR7Rk7Gbyh47Rw9qIWQGG3gwa2vx9LgV9HsnTNMC8gU1YQMcqbTLv4vR7Od9NQ9
         psXg==
X-Forwarded-Encrypted: i=1; AJvYcCWNW44gHg6kehOT97Qg0caN+JM8zrv0VFOaX1w1GFe2Ehxdy8LrrrXN30CR77msiyPq9Hz532Mn4Uzk@vger.kernel.org
X-Gm-Message-State: AOJu0YxUrfOUUmUJM6/+RBeo7KVj8UEApjwHH6arHL2dtDLq1F2QvN8T
	JNpG7p0Tbcg3HasckEEyoOadJBfH7j4GW0LHq74UVk+fWbcGdIveX6g2+9nYdDG92JA=
X-Gm-Gg: ASbGncumhir6vM9K4N/rizzkN+qTRPsNw4h4xhlc1O36N+bUg43HBGq6kawBaR9/998
	Yeb7nU60TR/GNVVAEGgGohi/Qqxu0dDKfemXVL76XGUpW+JPXfQx8idY16/AeKz9bR7AIs/k1CT
	hJqKaWnRvorwHd6bKv+r+btqFxBgbN1qPuMECTQLYGa26FlPXgFyZY4EMUnNL/HlxnuRQKTS1hG
	270PFcHA/WaJZ6qGaeQnc3gRgPMdtA4uxCuvvpomyIu5BV2Y6s8WS/moaOlUrbBqXyELBMnJ3IY
	VR3Pv+NcGn8rG8rSj4wDEx6D3yKerOzhLDk878TV8Nk2v7QhfA/HbAHQAeqeD6gEuq1Dtis3U1p
	SyNnn4kUQ5ZZZZ0rj
X-Google-Smtp-Source: AGHT+IGIpBaz6r7FFnIRCIEC0+a7WcaTtJlzxcvaE/LJOrX7ntXW3p38zffYBjnK1uGkAz25Buql4Q==
X-Received: by 2002:a05:600c:1c15:b0:458:f70d:ebd7 with SMTP id 5b1f17b1804b1-45b9353e81amr25870145e9.20.1756814365845;
        Tue, 02 Sep 2025 04:59:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:13 +0200
Subject: [PATCH v7 04/16] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-4-bb091daedc52@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2093;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/XFuHQ/ODPhn9fKCd0Ju7j35cIiLPr5VI6W7KxiJtqQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwSXkG4aY2cOKQ1+2ZlnidJXDf5tdbvHx7xm
 T6spE59tAWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcEgAKCRARpy6gFHHX
 ctGBD/9MbKPzAcDoovqTMIPxr8BtMxjfGlz3gLMXljCSbdBNiVKbz5YkKncvqSgoWFE8RgJf0lG
 4MXXFZah6ndL7XHk/j0H5Vk77deGulzZJPpYB/vTdKdTEXoqf2UNSvfFdaCO4GrYQCP918QKMbX
 Y3s5IeIFgdIKmHIOPtdTujxu+9GB19fBzWGn3Xn00xS5oq5wWcLacLqgtBNZ3zbqJAzJ/uNfJPs
 qN4Q0Dmp++ZUAAJw6r6umhTypcX6Zg8iMC61jkRLgnU/D+2n4dWGJizXrMxhUBexefXxLOkpp9P
 sBQ4DwOYb30i6GHdcCw9HykSNsNDvjDGgYjg207NXQ1aVGkE/9pE4CMyafvGn3AuGndzULmR7zt
 F/DShfIHttSBvsvdDThKnIT3lHMC0y8RBeoqEkg7NMd2lj5F2IXSblwbWjmfH2haAU16IoU8K63
 BB1ibO9AbrpHX2s/1ZYVXpD2knkhUXnwr29hJowBAuxojdr3z69Zs2oxlj9hUoQmrs4F+XAqsmB
 XcnxELikDisTVpBMve5oB/fjqGZp2rWuGuC6sykJ5jY00e9mdKF21zIYYBAygClSBwbdekEKGWy
 u9jdXOcXRRsC5p59bShjaSz0LjR1fU877tgST2UoQw6XScesIDYv6cUiRWjgnFQkhjQkOqP8/4R
 AWXs/njP4gntjFg==
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

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 1b2f132d76f0aff78768ed846e8d5980e5b46770..796dc2461ebae167d9daccbb26c4ef6f358851a1 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -35,13 +35,8 @@
 
 #define PINCTRL_FUNC_DESC(id)						\
 	{								\
-		.desc = {						\
-			.func = {					\
-				.name = #id,				\
-				.groups = id##_groups,			\
-				.ngroups = ARRAY_SIZE(id##_groups),	\
-			}						\
-		},							\
+		.desc = PINCTRL_PINFUNCTION(#id, id##_groups,		\
+					    ARRAY_SIZE(id##_groups)),	\
 		.groups = id##_func_group,				\
 		.group_size = ARRAY_SIZE(id##_func_group),		\
 	}
@@ -334,7 +329,7 @@ struct airoha_pinctrl_func_group {
 };
 
 struct airoha_pinctrl_func {
-	const struct function_desc desc;
+	const struct pinfunction desc;
 	const struct airoha_pinctrl_func_group *groups;
 	u8 group_size;
 };
@@ -2908,11 +2903,11 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 
 		func = &airoha_pinctrl_funcs[i];
 		err = pinmux_generic_add_pinfunction(pinctrl->ctrl,
-						     &func->desc.func,
+						     &func->desc,
 						     (void *)func);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n",
-				func->desc.func.name);
+				func->desc.name);
 			return err;
 		}
 	}

-- 
2.48.1


