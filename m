Return-Path: <linux-mips+bounces-8721-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734C7A9A609
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 10:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05CE23BC321
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 08:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B163213240;
	Thu, 24 Apr 2025 08:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TeZ7FzFD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020941FECAA
	for <linux-mips@vger.kernel.org>; Thu, 24 Apr 2025 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483748; cv=none; b=rW5iHgaVIHvIZXrZM3XObNnewt8XGa73iSXV11wseo1MeG8GqyKL4BGD9pNO+6+k9Kk93f+u/CIoESSlX5w76gwDGGCsp+6PFFOgCMKXICDi7JDfWkhZdpkYtyb+ZRojN7ZNIaWKzOR74kxZ+7uKv1udtKjxst3A13uRK5BWJ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483748; c=relaxed/simple;
	bh=GKznQfl3JNkYy5vmo0PNTYM2muY2yQRrhtqXia3AHFA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=inAZWWeRPfiL9OzseyJJsbk50Evcm2h+5xzAXv5l8A591xX5AsQlPj5Me4BFw3iegCCwpbMjwTqTMC1fr5ppr2lvlWTdFRrtRHX6oNQNjSu3sJGHvHh1/DEY4RT6mlKOwmjbr6h0Zhwdg6fpdB5rLaGdICZFQkJlwD3zsC5LFBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TeZ7FzFD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a064a3e143so338276f8f.3
        for <linux-mips@vger.kernel.org>; Thu, 24 Apr 2025 01:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483743; x=1746088543; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wKLuHIxdGKJ5U7MzOvw6oNf3BEX+m2YB8ZP6WN4zI5s=;
        b=TeZ7FzFDWF7EhbawDoNyW4TP9XFVim5OKCAaKny475ngDajgZcxFTW9ksQpzQteGBB
         7+wpGMfGl9iMl5faIKAv033hFHU/MaDt6KZzkH7XFZgzLzYrRTIdqZOEqS4h5sRh7pjp
         ek2+YRjCyTxD/nMsBd2i7U+1r63c8ZxqSI2lKoxCc6w8LCOQazHC3SdUI5vDo32qKgsD
         xpRzX9DDpmnf8Tx7ZFfb9Q4iyaFXML07clTGmPsG7yjc9y/YwDRhJtWo2EWNP1g7HPmA
         ytffSlqx7FkF1qkhCF+iw8aCRrVryQ+JHQm/b7Od90RmuFVdW8kqTE3NWWfgQblnfbUU
         u6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483743; x=1746088543;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKLuHIxdGKJ5U7MzOvw6oNf3BEX+m2YB8ZP6WN4zI5s=;
        b=hzNRnQkKuk/447+fGSX9/cCjoCQ3u/H2OqHNm/2WxIh0ajh0YQQccqtNt4KAVhtD/s
         O6xA1lCj9SjF+m8YXKtbnk4MjvlDMmfq2G66G241Pk5mSnGtB6Zi2iAYber1CqKkmJsz
         SVonxneu5rjNNXdc570h969KnKSDwQhLNDQViumcFvdAK6kXuJPz7xutPd63+FkJH+u9
         2Q19lF2TlmSzwl/pcaSniwbFCf4KvWNc8RMmWHxNK3XIQOjnq1WzX0pLgdE9/GQdMlWP
         EQjlzeW7f7GcICX9OfKH/qO5DuV1apfkawSljpwHbQelDAehz08eAn3epHV28/GZ/JRK
         jKEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWAKocOdrgjE1MKHcGjOQ1ZFstNbN8PP7JnRJrKAM/VZny/84iJBU8KaF5XFJN15LZ6ld/r/5AmGfY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6sYFGKlYWvYlfoPA0oK1sAumSO+ubNtcSE9byttI67p5gT9fb
	PmaGGnR6KKKvAN591CTf3SQJuBNYpxxrMrYq5llSKZ6hE8FADrBlw62elRDiOmU=
X-Gm-Gg: ASbGnctnGTJy9XVRq1Vzge9ain9sHDUvnX2b1u0WCqsHALw8sTNOsqBKjoMuck9opgI
	g4kXiqYTpukwFyzIjdIrRDld6sWD0UcfUhLGlicjg2mL5O41YYY10oDR9Ktek0/zLNg0y6oXAFz
	B+2YXhH+979V0rraIkWZRufJVe0whpj8fonE3N3QKzRra+Tun5U4DrXpmSX9z/oMun4LsZX9q+h
	InQ4+1qLENTVDoTqq+NFBPoRCHU+56TUWp9m+AD2zbvbz3wV60+4nqCSFYICgllY+eGh9Rqkd2O
	s6bWwe3d7gJMBEvKMkcZ8LlQgm+EUbo7eQ==
