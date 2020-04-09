Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09D6E1A3160
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 10:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgDII64 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 04:58:56 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:50675 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgDII6z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 04:58:55 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MhDAi-1iqzpE2uFW-00eI3c; Thu, 09 Apr 2020 10:58:54 +0200
Received: by mail-qt1-f178.google.com with SMTP id g7so2144406qtj.13;
        Thu, 09 Apr 2020 01:58:54 -0700 (PDT)
X-Gm-Message-State: AGi0PuZnwcp+Tqdgl47obk3LyDCyWlo4dBmaaM0KkS9BIjsXI+mDHzu3
        XEwP+Ipc4/ubF7jRNKv0i7K/1IVuQPRS8ER+J7s=
X-Google-Smtp-Source: APiQypJGQnSKvwEmA3Uxqr21N7C28AlJ4H4USNdYjJ7jBa7oUXIlp/5GQn3RknUCUlZR5y4GP5LLx3U/KPQi69ASHsQ=
X-Received: by 2002:aed:3b4c:: with SMTP id q12mr10854453qte.18.1586422733282;
 Thu, 09 Apr 2020 01:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200409064416.83340-1-sboyd@kernel.org>
In-Reply-To: <20200409064416.83340-1-sboyd@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 9 Apr 2020 10:58:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1mOS4bVs+FQNcWPXuAdXpB-rKAuRE-at-Pr0m=43D68g@mail.gmail.com>
Message-ID: <CAK8P3a1mOS4bVs+FQNcWPXuAdXpB-rKAuRE-at-Pr0m=43D68g@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Allow COMMON_CLK to be selectable
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Alexander Shiyan <shc_work@mail.ru>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Huacai Chen <chenhc@lemote.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-c6x-dev@linux-c6x.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Mark Salter <msalter@redhat.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Paul Burton <paulburton@kernel.org>,
        Paul Walmsley <paul@pwsan.com>, Rich Felker <dalias@libc.org>,
        Russell King <linux@armlinux.org.uk>,
        Thierry Reding <treding@nvidia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tony Prisk <linux@prisktech.co.nz>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:O1q931hCZ40T0tLkpVu7G+bihKn8ZKa+7Q36I2aOnANCcD9rGPv
 bNiYtUO1D51Vlkj+7/CjCy8tt3nrbLkCvViBQyHvFelIwFAPWhVlrNhVKKHjGdr9KoTxIlF
 r67KKVv1oWwEiP5GAlv3JelwY2d3v8nfKlYfEbnhR2yCiAg42IaoG+JqXlsiN2+1/RZ1rE0
 GY/sQddB5aPnMh3dufYOA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2AqidcnxkcA=:Hgp3RZDeZIgahRHJ/yk7nE
 Ulqh8jc6o/Z+yMvq7M10nOyZxnr7eip5vdx1DIfSMCTMELWDmZBF0lxuo/QJ8nUGK/29NfnXD
 B6dIoA072qWvbBqMbk5tNevgw/s2qWs/QhQqdoeSbFP0Xs6TeAsjBF8gcNEKo3bdPhAapgMXF
 tiBDTacTW3a701mf+Hf/iBvexQ81Ui7JIClEs/xmQfVwVMbur5WlTINhgZ6aXtnt/Qxz617A5
 Gu25OVYlcy/+wOGROa38MQwR1RZZvpt73ioF9Te5bYZPp4sC038OgxbZeNkPoVMaWb0h1L/q4
 aLGdyPWfuI7878M6nv6dokLnav68ecWblRGBsJJ1A33KqDYvibuUPSb2rfx0dWDy+flUbbcXB
 yjUtTz5NCsGhx8Z7A/2ms1FIi7P7EWhY/dZpMjR6JgKVzKzVxq48t0bc1y2tkXA9wV8V2rrqF
 xwGhxQcAe1u69AvnVWQTMX5dD9JyHgJvdszBeOQTcbIVMPKUrNrXf+UU0cmPxq8PNO0Xpl57V
 rClHRH0l4oFV2EkyLf8GS/vCfVDJny3RAQ/AOKzP5vxaVsmNH4YagBWKwapsPjgXcbeq14S2u
 JqxgZ3TD1NmODtlIF4dzEyP+fvgmeagmYPEy4wtLw50777om8U+8ObPsozZcdMOBJzlJW4NY/
 D88RxxGlgB9nV2tn0QEOEXnJHnlpDDD7ofucFN3mAdp5KPz5g9NZEmh4vsqrk5ZBbbDxXmZkC
 ebUgF7k8cBaIBjJejSYhrRUuLN+Z4ISdfTNh5VBGy64rJsBNqCf2Uh1Kb62WN8zbGzS4IBdxj
 1wjjdT2t6f8d2eOsrSnyIGAnST+ls5XOE4pAXXP7wjCyNPJ4rE=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 9, 2020 at 8:44 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> This patch series cleans up a handful of selects that were redundant and
> deletes presumably dead code with the goal of making it possible to add
> kunit tests for the CCF in the future. To do that, we introduce a
> "legacy" clk Kconfig option to mark code that hasn't migrated to the
> common clk framework and then make the COMMON_CLK config option visible
> in the menuconfig as long as that legacy option isn't enabled. I've also
> included a couple patches at the end that may be more controversial but
> helped me consolidate all this logic/code.
>
> I haven't done more than compile test a few configs for arm, arm64,
> h8300, and mips. More testing is welcome.
>
> The plan is that I'll just merge the whole pile through the clk tree. If
> the first five patches or the last three patches are better going
> through another tree like arm-soc or architecture trees that's fine too,
> but there are potential conflicts between trees so maybe it's better to
> just leave it all in one tree.
>
> Changes from v1:
>  * Fixed MIPS ralink build problem pointed out by Arnd
>  * Fixed meson mx sdio build due to bad Kconfig exposed by this change
>  * Picked up acks

Whole series

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I also made a patch to completely remove the private clk implementation
for mips/loongson2f, but it obviously clashes with your series at the moment.

I'll send you what I have today and you can decide if you want to
add it to your series after it gets an Ack from the maintainers, or I'll
send it separately later.

     Arnd
