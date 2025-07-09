Return-Path: <linux-mips+bounces-9704-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93498AFEC4E
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 16:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55586582B93
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 14:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4232E6133;
	Wed,  9 Jul 2025 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FrEeYwKO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B1F2E889D
	for <linux-mips@vger.kernel.org>; Wed,  9 Jul 2025 14:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071958; cv=none; b=UicMGuZxxAfTthqXfhIhFzvhWOD20yj+wCZnMxzykgq3f09q2ym1mD1Yc7QOtk8S3qogUD+HhOJcZ2KL48lMXgyZyqs4iDzMnjW3S33FqMeHDWbci38RyJjDuLmx5lO7dGtwEXS2nscGTk9RZvvHuGbfqRxoZgO/0SJweWpyDX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071958; c=relaxed/simple;
	bh=A5Gapvd9pmG5KGm8z0XjdGP1Xzkbg1ds0KDnXyuVVrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XTcee/x3jMYniNu+1A9zxCSNw/eq5SM+krw9HnK8br5uW5jyVFE0vqtR+hQEmPkWHfCjKqptvdrMqQmRvV7OjHhSXdfMxbzzvfDQTjzch69IdNtFW3XBHDlk0AXlKHQkIedKl2B42CYQKG+Eg3wWrsqFsH8o0nAJaEFArFYIfjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FrEeYwKO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d6ade159so49952905e9.1
        for <linux-mips@vger.kernel.org>; Wed, 09 Jul 2025 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071954; x=1752676754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyQR7nMIaqJhvjojyZVdCfat6irNE82iu33KzL+Vh5k=;
        b=FrEeYwKOczEpJfu7eQwuv4+DKwqUzvpIKcNbCd7tjzA2tafnocBlFEa+UYev29agYh
         26BLXvybBhJ0BiPPyp9pjhZrfv7Mg8stH0wVKtn5VCCNRq/d6sXtBaN0TEguYHmRm2oB
         psjOTAWOqj86YhCpshxoaeFR/x7h1oMFleyksOwObHaKWVl//QK+3vN6KAuLwpWqC301
         UUCNduxR5SD/pbLUFHuLd04qvzNcU37HMDYwesls5DZA+vzz5MUwlek8OT6zcl9DQPuE
         872ncpsyUo7T2l+4tIFydt7udBe1zoN3xjtORcQi9EMwLTzuC3i7Ld0n21ecYUl5L3GB
         Nftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071954; x=1752676754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyQR7nMIaqJhvjojyZVdCfat6irNE82iu33KzL+Vh5k=;
        b=auazyCgDAN/UY9+sJCPKO6qcDiS3uy0H8ZBQ5lFfEFmD9QQLu0IuYUCZ/0fZxPnBX0
         FfGZUuDoEbuyfLuhKv+maj/vGZAsTBRZZhETq1GDeHOmh7wPWsp2bJk2zypb6BfQLAHq
         6wvtrMdBg0TdLMLKEgLBr/C1qUsVsNdWoXMmDeM1EvZrtgB8u6kWzI9/04RjCs/g7Rn8
         HCCU/KilZwRVczZhH1glm0kKgD+b2zqQIGWZGSGz9W1FRKQZGVq7xy95r8gOr8D5pXBM
         eMs2vuQmk8b7AFSViVn4KJxDCX5p0xJFNkHaT70xr3Rl78dTehk4Di4ORROYwR/R0Mdk
         pnCA==
X-Forwarded-Encrypted: i=1; AJvYcCUVzXiuKQW4sd7OETz6Sb+moyEhcryU9GGchaX1ty7g+cqYolUTNq0IxBZ+2Ktm8SbGbjfSUg4TJ7m2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb3rz0FeLKKFYJwvL5fVshCS7LZEdatsueej00g9fJqTgAEX5j
	4oEyhXqkHIkGqhAAP1akpfNLfAtFfOLPzrCLaDQvMRTcE/SpA4K47nyKcGpxginueI8=
X-Gm-Gg: ASbGncvok3mA7Vjcgw2IfCn2M3/dVK2TeeUyjjL8+1OQNVBrGg9s2mGjvesygV5OeGy
	Yc89AspxJnLKnW7xtKclDXDq8E4NRCn23oND+e3c9V45Jc9oZB3/uAl/3Q0+nUjTzen//6R61NJ
	Yhz6V2HvKFjD5G9c9y5gqszBRmE/0AAlCWL973XNAea04NnPY4+YjxT/hxjq9sr2A6U6LZMNmAE
	j6YNoBg3HTjX2LMZMsYnYmrFny/Hv6kqm9v2nleXC+T8XasV5vdORlRGZZVKnUDi/FMTiiajwn6
	b40VVw1QIayaqA0QKw0PSPinmrrpfSezyVGDcFrRST6QYZ94t25C4d0=
