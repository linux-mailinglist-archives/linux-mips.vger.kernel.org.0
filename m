Return-Path: <linux-mips+bounces-9702-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D5CAFEC42
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 16:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50210564172
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 14:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F832E3B1E;
	Wed,  9 Jul 2025 14:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="q/9ujI5k"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B60F2E7628
	for <linux-mips@vger.kernel.org>; Wed,  9 Jul 2025 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071955; cv=none; b=EzwVwKKU582RyjKnswojAG07gvxJaKz2dEMQ3/rXO1rUqyDTrLRPN551q49TXIp+q+U/ITCIgLh5Cfb6Jl6/E3o3dGJXlmdCwv3E98uXxezWDSScmFas2eH1CTAP2mislMzYgxSDDgYoaTauhWj4ToWZVnxhP/CDwyK5hsJgbhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071955; c=relaxed/simple;
	bh=Otpwmldb5UiTVDtiVYgL0Pf4AQUDuuXdiuNaENwU0xA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qhfa9PZAJfavssOn4HNMAEkoWnq+pUEvnt5+ohizci5uAIU1fM2s5/hVcJjPOeSHd8JQXzQtjeZbmlYGCL4dyGHh2/xMEvW2cYa9p9nshuL4Nhwq9pJWKqfdwBNxMr9PX6hS5m9K518owDc/OYZj7eQXYxTMFrPWwt+AWZQ+ZdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=q/9ujI5k; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-453643020bdso44489765e9.1
        for <linux-mips@vger.kernel.org>; Wed, 09 Jul 2025 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071952; x=1752676752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xmTipmFVVxbCGcdXsiaH70Bk3Q/qRASYoTM1gDWBACY=;
        b=q/9ujI5krY+Sd5vNh8Cwkx4Jb9OPGyqC+mdzq48xvpbKFEh95GVcyb4uR5i+j+//+e
         vr5H6FPsGyM3PC3ECu8UBQhNYNW+9iAbNNQojJWLzm7IQ10qwMYNWuSknO3pciYgfH5f
         r3nqLe9rZyqE8b1oA9Y8SgfaxiwH7/MyYAMC4cPI+u7lg31YffxQb6Skel0FNCflFL9h
         C2EN0AAGO/lscSU7CVLm2uEt5PTbBuuiG6ZBnXyFyp7j9dEEw+EFFJQgxm2q7b6qKFJj
         Y/ZBpb2/dePgYopc/oX0VHeTbaNQqoE1xoDv0+GIxWYPInf0chDPg5PUdfowoDgxdNsM
         D6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071952; x=1752676752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmTipmFVVxbCGcdXsiaH70Bk3Q/qRASYoTM1gDWBACY=;
        b=krcIWVYtHl7IkBfD6dsrjE9hejaGBb03bii00GOXBTBQPycP3TxVXrjLWxll1SO3SK
         J9tqVHkihSCS1O/TrxP6Bq7lLsZWTjYEdLbfN+64gvsqoZhXH9f4SRvmWb+2rcnQTpoN
         jjA3/EstBlgQMiNrE+FQldZGW9IIEo5/h/bMhJP6e/NbKRx5ZtGgHZl096z1G4P7nkPg
         4YkiBieRXXwJGnSEHpScLkjg1/Zns/Xe2KOqmJmwosX4WnRZ6TfP5b2S3YQMJn7dTkXo
         UR9XovEUt/aP/v9tGVIhEY3Al6HK4aKd8kXp+IqaZKpCo810PoqglHaJus41aWRDvfRl
         fB9A==
X-Forwarded-Encrypted: i=1; AJvYcCUhr9/VGyaIvI3yAeLEEqnL2XJleOFl1aR0iVH0tRdQV0duRoQUZ/QB915gJCAhhtrohhOfBi3/jnB4@vger.kernel.org
X-Gm-Message-State: AOJu0YxYv+CXTcxQmlBcw7eYM3bL1XaRxbm1QQIFE4hJQNro54QaRTAi
	nnZPDS0WlBREdguNeyg0rsuqhMyafteQHDEArcUBqJHaeOAB/qHUN235IEmTB71Uwfw=
