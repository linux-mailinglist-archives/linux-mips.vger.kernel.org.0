Return-Path: <linux-mips+bounces-9708-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C472AFEC53
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 16:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3225544A59
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 14:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2752E9EA6;
	Wed,  9 Jul 2025 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EKnWlUoS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2541A2E92C3
	for <linux-mips@vger.kernel.org>; Wed,  9 Jul 2025 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071962; cv=none; b=t7LHoytzAthRYsW1v6dU9yCnG8dydJSRk9zuaS2TnEaDKvlmWJLSbCjXyLEiia/5IsZv6+QJuq3mFMNQnVO8aMPQxShXestrOOQYvJYB51QpvnFgfuDAGudNNNCm2JR5FRqoY3OUkh49FCuxqyDW8I28pZFi5L2d2SHosDVCgfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071962; c=relaxed/simple;
	bh=zK2Sd0VSciKrNlt5gqw8BaOL1Ln09MOBuoUiwO3OGSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SgA7eWceCuvZ0dUS8YvBpg34WFUNZsM7jKQPYgSNAxkpps/vb8FM/fJ+4xf56Zq7ttb6iPSqevVm610Rv3SBjVG4Sl+Xg1ADbPwKRtwhe6fGp8XhYDgJyo1IZpPeU2qv24YgFaR6aGjnkubaCF5udNkjS7DPSDkzffRO1JnFGyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EKnWlUoS; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f379662cso16731f8f.0
        for <linux-mips@vger.kernel.org>; Wed, 09 Jul 2025 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071957; x=1752676757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZAFZJHtKocgnXC8Cm80wUplDQcAHmE1R6AOchOm23U=;
        b=EKnWlUoSLua2nKfvpogyMlksE2jRMqbSbMoVxNTU2xZskr8dE4BlOQgW0bQI9zZCuJ
         07hAfA0lPV/rCwi4nXiW4/7g6x4QF2Sxr4GxkJcYwPWsSqI+HJzPwVeuRt0/a7pDx7fJ
         PMlDIP45LeUeAAIEqr6I71bw1d+cFJoAC/34bWfaLKRJEVhKcQE6rGeyUXHi5mD3/vn7
         HxVwWWWLxbjFxknrNb1xcmIJYkaZy7z5QZtxLQnIQ5AyZZ/gPdWYSJtxfhiz5+eSjxmn
         aqPE0hLkbDrhfcuto8zrjbSR3E2AdIWykCBNUaqyC9nGhPViT5O4zxVke+ludj1BsYMO
         RuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071957; x=1752676757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZAFZJHtKocgnXC8Cm80wUplDQcAHmE1R6AOchOm23U=;
        b=R8R8chSbYXIG3inztpv5DpbpMMVKHFysLJdDuxH4e852V6sTrGWLuSLEwnJ2GxGmzE
         XzIHYvEY/6xF8+EayLVl14qdvQtN6ep1ozV65Pt1z819LYF7IFaOOR34mDM5SqxOg2km
         9JRyf5gu1Np/ZAKGT5dYTIa9YUrX0MH95pKTBBacAatodYGFE9vo5+zfa8m/hbNHoSKq
         4xogSpjLBCgR56fW3ISB76+09LoIQJvWo5NKME1lFNqzsxUuf1iEXurwZY6Dxyyq1WRq
         AmB/Pi9EStBt4rZoNHhaWZvrpgEJrZSjSN4BWgn0a/rCeVoJzguIYZJO4gX5X7UKQPka
         3cNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRtYpWFLkaRTMlhmCOhW6foAB75mV1hQ5el83/K5eTW/b9NpYgI6IumxkYr25ECx1n/o542pW/Br3a@vger.kernel.org
X-Gm-Message-State: AOJu0YyhnyFvaA5n+/YKieSetY0jQ0YS+1wFHzIAksjYsqjfSxQybk2i
	4fjkKYxnnZ60UPvFY7y3xNjl7gSEMEjU5cyE9DVPINH6+dAugyo/OJ/pjIs3s7dLxGU=
X-Gm-Gg: ASbGncsXLT04d0Om2k9fMFoLRvccZp5QI4ySX48oeOJd072zmC17+D4UnfZBTniU8dR
	egADWPCaXh6LlQ6yFGUCRfOhMNX8iQ6GAfjwOCjCwiMwk4bOaXscSdrlvmFRx5pdLF4RhEgRFrA
	vTh4c0BOu3eiKIsrKHOTmscMHcsG3pzdP5n0Xs5mdTsb7k/b5s6K3Ky+A8/NmvKbix1kJF68+D6
	Dz9EUy/LkoXw+vY4irJn7H5QJwPsHXNBRUUvEdKTPKtJBufinAlXhGB8LnRucXB0dhUhkhrXGDL
	lT8Xv++lIuUZuKrDThgKpLcyk5m2khPD+uNMwU638gvoBe1rVKCfL08=
