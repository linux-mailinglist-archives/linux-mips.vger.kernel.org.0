Return-Path: <linux-mips+bounces-8497-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0202CA7D615
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 09:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE885165DAF
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 07:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4EA7FBD6;
	Mon,  7 Apr 2025 07:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AOXZ+Vof"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97320224AFB
	for <linux-mips@vger.kernel.org>; Mon,  7 Apr 2025 07:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010715; cv=none; b=Gmz6/90gYaE07xP90hw6w9VNdhGSaq6x+Ea83zplHEpvbNx9eyAiLMOVL/QVuQmSSe1fTmAaFsQq7nGy1h4Q78mq6p56KckxkTpteVDciL6P7P7SiGkPaXv9XeJMHntaNelrWDe7SeKA8wd+w9hAF/C9xSywIbHhHWKLhlpHc3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010715; c=relaxed/simple;
	bh=ycFdXlFX2Ifhu/veSKJJ+51L35rshG5hTgbgwoD9cIc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WJm6v9HaXbTil9j0ifyxNkGB0fkchgyIho2XmgxJ6QoFqOwkiJYekDyl+Qp1oFegwEulpWF5esGUFGUi57GlpF5isR9MxiDCx1OEqbrMQaxucg64CvtWXskLak0bsqbu2FfAUMl9kvtorDKh8KZNCePb1ViCoGlgsglrDNmWmz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AOXZ+Vof; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so19134755e9.3
        for <linux-mips@vger.kernel.org>; Mon, 07 Apr 2025 00:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010712; x=1744615512; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AY0gaCvzsQoOmdT4FoXtHo5DdK8nDayf2ktX4ZMPAcQ=;
        b=AOXZ+VofCPOkORh4ett93lLhzaEZf2570DRJiUydW0x1myMECfanPXb5mOM2bX4Gvb
         zCIToFpAIujJ5vZNWjPqMyvwQI/3v/4ECYYI9z4lVMF+wn+WqqhSDA208tqzJIBGEyRp
         xHlMMTeCBEnc/UEGq9T5Hc24NpmKzLXhNGlifye+l7AuFoQi2yKu7v5DL9mJ0r26bwrJ
         E7anDvRiVgEgAhXeVNx6KR6BYcKg4zUER7jvoDN2cJx5h95yGUibr4GgPIp9Dr8j5n8t
         4moE3pc4Q0guB8LszyUML3R3aZD/xsaTf+N+zLjf+jY8/1CTUnuDoJDvTbL6d1V60wet
         7ZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010712; x=1744615512;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AY0gaCvzsQoOmdT4FoXtHo5DdK8nDayf2ktX4ZMPAcQ=;
        b=GVOva2aktcZUnxzscSwb3tAdtcHPGvYg+KuSEtHg4+FwySPOLK+ItvPmnZB6/jPxGm
         8WH4oDFfMB7bZXIUHS/eKNZElp1exR5rUrT8l9sGeTyaMt1lxrR8CN5VsBRvJ+qVpqxT
         pWSHDUljpS681f8EZlfGjcWoeRbhN5mLlgiPWcU8WO8movO/b88eySn5ZuyX1u1lqDr8
         fUfMsYraDVDAts0JH9yxED+QF3FtZW+28CBDXvA6G3xg6IDgV5Khlfh4Y7sNJccS3git
         SnkLmPeGCJOwaQGzZs8LKc1bxP+DqLhSHqiljnmLkOhEqUFesZB3sJB767S9FLKMOWda
         WkWQ==
X-Gm-Message-State: AOJu0YwE3LKVQdlTFzyWSI699jay7sbi0N/GI6dI/PTjnw9yIbjlIhGS
	k6akbHTSaX9RBu+dtW4tdvC6rs20F1RwYLRTsltHtj80h3uVxyo4xwJ0iPfs874=
