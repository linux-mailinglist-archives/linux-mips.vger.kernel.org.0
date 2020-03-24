Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0C71906D2
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 08:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbgCXHw5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 03:52:57 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17841 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727383AbgCXHw5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 03:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585036200;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=YIo4JEVOlyEQh9maxLEUutKCPptTa/vNvjGQDAw/y8Q=;
        b=ZwCv0Oqy7FKxKy76FGQEiLsKQqiYcwDZ6c3bN8r1kH0HnZWMVsYX4256Aml1OuAc
        4uSau+4AXo3QqGr8OolnDQInQgFLNWQduQQVs883kQ7esa+HD+M84kBYd0Z4UF1qJaQ
        b9U8Zog4FZVRuDEVLX/Z5uQtn/r9AvijXOxb26n4=
Received: from [10.233.233.252] (183.157.60.227 [183.157.60.227]) by mx.zoho.com.cn
        with SMTPS id 1585036199410710.3765591047899; Tue, 24 Mar 2020 15:49:59 +0800 (CST)
Date:   Tue, 24 Mar 2020 15:49:50 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn>
References: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/3] Add basic support for Loongson 7A1000 bridge chip
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <F85A21BA-31A2-4230-BFF8-7B5F355BB125@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
0:59:12, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>The Loongson 7A1000 bridge chip has been released for several years
>since the second half of 2017, but it is not supported by the Linux
>mainline kernel while it only works well with the Loongson internal
>kernel version=2E When I update the latest version of Linux mainline
>kernel on the Loongson 3A3000 CPU and 7A1000 bridge chip system,
>the boot process failed and I feel depressed=2E
>
>The 7A1000 bridge chip is used a lot with 3A3000 or 3A4000 CPU in
>the most Loongson desktop and sever products, it is important to
>support Loongson 7A1000 bridge chip by the Linux mainline kernel=2E
>
>This patch series adds the basic support for the Loongson 7A1000
>bridge chip, when apply these patches based on linux-5=2E6-rc7, the
>boot process is successful and we can login normally used with the

Is it still true without IRQ driver?

>latest firmware and discrete graphics card, the next work to do is
>power management and some other controller device drivers=2E
>
>Additionally, when I git clone mips code [1], the speed is too slow
>and clone always failed, so this patch series is based on the latest
>linux-5=2E6-rc7 [2]=2E

You can clone stable tree from mirrors in China[1] at first,
then add mips tree as a remote and fetch from it=2E
In this way it will only download a minimal difference set from foreign se=
rver so won't spend a lot of time=2E


[1]: https://mirrors=2Etuna=2Etsinghua=2Eedu=2Ecn/git/linux-stable=2Egit

>
>If you have any questions and suggestions, please let me know=2E
>
>Thanks,
>
>Tiezhu Yang
>
>v2:
>  - The split patch series about Loongson vendor ID and SATA controller
>    has been merged into the linux-block=2Egit by Jens Axboe [3]=2E
>
>  - Think about using hierarchy IRQ domain in the patch of interrupt
>    controller, and this maybe depend on the patch series by Jiaxun
>    ("Modernize Loongson64 Machine"), so the patch about interrupt is
>    not included in this v2 patch series=2E
>
>[1] git clone
>https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/mips/linux=2Egit
>[2] git clone https://github=2Ecom/torvalds/linux=2Egit
>[3]
>https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/axboe/linux-block=2Eg=
it/commit/?h=3Dfor-next&id=3D9acb9fe18d86
>https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/axboe/linux-block=2Eg=
it/commit/?h=3Dfor-next&id=3De49bd683e00b
>
>Tiezhu Yang (3):
>  MIPS: Loongson: Get host bridge information
>  MIPS: Loongson: Add DMA support for 7A1000
>  MIPS: Loongson: Add PCI support for 7A1000
>
> arch/mips/include/asm/mach-loongson64/boot_param=2Eh | 20 ++++++
> arch/mips/loongson64/dma=2Ec                         |  9 ++-
> arch/mips/loongson64/env=2Ec                         | 20 ++++++
> arch/mips/loongson64/init=2Ec                        | 17 +++++
>arch/mips/pci/ops-loongson3=2Ec                      | 72
>++++++++++++++++++++--
> 5 files changed, 131 insertions(+), 7 deletions(-)

--=20
Jiaxun Yang