X-Google-Smtp-Source: AGHT+IH7mMmANEtv9UjLqYnQtwGVN5We8jsLjt4b4Ofw6oPqgB40wgvTP4hyUbeyjYfi5JsWfn4HGA==
X-Received: by 2002:a5d:64c3:0:b0:39c:dcc:f589 with SMTP id ffacd0b85a97d-3a06cf5edf1mr1489824f8f.20.1745483743092;
        Thu, 24 Apr 2025 01:35:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] pinctrl: convert GPIO chips to using new value
 setters - part 2 for v6.16
Date: Thu, 24 Apr 2025 10:35:23 +0200
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMv3CWgC/x3MQQqEMAwAwK9IzhuoscquX1k8SI0akBrSIoL4d
 4vHucwFiU04QV9dYHxIkj0W1J8KwjrGhVGmYiBHrfPkcVHZwyqKiTPagSoxZNtQR8uEvpm9o27
 6cfOFcqjxLOf7/4f7fgAp06BjbwAAAA==
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2167;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GKznQfl3JNkYy5vmo0PNTYM2muY2yQRrhtqXia3AHFA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffXZVbgeHHyBonTI7l0CNbMV3a7nzVuh7Pgd
 tRSd65EsuaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn31wAKCRARpy6gFHHX
 cu6wD/9k01NyVMtAZM1iym82+J1zg/2M7KpPgcj90NcGJu3sdiYORuIKIxHeLA8p/qoO6rtazUg
 OnsrjaAd28Quy2LLhN+yav3xDnqFRhDQxQ32dKFL/wwq3GsGKL5t5fIAQdV4556J8gSyw20nEYv
 rj14oOGWwqIIUPYO9S4Rs5+pypiakwr6CDUOiDThtCkbISTv0lgDWcm8m1U99gSMRWGHWEo4fgM
 vx9wT3GEDlbOFe7qgLKbXoDqFHjfOkIZyBS/OkBBh8QFHv7nOjp7t2ngi7h7rmKLQvZofpZjObD
 DvLv/QC6NRLVyF6OLf7EQvJo6bL5m9ME9v7ULvfBSitrz7jhodX1CHKmC6KxUVgwDrN1iK+bu4N
 H2rguQU6Rgrcyc9u9L4VyQkxCBsd9y/LzoaheFQrNqSIV70KJy3YcsEXfbakAo/ejHH5vKHD6o1
 0av7LySBUK0F6wWazNJeq2gWANIZYv5aGnpRyGtEl709spGfrRTp8nhybNbuuRVgWNIdYgYFb8N
 i4g4cUqjN5yT4nIj88n7QM0tduE0Dn6nEjV+AewLUYbPmNvZ7d7xeKWwwtgL03HsiKsVYDelAsS
 gXHsxJ2GDeefk3dCEwJLnFib9SSsKKlpLzV4hI97af4of0i49uE3e4GW8ofqXlW/gKNVfcDwuVy
 4WrMOOmwjydrMXA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
the another round of pinctrl GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      pinctrl: amd: use new GPIO line value setter callbacks
      pinctrl: axp209: use new GPIO line value setter callbacks
      pinctrl: stmfx: use new GPIO line value setter callbacks
      pinctrl: owl: use new GPIO line value setter callbacks
      pinctrl: stm32: use new GPIO line value setter callbacks
      pinctrl: ingenic: use new GPIO line value setter callbacks
      pinctrl: microchip-sgpio: use new GPIO line value setter callbacks
      pinctrl: at91: allow building the module with COMPILE_TEST=y
      pinctrl: at91: use new GPIO line value setter callbacks
      pinctrl: armada-37xx: use new GPIO line value setter callbacks
      pinctrl: pistachio: use new GPIO line value setter callbacks
      pinctrl: samsung: use new GPIO line value setter callbacks

 drivers/pinctrl/Kconfig                     |  3 +--
 drivers/pinctrl/actions/pinctrl-owl.c       |  8 +++++---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 13 +++++--------
 drivers/pinctrl/pinctrl-amd.c               |  7 +++++--
 drivers/pinctrl/pinctrl-at91.c              | 15 +++++++++------
 drivers/pinctrl/pinctrl-axp209.c            | 29 +++++++++++++----------------
 drivers/pinctrl/pinctrl-ingenic.c           |  8 +++++---
 drivers/pinctrl/pinctrl-microchip-sgpio.c   |  8 ++++----
 drivers/pinctrl/pinctrl-pistachio.c         |  8 +++++---
 drivers/pinctrl/pinctrl-stmfx.c             | 13 ++++++++-----
 drivers/pinctrl/samsung/pinctrl-samsung.c   | 13 +++++++++----
 drivers/pinctrl/stm32/pinctrl-stm32.c       |  7 +++++--
 12 files changed, 74 insertions(+), 58 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250424-gpiochip-set-rv-pinctrl-part2-43f4026d9e38

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