X-Google-Smtp-Source: AGHT+IFzhS2FObKCvbQb1ODYSk4kYEcHlByrz27/hi0ViOkZFEdL0jFDGSl8FN2MxYO/qx/6+tCOuA==
X-Received: by 2002:a05:6000:144b:b0:3a4:f41d:696e with SMTP id ffacd0b85a97d-3b5e4522567mr2235515f8f.27.1752071957190;
        Wed, 09 Jul 2025 07:39:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:07 +0200
Subject: [PATCH v2 11/12] pinctrl: qcom: mark the `gpio` and `egpio` pins
 function as non-strict functions
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-11-b6135149c0d9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=35276;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hpX9UKJoNkN8MHry1GsUOwDGU7DIqAoorLs3EZ51CUY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8HPNPWVyRPDs6Zy5llCQ5FZzBoNpbuV3vhM
 DaSQ9ThES+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BwAKCRARpy6gFHHX
 cn1aEACLJVp7/ZhA8zJnui2A41AktwOWJxEbntWXeXXw+hQ6bb2QN78eBEvg3rfBr2dIu0ORAoB
 bTEWTpBbYXGmqTJO8GoA+0xxPD+fOOXOZzW0FD4ih7+FyQIgYiHbtyRZIqTu/+IaToyJ6bdA99K
 VQhvjwZnukFIbzzDHFI2XPyZG3eHbd8UViN9ZlJwYxPcuV9tQHqBB3uueN8mhxgN+tkf58/EaY9
 9IQVFGxwMR3TuJwyf6OZtWfrwulZ/ejGrM7SENe6VXUghsoWkcgPwTsI/t7FUe6TjpfirijC3u1
 C9D9ZrpLbUjgLjAlK9rBtmdcfnRQjoOuZvFczINqacn/VDq7u5fTxwSp02nBNGAow5P4o1AsmuQ
 RsOEHwfmYKTym+2/E1Yc4JN1btSpr+Ksv57k+SBUSb5/4MEna/LXrokKiRgr1hbRDTgZdU0/l1T
 dMAZuoPM8Z6B+wISvdj/i4+YZwh/M3ntlguFhKdYRBx12LxQwr2KVyiLP/KwzloqQmOqEPCJzNM
 4xYdr8ti/Al3g5Bs3Z7lb/INIE2Wg4b7ONpzZxZPMQPmVxPCK4yb01AeAdX3YGuEUY9CKt0wBWS
 7PbMctG6pzR9DILHhN9nLL3ZicbErTGyTWr4KoMEHLJWSI+diQ1dRGW2/LfWozRyeATplmLgRsH
 lZmRhWLAcjNRdpA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Allow pins muxed to the "gpio" or "egpio" function to be requested as
GPIOs even if pinmux_ops say the controller should be strict.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-ipq5018.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5332.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5424.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq6018.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8074.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq9574.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9607.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9615.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8226.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8909.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8916.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8917.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8953.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8960.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8976.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8994.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8996.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8998.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8x74.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcm2290.c  | 4 ++--
 drivers/pinctrl/qcom/pinctrl-qcs404.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c  | 4 ++--
 drivers/pinctrl/qcom/pinctrl-qdu1000.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c  | 4 ++--
 drivers/pinctrl/qcom/pinctrl-sar2130p.c | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7180.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c   | 4 ++--
 drivers/pinctrl/qcom/pinctrl-sc8180x.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c | 4 ++--
 drivers/pinctrl/qcom/pinctrl-sdm660.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdm670.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdx55.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdx65.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdx75.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm4450.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6125.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6350.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6375.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm7150.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8150.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8350.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8450.c   | 4 ++--
 drivers/pinctrl/qcom/pinctrl-sm8550.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8650.c   | 4 ++--
 drivers/pinctrl/qcom/pinctrl-sm8750.c   | 4 ++--
 drivers/pinctrl/qcom/pinctrl-x1e80100.c | 2 +-
 51 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