X-Google-Smtp-Source: AGHT+IGsHwl5+rMjFVilVGS4uZ9wBps6vIXNpmci7apkTHJjRa6NtZeF0fWAhzC6zphVIGoh9yt5ag==
X-Received: by 2002:a05:600c:601:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-454d558720fmr19496665e9.6.1752071953726;
        Wed, 09 Jul 2025 07:39:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:04 +0200
Subject: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3084;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=X9Ki+5EzRPJP9Qn3Qvwbtr2ISnwV85fgPGCpNBHhMQ4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8HFeMyI3D1Dqv2tlHQAY2Z38HnGvNZfdCo6
 FBcXb4w/zKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BwAKCRARpy6gFHHX
 cubfD/9US7MCY9XLoATZecFIFEpWPf0Uefyye79X1KjQbCS07kHwcGgfH29AFrNvz/x7bWA1zaQ
 j0tbicl/uEJT9H2rS9VI0wDfPs0Lp/jNv3kwL31mLZ5zrr3liqjA1SiWHdyvY3uJqL1WH75P2+T
 eGGET8T0GYpCbuS9ptjobR/lbIDAMAlpddosYHOTPxrv0jcwM8tQW0foOgj0biOm++Exqw04hE3
 lAxop7qj+e99fPMbaq2xxY+fPQDyhHDE+TLJk5rINgIzsoit0/fH2nQDW0ODRcdF34NLaGnJPjx
 KGwSupH2Mt4yw1yZnXBiAJOLOYMiuwwH1zIgy7393NLrdGEKE77UsiGEIe790H0qOryEeXPl5KV
 icLIoiQ5+fWHCwiLeEzdNycAmwN7WUCCKiQbt7rGm+XkhdzVYeFtM178q7tjRXqUTy/XeLHF86V
 gB5mDG0RP0tAc+2vIAsYPaZcNvMlbTtNx8Gs80NVJfnyFLZZUgkqEUXzMNCNnKDGUNxm7ThNvKr
 4CFo6uZG38y7BgdfFnuKMzQCjCQzXuaw7yT2vUolD6aZXlRTeZGwKmgp/AL8++3l7FXG0egh13Z
 TEZkDQdE/c0CUDcQgNfWaYCm2/c3uj45Zh/w+8K1Oimrzad/wNJH4iwwtyZ5/bek9McTHfuZW2U
 zL6jyCz1pu8lcNg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the existing infrastructure for storing and looking up pin functions
in pinctrl core. Remove hand-crafted callbacks.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f713c80d7f3eda06de027cd539e8decd4412876a..965f0cceac56697bc4cdb851c8201db7508c042e 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -31,6 +31,7 @@
 #include "../core.h"
 #include "../pinconf.h"
 #include "../pinctrl-utils.h"
+#include "../pinmux.h"
 
 #include "pinctrl-msm.h"
 
@@ -150,33 +151,6 @@ static int msm_pinmux_request(struct pinctrl_dev *pctldev, unsigned offset)
 	return gpiochip_line_is_valid(chip, offset) ? 0 : -EINVAL;
 }
 
-static int msm_get_functions_count(struct pinctrl_dev *pctldev)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->nfunctions;
-}
-
-static const char *msm_get_function_name(struct pinctrl_dev *pctldev,
-					 unsigned function)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->functions[function].name;
-}
-
-static int msm_get_function_groups(struct pinctrl_dev *pctldev,
-				   unsigned function,
-				   const char * const **groups,
-				   unsigned * const num_groups)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	*groups = pctrl->soc->functions[function].groups;
-	*num_groups = pctrl->soc->functions[function].ngroups;
-	return 0;
-}
-
 static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned function,
 			      unsigned group)
@@ -288,9 +262,9 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 
 static const struct pinmux_ops msm_pinmux_ops = {
 	.request		= msm_pinmux_request,
-	.get_functions_count	= msm_get_functions_count,
-	.get_function_name	= msm_get_function_name,
-	.get_function_groups	= msm_get_function_groups,
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name	= pinmux_generic_get_function_name,
+	.get_function_groups	= pinmux_generic_get_function_groups,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
@@ -1552,6 +1526,7 @@ EXPORT_SYMBOL(msm_pinctrl_dev_pm_ops);
 int msm_pinctrl_probe(struct platform_device *pdev,
 		      const struct msm_pinctrl_soc_data *soc_data)
 {
+	const struct pinfunction *func;
 	struct msm_pinctrl *pctrl;
 	struct resource *res;
 	int ret;
@@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 		return PTR_ERR(pctrl->pctrl);
 	}
 
+	for (i = 0; i < soc_data->nfunctions; i++) {
+		func = &soc_data->functions[i];
+
+		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = msm_gpio_init(pctrl);
 	if (ret)
 		return ret;

-- 
2.48.1


