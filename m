Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A36C411902B
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2019 19:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbfLJS4V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Dec 2019 13:56:21 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35447 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727617AbfLJS4V (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Dec 2019 13:56:21 -0500
Received: by mail-pl1-f194.google.com with SMTP id s10so231644plp.2;
        Tue, 10 Dec 2019 10:56:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=SusWz82FXY+hVBTH0+WUs88Y9sVAdnEx3AtXJCD2kjU=;
        b=kRG7z0ue7zQD5IUUYGqa4kkIP+5IkhMPHatUhE+HWtg6lXf7w1/72nixGvax4OrXL9
         RGDoodvebXZk5piMrp8GVR60IxHwTsp8yomd7aERaE3lh3XL49C1jbnjpcIl8ZEEWVdB
         JzQIZ7Z5v1tgyekybab4GQmm7fUsOWc6MGlLhvfVf4V2DZ29YJLzRLH9Utu6DpMVSJcR
         8VEW+KfBFl/qMNcwUkyscQ/QbesvMA/iqg6L/t6xLS28FGt7HFd9ar6iEo0HWKMf8tmP
         +9f5r86Lfl+a/PjYhNatC2U+wAv8OYrKJtD9DZ+h9D3SFUkiWmFsLEPGt/ZYbfdgYEQ0
         Xbvg==
X-Gm-Message-State: APjAAAWH8S+PwOba0YcgpFYdPLCyY+L0y8elR2BAAAtrVXbh+m8LcPfo
        /R7gVklSHAlUQSl7HHKNC3UrUMkIoxsfCw==
X-Google-Smtp-Source: APXvYqzIVvC4wMeTsEf1zGEVciH66x1iN6YzpOFGsUzK48Zvz1bihopCVM1RTLfmJE5Wrrfb7niQ0w==
X-Received: by 2002:a17:902:9302:: with SMTP id bc2mr37159497plb.148.1576004180358;
        Tue, 10 Dec 2019 10:56:20 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id f30sm4229373pga.20.2019.12.10.10.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 10:56:19 -0800 (PST)
Date:   Tue, 10 Dec 2019 10:57:16 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Denis Efremov <efremov@linux.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Add KSEG*ADDR definitions to CONFIG_64BIT
Message-ID: <20191210185716.3lkhbuuqtzj2vs3l@lantea.localdomain>
References: <20191210172739.27131-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191210172739.27131-1-efremov@linux.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Denis,

On Tue, Dec 10, 2019 at 08:27:39PM +0300, Denis Efremov wrote:
> The patch adds KSEG0ADDR, KSEG1ADDR, KSEG2ADDR, KSEG3ADDR
> definitions to CONFIG_64BIT ifdef. This fixes broken compilation:
>   CC      drivers/watchdog/mtx-1_wdt.o
> In file included from drivers/watchdog/mtx-1_wdt.c:44:
> ./arch/mips/include/asm/mach-au1x00/au1000.h: In function ‘alchemy_rdsys’:
> ./arch/mips/include/asm/mach-au1x00/au1000.h:603:36: error: implicit
>   declaration of function ‘KSEG1ADDR’; did you mean ‘CKSEG1ADDR’?
>   [-Werror=implicit-function-declaration]

Since this driver is meant to run on a system that only supports 32 bit
kernels, I think it would be better to correct its dependencies in
Kconfig like so:

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 58e7c100b6ad..509cbb6d2cea 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1648,7 +1648,7 @@ config JZ4740_WDT

 config WDT_MTX1
        tristate "MTX-1 Hardware Watchdog"
-       depends on MIPS_MTX1 || (MIPS && COMPILE_TEST)
+       depends on MIPS_MTX1 || (MIPS && 32BIT && COMPILE_TEST)
        help
          Hardware driver for the MTX-1 boards. This is a watchdog timer that
          will reboot the machine after a 100 seconds timer expired.

And mark this with the appropriate fixes tag:

  Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")

What do you think?

Alternatively the driver could just use the existing & equivalent
CKSEG1ADDR() macro as the compiler suggested, but in that case it'd be
good to check that's the only change needed to build cleanly with
CONFIG_64BIT=y.

Thanks,
    Paul