X-Gm-Gg: ASbGncuirotEJCApzxgh7Soiahfo3FzAxpZtCGkAvrKm1e7QFMEGdWZ/61NYEgfK6OI
	/ATIus6jqOPY/a/TphAIcbClxWSXIOh2amuh68Zd/RMchEbpx46kFEjfGqjAHEmkyLJELyFDWhQ
	wtKirnYq+/WzITSBuvXcqzZNRr05zzViXpv14Ca1n828CKUYL/EiieJmFL+bcWKecB5SJHINIuJ
	YsJlCvq8eRJ3y8IyeOxMG3miAyHu/Z9SMn0F2Q3kboz0lv5Y97HZaa8Idu7kvwtWAOvQyEdA5K0
	9iEJQ1rd6U0xpGlMQ5A0hso/OwqaI911hwI+e33XbrHs/jk9giHxyd8=
X-Google-Smtp-Source: AGHT+IEqHxbgo4BeTO0rlwHgfs+5cT4MK/pnweKO+TNdiAGszDjha7dmHPKUi9qhBMYkfvOZ2o5LAw==
X-Received: by 2002:a05:600c:b85:b0:453:99f:b1b0 with SMTP id 5b1f17b1804b1-454d53a7430mr25430055e9.20.1752071951593;
        Wed, 09 Jul 2025 07:39:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:02 +0200
Subject: [PATCH v2 06/12] pinctrl: keembay: use
 pinmux_generic_add_pinfunction()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-6-b6135149c0d9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LiSip0OZ3qgm+1gIe35XDjDVlfL+H8JX04gXW7dLT1g=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8GPdYY6Prvb78Lkt36Igp2P+vSPLUAtu4SU
 UOQ6CfFu76JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BgAKCRARpy6gFHHX
 clEgD/4/hywwvwvR7tFh1C/3Ky26RR7UITmtWx1t2bwLPpLBRA/8B4rCbEmpf+eO/3aF3TEB2US
 EYT5xt+1aNMdlx3uo+A2sMKw5nRorK9HEE6hURhLpVVmSk04hVEZE9MADfkaTbdRUoEe+OGaL2x
 I0kTBJOsZn05tkr0eEMOfrTnesHV4T4oWgM+9ChUQR0o1ypuKoqZ4iZjvyWe0D3aPwjRYL+frf3
 6zQMxdIIJwJAkHA9517OGixJJG6vvkMFMx89OGsymSIq4ONGDphjL1J1Q5Ne+hjQn5YbzRnB49k
 8rhdGbedPZUwmP5EfEj4V0JcaMCqZBkHgG+FzRmGGAxU819C0ITJUQharhh3VrtoJ7vhTPSes7O
 /LtdaGdMbMDnthTnRMvhVMRVbv0+C7d07RBE1cgZEkxXDP0O4cPrMvXSJhQHStTscNNRIGyDOsC
 hbXLZfQpxTPmAVOedaUaKleDfjlqz6DRaQUF6lA+//qOkpkOzaQ9VU3d6b1C6b9r6LIBu8dzy1Z
 WVWmrl5sQm5XkBjrlUtm5rzMSecnAxJoW4vUedcSZeooEqWzguv0INc84+jcbVStA+pJ2mnEo6d
 KiCGH/Xl4Tssw7AvLZSU9Kac2kfldzJXaNkyBSwSc7PurFd/MSL1qI1aPWOumrkmLq9r/M37v5F
 Qy5vLPoQSAjVjiw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of passing individual fields of struct pinfunction to
pinmux_generic_add_function(), use pinmux_generic_add_pinfunction() and
pass the entire structure directly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 622000139317e9dfb95e9a76f2478366daebdcaf..30e641571cfe5396075cb28febd2d0776326365d 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1586,13 +1586,9 @@ static int keembay_add_functions(struct keembay_pinctrl *kpc,
 	}
 
 	/* Add all functions */
-	for (i = 0; i < kpc->nfuncs; i++) {
-		pinmux_generic_add_function(kpc->pctrl,
-					    functions[i].func.name,
-					    functions[i].func.groups,
-					    functions[i].func.ngroups,
-					    functions[i].data);
-	}
+	for (i = 0; i < kpc->nfuncs; i++)
+		pinmux_generic_add_pinfunction(kpc->pctrl, &functions[i].func,
+					       functions[i].data);
 
 	return 0;
 }

-- 
2.48.1