X-Gm-Gg: ASbGncsr2a3JmrV6tiOFn4a65Wd910WpX8EpIFtjosAJF0Hn0LnKNMS08Ws6E5R+G65
	6uqsoDndFuPpt45UdQEC9SNYL5P3F7nv740WJ0aKb4smrdY+I/vVI0vBTfj8V2N8jX+Ozs3EHsY
	VOL1po6uXyxtvPjHbNTVqYuquDSxu2eVnGENKSVhTJt0sgQ7NQunQ3Ueq/h7GxPW0dF7/zgKjE/
	ph9DNqVK/bcBEXaHZlq64sIY96DYRuImZelWcufh2ca1XuPG8fwBMBY3aHRbEw3Mf9Kp6UrlJjE
	VaR+nd9j5WXRkq8uxxalCLqcHxgmR9d+nGhwqOCdeRp4g8Sd
X-Google-Smtp-Source: AGHT+IGpCsUGS6+nJ21np3wH2QqJBep7GFz9qssmAbFQhdYX/s2jilKHiUnsdYGfH6+7gk+Mc2diaA==
X-Received: by 2002:a05:600c:8719:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-43ecf9c37e5mr85515745e9.23.1744010712064;
        Mon, 07 Apr 2025 00:25:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b760bsm11303051f8f.55.2025.04.07.00.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:25:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] MIPS: convert board-file GPIO drivers to using new
 value setters
Date: Mon, 07 Apr 2025 09:25:06 +0200
Message-Id: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANJ982cC/x3MPQqAMAxA4atIZgO19Q+vIg5So2ZQQyNFkN7d4
 vgN772gFJgUhuKFQJGVrzOjKgvw+3xuhLxkgzW2Mc7WuAlffmdBpRtDxINFsXbedNR2zvYEOZV
 AKz//dpxS+gCnaP1MZgAAAA==
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ycFdXlFX2Ifhu/veSKJJ+51L35rshG5hTgbgwoD9cIc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn833WXl6CD/CzHFH8MS0o55jkSM+01XZFFLLGu
 m9jD+pgbYGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N91gAKCRARpy6gFHHX
 cgWYEAC8TUWM/Nmp6IXHwMPES4Da2ZVr/QhWx4kxVFLdxz7SOli+EvrfpyNl98t9lS1hMUSyabI
 dhv/ZM6Y+uF2IoHkOzfi4WQoQf3IB0Kv013NFj50PDb+h7PlG4LFLyO7Im2RROhAvZGuyj2i3O4
 Fn5hX60FRYxw4UhhnALT00AcaxH1rQCSxn5/VGnRtFpeVCweDRSrNebdnD3lSkYr1xctok0ZUr1
 vEKGuEZkbwKqkQNqB0WBlzWox++2pvbSPJFsKMR2eMHTsWlKm2Nx6/iQhuA/0itoxBcU4aLtsGt
 j4dZmurh5oGV57awGSTuGys69U2ry2X6gKT4Gy48NkhbqryetG+c+e5CH3KkyLfU0hF2xz/ieWr
 YJzZkkTqhOleSJW9d+RBAbQAtnPsPoFHCJXuxoA0kijlnucuJ2NyeGFnz98akkYH1e9/DCnKzk6
 p1uqu20cWJKE0e1o9VbXeQ4+kuQjNrL2lvngcbMhTFaxUgbmYodjjmrnxQAEaTDQwZS6FPTOkWF
 /0dU0TKwSfKtMfmovBWRiAm62+KI7l0lKTYx+rBTM9ki5QLrwEVNYsaEMhGzensTzRPfdyOsgdO
 mr6r/KBCgAq47uGrqOIBIPAK9jjG+3grZ/gDGyqm1OgaMQABwFvqta29pmWkWE15BXj3hYMFikH
 j4+FXZ0xrTgJYtw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of 
converting all GPIO drivers to using the new API. This series converts 
all MIPS board-file level controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      MIPS: rb532: gpio: use new line value setter callbacks
      MIPS: bcm63xx: gpio: use new line value setter callbacks
      MIPS: alchemy: gpio: use new line value setter callbacks
      MIPS: txx9: gpio: use new line value setter callbacks

 arch/mips/alchemy/common/gpiolib.c | 6 ++++--
 arch/mips/bcm63xx/gpio.c           | 7 ++++---
 arch/mips/kernel/gpio_txx9.c       | 8 +++++---
 arch/mips/rb532/gpio.c             | 8 +++++---
 arch/mips/txx9/generic/setup.c     | 8 +++++---
 5 files changed, 23 insertions(+), 14 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250324-gpiochip-set-rv-mips-43c07e67328e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