index 10b99d5d8a11db644e974a80b9d7d04ffc09bd4c..cbf34854f8826507430a9bb5a527bdc5d87b9a8c 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
@@ -630,7 +630,7 @@ static const struct pinfunction ipq5018_functions[] = {
 	MSM_PIN_FUNCTION(eud_gpio),
 	MSM_PIN_FUNCTION(gcc_plltest),
 	MSM_PIN_FUNCTION(gcc_tlmm),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(led0),
 	MSM_PIN_FUNCTION(led2),
 	MSM_PIN_FUNCTION(mac0),
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5332.c b/drivers/pinctrl/qcom/pinctrl-ipq5332.c
index 1ac2fc09c11923cd716495b16a7f4af5686ce398..239cbe75f198d3fadf39ed13387f5cea625a8f63 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5332.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5332.c
@@ -692,7 +692,7 @@ static const struct pinfunction ipq5332_functions[] = {
 	MSM_PIN_FUNCTION(dbg_out),
 	MSM_PIN_FUNCTION(gcc_plltest),
 	MSM_PIN_FUNCTION(gcc_tlmm),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(lock_det),
 	MSM_PIN_FUNCTION(mac0),
 	MSM_PIN_FUNCTION(mac1),
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5424.c b/drivers/pinctrl/qcom/pinctrl-ipq5424.c
index 7ff1f8acc1a3a81037298464130fda59f329d53e..67b452a033d62340d669bfff4b6ae7b6d6cc430d 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5424.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5424.c
@@ -641,7 +641,7 @@ static const struct pinfunction ipq5424_functions[] = {
 	MSM_PIN_FUNCTION(dbg_out),
 	MSM_PIN_FUNCTION(gcc_plltest),
 	MSM_PIN_FUNCTION(gcc_tlmm),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(i2c0_scl),
 	MSM_PIN_FUNCTION(i2c0_sda),
 	MSM_PIN_FUNCTION(i2c1_scl),
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq6018.c b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
index a4ba980252e187879947e7057004fa48815f2620..be177fb0a92d957bd57126df9c2a495b69ef1457 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq6018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
@@ -891,7 +891,7 @@ static const struct pinfunction ipq6018_functions[] = {
 	MSM_PIN_FUNCTION(dbg_out),
 	MSM_PIN_FUNCTION(gcc_plltest),
 	MSM_PIN_FUNCTION(gcc_tlmm),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(lpass_aud),
 	MSM_PIN_FUNCTION(lpass_aud0),
 	MSM_PIN_FUNCTION(lpass_aud1),
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8074.c b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
index 482f13282fc2be951032cbe6dc5100bf9129ea5f..e94de90833140c83d50535778e64044bb315c4ea 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8074.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
@@ -838,7 +838,7 @@ static const struct pinfunction ipq8074_functions[] = {
 	MSM_PIN_FUNCTION(dbg_out),
 	MSM_PIN_FUNCTION(gcc_plltest),
 	MSM_PIN_FUNCTION(gcc_tlmm),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(ldo_en),
 	MSM_PIN_FUNCTION(ldo_update),
 	MSM_PIN_FUNCTION(led0),
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq9574.c b/drivers/pinctrl/qcom/pinctrl-ipq9574.c
index 89c05d8eb55034dea3e1c7299ede6567c20e0159..3ed093ea8eb9074426934336dcfb9d74e3b8af22 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq9574.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq9574.c
@@ -651,7 +651,7 @@ static const struct pinfunction ipq9574_functions[] = {
 	MSM_PIN_FUNCTION(dwc_ddrphy),
 	MSM_PIN_FUNCTION(gcc_plltest),
 	MSM_PIN_FUNCTION(gcc_tlmm),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(mac),
 	MSM_PIN_FUNCTION(mdc),
 	MSM_PIN_FUNCTION(mdio),
diff --git a/drivers/pinctrl/qcom/pinctrl-mdm9607.c b/drivers/pinctrl/qcom/pinctrl-mdm9607.c
index 3e18ba124fede923f56eab1aec5aaf875f06e343..cef330547ce78d4c8cc873251d77f18b29aff57b 100644
--- a/drivers/pinctrl/qcom/pinctrl-mdm9607.c
+++ b/drivers/pinctrl/qcom/pinctrl-mdm9607.c
@@ -861,7 +861,7 @@ static const struct pinfunction mdm9607_functions[] = {
 	MSM_PIN_FUNCTION(gcc_plltest),
 	MSM_PIN_FUNCTION(gcc_tlmm),
 	MSM_PIN_FUNCTION(gmac_mdio),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gsm0_tx),
 	MSM_PIN_FUNCTION(lcd_rst),
 	MSM_PIN_FUNCTION(ldo_en),
diff --git a/drivers/pinctrl/qcom/pinctrl-mdm9615.c b/drivers/pinctrl/qcom/pinctrl-mdm9615.c
index bea1ca3d1b7f84c28c23af2a52cc464da44a90b0..729fe3d7e14efcfa247da2daac999c4038e1613c 100644
--- a/drivers/pinctrl/qcom/pinctrl-mdm9615.c
+++ b/drivers/pinctrl/qcom/pinctrl-mdm9615.c
@@ -313,7 +313,7 @@ static const char * const cdc_mclk_groups[] = {
 };
 
 static const struct pinfunction mdm9615_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gsbi2_i2c),
 	MSM_PIN_FUNCTION(gsbi3),
 	MSM_PIN_FUNCTION(gsbi4),
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8226.c b/drivers/pinctrl/qcom/pinctrl-msm8226.c
index f9a957347340813f87e58d3bcbea81faa9d6255e..a81aa092ef1240c9e951352720d48db6d269aff9 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8226.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8226.c
@@ -483,7 +483,7 @@ static const struct pinfunction msm8226_functions[] = {
 	MSM_PIN_FUNCTION(cci_i2c0),
 	MSM_PIN_FUNCTION(gp0_clk),
 	MSM_PIN_FUNCTION(gp1_clk),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(sdc3),
 	MSM_PIN_FUNCTION(wlan),
 };
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8660.c b/drivers/pinctrl/qcom/pinctrl-msm8660.c
index 4dbc19ffd80efcdab059a253904e1ffe95fd36f7..5ded00396cd949f432c4bdcd3b1224cbfae34f8c 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8660.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8660.c
@@ -714,7 +714,7 @@ static const char * const ebi2_groups[] = {
 };
 
 static const struct pinfunction msm8660_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(cam_mclk),
 	MSM_PIN_FUNCTION(dsub),
 	MSM_PIN_FUNCTION(ext_gps),
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8909.c b/drivers/pinctrl/qcom/pinctrl-msm8909.c
index 0aa4f77b774f45947ffade7d167dd25cc4da5297..544a52fb8f3d6e6abfd97e2c0736e8242b51d7ba 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8909.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8909.c
@@ -696,7 +696,7 @@ static const struct pinfunction msm8909_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3_clk_a),
 	MSM_PIN_FUNCTION(gcc_gp3_clk_b),
 	MSM_PIN_FUNCTION(gcc_plltest),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gsm0_tx),
 	MSM_PIN_FUNCTION(ldo_en),
 	MSM_PIN_FUNCTION(ldo_update),
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8916.c b/drivers/pinctrl/qcom/pinctrl-msm8916.c
index 0dfc6dd33d58b2d9df7a5cc3f7ff8890976207d3..b1b6934bb4b6357f04d84ce9c244ba930c1916ba 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8916.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8916.c
@@ -743,7 +743,7 @@ static const struct pinfunction msm8916_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp2_clk_b),
 	MSM_PIN_FUNCTION(gcc_gp3_clk_a),
 	MSM_PIN_FUNCTION(gcc_gp3_clk_b),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gsm0_tx0),
 	MSM_PIN_FUNCTION(gsm0_tx1),
 	MSM_PIN_FUNCTION(gsm1_tx0),
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8917.c b/drivers/pinctrl/qcom/pinctrl-msm8917.c
index 2e1a94ab18b219f818c591ff3b07280578822d1a..f23d92d6615b8926dc04ba0056cbce6715cc7b21 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8917.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8917.c
@@ -1302,7 +1302,7 @@ static const struct pinfunction msm8917_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3_clk_b),
 	MSM_PIN_FUNCTION(gcc_plltest),
 	MSM_PIN_FUNCTION(gcc_tlmm),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gsm0_tx),
 	MSM_PIN_FUNCTION(key_focus),
 	MSM_PIN_FUNCTION(key_snapshot),
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8953.c b/drivers/pinctrl/qcom/pinctrl-msm8953.c
index 956383341a7a777edf28c710353dc6deab124ef9..67db062fdf5628fb41588f2dc5a79a9e3499e5b6 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8953.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8953.c
@@ -1533,7 +1533,7 @@ static const struct pinfunction msm8953_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3_clk_b),
 	MSM_PIN_FUNCTION(gcc_plltest),
 	MSM_PIN_FUNCTION(gcc_tlmm),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gsm0_tx),
 	MSM_PIN_FUNCTION(gsm1_tx),
 	MSM_PIN_FUNCTION(gyro_int),
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8960.c b/drivers/pinctrl/qcom/pinctrl-msm8960.c
index a937ea867de709326a2aea77f980cae1d8480f35..2fb15208aba050a1bf669a2e304e389fd10fe0be 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8960.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8960.c
@@ -974,7 +974,7 @@ static const struct pinfunction msm8960_functions[] = {
 	MSM_PIN_FUNCTION(gp_pdm_1b),
 	MSM_PIN_FUNCTION(gp_pdm_2a),
 	MSM_PIN_FUNCTION(gp_pdm_2b),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gsbi1),
 	MSM_PIN_FUNCTION(gsbi1_spi_cs1_n),
 	MSM_PIN_FUNCTION(gsbi1_spi_cs2a_n),
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8976.c b/drivers/pinctrl/qcom/pinctrl-msm8976.c
index 3bcb03387781f803bf7e0251496a88a43b562b8d..345539b9e696f0decdb02b24eb0f966c7439af9d 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8976.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8976.c
@@ -812,7 +812,7 @@ static const char * const ss_switch_groups[] = {
 };
 
 static const struct pinfunction msm8976_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(blsp_spi1),
 	MSM_PIN_FUNCTION(smb_int),
 	MSM_PIN_FUNCTION(blsp_i2c1),
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8994.c b/drivers/pinctrl/qcom/pinctrl-msm8994.c
index 7a3b6cbccb687c8b5040ee6bf372f092f21aa872..94e042d1f4b2a5f20c3c3e9287b254e1e06c4050 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8994.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8994.c
@@ -1071,7 +1071,7 @@ static const struct pinfunction msm8994_functions[] = {
 	MSM_PIN_FUNCTION(uim2),
 	MSM_PIN_FUNCTION(uim3),
 	MSM_PIN_FUNCTION(uim4),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 };
 
 static const struct msm_pingroup msm8994_groups[] = {
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8996.c b/drivers/pinctrl/qcom/pinctrl-msm8996.c
index d86d83106d3ba12343a4685e5b87c661f823c35b..e5b55693d02377c1bd992504a9d15a9ce015cf84 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8996.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8996.c
@@ -1532,7 +1532,7 @@ static const struct pinfunction msm8996_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp2_clk_b),
 	MSM_PIN_FUNCTION(gcc_gp3_clk_a),
 	MSM_PIN_FUNCTION(gcc_gp3_clk_b),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gsm_tx),
 	MSM_PIN_FUNCTION(hdmi_cec),
 	MSM_PIN_FUNCTION(hdmi_ddc),
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8998.c b/drivers/pinctrl/qcom/pinctrl-msm8998.c
index 1daee815888f54b711505dfacefd614df83affc0..b727593af34af94925fd9c938e3c03c40ad59eaa 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8998.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8998.c
@@ -1160,7 +1160,7 @@ static const char * const mss_lte_groups[] = {
 };
 
 static const struct pinfunction msm8998_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(adsp_ext),
 	MSM_PIN_FUNCTION(agera_pll),
 	MSM_PIN_FUNCTION(atest_char),
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8x74.c b/drivers/pinctrl/qcom/pinctrl-msm8x74.c
index 8253aa25775b247dc54a377c9781094e465e22b6..202bec003e96f1d2d68703676e6e8a88f1ffdae5 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8x74.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8x74.c
@@ -778,7 +778,7 @@ static const char * const slimbus_groups[] = { "gpio70", "gpio71" };
 static const char * const hsic_ctl_groups[] = { "hsic_strobe", "hsic_data" };
 
 static const struct pinfunction msm8x74_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(cci_i2c0),
 	MSM_PIN_FUNCTION(cci_i2c1),
 	MSM_PIN_FUNCTION(uim1),
