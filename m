Return-Path: <linux-mips+bounces-11175-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1513CB50EE1
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 09:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A33C3547BB3
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 07:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804E530AD14;
	Wed, 10 Sep 2025 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iy+SSqxr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D20307AD6
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 07:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488376; cv=none; b=lJawsVzjRB/BS9eszR/sNOpEt0JM2VlZsbFtvOCBM0smW4VYSShVoI5230+XfAoeQnGpctOTJwfYdKPBgiI84j7qVNJGaG/FFyPYauEvJR2OlXvqTtByRUVzzE/1BjbpGa8Q9Ir0tfvHtyfPe8AnkCMhVIIQVA3++pI/ZAM1MCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488376; c=relaxed/simple;
	bh=d9yyY3lRi0oWGFXJAFBO1adyvJFMOKukPKPljQ/13DM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=URvAlMsKAPccNn4FUg4hcEpbPnk2arIDxH34+eZMh7yONTeGDNUroAiJXhAAUwjjQsaHUTmiHQLwd7ZIq+pCh0P9meyCVxq2V21Be9CRk7Y+aw02Ar7z1p2cA5R8QfieZ3+WZqRDdVMhlfnKhhdSb8FnOJoXM2bwOowPgy/YuQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iy+SSqxr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so60389675e9.1
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 00:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488372; x=1758093172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=;
        b=iy+SSqxrTe3NTT8ktJLacewy16iR03HyXPhSB0QR7BBGDtqq9hqCzW4zZFvKmCNSXi
         eJhC77Jaw+8kvZaDmA2SPYwucYOXnE4yd2QoiFkjKIA3XKwzrzNxVWoiHs8NkuG7iVk2
         GDhh/Egngy5sXJKphvpCNPFjBojJ8oaPU69G4EQPh+zrrNDvU7yYXTBuEnw07+7O7uqO
         E28+r/phBV3j33fLbkNgHXR2ToC7uquUY26smZ+CGOsLZHq287UmRSTmnoUaOXzwc0Wm
         ltsILfzK/Da4wWJIss4o8Yb28LVoWt0k+nguCsjI+78RQEqfhlRKM49yNNrLz8yb39c7
         7eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488372; x=1758093172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=;
        b=vJkygSWg7/uZSxeMIPGjFtknMhrpiPP4T70h3+0S4odxhvKpwO1CFomAkyGhlBjzH0
         sn1XdtqArWmFKA6drES4ehS3vHtNkssa0evVqV2NwRUOrAPtmBTxY6D5N/nB5vfiCdXq
         hbz7Uvm3ak66pKptYKI23LKYj+gAp2CQgkTVuLLAmwTbc+1iWSovzqueBV6GA5SYEOu1
         uJxuZjORu9jxI6nATjavNpELFBxvrwMyO6r0JDgV9YkbHaUdqlowJlD0sNA4p7vveCUl
         BQD8syjbgHvJeEA3y5BoBOJHkLpgNGC3Renqt5EdWEHGAM9Y4q4Pdv2W6SxMhPNuyaNM
         cwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQuV+I0Q8H0wWwNzW7u0Hz1w1qG8S/J7fSXxgq++IQr81OFSzMP+Gc4uGTc0BmPA+gtfaMi2Sjh8vq@vger.kernel.org
X-Gm-Message-State: AOJu0YyfgTHFNOTjsjmDzMsA9kggKxeuXvJO5uTR2cQQoGqNNKio3/Mt
	O6ICGxr1ecwI0nENwHBFEJv0gbdDfryOIJoRSg617juEtBXOhNDC8xusRRYSzgcz1YY=
X-Gm-Gg: ASbGnct4q6BQ7uAn9MghSx7WqvjZ5BQbPTagpT9h0yH1H8Ul4OMVsHsbsgekEOJAZKP
	k9pzBbqF911KS/1nqTUrt+lfXHhDskJ/ed9im17e8KqzBj71B5AvBvL643TPRpMEnP5DrQ70E15
	kq36gsOgqCH3S+T7kexOWK8WlXC01bJVx6WTIG4i4/0+6b72/J39v/Jun/gfcRtF2yA7fPCo55x
	3nS9YaoCASrg6eOCov++osX1JtjBZczjaFrABIQIjgg4zg6xRCRhzzmqyAWjsua2nTvRckAVIok
	AFWAiZogNIsx1y0/bcSM5GtVS386NbT1SfTxal0xw76i0A4SzZPDeDTBmWl6gnRfC8e3hpWOrnv
	56YbtbzIeDZVtxlsD
X-Google-Smtp-Source: AGHT+IEKdyheRTbxpZeobOaj/kiQcyqSdEjwXl91ot4Pp3gVY+W0lJCPHtV2Imjqq20EGU/uJIPCgg==
X-Received: by 2002:a05:600c:3103:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-45dddeeaa9emr137392025e9.31.1757488371739;
        Wed, 10 Sep 2025 00:12:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:12:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:37 +0200
Subject: [PATCH v2 01/15] gpio: loongson1: allow building the module with
 COMPILE_TEST enabled
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-1-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=739;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iZ4PlFFkHvr3VSD1LivXtszs5JdORDU8d2OKjqzKoYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTsAuSSpb/N/lpm/J9TyMpn18U4V/mrLLrDe
 Nb4aV9WcKKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7AAKCRARpy6gFHHX
 coJID/9hXOYitzKUXEqsQTqE5rBhujI/Occo7tHWgfIzIoAYIrcKEjGZOM/F/dZQvTTO3crZcoi
 suPbR7zuB+Jwaigt114BA9+7sQ/fsomvdtZfhpDTuvsoC2hy+nvFaqVB3/AbtBU/Nm++6/6lC/N
 I3tHd2uMu6qHDBuZBcppNKNG4SbEq0JKpYwTu+MnLMEwtc0N+6h53H/41eGbZq5dZPBZO1Rs1UR
 DnsfU3NyzIvVPnS/UCPKV9yNJQLf+rM4PJxRp8cAsk8sEbncOdYImG/068XM06CPN+DGmmXrkGA
 fYhey5N4vrqvCWZh8TxID78/CdJfbkmeFDRgMDyP3mhtvARDEKEA+AKrlDBZHa0RpwxBbvvWCho
 gvUvkB9GZhfkiX2JmGAZIOs2nOEWqUor9AfytBA2we9xDvE13Ah2As+XI7cozQfLrc458cUOiA/
 PnhYb3BR9BG5uQD8C9Nard7cUzzMB65mag1/chlPkkKo3QnsuHfH4DibdeO3gne/qRwL3RvcyVA
 h4K4xVvknUUR3yUuq93JVa8I5Ld6yvsffOcFkmBa9Dig+3SRyhmk6pO1BvmfiVLl5SBTRO+1oQ5
 T2/6+Bnqw+ctTLXI3lmM5qPef07X9J86lhVm1+uhfTnzHoCWhndRZdVqNsXDBDWTKhjK4nd6OrJ
 h0UFM4WxGx3TqIg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Increase build coverage by allowing the module to be built with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 31f8bab4b09df1640c892f4d839860edaa2ad6a3..09cb144f076661e0a2069016175d0692257fb156 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -885,7 +885,7 @@ config GPIO_ZYNQMP_MODEPIN
 
 config GPIO_LOONGSON1
 	tristate "Loongson1 GPIO support"
-	depends on MACH_LOONGSON32
+	depends on MACH_LOONGSON32 || COMPILE_TEST
 	select GPIO_GENERIC
 	help
 	  Say Y or M here to support GPIO on Loongson1 SoCs.

-- 
2.48.1


