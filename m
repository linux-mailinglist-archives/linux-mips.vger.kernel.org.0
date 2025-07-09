Return-Path: <linux-mips+bounces-9701-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4123AFEC37
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 16:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC8021C24B95
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 14:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369352E764B;
	Wed,  9 Jul 2025 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3cccPFno"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD6C2E6D36
	for <linux-mips@vger.kernel.org>; Wed,  9 Jul 2025 14:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071954; cv=none; b=VllCIRU0BzCqRKo87/cI8UAAnLGLt/eEsTIuLMfc//r5ZSFJ4lA4QDBTXmvvfYRGsrOnFDrFY7mbwdXxtxrOVMxD86NILYMJh7kSotqdIOWOddNwrCiZNZWsUs4rqCYmHK9BjL8Cbo4//tFk5h5IAOy0OSMI5Kq9zZQe44aSkhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071954; c=relaxed/simple;
	bh=fkzifz8gUt9BhNi6t/GGXjLqi0r1E5NO+5dh0OBvr2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pSUOI2qkWSMu0iHelXrQmbBT1jBFdB5H07L3iOoDgO7bp3UyLM75r2jtYxPscmGiRMd0lMITjr1KhtO0cRyg9nQLRs73GvzbHBd1wIe6nrjsjUCjro4AD1McKE3LnIzLpOqkwGCd2uvmKUhi2ouxsaoq+PjyhE/qMQi/LPsuxxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3cccPFno; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso35772195e9.1
        for <linux-mips@vger.kernel.org>; Wed, 09 Jul 2025 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071950; x=1752676750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbTmzkj5bx9hqI1J6tJ2tUhaqDl2dEmQ2iKfN7GUYSE=;
        b=3cccPFnofLKtIQI22Nl/5USSXq3VUGhx4V7/ewjlhbl7cM/6Ddm5FfJvckj5j0z3Gt
         DkHwINsVTfOlGpPuScixMCEfAwSCIIOFSkZlk9bMvpDCOYb9ovGr7A0170t7tNvMNExp
         hhem/w9mUlZYadZWOOCyEZhEPdBuz+AViGM8idBbwGIIt3Xog3i8GoMJx0RPAxG5yzF2
         G9QpFxcB89CD6Y0ldIL7vOiTI9aTXrLOedIy3AkVv4CDIHCfcDj3C7XgZhHd/+XruP+e
         xOlW8EX9fMBHtA/mj6TROxtTsYioo6H19YJj1kVgyuLMJ+4k3Xesi4rsm+mX7ngdp+R4
         /lZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071950; x=1752676750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbTmzkj5bx9hqI1J6tJ2tUhaqDl2dEmQ2iKfN7GUYSE=;
        b=EE76Qd4AYlHIMe+S0C+BlqBelC1Tf5Xq2+wl4PrLNEUYXUsfT0jBR9q2R9052Rg+E6
         gO/KjxS2dZmF8lDU4qafB7kvJzw/9ifAsYsoSdINTPGZ8ThfLdshV8CDcHsG762UN9BT
         bcaSgkMBsFDxBaG7Il49UxlUmNfviTcaD2VmGgKAvSbnDSYMIScbm+4PgEiqnhsIkTfU
         Z7Fv5kjKKp6pP0RS1aDso4AxPWFppc8BUXimIoCY7rfHUdWstSOINn9/Llj1YCoiQv4T
         dBWBackl5zVrUfEjkk2yNRDMLlloNfSVjF7pc4UDaLf6iQfWe7pnbDHIEZpUqb63xDwq
         48Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXhn6PntWtnBZt1PyIMfEeb/NxGh3p/b35ndOcJPmM0QIfd8jvI2XNeKf2UByxuvrLx8l+pN0Ii97pG@vger.kernel.org
X-Gm-Message-State: AOJu0YzzByiQbKtK7t5mb2x+nXksytRDnz9sMx56p+SHnKYmCtk40+6B
	SZGl6CQLaAj/w9LgpbORQm61IUFkETKxQ8lfKSJ4Gw7KAG71LeTzZkAGR56kP6cADPc=
