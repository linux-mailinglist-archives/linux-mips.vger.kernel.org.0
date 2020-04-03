Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDA3E19CF14
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2020 06:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgDCEVs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Apr 2020 00:21:48 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:32998 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbgDCEVs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 Apr 2020 00:21:48 -0400
Received: by mail-il1-f194.google.com with SMTP id k29so5989726ilg.0;
        Thu, 02 Apr 2020 21:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iTvfVv9OMelL2tJNQhqCvCC3vbEtodW1DXRkZdSxEgM=;
        b=MakQgKQ+OPkp1iYYauWme4unfCiANy7OA1fMZ4N3dVb4DpHxRL6VT2tsxKzO6NL6RM
         SR+Z/SlKHaxvb30RBOjJVDMOo9qTurRsVXK5eghfGwjR+VG8LGNkjBglKyyDcnykyDgC
         bKRfEKCWuofsPNp2SpzohDHOXiHXTPNi6O9pRWbHUotsBr0YeDFMXGnlYwlZQqsqVa3E
         tQ+y/cqe71lMTU0za+7MRwVM2D5IAVs6Q3IKUYGypUs1i3F+2H1yhHNzEKIbeJR7rfuo
         UPgsLhvJH8Kj1pFHFXCeVsOdwvI4VK4oWx26jirUUkEfqM8CfSRZ0H+mqELlZx9tNCqT
         JymA==
X-Gm-Message-State: AGi0PuaRKclfI0tcGeB6yF0/IKUpeJSoPXqVkrFuIkQkuHupaZ/fjxNY
        rDAF2wU6fCtlR/F4GdP0JGNA+gp8Uc5u0fSRE0/cTAEC
X-Google-Smtp-Source: APiQypJRG0q51HavwyEmN1v7MTc8CDalf3p/c5rurCJxhL41UfnUexRPVYAyxzfRSydkm//LE4mXKRTvNyq0dqidknQ=
X-Received: by 2002:a92:c742:: with SMTP id y2mr6585035ilp.147.1585887706183;
 Thu, 02 Apr 2020 21:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <1585661608-3356-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1585661608-3356-1-git-send-email-yangtiezhu@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Fri, 3 Apr 2020 12:28:43 +0800
Message-ID: <CAAhV-H5zKaWREreiDmmRgtAuTvOcQwEm1xvQxcCGrpdiiW7uWg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add basic support for Loongson 7A1000 bridge chip
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We have a rule of naming to avoid confusing: Use Loongson-3A,
Loongson-3B, etc. to describe processor; use LS2H, LS7A, etc. to
describe bridge. So please don't use Loongson 7A1000.

Thanks,
Huacai

On Tue, Mar 31, 2020 at 9:34 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> The Loongson 7A1000 bridge chip has been released for several years
> since the second half of 2017, but it is not supported by the Linux
> mainline kernel while it only works well with the Loongson internal
> kernel version. When I update the latest version of Linux mainline
> kernel on the Loongson 3A3000 CPU and 7A1000 bridge chip system,
> the boot process failed and I feel depressed.
>
> The 7A1000 bridge chip is used a lot with 3A3000 or 3A4000 CPU in
> the most Loongson desktop and sever products, it is important to
> support Loongson 7A1000 bridge chip by the Linux mainline kernel.
>
> This patch series adds the basic support for the Loongson 7A1000
> bridge chip, the patch about vendor ID and SATA has been merged
> into the mainline tree, the next work is to refactor the code about
> the interrupt controller, and then power management and some other
> controller device drivers.
>
> By the way, if you want the boot process is successful (just for
> test) on the Loongson 3A3000 CPU and 7A1000 bridge chip system,
> you should not only apply these patches, but also need the support
> for SATA and interrupt controller in the v1 patch series.
>
> This patch series is based on mips-next.
>
> If you have any questions and suggestions, please let me know.
>
> Thanks,
>
> Tiezhu Yang
>
> v2:
>   - The split patch series about Loongson vendor ID and SATA controller
>     has been merged into the linux-block.git by Jens Axboe [1].
>
>   - Think about using hierarchy IRQ domain in the patch of interrupt
>     controller, and this maybe depend on the patch series by Jiaxun
>     ("Modernize Loongson64 Machine"), so the patch about interrupt is
>     not included in this v2 patch series.
>
> v3:
>   - The split patch series about Loongson vendor ID and SATA controller
>     has been merged into the mainline tree [2]
>
>   - Modify the macro definition and add comment to make it easy to read
>
>   - Move ls7a1000_pci_class_quirk() to fixup-loongson3.c
>
>   - Use PCI_VENDOR_ID_LOONGSON in pci_ids.h instead of 0x0014
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=9acb9fe18d86
>     https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=e49bd683e00b
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9acb9fe18d86
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e49bd683e00b
>
> Tiezhu Yang (3):
>   MIPS: Loongson: Get host bridge information
>   MIPS: Loongson: Add DMA support for 7A1000
>   MIPS: Loongson: Add PCI support for 7A1000
>
>  arch/mips/include/asm/mach-loongson64/boot_param.h | 20 +++++++
>  arch/mips/loongson64/dma.c                         |  9 ++--
>  arch/mips/loongson64/env.c                         | 22 ++++++++
>  arch/mips/loongson64/init.c                        | 17 ++++++
>  arch/mips/pci/fixup-loongson3.c                    | 12 +++++
>  arch/mips/pci/ops-loongson3.c                      | 63 ++++++++++++++++++++--
>  6 files changed, 136 insertions(+), 7 deletions(-)
>
> --
> 2.1.0
>
