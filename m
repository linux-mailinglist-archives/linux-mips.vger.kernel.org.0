Return-Path: <linux-mips+bounces-9253-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A37AD5608
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 14:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 304943A5096
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 12:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE25F283144;
	Wed, 11 Jun 2025 12:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XBQApjA9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B439D28314A
	for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 12:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646459; cv=none; b=I3jQokPY/GjvYEW1Or8L6OFe7jwJswh1c0BpRqsj3b4BkdjQzQvwVk4RSPJl4ldf0g8VYKhZC4TgfimL70FdFYtjmgkTCFn1Xl8agbfoDWV5Ykqr+vbdGNPgwYrDCKoFrGzdRAeGYJLxA3G17wQ7G662SCR5XXAQpU99rs5YRbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646459; c=relaxed/simple;
	bh=MwCg4L2h46PDOS0g7q2n/0TFp7dWTy5pPJdpMQqZbyo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MfSSVv8447b2ZS01ZK0zEMjRopNYWYLeQheYkBv7Xh4yfJ+Qw3GifSqGPkLm5JMY3xTF7fEZEMsYHW2jwOfn8cd6RO3hTJlH8AK/N0yI8Ug08aTXv7nYv5MHn5ZQDGnm47M5tBzmksY1bID2VRzC1ZuTZsp3NhLECyAmVnUacd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XBQApjA9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f379662cso5444321f8f.0
        for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646455; x=1750251255; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3hcVPfIPjKgnN/jxAK+0iuHy/Mp3frsm9eTH/rmctjg=;
        b=XBQApjA9RekG+xDMVRNFPp2xNja5Up/nP/YwFZRyqyXHHjF9i7dZWni7ctlNg1adR1
         j7KLLjS8rkziSQHvNl2S2dXMYvZdhmzb+52lxj5ybkpouwLpVrhheHi+ZQ4JxRNAxEq5
         evTWdkZ0zEwR7Ta2IKeAUFAI0RrZA/EUjKUTNE5vkpK55/woE4eIB+QRRny/DYPpe36r
         shDhpQ1+dVY0o0tURicTe6MH207nydo339rRWXk0uG06vK3NJH7kwap8vTq8jiD6g+dY
         cr29Q7Q0XSdRqq8broFa01XaR6Gf4mT86Xo5TpWyPrlwwlx3B7OhTgyfT0txU4NXyhwt
         OiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646455; x=1750251255;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hcVPfIPjKgnN/jxAK+0iuHy/Mp3frsm9eTH/rmctjg=;
        b=pcQ1sG0id6/TIhP9l1c7HjeETIEReZ9rWJZQ/enax/oJ+i5IobO3hLiezstfIfEvHh
         lG/ph7eI3TGheWCsIh1lfS4u1V8xdp4mu7X8ZLr+ECWFnydwMQmEM4K6NCuljH+ZZoX9
         HLbQJRNdAexj4yrsP6vy7NyYzc9qIKJ5q45tnFCPJJeS+WQOYfx6yJhY4Sqe5eiv5mRN
         z5pEfx2nmJXJY1agq+Kfg73qNjguXFbO6pVYdMOEsk5ZyBKaws0+AhKbFue3kn8dJPZk
         RHRH4rPzbAr3ay98g0tgjspy099AIDtu5qj9t3BPtjE24/VTEODJjTBRoVEbnexPaHDs
         jYrg==
X-Gm-Message-State: AOJu0YyS9ylit2Zqf0yyJLyQVTxu6D39cANnumJK6Kvc3xwayzDkewiS
	d5Wkv4clRAW3Ks6nvFyJjAj2dYVPuLW/bNeCz811A/4ryVstieejF8luCXfMeqAI5Z0=
X-Gm-Gg: ASbGncs/l59/6GPBvMj1rFqtTJy+fZqunM+2xDkDwsaxGp7jfgWwbNqwdsWMXBnKkCJ
	0uV1ETeftBi7UAxl1lG3sjJnKa95ofQ1RiP+FsiIF8QRfbEdw+4Nxr8cLpWaMDfphYbna1XtZIc
	3WBUXU58DDhpaqFhOp1zvXTxipjZ3762bU2NneWskhj1l4A4QCEkfsfzaFIKfClCTbDcS3b7iE8
	EJHee9hhSbF0Dv5H/jT1QmehY1XPbCYUhL3LexN/YP19uDEETTo9EJbHCvBw0DivqjshWikLrH9
	Ftq8y7SYoL8qU14JmDhBxHuOsasfaW+YtzszuZYqsiPwHigkIDs1ev660pxfL/dO1pI5K+5Da7N
	f
