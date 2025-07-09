Return-Path: <linux-mips+bounces-9698-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9744CAFEC2E
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 16:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F9061BC1DB7
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 14:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B169E2E612B;
	Wed,  9 Jul 2025 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DN2G3XCM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A382E54A6
	for <linux-mips@vger.kernel.org>; Wed,  9 Jul 2025 14:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071950; cv=none; b=Q4zMqR2uhr0eW2LR3aqFNOnX0bvWK51yJw7DxAwMXYbEJmmEJmoeaNIOQjz6/230mrdE6SXMhAjN2n84tylY97cLk/wICWlAk3DIu7ZeDkeritNAIlJsfiZzY2T2U5b7sCtuUJGmEZT5o51AptAP3F1oCduN3Ada75CCvS2/f4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071950; c=relaxed/simple;
	bh=wDn/74XfpvokV8nWtZyxnEQPAbXH8hFUWEx7z9/fJrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TKaqm39fWmNTmhY9J3HfFbcrZAMedqeVRg9DPSplWL6lt/cCLikrIrx8VmqQ2AsCmMuy7z5+vIGOeQ9crkOjAer9QVvvvHcQYF+0BOhXoKDlNvArZjAGj3J36DlrpFQKypI2zPE0k10iEuiWB8CsFr+FaueBG6IsqrIFLSpoVNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DN2G3XCM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-454aaade1fbso63185425e9.3
        for <linux-mips@vger.kernel.org>; Wed, 09 Jul 2025 07:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071947; x=1752676747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czHhdDldz+WtRX7ZZCzWNm4N0HL7u5F2xQoqfhztS9w=;
        b=DN2G3XCMPwoKJNd54IS/8VmR0SJEWl6Jrp5DtRuvzIB8VFKShjSiVeL4HCGOOnqizA
         o1l3X8n0LVtfz3/ToTwnXXbknaBPNboEMRBhWKR19nPjS0QZjaprQf0BiJiJv5Oseq4T
         kl6fvatYXHnXpGeK9LpK+KiIPWfQRpsGXNquJsT4DEDiWa9SVOqDaPSJOW4xSBfjEF7X
         xM8ee7tH9RGzWwEXrYGCrqQW9naMAhIr7I5tawbu5w5ENegRGQvvo44vJsGItQWyuDlF
         HTFVh5M59iDyvb78nepRJcw6GIMmPWPf5kcG35oDL+kdJF9W5bNZJXpVOozysAflfIYP
         kfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071947; x=1752676747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czHhdDldz+WtRX7ZZCzWNm4N0HL7u5F2xQoqfhztS9w=;
        b=Wo4eAyJI6Z+EidjeVk0HnAJTZdlsMazy1C3HWfANsdYUmy7zvQ8PNzFkIT+bOgu2W1
         jYEr/GS3SN/8VT/1srKKj1x67805kIfe1Sh/gY8D9CI+MTnpeQMOd0lEGGQOArRQ98k+
         QfaNmjKLl1wWouFWWUbce6ZEdYBhf4OiwRZI2KvWgWZSnZ1/Dht2il/8f2tgJ45whDMO
         TIMDL1Whk10ZNZiyKSLe45+RTKyexLvVXsv0S2aSpeFKuq8IPHMNAzZwoH8XvA5yJl7J
         /CDc51worgn6/x8pL2wUCEMZxuwiBGHpNvRoxXfbxtUYS9JUTktzso0+945rEY/cJzVe
         mTyw==
X-Forwarded-Encrypted: i=1; AJvYcCWROfX+95SSqR6jdVLPuBwKJb9/B6iqIDcC/Myu2s2spox9YBljjyp+HxlE4htIAeLrzRiTvwcC9I5j@vger.kernel.org
X-Gm-Message-State: AOJu0YynkxmoFsZF/OncrCl0SPeAu0nEXWlleisZibGkYCWe7SlDlL1P
	OHaK2KXfrDasJDITQdyE9+WLenOdL3jQBgSJMJYThttQfKXgjp5LIO80uXGhpvTjFiU=
X-Gm-Gg: ASbGncsoPjgkYgABhUoLlywawA/d+7ijye+w699V70lhVIcp8omTieEjbGcYTLy35Qm
	YHrh82lBk2y4iX+wEhQj1S3CcFAl7/bPoEc4CL0x7iKtUOsje7jTlVxi50anDDE05HfG7MWT5ey
	u4s7AzkEGMAHMJ7M1I1mkgPEdkuN1hrRnUSXzMqWGTgwTMgeAYteVdBlk+riRZihlbilO08DhI0
	aSLvNZ3jtwSH3PWtf/1mx/wQgiG43JIBjVqx4vPzjMhR5WDiqMizfIAfVvsANDFmLW6i4yiGwpq
	i+GWVNXW+nYaoIcMIadwVrWc3vTAwLU1YSUcBRKRnd2WQdcEEjsSias=
