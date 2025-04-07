Return-Path: <linux-mips+bounces-8499-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B5EA7D616
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 09:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92DBC1661E8
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 07:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7B6226CF1;
	Mon,  7 Apr 2025 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="n1iHeEpe"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACA9224AFB
	for <linux-mips@vger.kernel.org>; Mon,  7 Apr 2025 07:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010717; cv=none; b=hXQGl3/5ng79TpRv5MQvWjRncHSsb7a82Dean93wp7l2zwqVEyirTS1y3grdIfXPLHvYbEHmTc6sSCdq1VLDGfe8ZGiQS0HT8NwgtJidnr/78GOpv/YbdM2ZeAJ6ko9W+HEibhuM3Siudl9AFv5qt5ATchjMYY83+NjvSkBT6C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010717; c=relaxed/simple;
	bh=w+tJ66+vAfAQ+tVf+KdsfAATk1FBtE4KQuBCKJPozTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YpvvwMHTpRUH6z8wYMQvJV7DZ8T/tC1jg5CI0nYBSc5fekujeEeETohVeHZtU/AAk2FCTkWRMllNSDzPENMDyubsmWHRLUnRrAMMooM5e2H39RRXgUjsND88M/1bRtM94o75canL2fMQr0gjck4SGl5pqYk4DxUnap6wRRWY2PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=n1iHeEpe; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3914a5def6bso2237599f8f.1
        for <linux-mips@vger.kernel.org>; Mon, 07 Apr 2025 00:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010714; x=1744615514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bH0zQFfwtV2yBLh01F91GT0vxYLchektN/rR3xpyT0=;
        b=n1iHeEpeAFaI52bNgTTP7f5OIZ5iP/fOpUuSayiPMdADgiwbzQOJ9jZrhmHYLIJPJO
         QhSIPjk0rlaXMGH6lTZ0aDVlRcGPONzK6U1e23n0Iz3sK0VFKJ3GLzfUT7/aUjboQYdn
         o0XLJGLIWecEK/jHzfnQ4UgX4QsKF9JHQecYuAMQ7NUvU1KEjOzGnCMcGnwGP7cy+Fwz
         XVjFgTJfLGUlSRPwsWxw2QtjDYDS+2NdQnTz/qkLpICDXoGhSc9VGz2q1oQ1cu3EC6zU
         Vr2KMwNMS8QNn/DzCLRy3O+QX3uRQAmal5lKz8mNbA/Bnt2nbQYdKNFgrAljSgZeeDPk
         dMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010714; x=1744615514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bH0zQFfwtV2yBLh01F91GT0vxYLchektN/rR3xpyT0=;
        b=aqA5R2cBotoP/vlf4plnqDK0Sr+6CPfKaTOSe3hkh6vnqdpKbwcm9yt7sNLd5FO/bZ
         +W+YM23mMk0BsgElJKYnsBPzlBVm5BcZ8YSsOoFAUqoaMaDlmdWT+k/862ASCVaeP7QS
         pwg3/hip7bE9zYzsKrn796k/ptM5CdIw9yUz5RFcIrWSiyzucTBVoj/lbgCG4tcRDbqi
         dUrZf5Lz9wP/xSivldz4AZGOrCVdyDRiAGoJgjb+mZQ1FNaUZ4ECHsRLvkQmhJKe9BbW
         HDkL4MF7SJui2+c2Nzk33sJA5E0h/5eENVouMhlsMbdwU1+QUx2P1d2Os6moBiVwnHNI
         qBJQ==
X-Gm-Message-State: AOJu0Yzg9+bQz69DxcFvScnsz55e05Ky6K2cxmWD8eXATT2ocAjqoHCw
	NGIH9PKpC/3VAeRzONLTpdVp9GeKiQxdnqEFw3R0lJswucPqiyPNDleEJPtjwBI=
X-Gm-Gg: ASbGncsjL+4PvHx9P6/8X+4RJ/br5Z94J4j2OXUzH+1pIgxwkxMbZuLUjT9IGxyRzsH
	gXtX0YRsX2EstqKBkU2/wWtOdsBih7r/nJKBP5uaKGfxEzyI2zwdjpGW7LszbpHnsSZUKBszGFQ
	0BSgzE4d9fnUMc9ukZBgZIdc8lsw9FtDoDrYKSH++KgnzpXLFYC7tg9akQBrxp8QlDT3DFhLQfU
	MOjZtP9RrVMn7dj82H6oRg/Q5rw48zswK0AwGp4qCqZ62qIK32M4oYY02/jqHF7UUmWxNuOThse
	D4O7hBAvLCOUMiJ3vxFPNQ8TjVp2Ww3bS/6liQ==