X-Google-Smtp-Source: AGHT+IGrOsdxa4zJCbGnTi4fEsX+7CHAps/JT+rDRqNsXkWOF1cXauuh0d8YfM1q6aZsNyF7ST0Luw==
X-Received: by 2002:a05:6000:1448:b0:3a4:f52d:8b11 with SMTP id ffacd0b85a97d-3a5586f1905mr2571117f8f.20.1749646454734;
        Wed, 11 Jun 2025 05:54:14 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/4] clk: use the auxiliary device creation helper
Date: Wed, 11 Jun 2025 14:53:55 +0200
Message-Id: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGN8SWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ND3eScbN3E0gpdA0tDs1QDMwvLJMM0JaDqgqLUtMwKsEnRsbW1AFE
 JXr9ZAAAA
X-Change-ID: 20250611-clk-aux-0916e0689b1f
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=MwCg4L2h46PDOS0g7q2n/0TFp7dWTy5pPJdpMQqZbyo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXxt57wn6gj2MMaDJqXctxiVe/tEY4F+6WgSm
 BnehdmmFCqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8bQAKCRDm/A8cN/La
 hV6kD/4mGMjR2Csvf4Ac7+0h9kIkcrt+1BCIsyu7vwlVO5wjBbzWtmF7BE6DQqByhYj1kk2WBcj
 y167kxXU9BFQ41uDY1MCnyPCp3WYUj3c+RR93vorROw+S1ly382yPWEBrE8uhY+rHiiBTrdOwsI
 h/SJbofzfUdCnCYA1Nzj8mbOnR/F0Le8LFdXtcHEjXvHu7tq9YJg64XwjXCQ1NBndkGclowoBQ1
 YXn9L/WM6qXhVilWbeMq4pDMMoE2EKP7gIuj93iNbtuHqqSyTPTJBCbrYCXSVaJ8KOwKRzf/4S9
 KoiKe+nPFlHxM7fCBW65F/BrfxwBqjPhp7epi9iZvqIFg7OlDW69nCy+UogWg1lb62tAIA5lEjT
 kf+omgPU5kR9UgjbG34eKbe30yHput+jherUVzyWZAWJENmL3uEOt4BoTV45navcvdaIBPdJ96W
 8qq8vlmjdnwPqPZDOBj6/tPBre4GYpgxDIwrhlwRiqTrxRKlHe0V8yGGewu5ARh3Zu6oTVZrRCv
 pPJr05s++w6148vJUMNhFcTkuyQpIKBg7Ca+Qyt2Bh0YxKw3m+KF3YCU6Lr14zr6RmYPD1S8pVv
 0+xW+vylPjCd8KSajuG7qkmLX2dzHXoY2NDlPGSG6DcicgVxfEMbtP7apQ358uzjYH1c6uSy0mn
 RNqdkBmE81/FQ+Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This series is essentially a resend of the clock related changes of this
series [1] sent a few months ago.

The necessary auxiliary bus support has now been merged with
v6.16-rc1, so this change should be safe to apply.

I've included the reset change from Theo. It has been reviewed by Philipp
and it is probably best if it can go along the eyeq clock change to avoid a
WARN() in reset.

[1]: https://lore.kernel.org/r/20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (3):
      clk: eyeq: use the auxiliary device creation helper
      clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
      clk: amlogic: axg-audio: use the auxiliary reset driver

Théo Lebrun (1):
      reset: eyeq: drop device_set_of_node_from_dev() done by parent

 drivers/clk/clk-eyeq.c                |  57 ++++-------------
 drivers/clk/imx/clk-imx8mp-audiomix.c |  49 +++------------
 drivers/clk/meson/Kconfig             |   3 +-
 drivers/clk/meson/axg-audio.c         | 114 ++++------------------------------
 drivers/reset/reset-eyeq.c            |  13 +---
 5 files changed, 37 insertions(+), 199 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250611-clk-aux-0916e0689b1f

Best regards,
-- 
Jerome