diff --git a/drivers/pinctrl/qcom/pinctrl-qcm2290.c b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
index eeeec6434f6a68a588ff58641b7c25c261b5749a..38200957451e1975b7215eae6a2d10329a30a57d 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcm2290.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
@@ -870,11 +870,11 @@ static const struct pinfunction qcm2290_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi1),
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gp_pdm0),
 	MSM_PIN_FUNCTION(gp_pdm1),
 	MSM_PIN_FUNCTION(gp_pdm2),
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs404.c b/drivers/pinctrl/qcom/pinctrl-qcs404.c
index 54e3b44353494e9398a88702945b7a85ff901b4d..0b8db2c7e58a9b6f6b832c8998766f2711068dd2 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs404.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs404.c
@@ -1296,7 +1296,7 @@ static const char * const i2s_3_ws_a_groups[] = {
 };
 
 static const struct pinfunction qcs404_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(hdmi_tx),
 	MSM_PIN_FUNCTION(hdmi_ddc),
 	MSM_PIN_FUNCTION(blsp_uart_tx_a2),
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 2a943bc46a6299899abd87523f24e7e291f24c57..4dfa820d4e77ce8157a3503ee8ec6e426b54e030 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -819,7 +819,7 @@ static const char *const wsa_data_groups[] = {
 };
 
 static const struct pinfunction qcs615_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(adsp_ext),
 	MSM_PIN_FUNCTION(agera_pll),
 	MSM_PIN_FUNCTION(aoss_cti),
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index d6437e26392b60f5d345f2591e98516a9d933a0f..f1af1a620684cd48e0282d4452c3f00af6ca0302 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -929,7 +929,7 @@ static const char *const vsense_trigger_groups[] = {
 };
 
 static const struct pinfunction qcs8300_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(aoss_cti),
 	MSM_PIN_FUNCTION(atest_char),
 	MSM_PIN_FUNCTION(atest_usb2),