X-Gm-Gg: ASbGnct6fVjw+cQQoVGlI2h+Is58r13bp09Xir4C8HLnYNey7JB1xm/jKq71XDl6/Hq
	qeIaC0nNNc1GcFaj+SKktNEDvETURj1U88l90rrq99h01zX5hVUk2DTascKjGo9AkW1s66pVclt
	yDYB56TpIm+l/Agfz0KqI0cI4QWM2Kb1WuqhUZ2/QyWE15Mm12oQ8mpxVgqN1raqAAZV1oxUMES
	st8GNq2fTWUbtCfZKiZod6fhU6H5I4V2nButbanG2O8BJJrh0fyWO4g8kyb0SdJVJFpk1AkDCIh
	Zq7+qKgrTX18MBC1IaaNlKfuaJISeqN7VjgnfIeF/7zHQV4Do/F6RAU=
X-Google-Smtp-Source: AGHT+IG7dTgqRsBY9IH10Hah+GK6+ws/Aqt50U/XubghXVDr0XTaMm1YapebW+fcF0tbgN/aSQ7qRQ==
X-Received: by 2002:a05:600c:8b6c:b0:453:745:8534 with SMTP id 5b1f17b1804b1-454d5311814mr28438025e9.12.1752071950476;
        Wed, 09 Jul 2025 07:39:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:01 +0200
Subject: [PATCH v2 05/12] pinctrl: mediatek: moore: use
 pinmux_generic_add_pinfunction()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-5-b6135149c0d9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PaoUd9pQ9Z9p4YRFcKkVOtGOvLlMkYaRSVbJV09EwEk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8GSzBDRg+86mcxYjd4CtCwJciXy5c415gCM
 mNUFmhqAquJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BgAKCRARpy6gFHHX
 cpLbEADMbvWcz55XbVdG30TNx5PJ1L7YL7I/gyTYo7Nr56TDm8bcBW/bGe1Lza3s85yT9b27xVd
 tpRH6IxKjYilWPe8vm++C98rzrKPdf53zin6oXX/o87YG5c6/6JDbgN/pOBwEZg8Eb3BG1Y5JT2
 Tg3+fsnjosmmA73uIMu5HO5ZtBi9qfq9YHb+p3Lxga7djFDCjD//0SGjNRisto/h6/HPfzxzQhK
 A7pspvX9CelxQa7FSn0wZQ1PYgLxKKE94GVq5IQVBRmQw/Bf+VrxSyNTozRSLl0b1TLYa/B1ywc
 1LkTfqqnfB6JHzpPJPTWFj8hSsrdTj3zto4IqyNSMvt7SDeiO9L2/yBF+tJSQdiocF3zBq4uS6j
 j/I/Xz37CiQOXrTSQjs+u/OBTT7+Fy28Nx33YVVoVcxeNKmLu2ukeOz6qY2AK+aLlomnJu9XddS
 CwgJOu2mpUws2Us+eKo+CD1UOG8TYK8kXqxPSWPsV4l54IEpTfPiOuva4DxjqwJ7+cbhgohakWl
 /QNUHjRgM+f5LhtLaBN2/aSoWlUKZL8pn2jmqvrEzuUD+p4gFktdY+/2VJQoZqIgJOyWDGoVqDz
 7gTekXcN/ouYNt3HVWbJuewtoErMvswWBAYa53HIbFq64yiMj5jXWA7a3zyEzgP6Ijff7FV0vdo
 G6TJtHlvpjO0wyg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of passing individual fields of struct pinfunction to
pinmux_generic_add_function(), use pinmux_generic_add_pinfunction() and
pass the entire structure directly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 827d0f1910310a6717adb4d61c3d395105806501..ba0d6f880c6e1624720f0ed8e7b36e4734dda004 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -625,9 +625,8 @@ static int mtk_build_functions(struct mtk_pinctrl *hw)
 		const struct function_desc *function = hw->soc->funcs + i;
 		const struct pinfunction *func = &function->func;
 
-		err = pinmux_generic_add_function(hw->pctrl, func->name,
-						  func->groups, func->ngroups,
-						  function->data);
+		err = pinmux_generic_add_pinfunction(hw->pctrl, func,
+						     function->data);
 		if (err < 0) {
 			dev_err(hw->dev, "Failed to register function %s\n",
 				func->name);

-- 
2.48.1


