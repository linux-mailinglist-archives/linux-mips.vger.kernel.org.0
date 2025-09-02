Return-Path: <linux-mips+bounces-10948-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DFAB3FF96
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 14:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AB245E0112
	for <lists+linux-mips@lfdr.de>; Tue,  2 Sep 2025 12:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC53432144D;
	Tue,  2 Sep 2025 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Hok4d5ns"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AC23019C5
	for <linux-mips@vger.kernel.org>; Tue,  2 Sep 2025 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814388; cv=none; b=X9XK9M0Qz6k6AzuB0CBW3Zb2hGN1XbC/5PCQyjC269aQcL/kQCLK2iYCiiPbvn8EbQzQAigbF7DlgduO8NUt3YRfylszFl7RrUW3hHpeijnh00uDlIw6XbYMkzEy+ies7eJrJ3CHFFCkIV0ksNy1NNXqBhIDHhagDcjW17pViUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814388; c=relaxed/simple;
	bh=SV+I2au43zHAy3pv5eee+yllfhgOlyFWT5ZY6Em8qGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koXfVE/Joi9lZ2jdtZsf4cmbe4Dx3P7tGM5e60QO+v6s1/bB0B0ULHkg7FDTdUIHxF3rSy7PtOIJwCQPTICZmldmDrAYXrK1spF7bAvk3JLu3jh+lQP+WJIqFLMIyocAKzJfrbS98OrR1ljZFHSJsXTwYHkQtRdJkwXStzVvkzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Hok4d5ns; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3d0b6008a8bso2043302f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 02 Sep 2025 04:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814379; x=1757419179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEWsVeKHUC/dAllw2aDUrg7lMLZ7DefoZuk24jUoBho=;
        b=Hok4d5nsiFJKt36KxB3HOZa74z8XsGOmTY8KysQJNfg2AyK5ztd/6ug4dDEM+y/pBR
         FO9bKtKZhoamrSuv8HWM2mX9OLgEVV17BsEfH52k3gIZeM5yp7UATZFho4xHxfg9LXrZ
         EonISc6v07+HNER6b43Ug3Aiqm/aAgKKyohyeMs73i5OdK/twvDi22WBVAC8pwKGa3gq
         cdEKMnV79G9/QWPa8xogfEYp2Sgedx9ZJsFTxKCf4LsX7Yoged1HKYFs5SkAjEOo5RAg
         1d31RvGB6vvCYx9Xi0DcJRUuNkrDkFms1z+KUE7gjsaG3qrRh/TA17MPImihvid1k8g4
         ekJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814379; x=1757419179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEWsVeKHUC/dAllw2aDUrg7lMLZ7DefoZuk24jUoBho=;
        b=Qmy4Rn4CW8CEKKRdi2GA4RH1efWdmwLMm/rRbJ8OTEferNCbBNlkE+h9LQAvxGONtf
         V2xBwCcpDDr+pA7CvNGjnAh6oZZ0CRmOQCctsrYvyahiHfe7tdo847Z42bbanV1cB+JH
         s1bcujQQ3APnT+jmRaRyP9rANc+/Y8ZCL50YWzhX5jftrMmHdgP8IbhMoERZbF6o8o69
         gXCu++kqtKvms9kXaW2HYUEUl4nS9t9kEC7kInsCg+9hJhEBGQyBQa2b0VH1IIlUpfVI
         WjEncTJ46jdP0xmMTWniW4hpeftNtjTZzRGjEaiWpL35LqRHuQcb/zzrpfvyNOmOekCd
         ziZw==
X-Forwarded-Encrypted: i=1; AJvYcCUbFFQ3dloQJpat7AaIO/2euUfv919nJj3MUPZEl8/wNbeMI9F2Uh4a/iiTe4qbN3pq8JF0rjgCYyVb@vger.kernel.org
X-Gm-Message-State: AOJu0YyYrev/qHQADe6fa3y0+tzFENQHyfdwkWuObEoTuw0DKFOi+lTM
	LnwHrDwsmVzvJ32uFMh/O1+6t/9D5PLZ90+1hoGvqQOjp/l5nbQIludB7cGuE4KkGRM=
