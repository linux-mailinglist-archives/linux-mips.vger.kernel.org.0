Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7D0393FF3
	for <lists+linux-mips@lfdr.de>; Fri, 28 May 2021 11:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234770AbhE1JbA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 28 May 2021 05:31:00 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:58163 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234226AbhE1JbA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 May 2021 05:31:00 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MacWq-1lFysY0aKY-00c6fR; Fri, 28 May 2021 11:29:24 +0200
Received: by mail-wr1-f41.google.com with SMTP id g17so2549179wrs.13;
        Fri, 28 May 2021 02:29:23 -0700 (PDT)
X-Gm-Message-State: AOAM530U6aZLjGHwXiJQS/XnB5Sn/ZI7RYmqqRXO30ZAi5onlVnzNcRb
        3HRNc+WMi8Nhfb0HoLD+m2j+39I+QOokukfTJeM=
X-Google-Smtp-Source: ABdhPJywgALYfevaZchWg8EzzxwlRe7/w4FsfnLHzqy7k0scBlUV9N7AwRL3lgV5nPFvp2XIyNLmAh0ZEV+CX3zrcmU=
X-Received: by 2002:a5d:53cc:: with SMTP id a12mr7140748wrw.99.1622194163736;
 Fri, 28 May 2021 02:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210523232556.15017-1-digetx@gmail.com> <CAMuHMdWqNngrDQOut1r5aD1Nk5BMXEV4m8+OBix4DXOV6OSpNg@mail.gmail.com>
 <8b6af8c0-6f01-193f-1eb4-4e230871f0cd@gmail.com> <f12b4622-6cea-ac65-2d94-f50a85c29215@canonical.com>
 <CAMuHMdW_G259Nwx1EEf38h0AcVH8yjmjqp9Mh-vQ4LJJMzD8Dg@mail.gmail.com>
 <2e5bb7c2-62d9-b1f7-7f35-2b379d3692d5@gmail.com> <3661fdba-ad32-5d16-7714-1ebc58caf435@infradead.org>
In-Reply-To: <3661fdba-ad32-5d16-7714-1ebc58caf435@infradead.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 28 May 2021 11:27:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0hZGEOh0jckDvt-386KopCCL09RM6hv4qAUie31LDSTQ@mail.gmail.com>
Message-ID: <CAK8P3a0hZGEOh0jckDvt-386KopCCL09RM6hv4qAUie31LDSTQ@mail.gmail.com>
Subject: Re: [PATCH v1] kbuild: Disable compile testing if HAVE_LEGACY_CLK enabled
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Paul Burton <paul.burton@mips.com>,
        John Crispin <john@phrozen.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:tRfCYgyoPaTocN4/TJgdyNhWfvo5WQP/i9Ts8dKcu0wJedhE7HE
 ZW01rAxMYdnlGI6bBVhc+mMStv3U0YD3N5lv+eLhRWfynXb0u6UUOymuj77o2eTECDdaJKU
 pEu7LZ/ovSDL0Xmya2mAs0a7VB1ivMvz2pJ+nFUgPz2fHQLa5P5H5/JsCdRjhwp4wJ0seKK
 p99WTQ38U25agHnbmmMPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VeAq1yubPvo=:jguehIBFhjnP27Z5dXYlDq
 jB1KAYY96bu52wJjl0FqOqzEi/+AQHYQcmFkPfk60dt5ZK3C+4zbQhqZ0DEQmzETPRZ7Y1RV5
 pwglJ0GsU5FnzwlYkUzy5ebId/hW5ivP1HYkEBR+6VlL6feb+re9FMmTXFqQjBYM+vNwqqEco
 axq3q9Reqr4eLlXGTRher9mWGP5Y5QeUWXzjTxQ7syKFUF2GTRy8aB7XpHHUVuoH/95iTNXhf
 NUQrNU4FRNeCg+dN4lMn3ROR8QW36DC+jYE0/O26V5MKVItebJ2byfkf5XjCzoluBFVgA6Dpn
 PbrqPSCWr2tZuj5uPX8P1AWP8Y19A0x/FI5w881J4AVg06jnXbVuZ+swbWmaIvd4wJjy2xVq/
 3lDfMuB6KnF2PFSO94c2QVWSoZYRxQ6229AF8Kxcw3XuYDkhc+oIcsd+G06r7QULuIdC3Fko6
 LRtDtx6b5jbtCjEsPLObWosboLP2L0CWQm0TpjFe8wmzJnlyxmTFU2xMX0iMcv6iaFbg903hq
 KLkQGXFvZVPQQ2KAOrgAiH39ukXwvpDFX8jvx3RIay4JYKrdXUAB7JScPgNj8mw0Y9n7YI5mz
 kXrFkWpnRP3Q2sJTfX9InBK3r+vnkxlXJ6R+bIorW4suD+yRRy7m1MYAkHZcdzFx47Y1s2Y/n
 KmPQ=
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 26, 2021 at 2:39 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 5/25/21 2:29 PM, Dmitry Osipenko wrote:
> > 25.05.2021 15:19, Geert Uytterhoeven пишет:
> If you are messing around with HAVE_LEGACY_CLK and COMMON_CLK
> and don't mind, please have a look at this report from
> 'kernel test robot':
>   https://lore.kernel.org/lkml/202103162301.oomY9NwI-lkp@intel.com/
>
>
> Maybe this one is more MIPS-specific. I dunno.
> I tried to come up with a patch for it and failed.
>
> I will be happy to built-test any patches that you come up with.
>
> Maybe I have just looked at this too long...

This is exactly the case that Dmitry is trying to solve. The problem
is that bcm63xx
and lantiq set CONFIG_HAVE_LEGACY_CLK but lack the clk_set_parent()
and clk_get_parent() functions. We could add the same stubs for these
two that we have for the other legacy clk implementations, or rework the
handling of legacy clocks completely.

       Arnd
