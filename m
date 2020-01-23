Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDAFD1471F5
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2020 20:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729208AbgAWTob (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jan 2020 14:44:31 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45957 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728809AbgAWToa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jan 2020 14:44:30 -0500
Received: by mail-pg1-f193.google.com with SMTP id b9so1871763pgk.12;
        Thu, 23 Jan 2020 11:44:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=GU462IDaSVGnW20pL3QtqaVDshekPFtGJBficVxGeMQ=;
        b=LTDT0IsFzRNEF44g1NqFdZR00LXlYWXpNEM1b8Was0FJpF6rZFMXK5qHOsQqfMuiUx
         tVYHvCevTMAjlvvbwciaixUtw/NINbAOqGBQxhWHd6qtg26TOvQ/9CEU6PoIYtWFAd0k
         n8C2DOoYKwF+++0RA9fYWg8FLskW9SrpYKK1hwc+92Zy1wUDUM3SRssg4cRXkNhS2KHl
         Njdbp1IKdWYoQge9uIS6qcl1HLDc8ED1mFPfkESv0UGJ6G+Ehg+fHawdTS3nt9JCQrNh
         AHuP9fD1r4a1tTJ1S3maAvaEak4fYBsjpZlJE9MC7O3jkHJjnZrlZb7k0tCCgfKdKhjY
         2Fuw==
X-Gm-Message-State: APjAAAWdtSm4KW1zoq3dEIIfY5OivT1ZpNie/vmVnDqbX2hd7+Rr565C
        ZoBRrjgoy358QuxXuKOSeGw=
X-Google-Smtp-Source: APXvYqwiVBxjGEzqKz19ztEdBtlBZztsBJn4ccEM/CMW91yT9KPDFdJkRDR/gapfoM3G2aJNNDzIvw==
X-Received: by 2002:a63:d411:: with SMTP id a17mr419242pgh.333.1579808670032;
        Thu, 23 Jan 2020 11:44:30 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id q64sm3458422pjb.1.2020.01.23.11.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 11:44:29 -0800 (PST)
Message-ID: <5e29f79d.1c69fb81.c5e8a.83cb@mx.google.com>
Date:   Thu, 23 Jan 2020 11:44:28 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Alexander Lobakin <alobakin@dlink.ru>
CC:     Paul Burton <paulburton@kernel.org>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Michal Simek <michal.simek@xilinx.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH mips-next 0/5] MIPS: a set of misc Kconfig/Kbuild improvements
References:  <20200122105852.8788-1-alobakin@dlink.ru>
In-Reply-To:  <20200122105852.8788-1-alobakin@dlink.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Alexander Lobakin wrote:
> This patchset aims mainly at MIPS and Generic MIPS Kconfig optimizations
> except for the last patch that removes redundant BASE_BAUD override for
> Generic MIPS. If it should go out of this series, please let me know.
> All changes were fully tested on Generic MIPS32R2 board, but I admit
> there potentionally might be any non-critical issues on other systems
> (unlikely though).
> 
> Alexander Lobakin (5):
>   MIPS: don't explicitly select LIBFDT in Kconfig
>   MIPS: generic: don't unconditionally select PINCTRL
>   MIPS: make CPU_HAS_LOAD_STORE_LR opt-out
>   MIPS: sort MIPS and MIPS_GENERIC Kconfig selects alphabetically
>     (again)
>   Revert "MIPS: Add custom serial.h with BASE_BAUD override for generic
>     kernel"

Series applied to mips-next.

> MIPS: don't explicitly select LIBFDT in Kconfig
>   commit 7c8f13790958
>   https://git.kernel.org/mips/c/7c8f13790958
>   
>   Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: generic: don't unconditionally select PINCTRL
>   commit 7de86604bbe4
>   https://git.kernel.org/mips/c/7de86604bbe4
>   
>   Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: make CPU_HAS_LOAD_STORE_LR opt-out
>   commit 18d84e2e55b6
>   https://git.kernel.org/mips/c/18d84e2e55b6
>   
>   Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: sort MIPS and MIPS_GENERIC Kconfig selects alphabetically (again)
>   commit 34c01e41b247
>   https://git.kernel.org/mips/c/34c01e41b247
>   
>   Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> Revert "MIPS: Add custom serial.h with BASE_BAUD override for generic kernel"
>   commit 0a3d5b577784
>   https://git.kernel.org/mips/c/0a3d5b577784
>   
>   Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
