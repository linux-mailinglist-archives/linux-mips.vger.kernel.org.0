Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07001E0194
	for <lists+linux-mips@lfdr.de>; Sun, 24 May 2020 21:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387951AbgEXTAk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 May 2020 15:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387823AbgEXTAj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 24 May 2020 15:00:39 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738F3C061A0E
        for <linux-mips@vger.kernel.org>; Sun, 24 May 2020 12:00:39 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id l11so15284136wru.0
        for <linux-mips@vger.kernel.org>; Sun, 24 May 2020 12:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ZA2/h8zEph3FDQWtHx/9lkBheVX//yyexZs5ql0uy0=;
        b=N6WNVQlFbNbDgZm8jRHCNWNq4UPnJWxCE72/5CiWreqMD3XpHIHOrs19pvpY8mRd4t
         syD+RZT3OIikTjovki4SVFjBcHXBQMgyBprTtw2/em7Xe98JCbBBBAeSaJT3GSn/Zete
         6n811DVKTopwrRCBipXVT2cOFPfC1CvVD28eebB9E/dSGB+zNRXaYVDKZ4kp48W/teZ6
         inEVDhEpDCDgKKjMs0n2ob9TgnTMWbJlOjUe1A0APl9IbO1mA/qSF109GSe9gWpTY5fE
         7Zba5gw6QYBvUFpVTC87dW81gzFTn9cQ0KcaXPAlJfWN0RvqTd7LhLj0CwUHP3WYFO32
         QfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ZA2/h8zEph3FDQWtHx/9lkBheVX//yyexZs5ql0uy0=;
        b=Ocx/nNxgt5579cOhtzOwf6ja6fBvgDPElfPfxfIkXes8n7LNrlcZR8QU2SsAkz8LAS
         kfCc5xOQ4X2o6ou8fBdYIhFd1BAoy+gMR2QJedCq/hjCQxx4UrvgwsLXbXfmQvGgOT3K
         6wGG+u659alHCjbH43FL31IJhgMM9GzYreyYhXGrHm5Hec9efWKhwOoNk+xbP8O1ZiQt
         t0macRfRJtY6VASkQ0h3Vuvk98bSimn2cLKLtqsRmik8ABbXogosVSceVYIxXWLPhOSx
         B31srbqtTJSLyqR5BgjEiSgUOvyvswbmLfafGX8BrJC6eSbM9lca18EgpYUn9CjYzU9q
         Gv1A==
X-Gm-Message-State: AOAM5309aRrMpnOqynCZXC0ONdgck0y7PsYCvAj9BSjqwiTF9fUpIRvK
        JhDYEtdjRLpBvnSbcGpWU80=
X-Google-Smtp-Source: ABdhPJyrQMAqv22b8dbdTW1uEHnbRZDTalsBnoT/Hq/+12uD4QhrLOuc8iCnHb2FH8Y4YnpdrVDMAQ==
X-Received: by 2002:a05:6000:128b:: with SMTP id f11mr11985765wrx.227.1590346838157;
        Sun, 24 May 2020 12:00:38 -0700 (PDT)
Received: from tool.localnet ([213.177.197.81])
        by smtp.googlemail.com with ESMTPSA id l204sm5885894wmf.19.2020.05.24.12.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 12:00:37 -0700 (PDT)
From:   Daniel =?ISO-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
To:     tsbogend@alpha.franken.de
Cc:     f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: BCM63XX: fix BCM6358 GPIO count
Date:   Sun, 24 May 2020 20:59:53 +0200
Message-ID: <4452917.ZOZUicq8Ig@tool>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The BCM6358 SoC has only 38 available GPIOs. Fix it.

Signed-off-by: Daniel Gonz=C3=A1lez Cabanelas <dgcbueu@gmail.com>
=2D--
 arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h b/arch/mips/=
include/asm/mach-bcm63xx/bcm63xx_gpio.h
index 8fe88c2251..9212429d5e 100644
=2D-- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h
+++ b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h
@@ -13,16 +13,16 @@ static inline unsigned long bcm63xx_gpio_count(void)
 	case BCM6328_CPU_ID:
 		return 32;
 	case BCM3368_CPU_ID:
=2D	case BCM6358_CPU_ID:
 		return 40;
 	case BCM6338_CPU_ID:
 		return 8;
 	case BCM6345_CPU_ID:
 		return 16;
=2D	case BCM6362_CPU_ID:
=2D		return 48;
+	case BCM6358_CPU_ID:
 	case BCM6368_CPU_ID:
 		return 38;
+	case BCM6362_CPU_ID:
+		return 48;
 	case BCM6348_CPU_ID:
 	default:
 		return 37;
=2D-=20
2.26.2