X-Google-Smtp-Source: AGHT+IECaJqQG8cK6lzmXq/pB670TfbTOlyo+fEdVDsc/4UrKZpeVkgsZWPV/XbPn3+jHmmTbMF11w==
X-Received: by 2002:a05:6000:18a2:b0:39c:13fa:80b with SMTP id ffacd0b85a97d-39cb3575987mr9210700f8f.12.1744010713777;
        Mon, 07 Apr 2025 00:25:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b760bsm11303051f8f.55.2025.04.07.00.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:25:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:25:08 +0200
Subject: [PATCH 2/4] MIPS: bcm63xx: gpio: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-mips-v1-2-e7f74a4eee2b@linaro.org>
References: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1415;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=A7tdOeOH4ZxC2K1ChcZa4zkS6T3epe5y/43sqo2zGIg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn833WfABveaA0YaYrFM6n710xpzptZ+knu0gyp
 HGC6NQL8EuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N91gAKCRARpy6gFHHX
 cpS3D/48aRmSYhrdU15Z0RDoNkh4YGbQqA3sGZbJAWXKpACQdlLi5N4D0znB5ZLtNqHOCSHVw1x
 g7RZdW1SenYQGMg3YZ7gJMkVBmV9pZscM5Vdx+q9VsehM/Ryokb+ZeFuthIcyWdJvl9L97UULrl
 +ThU9ymEpULPqWMlYAXvo5MV4qE7cZJZu2w38iEG/j76WGn9my30iUZ6AvfKL+LHhVxZFeQ/nZ6
 DrQWBXBrMj2HrZ1Ml2xWtnN+j9//tcKhJPHBUKulRuPrvZ0EJA0NsGUjKMfqWP9Tne4zYjQlZ8x
 tbT568xyqL920QF0VYIPDLQyC5lZKZ4vyVXGkTrrH2LM712oogfy89hUZlqmsr5A7rR6FW09XGu
 bgSgnyAB5DDhy6oSkofhxeNXrIWutsV1Go8FobeLXctZJic7Y475oLy+TFm0DywTE8QjreHhVA1
 eh9UTNKQ2slbzaEC1lyrjKN4Rnc/grShk3TwacigUJp48inaJUOMF+C/ONITyUGkMKj66iBzCJh
 FE662LQWz/LaC/C2g5WccgDEmeFrTcDBOl4vQzE8kvzyD8ErgMqopqSN1ZCs2Ekrwi74yHD+twD
 rQFW6DJDyeooB8xKVePWtg7OCHgWvD3Oa+4d9cxJS5vWeSSZ7388TO2jVucL8wZJ6qzt1RauAOG
 1U6hW8PUXcRL+zA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/mips/bcm63xx/gpio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/mips/bcm63xx/gpio.c b/arch/mips/bcm63xx/gpio.c
index 5c4a233db55f..e7a53cd0dec5 100644
--- a/arch/mips/bcm63xx/gpio.c
+++ b/arch/mips/bcm63xx/gpio.c
@@ -35,8 +35,7 @@ static void bcm63xx_gpio_out_low_reg_init(void)
 static DEFINE_SPINLOCK(bcm63xx_gpio_lock);
 static u32 gpio_out_low, gpio_out_high;
 
-static void bcm63xx_gpio_set(struct gpio_chip *chip,
-			     unsigned gpio, int val)
+static int bcm63xx_gpio_set(struct gpio_chip *chip, unsigned int gpio, int val)
 {
 	u32 reg;
 	u32 mask;
@@ -62,6 +61,8 @@ static void bcm63xx_gpio_set(struct gpio_chip *chip,
 		*v &= ~mask;
 	bcm_gpio_writel(*v, reg);
 	spin_unlock_irqrestore(&bcm63xx_gpio_lock, flags);
+
+	return 0;
 }
 
 static int bcm63xx_gpio_get(struct gpio_chip *chip, unsigned gpio)
@@ -130,7 +131,7 @@ static struct gpio_chip bcm63xx_gpio_chip = {
 	.direction_input	= bcm63xx_gpio_direction_input,
 	.direction_output	= bcm63xx_gpio_direction_output,
 	.get			= bcm63xx_gpio_get,
-	.set			= bcm63xx_gpio_set,
+	.set_rv			= bcm63xx_gpio_set,
 	.base			= 0,
 };
 

-- 
2.45.2


