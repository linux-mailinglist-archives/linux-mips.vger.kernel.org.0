Return-Path: <linux-mips+bounces-11124-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21485B4A7B0
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 11:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F8724E7FC0
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 09:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0162D6E75;
	Tue,  9 Sep 2025 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lqlBWBv1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841FA2D6E59
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409347; cv=none; b=Hp350izTQL3miuBnQvBtxs9uDbDEzDnBosEmJ4VnwlcZmj4m1I4srIVtTxjUBNafOiurZF2d/2SvQRHDQ3B0z7v9KeSQ+2TIU3fm8iDEVM/hcEbe7he2XWD0IJnm8gGDLL3yO6HLwvuUCY7GxlFivLP0IOgYPuRmguES5TPYwwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409347; c=relaxed/simple;
	bh=d9yyY3lRi0oWGFXJAFBO1adyvJFMOKukPKPljQ/13DM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMCjw9ogxGD7vjYwUXbITGJdgOmvLAkifjSxfLtLabR+L4yBmncczGFqPMf9nznvg3EL5Pg8P/E2NZoKBE6uxwnuIZH6UMM0Z2OLjRzdqWw2HCz23DupKhEMeVHp0547N1z5dCRVX7v/ZY854PejtGIy7E8hO1rtpMTOVq8L6vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lqlBWBv1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso45581125e9.1
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 02:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409344; x=1758014144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=;
        b=lqlBWBv1L7N0PHQCf1i/IPLVse4cDhFh7VXSiJBIviUyhtgS89LzQ+ntNWlsdNTD1s
         rYEHeZtOrlNvCDHDmJhi9aP8r99QLtm5RJ/kTwDC+EadpOTupXCwr5ExdilTNS/yKDvq
         MRcOgdRgwKlmokO72DH5VES5SkIATkfmFAOH64Hmjed14i7GoT6AA6jPN2sZ/VFkNVw/
         9j40PaMhG+iXrLgQ1W8WFput7uFH3q7ZKALXhSf/IDobiMNSVWP/CVrwMWyT5zlESE50
         zOv9Yt81ZuL/xN4rvrnnRp/X4bz4+8241+M+IqklEDOAZZjBPBLGNryWxIzb/iXWO8ks
         jAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409344; x=1758014144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=;
        b=N33YwI1TIa+ctLvmWm8gYYLc4TzYnfzB8ByJ1+xsDSv6a0F1G8Vx82MhCCQqz/AAYp
         LeegtgpOzf7S47McwO8wmqyP/fWYrIQJp2r7haowP9+N6F2KMvNzwUoW/xJfGljY4cDv
         cZQRIM1lKUA5ds54AmfpRFktFeo35yjFCYQTIpf8t/HdI0JWhgY1ntBNbvV1vS/3eHVh
         CcLyx7V4xrlP588jKcvDmsm1ZkqZlMMrgNd2lhFpJd+BsuzAh9fVkk/h9nEIPUv3haAD
         3uAUhRZGx8fUVGdLeGSgZnJZj98cnE1he4W2c5iWwC+3fpasTbw1GvZBGImfFdpbW2+4
         OOtA==
X-Forwarded-Encrypted: i=1; AJvYcCWa1xIbBqfc+120//zKkLA0XROWi5HSIH6gYiWUYOtdH/8UdiPx/etTZwUqd5ujNwVk6ASziM86X/+P@vger.kernel.org
X-Gm-Message-State: AOJu0YxQZu5qC3ez1fjKDI8mWvb+AJpkPkZWMYDCuLv/uYc2S3s38OWJ
	NRQ/5yBDfXxFKd/4CU8wm/wcjoIzCQzMajwf6DDx/GecL7mamNZeOjV0RzZ2tKO5Ppc=
X-Gm-Gg: ASbGnctWYVrHFpKpljPoZ1wOYkuQCTAVRcUO4fnkn7fUaacSL0dmDLno826eCaxNA3E
	wGROLiqyVsVd6pXRTwW94VNHXKJbDgityy70jZ45wvHnjFsda+0MFULgGj3ExVcx257ckQAwahI
	H9gvEyR1S9HkCgp+7Xk6VKKWpT7zOtn+T2AIiFPnhunnA2VChNk7Ewg1nCYMbcqltQUnb3jYyys
	uSHvGmV5cY2dTt7IkS73bUBst1sYOCvUVyNloStDSI3E8NfCGcU9CIyvQoU8jkJgHmmWwpfkgZT
	zCmn5kOCx63p5LXYKLlIdRf3e/Si+Tv9EL6l7p6errB8/L0zIazeJ7BAJSJ6d4V3kKpDdhlrdb5
	h2OaNJUAYjDHsA5NONw==
X-Google-Smtp-Source: AGHT+IECDvyJ3MhP86HfNBVWgMSE9naIJTJZ0ycY5JDb9n5YXZLF4Z2JGvdK2tqbA8o20swd57M3IQ==
X-Received: by 2002:a05:6000:40c9:b0:3e4:bec8:dcd3 with SMTP id ffacd0b85a97d-3e64c1c2d59mr10736450f8f.42.1757409343760;
        Tue, 09 Sep 2025 02:15:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:28 +0200
Subject: [PATCH 01/15] gpio: loongson1: allow building the module with
 COMPILE_TEST enabled
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-1-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A2X122vy1cTHyhSgsG7MkIlsciNRM8ZFaAn
 T0KGuq7L2KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wNgAKCRARpy6gFHHX
 coJPD/sF2yokXt5SbcL4IYbnNJAAMtC0yciCVu9NMg4HOIEJbnJLMgoDU6f/Lye1GJHoJd/r8bg
 psxEzWVypKMAKXC2sb+CSVVktqi2LrWPd8WvjbD1w2ncKGKzuoVyrAB92tWBa1NfLh3OHEC0/ku
 wXBtt25qo0HmUF1tPPNUvjxgq2bP9TIbQyvUarSxnG1iQ43oZqiFep6k+G/aSkGV/eXl9TU97AV
 RiQxqO1JzL7fY/XVn+T589yE1pLjj+axt8MR7YyrZIyTlTCZzpRhxzrT5TOcFcBXyrdQuaK4G8S
 JvZcqp69ousBbMjF2RCkf6zj9stt/FPHhc+NIVzaO/+3Sa8+ozpD12cukCkwRGN1QLu8gIdG3B+
 7GobaI7NpSdG8YFEC2lE+CIWQTVJpeopaa/MVfsBLom8dXS1rNZSHXTXXExOTkQne5Y8oRI54bO
 dSblAGdXRavGi6h4oh3itiTfoSZ4M2+tv/WBS0fg0FbvwFAs4Zzw6lqS5iigmBx328VHt10DT4d
 p3OpeS4s1QtcpZmXPa9n3iQz4eK+u7bsgZALZlItLZr+caxJ/Q5lFLxgMJeqxzV4cHRROk2u17y
 qsz/m/yy5OZlZLgQ7uwBNunQYNBtvrqCQsCUhjR2JYSvEf0IrCHidjQP2VNeU9r0zEuIV4zBpsJ
 WMI3XWLHsq/gdow==
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