X-Gm-Gg: ASbGncspatL3pYOzeZH1N9+uY17XfeoOxJ/R2dfTeWQqTdmeCpKmoy4tGF0BJsBH553
	GiJc0N8PG7iSE0E+V1zzg1c8ECfWC94+KhDW0UnQ+YA/FS2rrdNION50RSh2q110XntnK3lBhW2
	8+IqwFnkzwSHnWksU0XGgfqbmPOzFj3jn8Mpl7bXdK0tBL7w2x6Sai+fag+Rd/U/NPK0YosM1E8
	Aj56zDpypQ8AJExq1lmBUlptSx15bHo8N8JfZ0iQ3YZxMoG4PRZCpPMEaEDF4odJ/GiGTM6C+CR
	zV/FJVDTV2+ZyKiRG54DCBckla3WCy5CFtFV69TJ3LbHZEM9IRBmubILxeZDfgs6sohhfekC5VC
	q78ijTQA+LCPp5UZ+MZ238vcYlWU=
X-Google-Smtp-Source: AGHT+IFbemdBZVr4cSqFDknoZOXx6G9gv7/Y0ZwIrtmRmycK6XluzE7F7aIjOJthCpOln2BXwIsUdA==
X-Received: by 2002:a5d:5c84:0:b0:3d1:6d7a:ab19 with SMTP id ffacd0b85a97d-3d1de2c6bc9mr8102151f8f.20.1756814379349;
        Tue, 02 Sep 2025 04:59:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:21 +0200
Subject: [PATCH v7 12/16] pinctrl: qcom: use generic pin function helpers
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-12-bb091daedc52@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3806;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=32Zcb9hfB+ZeJyoy3uwQecPB9Xyi4ZVd3B+L7ZvFZiY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwUCgQZBmoTxlTrj8gjD6XedHkrbIupwH0/A
 aWSRMyfc9OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcFAAKCRARpy6gFHHX
 ciHxEACSn9uq6GCoE4OW0AyeoZN7IZ7Lwnvcc5CVALJn3LNwLkXQJla95ogJxXNn6INZUSqnzyZ
 sAv2J4r1nBu6cWS1jCNcbRwgOsUxCD7DOij9DTVk8vVeuUiyb3/nBCtlDSiKX+I+EJ6UBXABrJP
 2ulvPkXnmvHPxoFGDEuoV7ZOvRno5o2gmZUIT0hafWB6etSbvtGLzxA4akcilCxSVle3PTU7OoZ
 rJ8ecXISPikzFtKVSa8iwGbopUmzdfdyaqHjdni8ExsDN8TyDcZLKAkiWHxe+Wn+ovT37ULrXwY
 URy0PXM8ZdNugKFa87z/9zRKbtpRbfznmQOJUMdHJRA/3Ws1XTiF3r7m1C3mAvhJJki+yp8n8ns
 eekmGbBOSMUH+0H6ap2CxYRgxlOFFIARsBHSIK1O4ci5efShHfePBz1yk0YTqE0lMMxwIMBS9OW
 2ww1g3NSRKBROCGTk2V6dGLcOIKnRJgSX6OYWcbmQaifc54U1l44/0nmUnQFfIW8yZepxvX5WZr
 TMbqscKrQY9wJyUsRY/9W7iq0Cs9ZRlfqGO/8OWJ8flLXdJXpeZsEkmsdB6GYbixZ1cdyNpfVd7
 6AZzJLar5yCrsfEiPgfaRWSe/izLz5B8B2bE7q4Js+qhiJKPopM8A0/rJP6mJC4aBWYqvqM/qXZ
 qANi8Fe+TNoz+zA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With the pinmux core no longer duplicating memory used to store the
struct pinfunction objects in .rodata, we can now use the existing
infrastructure for storing and looking up pin functions in qualcomm
drivers. Remove hand-crafted callbacks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig       |  1 +
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 2 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index dd9bbe8f3e11c37418d2143b33c21eeea10d456b..f7594de4b1e9b95458c2c817e1158026a8006f64 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -8,6 +8,7 @@ config PINCTRL_MSM
 	depends on OF
 	select QCOM_SCM
 	select PINMUX
+	select GENERIC_PINMUX_FUNCTIONS
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83eb075b6bfa1728137e47741740fda78046514b..96e40c2342bdedb8857629e503897f171a80e579 100644
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


