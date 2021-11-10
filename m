Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D5444C020
	for <lists+linux-mips@lfdr.de>; Wed, 10 Nov 2021 12:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhKJLbQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Nov 2021 06:31:16 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:45327 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhKJLbI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Nov 2021 06:31:08 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MwjO6-1mUlI13AS2-00y6HW; Wed, 10 Nov 2021 12:28:19 +0100
Received: by mail-wm1-f44.google.com with SMTP id z200so1851138wmc.1;
        Wed, 10 Nov 2021 03:28:19 -0800 (PST)
X-Gm-Message-State: AOAM530Dy+zejzHMXbDDAZkNNuQRunvWsKstL6M+lfrxZpQn90OCMKU9
        v9cPL0Z3VIVMkze+cWP6Rl5B5vo+H/GwdiZN/u8=
X-Google-Smtp-Source: ABdhPJzAR8ZiczlfCaS3CRnVJq35IvntTZh8pqQom91FFlkqz7DmkT/XKjENOl6ammSqnkCEXvas9jebZZuYyb86adw=
X-Received: by 2002:a1c:2382:: with SMTP id j124mr15247371wmj.35.1636543699398;
 Wed, 10 Nov 2021 03:28:19 -0800 (PST)
MIME-Version: 1.0
References: <20211110030944.6733-1-rdunlap@infradead.org>
In-Reply-To: <20211110030944.6733-1-rdunlap@infradead.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 10 Nov 2021 12:28:03 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1s84Fw6ewLB7TN7Nb2t9V-_QCPjOz5S8XhH2r6aK6+mw@mail.gmail.com>
Message-ID: <CAK8P3a1s84Fw6ewLB7TN7Nb2t9V-_QCPjOz5S8XhH2r6aK6+mw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: boot/compressed/: add __bswapdi2() to target for
 ZSTD decompression
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:egY1NkQRFl7q3xRg2FDpYVMxg/TyWNQmTcuySUWGmK7v0meJc1+
 /V4us18flJiMGiQwVJOPGwiUSA/v5Ikm0dNOMMct9xVnx2FfNr/2QH78jGPbhMO/NMSPoK7
 YFU3Cynmf4SpUAzJ08FCHnFPcDOpXaED/ImWpmJRTLlUh5my/r4RSjehEFNFmwR4WKxPcLT
 okxsO8/tbpSKEhOe/8LrQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tJ7T4lBljrA=:0sVIIbIW2Qi/z84P5A/JN9
 n2CgBQiVrA9t5gBtz2mX5ZGAFHcjTNmRN2JN2Zaeqvo5d81PDSyWsVwmxcqzIQjVyGU0OGfuh
 LdggN7BfkDm7k5KeU2dIZL4I2SCsgDr4eQeC9tX7bua4OVmBUOH9VpZOtdwlpafcd+liiCVTw
 qUfs1PNWTIYDU4lTOk5O83Gf8tkZjZOEPLnL2FbdmS1ikeRFNxeiFmQDM7dgQbjh3aZymX+8O
 y0SbEbT1mCBEg4isiSoTUv/iZiDQf0ykDOrGJrjD+eBlDU8LvoLcdBach8rVWEafzH2iZ/x5L
 tiMPGu06DiEvXyOO1EIbNtx2KOdgyuU+Iwmm+t8CFxKxJWGpjoOIa6Dh95ONIsoAAZfX8QSEH
 dsVXyp4CD8zdHlKlByUOaHu3hMzb7GLa9FKkiml22Nf0fmrYIHpVFDsr9Kx4lK1ta8QhZdoh/
 6+UHxuI+R7QfczeqyqlfuAn7TUwQPJIPwHfE3yaOPCxRVygHAGzrPqq6Aq6UbtCMsyC2n5dBF
 3Ld1kQwq4GRxT0QCnCkT4Ya89v2BYvQkE53N0Duyt7xntMhBCzy1HBqOZ44xdUO1fQjeJiCEb
 xMAXtvc07InjG7YuPgU43W0TtgeEoiEDu/qNBSJFFZK/KbLjYY0sReBxtrrv+AqAIdp4EnlJe
 /Foyn/75YzykJHs2KACaIGdntvBrvbhq29VPan+RST2mjckBurjmaSFFiCdRcUq1xYyM=
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Nov 10, 2021 at 4:09 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> For MIPS pre-boot, when CONFIG_KERNEL_ZSTD=y, the decompressor
> function uses __bswapdi2(), so this object file should be added to
> the target object file.
>
> Fixes these build errors:
>
> mips-linux-ld: arch/mips/boot/compressed/decompress.o: in function `xxh64':
> decompress.c:(.text+0x8be0): undefined reference to `__bswapdi2'
> mips-linux-ld: decompress.c:(.text+0x8c78): undefined reference to `__bswapdi2'
> mips-linux-ld: decompress.c:(.text+0x8d04): undefined reference to `__bswapdi2'
> mips-linux-ld: arch/mips/boot/compressed/decompress.o:decompress.c:(.text+0xa010): more undefined references to `__bswapdi2' follow
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org

Thank you for the fix, it looks like I missed it when I patched the xz version.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 0652035a5794 ("asm-generic: unaligned: remove byteshift helpers")
Fixes: cddc40f5617e ("mips: always link byteswap helpers into decompressor")

        Arnd