@@ -949,7 +949,7 @@ static const struct pinfunction qcs8300_functions[] = {
 	MSM_PIN_FUNCTION(edp0_hot),
 	MSM_PIN_FUNCTION(edp0_lcd),
 	MSM_PIN_FUNCTION(edp1_lcd),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(emac0_mcg0),
 	MSM_PIN_FUNCTION(emac0_mcg1),
 	MSM_PIN_FUNCTION(emac0_mcg2),
diff --git a/drivers/pinctrl/qcom/pinctrl-qdu1000.c b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
index eacb89fa388850ef39ceb50497df9e5cca54191c..7c535698a780041c2660c08d22146c8d700ce081 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdu1000.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
@@ -904,7 +904,7 @@ static const char * const vsense_trigger_groups[] = {
 };
 
 static const struct pinfunction qdu1000_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(cmo_pri),
 	MSM_PIN_FUNCTION(si5518_int),
 	MSM_PIN_FUNCTION(atest_char),
diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 1b62eb3e6620c978225c5fd2ab541451cbe93093..53f28b9c49ba2dba7cfbbeb13774d011bd31fae9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -1181,7 +1181,7 @@ static const char * const vsense_trigger_groups[] = {
 };
 
 static const struct pinfunction sa8775p_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(atest_char),
 	MSM_PIN_FUNCTION(atest_usb2),
 	MSM_PIN_FUNCTION(audio_ref),
@@ -1217,7 +1217,7 @@ static const struct pinfunction sa8775p_functions[] = {
 	MSM_PIN_FUNCTION(edp2_lcd),
 	MSM_PIN_FUNCTION(edp3_hot),
 	MSM_PIN_FUNCTION(edp3_lcd),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(emac0_mcg0),
 	MSM_PIN_FUNCTION(emac0_mcg1),
 	MSM_PIN_FUNCTION(emac0_mcg2),
diff --git a/drivers/pinctrl/qcom/pinctrl-sar2130p.c b/drivers/pinctrl/qcom/pinctrl-sar2130p.c
index 3dd1b5e5cfee489ec34b16ee2ae1c8d2c2756553..4a53f4ee20418e755926770693f81a582c431e6f 100644
--- a/drivers/pinctrl/qcom/pinctrl-sar2130p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sar2130p.c
@@ -1128,7 +1128,7 @@ static const char * const vsense_trigger_groups[] = {
 };
 
 static const struct pinfunction sar2130p_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(qup0),
 	MSM_PIN_FUNCTION(ibi_i3c),
 	MSM_PIN_FUNCTION(jitter_bist),
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
index c43fe10b71add7d6294c90e86578ed472b8759a3..3eae51472b137372f358278a7fb04ace7430bcf4 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
@@ -903,7 +903,7 @@ static const struct pinfunction sc7180_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gp_pdm0),
 	MSM_PIN_FUNCTION(gp_pdm1),
 	MSM_PIN_FUNCTION(gp_pdm2),
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index 1b070e9d41f5972470d245edb821d202ca24522b..44e09608aad07acbd8354d5cb3e7f02b6e736f01 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -1153,11 +1153,11 @@ static const struct pinfunction sc7280_functions[] = {
 	MSM_PIN_FUNCTION(dp_lcd),
 	MSM_PIN_FUNCTION(edp_hot),
 	MSM_PIN_FUNCTION(edp_lcd),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(host2wlan_sol),
 	MSM_PIN_FUNCTION(ibi_i3c),
 	MSM_PIN_FUNCTION(jitter_bist),
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8180x.c b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
index 26dd165d154348a8659720335ec16c3e5ace30ef..d494e176383d25a369c217d1c649b580c374d35b 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
@@ -1272,7 +1272,7 @@ static const struct pinfunction sc8180x_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gps),
 	MSM_PIN_FUNCTION(grfc),
 	MSM_PIN_FUNCTION(hs1_mi2s),
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
index 6ccd7e5648d420072f7ce467d92ef0764a6d7764..cf8297e8b8f8c98add4cc5d305e99a2cd1f7a52a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
@@ -1506,7 +1506,7 @@ static const struct pinfunction sc8280xp_functions[] = {
 	MSM_PIN_FUNCTION(edp2_lcd),
 	MSM_PIN_FUNCTION(edp3_lcd),
 	MSM_PIN_FUNCTION(edp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(emac0_dll),
 	MSM_PIN_FUNCTION(emac0_mcg0),
 	MSM_PIN_FUNCTION(emac0_mcg1),
@@ -1527,7 +1527,7 @@ static const struct pinfunction sc8280xp_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
 	MSM_PIN_FUNCTION(hs3_mi2s),
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660.c b/drivers/pinctrl/qcom/pinctrl-sdm660.c
index 1a78288f1bc832837d5c72d9eb1659f397d79b94..687d986de75c4df5d91c6cda3c43beecfb24795b 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm660.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660.c
@@ -1157,7 +1157,7 @@ static const struct pinfunction sdm660_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gps_tx_a),
 	MSM_PIN_FUNCTION(gps_tx_b),
 	MSM_PIN_FUNCTION(gps_tx_c),
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670.c b/drivers/pinctrl/qcom/pinctrl-sdm670.c
index 0fe1fa94cd6da13591397442a63ce8daec9f4674..486b72edf7b4ec9d30bbbffbf53d41db2c9e8157 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm670.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670.c
@@ -991,7 +991,7 @@ static const char * const mss_lte_groups[] = {
 };
 
 static const struct pinfunction sdm670_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(adsp_ext),
 	MSM_PIN_FUNCTION(agera_pll),
 	MSM_PIN_FUNCTION(atest_char),
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index 0446e291aa4831da439af12b7934fbda5915ee5a..4cf8575797a0f49646e0dd7a93480dfbd6ba3a04 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -976,7 +976,7 @@ static const char * const tsif1_sync_groups[] = {
 };
 
 static const struct pinfunction sdm845_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(adsp_ext),
 	MSM_PIN_FUNCTION(agera_pll),
 	MSM_PIN_FUNCTION(atest_char),
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
index 2c17bf889146362edf9f482d33b17d35a255882e..79a7010b73f187f4aeab8ff7e27461984c1c9c3f 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx55.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx55.c
@@ -796,7 +796,7 @@ static const struct pinfunction sdx55_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_plltest),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(i2s_mclk),
 	MSM_PIN_FUNCTION(jitter_bist),
 	MSM_PIN_FUNCTION(ldo_en),
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx65.c b/drivers/pinctrl/qcom/pinctrl-sdx65.c
index 85b5c0206dbd199c6efc15aad10784d20c1addde..cc8a99a6a91ed253883535f3eb0338939db9a677 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx65.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx65.c
@@ -732,7 +732,7 @@ static const struct pinfunction sdx65_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_plltest),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(i2s_mclk),
 	MSM_PIN_FUNCTION(jitter_bist),
 	MSM_PIN_FUNCTION(ldo_en),
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx75.c b/drivers/pinctrl/qcom/pinctrl-sdx75.c
index ab13a3a57a830781f35916ff508ca65d6699271d..4078d83d818c3352253563fc45273a293cfe4ce8 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx75.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx75.c
@@ -852,7 +852,7 @@ static const struct pinfunction sdx75_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp2_clk),
 	MSM_PIN_FUNCTION(gcc_gp3_clk),
 	MSM_PIN_FUNCTION(gcc_plltest),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(i2s_mclk),
 	MSM_PIN_FUNCTION(jitter_bist),
 	MSM_PIN_FUNCTION(ldo_en),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm4450.c b/drivers/pinctrl/qcom/pinctrl-sm4450.c
