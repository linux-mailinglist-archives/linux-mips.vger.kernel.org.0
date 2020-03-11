Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF65C1813E1
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 10:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728146AbgCKJDM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 05:03:12 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37064 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgCKJDM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 05:03:12 -0400
Received: by mail-pl1-f193.google.com with SMTP id f16so784585plj.4;
        Wed, 11 Mar 2020 02:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8bM/wCwSXrnJCqsSvi8wWOGSbVzcZwUzc890uChHZBM=;
        b=MREjE9QBCCArLm3xVHXuKh2eNZCJvpe+U6eHgBpAqgXckRvOTJXvl4rYPKvUsIuZft
         jSJc8Y9dEKJhD5RYe2r0DsZpdV9SzwzZeRyMzui9EsDm72JpbYGCzLRSNFsJ+iBi6iI+
         Rxhn6PWNk7akIN5WNAiF3YsIMwWOFHSnyBSVP64A2yUNuOD9jjCwCzq3Ze8QSEr7xZ0r
         CrX1ZjcHqj0shB7vUkzeN802e9xi7CVc2d1IV31kH5CEce+i3iNygy0t8ZUMlfSNop+1
         4of2bEMFwEzqcuH/8QYIhAv5sbGJ2PThpb+CRC8AIhMywlqC1z0x95Vkt5bAki6IHgux
         dO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8bM/wCwSXrnJCqsSvi8wWOGSbVzcZwUzc890uChHZBM=;
        b=qq6/SXNGBDAcZDZCr+HRyd2BRCkroeFUYDhSPtBybXoq4NPUGKpmEaqRHouUwGl1Aj
         OTR+cBoyTO3xZ512Iwyd0X/qIh4gFzrWNzC+F2OIWMVdR3up/8DLgVEmsxQfTyt+4B11
         m2TvL3BgQQJiiYRhtSIYUqi3LWBc5dlAHkn+lgHgwehAN+BUU7hksIKJprm75csmjGuc
         B5XdDly8+goNV2mGsJsUc5lUfrlQIA79+DB8KuFGstV3iyYcEbWg7JUc0wuPGbs38SnZ
         I2GHwySakcWoc1t/LbjK3t2keKbVBPZ1sIUIbf6f4hjGxXRLjYRwvqvZ12pTu8BuBduL
         jC7A==
X-Gm-Message-State: ANhLgQ2JqEb+6FLzZIMVeUUMufsd1wLdCK32rj04t6sgReJNwZS0xwml
        VHrYkN9MGFuQDoMP86w40aa5hKEm
X-Google-Smtp-Source: ADFU+vuCDnh7w1xvfOVYsJQClMX8OE3C43uqARqIQzLzcdQQglFS7AAInUSwAo9xL8M4KffExDMNxA==
X-Received: by 2002:a17:902:7248:: with SMTP id c8mr2219680pll.282.1583917391010;
        Wed, 11 Mar 2020 02:03:11 -0700 (PDT)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id i6sm10456074pfe.62.2020.03.11.02.03.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 02:03:10 -0700 (PDT)
Date:   Wed, 11 Mar 2020 14:33:08 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH v4] MIPS: Replace setup_irq() by request_irq()
Message-ID: <20200311090308.GA5060@afzalpc>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
 <20200311053126.GA48442@ubuntu-m2-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311053126.GA48442@ubuntu-m2-xlarge-x86>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Tue, Mar 10, 2020 at 10:31:26PM -0700, Nathan Chancellor wrote:

> This patch regresses booting malta_defconfig with both GCC and clang
> with this rootfs and QEMU 4.2.0:

On a quick debug, Diff at the end seems to fix the issue. i realize that
all the execution sequences that can alter the earlier statically
defined struct irqaction fields needs to be taken care carefully,let me
recheck the resolution here as well as other instances where this kind
of issue can happen. i will sent a proper patch later.

> 
> https://github.com/ClangBuiltLinux/continuous-integration/blob/a85e3e44c2570847e22ad8f92f317c2b007c4517/images/mipsel/rootfs.cpio
> 
> $ timeout 2m qemu-system-mipsel -machine malta -cpu 24Kf -initrd rootfs.cpio -kernel vmlinux -m 512m -display none -serial mon:stdio
> 
> just hangs. I have not done further debugging past the initial bisect.

Thanks for the reproducer.

Regards
afzal


diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index 64e917dfe6b2..d24e4f2985c3 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -252,7 +252,7 @@ unsigned int __weak get_c0_compare_int(void)
 
 int r4k_clockevent_init(void)
 {
-	unsigned long flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED;
+	unsigned long flags = IRQF_PERCPU | IRQF_TIMER;
 	unsigned int cpu = smp_processor_id();
 	struct clock_event_device *cd;
 	unsigned int irq, min_delta;