X-Google-Smtp-Source: AGHT+IFuSbTCbzm4UMEs0fOr+CcLrwO9ZHO8Nn8PrkMXTiXu9SqobdbuxW9HdZqI8bmoCu470JLWgQ==
X-Received: by 2002:a05:600c:1d1a:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-454d5325799mr34930475e9.10.1752071947136;
        Wed, 09 Jul 2025 07:39:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:38:58 +0200
Subject: [PATCH v2 02/12] pinctrl: provide pinmux_generic_add_pinfunction()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-2-b6135149c0d9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2925;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sZ0ZigWm6IfbW3HtRq2G1M+nzP2iwa8TzMOAiF2WDhg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8F72btxi5xeLl0VGir38VLpRye250ZBWXiL
 84+vGLy9YyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BQAKCRARpy6gFHHX
 crSgD/9hLC4vMhdUuY8NHszXt6pGR2JOyKALHXCJqrcP120vpjqVcXV6Yi2hSZFN5tt64Szp/+s
 k7YylnJQ+zLC2IAqbqw1fpG6gY0fc8RceGTgqd3aEJIxwmekzOanlrSlfYOIz92Lj5hkfK1fQcN
 k1oXCPeX/oiBsCBKMgaF7w8oJ7H2kk2WFsYz44TN6CgqwpPH35bdMMtoD28g72S8FXLjdCHP7FD
 XepmoIsrZnknzd/4SGXiwlc4Cfl04BG9WU+kdB/+L8dOM23tvqZdCOiRrGdk0Y4ir4J+FpXF5oo
 +cCtRWMvmseaVLsSXqmHgNmiE7FzA0jGXqk4KHB43zZEi0m6t9/LKC3lUA8LQQgVeD0YH7nftY2
 deBpEtvp8lZw6+a1B3Y8/CzikfdewCMMB1j/1Wi1gDYVqyVldNDtiokONcvXIe0HZT8rZ1fWOhC
 nlzGki7r6QHuQ5/91jKveZtcw+MBK2cdqASSzFzeTDhvnSg+9BVhlHQ+cdsE5dl1VPj4c3xbzZa
 B3QWEpWthBDOhY8wbnWCOvOpK0C/IJx7i7j4eONBtNUK/JuWNAIO6HAgttJyeTUTbtB+aE2Pk4m
 1sNPDY4sXpmj2JJiu+FN8kf8MUdXFxrIcMq85K+dk69b737YT8Kxr29poEWjBkE+arImbDKPqBs
 3ClmLcrCq4JhxBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Several drivers call pinmux_generic_add_function() passing it the
contents of struct pinfunction as first three arguments. We can make
this shorter by simply providing an interface allowing to pass the
address of struct pinfunction directly when adding a new function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c | 24 ++++++++++++++++++------
 drivers/pinctrl/pinmux.h |  3 +++
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index daa7a11adabf672f802a8e9577c14e4da56b8678..8f2fe7ffc4f682cd966728f3c77c504489f7f8a0 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -876,14 +876,26 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				const char * const *groups,
 				const unsigned int ngroups,
 				void *data)
+{
+	struct pinfunction func = PINCTRL_PINFUNCTION(name, groups, ngroups);
+
+	return pinmux_generic_add_pinfunction(pctldev, &func, data);
+}
+EXPORT_SYMBOL_GPL(pinmux_generic_add_function);
+
+/**
+ * pinmux_generic_add_pinfunction() - adds a function group
+ * @pctldev: pin controller device
+ * @func: pinfunction structure describing the function group
+ * @data: pin controller driver specific data
+ */
+int pinmux_generic_add_pinfunction(struct pinctrl_dev *pctldev,
+				   const struct pinfunction *func, void *data)
 {
 	struct function_desc *function;
 	int selector, error;
 
-	if (!name)
-		return -EINVAL;
-
-	selector = pinmux_func_name_to_selector(pctldev, name);
+	selector = pinmux_func_name_to_selector(pctldev, func->name);
 	if (selector >= 0)
 		return selector;
 
@@ -893,7 +905,7 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	function->func = PINCTRL_PINFUNCTION(name, groups, ngroups);
+	function->func = *func;
 	function->data = data;
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
@@ -904,7 +916,7 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 
 	return selector;
 }
-EXPORT_SYMBOL_GPL(pinmux_generic_add_function);
+EXPORT_SYMBOL_GPL(pinmux_generic_add_pinfunction);
 
 /**
  * pinmux_generic_remove_function() - removes a numbered function
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 5c039fd09f7474b4c104d3c36e0e8b8dc73a2ddd..bdb5be1a636ead9695410824b5557937c5baa89a 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -161,6 +161,9 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				unsigned int const ngroups,
 				void *data);
 
+int pinmux_generic_add_pinfunction(struct pinctrl_dev *pctldev,
+				   const struct pinfunction *func, void *data);
+
 int pinmux_generic_remove_function(struct pinctrl_dev *pctldev,
 				   unsigned int selector);
 

-- 
2.48.1


