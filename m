Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61DCB225CDC
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jul 2020 12:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728310AbgGTKpf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Jul 2020 06:45:35 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:43951 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728232AbgGTKpe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Jul 2020 06:45:34 -0400
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M42Ss-1jxTIZ46T2-0003I2; Mon, 20 Jul 2020 12:45:32 +0200
Received: by mail-qt1-f177.google.com with SMTP id k18so12496427qtm.10;
        Mon, 20 Jul 2020 03:45:31 -0700 (PDT)
X-Gm-Message-State: AOAM533wRoO7L7l3KNVDnVj0MwnUMTxSvrDR9zZRWI7GE7+hSau13fCt
        qWGj+BIafh4uxeweRJra5r2JMpfrj+32ZJE7QWU=
X-Google-Smtp-Source: ABdhPJyveE09U5DOyjZw3YD0auFd/AcGtjZ7tGnHfjeOnNRKPaTJocr9ClHFJbUiY0/o5kQ5Bq1u1bhlyLaVg4bN9i4=
X-Received: by 2002:ac8:83d:: with SMTP id u58mr16596516qth.188.1595241930633;
 Mon, 20 Jul 2020 03:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200720074249.596364-1-jiaxun.yang@flygoat.com> <20200720074249.596364-4-jiaxun.yang@flygoat.com>
In-Reply-To: <20200720074249.596364-4-jiaxun.yang@flygoat.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 20 Jul 2020 12:45:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a13vZJyOGZ1FpS98ytVC57P6NgmQpSfhf2h9b7meQLtcw@mail.gmail.com>
Message-ID: <CAK8P3a13vZJyOGZ1FpS98ytVC57P6NgmQpSfhf2h9b7meQLtcw@mail.gmail.com>
Subject: Re: [PATCH 3/5] MIPS: Loongson64: Enlarge IO_SPACE_LIMIT
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:wxeTemO9I9qgRPajk466puVV0AUS0rUjtzK82g1IgJxYsxM8hZf
 8drL7XzB88nzF7YnDKnnLRQDeDRnuXPzCp7vEtn6RKhDI7DJ5bBBEKZ0X/S4wfZHnhHLlJv
 oM9nOlCLLhEoldO5rJwP5lzqo2KxWCMD+Mf5ZxKXnbExaXaGe8bEbsjqT0og9CEnpOItzl+
 1vnmr+IHLQwxhkhzzHHLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nVSe/g0VnjQ=:UFJn06VN8QV8JK/lm+7VCg
 xn2/3+TfCt6XbD0xE2iE9jNYkXX1CMbmjJRRYj5j3XiGbBmMGJU4x14S2Mt6XcZbRHkQ04K0W
 mp/dfifUhNJny1E19dYiFZ6GYWKY0UXeZkRHesmfzRnq/jTzRj0varPZYnB+Asi+Ga9TCD8xd
 sL7mG5LrMw6K8DRKmiLKeRQIAsy9u/V4BHHziqSEq7fypx94brn8WIQEDLlCNbF0EXiOnU60P
 sz4bk5W5JKjND9wDyIzZpf2ZrtWGxmguumXJckHsF+gGXLf76aa7H/3Q5m8UG7qudpCMWZqY+
 TrntflQNP0qBMip4trQZYHLNm/oUqYM7z187y0sDRVuxzAg2HS4YPNYemV5oDuwDZ5tgbjqRW
 u6uRhGXz54kDgbgQeO8FMAgG+gFOA4J4rRWv5BFOzPD+qh8GjVdnelZKJTe9hkLd9xlSn01gg
 SYdXPG26m8aFfreY/okFPk7Tv8y48i6z1Z6++ylyDsHNtuftepOqtM5nFNVMVN/WalFDr7n+S
 VBbh9Zfy55Y9LKPeLwjQdTX/byCazPOXjhdjOl17lPMcyUl0bbkSInZpRrAANd7k21s+T61Rm
 HctU9rAV38lbAUxL5iGn0l9uix8dPRJyhaPGqOH5RjC6ZTPSAX7FTFvOWcXqc5xUTgUANO08U
 VcCMpRriu6MnA1MKqbrZi2Zzu1wieN3XIQR4EZobn3uffDiLpXRu2FKhqLnlG6W89thz4RHg1
 VvWGpUaDy9Bc6duKBln/29htbyb2aKW/qyWOq79Ox1Zt/ES7qkYKyk5MPSNQ12CAav97cmTxM
 LzJF7H/O2wBlf16pwfoHhRabQZdeTl8xV9wcq4E2CXu+Qd2aP5na4lCCzpWnc1d4xs/dcDvqP
 kfCF5Si1cohX7BUjIwNR5oief6deYeYTm6Ak8FnPmGATPc+oUEzBvecWFLXx1ndU06nALNoLH
 sj9uQR2mv3NbxXURIJNHOKPyvkuFmvZC2LXxo8wGUgNaCarjfRSm1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 20, 2020 at 9:44 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> It can be very big on LS7A PCH systems.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   * On MIPS I/O ports are memory mapped, so we access them using normal
> diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h b/arch/mips/include/asm/mach-loongson64/spaces.h
> index 3de0ac9d8829..b99b43854929 100644
> --- a/arch/mips/include/asm/mach-loongson64/spaces.h
> +++ b/arch/mips/include/asm/mach-loongson64/spaces.h
> @@ -11,8 +11,7 @@
>  #define PCI_IOSIZE     SZ_16M
>  #define MAP_BASE       (PCI_IOBASE + PCI_IOSIZE)
>
> -/* Reserved at the start of PCI_IOBASE for legacy drivers */
> -#define MMIO_LOWER_RESERVED    0x10000
> +#define IO_SPACE_LIMIT 0x00ffffff

Does this mean that firmware may already have assigned "high" I/O space
numbers for devices? I'm not sure how well device drivers can generally
deal with port numbers that don't fit into a 16-bit integer.

Is it possible to run a 32-bit kernel on these machines? If yes, than
taking up 16MB of virtual addresses may also become a problem.

In practice, one should rarely need more than a few kb worth of
port numbers, unless you expect to see hundreds of legacy PCI
devices.

       Arnd