index 1ecdf1ab4f275ede7cb629321f9c37d3f81a25e9..d51e271e336101796b75d64e56f573f3547f1121 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4450.c
@@ -722,7 +722,7 @@ static const char * const wlan1_adc_dtest1_groups[] = {
 };
 
 static const struct pinfunction sm4450_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(atest_char),
 	MSM_PIN_FUNCTION(atest_usb0),
 	MSM_PIN_FUNCTION(audio_ref_clk),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115.c b/drivers/pinctrl/qcom/pinctrl-sm6115.c
index c273efa4399630a2187845382e231fe150d997fd..06700685ea2a380b84464d17955d040e55eb587c 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115.c
@@ -687,7 +687,7 @@ static const struct pinfunction sm6115_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gp_pdm0),
 	MSM_PIN_FUNCTION(gp_pdm1),
 	MSM_PIN_FUNCTION(gp_pdm2),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6125.c b/drivers/pinctrl/qcom/pinctrl-sm6125.c
index 5092f20e0c1bdee2e99b768f12cfbec31972c24c..5d3d1e402345ebb86524b508c45cf9fc9a0f2031 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6125.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6125.c
@@ -943,7 +943,7 @@ static const char * const dmic1_data_groups[] = {
 
 static const struct pinfunction sm6125_functions[] = {
 	MSM_PIN_FUNCTION(qup00),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(qdss),
 	MSM_PIN_FUNCTION(qup01),
 	MSM_PIN_FUNCTION(qup02),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6350.c b/drivers/pinctrl/qcom/pinctrl-sm6350.c
index ba4686c86c54b8c1dc32522c83587521e149a5ae..220fb582cac9fcc97271cc0feb2adc5b32c85994 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6350.c
@@ -1048,7 +1048,7 @@ static const struct pinfunction sm6350_functions[] = {
 	MSM_PIN_FUNCTION(gp_pdm0),
 	MSM_PIN_FUNCTION(gp_pdm1),
 	MSM_PIN_FUNCTION(gp_pdm2),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gps_tx),
 	MSM_PIN_FUNCTION(ibi_i3c),
 	MSM_PIN_FUNCTION(jitter_bist),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6375.c b/drivers/pinctrl/qcom/pinctrl-sm6375.c
index 49031571e65ee3291fb1e5269e071a08a77c87de..08b8ef6efaf09741e8826e08a2c12ef49680504a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6375.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6375.c
@@ -1172,7 +1172,7 @@ static const struct pinfunction sm6375_functions[] = {
 	MSM_PIN_FUNCTION(gp_pdm0),
 	MSM_PIN_FUNCTION(gp_pdm1),
 	MSM_PIN_FUNCTION(gp_pdm2),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(gps_tx),
 	MSM_PIN_FUNCTION(ibi_i3c),
 	MSM_PIN_FUNCTION(jitter_bist),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm7150.c b/drivers/pinctrl/qcom/pinctrl-sm7150.c
index 6e89966cd70e34bcb74cfb50e80e110e40655b0e..78dd8153a4d4e5bb68dd5d22aa7f2b6dc6a5fddb 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm7150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm7150.c
@@ -960,7 +960,7 @@ static const char * const wsa_data_groups[] = {
 };
 
 static const struct pinfunction sm7150_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(adsp_ext),
 	MSM_PIN_FUNCTION(agera_pll),
 	MSM_PIN_FUNCTION(aoss_cti),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
index 794ed99463f76032f56be9464a4aa3018537df94..ad861cd66958c4faa929737e5088b82a35ffc95b 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
@@ -1217,7 +1217,7 @@ static const struct pinfunction sm8150_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
 	MSM_PIN_FUNCTION(hs3_mi2s),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index fb6f005d64f53f318d58e69681f07e36404439cf..6021d9f6e407ef57a6b1ebaaa27039c0fea7e18c 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1021,7 +1021,7 @@ static const struct pinfunction sm8250_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(ibi_i3c),
 	MSM_PIN_FUNCTION(jitter_bist),
 	MSM_PIN_FUNCTION(lpass_slimbus),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
index c8a3f39ce6f1b8565a783f04100269b3cadb9bcc..99949b552021131f5aade06a80bd01799835e67a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8350.c
@@ -1267,7 +1267,7 @@ static const struct pinfunction sm8350_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(ibi_i3c),
 	MSM_PIN_FUNCTION(jitter_bist),
 	MSM_PIN_FUNCTION(lpass_slimbus),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450.c b/drivers/pinctrl/qcom/pinctrl-sm8450.c
index f2e52d5a0f9369d21922d0651539908d592301e5..9889fc5dc2cd204588abd06cfd7d1ae0e4513af0 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450.c
@@ -1269,7 +1269,7 @@ static const char * const vsense_trigger_groups[] = {
 };
 
 static const struct pinfunction sm8450_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(aon_cam),
 	MSM_PIN_FUNCTION(atest_char),
 	MSM_PIN_FUNCTION(atest_usb),
@@ -1291,7 +1291,7 @@ static const struct pinfunction sm8450_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550.c b/drivers/pinctrl/qcom/pinctrl-sm8550.c
index 1b4496cb39eb46b2b660ef213e1f3c8fdac2b21e..10a62031fdfd044f851165e346059d1834ff7c9c 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550.c
@@ -1340,7 +1340,7 @@ static const char *const vsense_trigger_mirnat_groups[] = {
 };
 
 static const struct pinfunction sm8550_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(aon_cci),
 	MSM_PIN_FUNCTION(aoss_cti),
 	MSM_PIN_FUNCTION(atest_char),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650.c b/drivers/pinctrl/qcom/pinctrl-sm8650.c
index 449a0077f4b10666ecd9dfaae8e0057a91e181a6..e2ae038002060d2f93c091c716b1ec7fb9b6498d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650.c
@@ -1328,7 +1328,7 @@ static const char *const vsense_trigger_mirnat_groups[] = {
 };
 
 static const struct pinfunction sm8650_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(aoss_cti),
 	MSM_PIN_FUNCTION(atest_char),
 	MSM_PIN_FUNCTION(atest_usb),
@@ -1359,7 +1359,7 @@ static const struct pinfunction sm8650_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(do_not),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
index 8516693d1db51d3e890e298ea6500ae62333bc69..6f92f176edd4593563a95dc8b0cfde2b6ad3a213 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8750.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8750.c
@@ -1290,7 +1290,7 @@ static const char *const wcn_sw_ctrl_groups[] = {
 };
 
 static const struct pinfunction sm8750_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(aoss_cti),
 	MSM_PIN_FUNCTION(atest_char),
 	MSM_PIN_FUNCTION(atest_usb),
@@ -1319,7 +1319,7 @@ static const struct pinfunction sm8750_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
index d4b215f34c39bf67a0656a3f894b8639491e898b..bb36f40b19fa53eedf68d46d02986410d07a733c 100644
--- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
+++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
@@ -1407,7 +1407,7 @@ static const char * const vsense_trigger_groups[] = {
 };
 
 static const struct pinfunction x1e80100_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(RESOUT_GPIO),
 	MSM_PIN_FUNCTION(aon_cci),
 	MSM_PIN_FUNCTION(aoss_cti),

-- 
2.48.1


