Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8EF190730
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 09:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgCXIMm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 04:12:42 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:44996 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbgCXIMm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 04:12:42 -0400
Received: by mail-vs1-f67.google.com with SMTP id e138so10539436vsc.11;
        Tue, 24 Mar 2020 01:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7791Abzq1umUvVU26oR9Lb3nGzS5O2yHRMAjIUKDNR4=;
        b=lkAWj/6VVsRJAulgQX07slAihBeYz0uOa0kYMNHRVbfGBDvkOXRRWt2RIj3BjAqN87
         JAY9cBxd+9s5OoUeBIOFkaCqELRhU1hyvEdQu+JypgwQWCo7hsusXizfjeIXS7L21TIF
         fAz34hzvUTIvK1x1a1hNq11S+6feKoJsfsF8YcOy2u11fdk6/UBRgYqa8giiSYvQKPhE
         F32sXN+SIAeIAE4Hq9nyOSMwQceZnaTSlPHAoJ2E7Cv5/hlAoIH0OZyFwaDCdVxir4Mi
         HF5kM7ohNxhnZlom19P9eZgFVr2kvCyacfo18hlDEGOUkSR1tIA6rbJIoeQL8VeAuwRS
         0Q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7791Abzq1umUvVU26oR9Lb3nGzS5O2yHRMAjIUKDNR4=;
        b=oKuhWoyNsLUDJoYpZx8HtydiQM2Tbw9or6epMeHbgCzVKtAekn2+y9dHZ6HQc+7KQZ
         XJEEiYAKiTG4tm8vGIoSvraVFv63jMtR+33FzMM1BlzJmk5OgKsrV2ijUvtKZCpwhQ1k
         L7wuZGgJJ2W0RnQXwCiHhp6GFRuMOTl5gT8tV8n+CvFjv2G342B94KUGxaqt8bnwcn/S
         9AkH7YXva73e8+vAkygm3Fobsq/5Iq8wQlVarIe/3unIV0WXR2m0rPeLdRWTDNFStRve
         /z4IWgIJ/fDDh+YfbSzFOF/kbHjrG4hrRSBTbDkp1WZ+7KZNCTm7btaT+XNfGfAWVo6n
         H6mA==
X-Gm-Message-State: ANhLgQ1K+NtPXkaCd+CJuT7t57a+l6eBHDHDBa9/EM3lxsdPLdRCVDoB
        8KTp6eEm+F93FyQTlIUSIWQie8/t8b85+hluA5Qn6FGoxCA=
X-Google-Smtp-Source: ADFU+vtt8m2MROBC4og15kzFKoSDaxAGSgsEAX/9SeviJWNRXX0N8o5p3XMonV+0J1FJcSx78yNmGXI1Tqw5Q2m/JpQ=
X-Received: by 2002:a67:c189:: with SMTP id h9mr8193773vsj.91.1585037561167;
 Tue, 24 Mar 2020 01:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn> <F85A21BA-31A2-4230-BFF8-7B5F355BB125@flygoat.com>
In-Reply-To: <F85A21BA-31A2-4230-BFF8-7B5F355BB125@flygoat.com>
From:   Qiujun Huang <anenbupt@gmail.com>
Date:   Tue, 24 Mar 2020 16:12:29 +0800
Message-ID: <CADG63jARzp+c9gbp5LO1a7ujgFbBoTD9kZQREFSca+Ung1wEqg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add basic support for Loongson 7A1000 bridge chip
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 24, 2020 at 3:53 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote=
:
>
>
>
> =E4=BA=8E 2020=E5=B9=B43=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
10:59:12, Tiezhu Yang <yangtiezhu@loongson.cn> =E5=86=99=E5=88=B0:
> >The Loongson 7A1000 bridge chip has been released for several years
> >since the second half of 2017, but it is not supported by the Linux
> >mainline kernel while it only works well with the Loongson internal
> >kernel version. When I update the latest version of Linux mainline
> >kernel on the Loongson 3A3000 CPU and 7A1000 bridge chip system,
> >the boot process failed and I feel depressed.
> >
> >The 7A1000 bridge chip is used a lot with 3A3000 or 3A4000 CPU in
> >the most Loongson desktop and sever products, it is important to
> >support Loongson 7A1000 bridge chip by the Linux mainline kernel.
> >
> >This patch series adds the basic support for the Loongson 7A1000
> >bridge chip, when apply these patches based on linux-5.6-rc7, the
> >boot process is successful and we can login normally used with the
>
> Is it still true without IRQ driver?
>
> >latest firmware and discrete graphics card, the next work to do is
> >power management and some other controller device drivers.
> >
> >Additionally, when I git clone mips code [1], the speed is too slow
> >and clone always failed, so this patch series is based on the latest
> >linux-5.6-rc7 [2].
>
> You can clone stable tree from mirrors in China[1] at first,
> then add mips tree as a remote and fetch from it.
> In this way it will only download a minimal difference set from foreign s=
erver so won't spend a lot of time.
>
>
> [1]: https://mirrors.tuna.tsinghua.edu.cn/git/linux-stable.git

Maybe the mirror is better
https://kernel.source.codeaurora.cn/pub/scm/linux/kernel/git//stable/linux.=
git

>
> >
> >If you have any questions and suggestions, please let me know.
> >
> >Thanks,
> >
> >Tiezhu Yang
> >
> >v2:
> >  - The split patch series about Loongson vendor ID and SATA controller
> >    has been merged into the linux-block.git by Jens Axboe [3].
> >
> >  - Think about using hierarchy IRQ domain in the patch of interrupt
> >    controller, and this maybe depend on the patch series by Jiaxun
> >    ("Modernize Loongson64 Machine"), so the patch about interrupt is
> >    not included in this v2 patch series.
> >
> >[1] git clone
> >https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
> >[2] git clone https://github.com/torvalds/linux.git
> >[3]
> >https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/co=
mmit/?h=3Dfor-next&id=3D9acb9fe18d86
> >https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/co=
mmit/?h=3Dfor-next&id=3De49bd683e00b
> >
> >Tiezhu Yang (3):
> >  MIPS: Loongson: Get host bridge information
> >  MIPS: Loongson: Add DMA support for 7A1000
> >  MIPS: Loongson: Add PCI support for 7A1000
> >
> > arch/mips/include/asm/mach-loongson64/boot_param.h | 20 ++++++
> > arch/mips/loongson64/dma.c                         |  9 ++-
> > arch/mips/loongson64/env.c                         | 20 ++++++
> > arch/mips/loongson64/init.c                        | 17 +++++
> >arch/mips/pci/ops-loongson3.c                      | 72
> >++++++++++++++++++++--
> > 5 files changed, 131 insertions(+), 7 deletions(-)
>
> --
> Jiaxun Yang
