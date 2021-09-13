Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F4B4083AD
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 07:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhIMFFf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Sep 2021 01:05:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:46660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229722AbhIMFFf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Sep 2021 01:05:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1206760FA0
        for <linux-mips@vger.kernel.org>; Mon, 13 Sep 2021 05:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631509460;
        bh=lxN0qP0COT0rwmrJlABqvhG+IyOIJtPpHHvmo/SxT9E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FCaJl4Om14J9ljuyH3KeJ3s/N8C9Gfi0OPP0APEi/IpUTAbXdoltm6YAv3p/IdPeo
         L90TSNDT6G9XetfmrGBLKIk0mQzt7RZFHk6lPyOT4vKnabaf9pTGFScaRyGJ/0ACjh
         /fClbxej5+rjgdaUUU+t+m86qnDnW9kzyoFUy31DN0ImAICNM9TK0GcfKWfHUlYgR2
         p7T6bRnmg14mMzw3+adL/crBs6wxEYikZ18msHCi5siqoYoiJQSQsUI39QYoRs6LCm
         NNSysCNtlstYGcSafixA8joFPaWsqzQykgopH54MDYSpwU21bwWZ32DR1TyXBEmMjL
         zCw990rq7fd1g==
Received: by mail-vk1-f173.google.com with SMTP id k124so2930886vke.5
        for <linux-mips@vger.kernel.org>; Sun, 12 Sep 2021 22:04:20 -0700 (PDT)
X-Gm-Message-State: AOAM531gQ9Xv1y+996wMZMqme8afAIe4WKxn0BptM5+fhV5lX81hC5td
        nWAQkz70ejt5hVH6ZGVSmMY8bAfVXsVlIR+Nz+Y=
X-Google-Smtp-Source: ABdhPJyPDDaTDjugGKt7AOxfAQH9O58U+h3a5YPB5FwWc+ZW8S026UF5N4sYp/SSH4DoQKXrH7QFbrjUQZGIcxz3SBE=
X-Received: by 2002:a05:6122:21ab:: with SMTP id j43mr3296860vkd.19.1631509459163;
 Sun, 12 Sep 2021 22:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210912061356.1723912-1-wanghaojun@loongson.cn>
 <eea34c97-bb3c-4b36-9f85-18a07fd004a8@www.fastmail.com> <CAPhSAwvJmfCD5yF21r79qgG+MkAYD-0L32hHU58m_4Hocuwhug@mail.gmail.com>
 <65fc84a6-23cd-4cf3-b7e3-02764d73c958@www.fastmail.com>
In-Reply-To: <65fc84a6-23cd-4cf3-b7e3-02764d73c958@www.fastmail.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Mon, 13 Sep 2021 13:04:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5h5w7HHsYAW6UKCd+mQr4JX4+_aj75n8=1L7jpg6H6HA@mail.gmail.com>
Message-ID: <CAAhV-H5h5w7HHsYAW6UKCd+mQr4JX4+_aj75n8=1L7jpg6H6HA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: loongson64: Fix no screen display during boot-up
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Wang Haojun <jiangliuer01@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Maybe the commit message can be improved.

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Mon, Sep 13, 2021 at 12:09 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrot=
e:
>
>
>
> =E5=9C=A82021=E5=B9=B49=E6=9C=8813=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8A=
=E5=8D=882:32=EF=BC=8C=E6=B1=9F=E6=B5=81=E5=84=BF=E5=86=99=E9=81=93=EF=BC=
=9A
> > Hi Jiaxun,
> >
> > CONFIG_FRAMEBUFFER_CONSOLE  is enabled in this config file, but
> > CONFIG_FRAMEBUFFER_CONSOLE depends on CONFIG_FB and CONFIG_FB is not
> > selected in this file. This which causes CONFIG_FRAMEBUFFER_CONSOLE to
> > be unchecked, So it causes these problems.so I selcted CONFIG_FB in
> > this config file.
>
> Oops, Sorry I get your point now.
>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> Thanks.
>
>
> >
> > Jiaxun Yang <jiaxun.yang@flygoat.com> =E4=BA=8E2021=E5=B9=B49=E6=9C=881=
2=E6=97=A5=E5=91=A8=E6=97=A5 =E4=B8=8B=E5=8D=883:57=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > >
> > >
> > > =E5=9C=A82021=E5=B9=B49=E6=9C=8812=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=
=8A=E5=8D=887:13=EF=BC=8CWang Haojun=E5=86=99=E9=81=93=EF=BC=9A
> > > > This is no display on the screen during boot-up when using latest
> > > > loongson3_defconfig, because CONFIG_FRAMEBUFFER_CONSOLE=3Dy depends
> > > > on CONFIG_FB=3Dy in this file.
> > >
> > > Hi Haojun,
> > >
> > > It won't work unless you get LS7A dc driver upstreamed or amdgpu firm=
ware resolved.
> > >
> > > Thanks.
> > >
> > > >
> > > > Signed-off-by: Wang Haojun <wanghaojun@loongson.cn>
> > > > ---
> > > >  arch/mips/configs/loongson3_defconfig | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/arch/mips/configs/loongson3_defconfig
> > > > b/arch/mips/configs/loongson3_defconfig
> > > > index f02101ff04b3..25ecd15bc952 100644
> > > > --- a/arch/mips/configs/loongson3_defconfig
> > > > +++ b/arch/mips/configs/loongson3_defconfig
> > > > @@ -282,6 +282,7 @@ CONFIG_DRM=3Dy
> > > >  CONFIG_DRM_RADEON=3Dm
> > > >  CONFIG_DRM_QXL=3Dy
> > > >  CONFIG_DRM_VIRTIO_GPU=3Dy
> > > > +CONFIG_FB=3Dy
> > > >  CONFIG_FB_RADEON=3Dy
> > > >  CONFIG_LCD_CLASS_DEVICE=3Dy
> > > >  CONFIG_LCD_PLATFORM=3Dm
> > > > --
> > > > 2.27.0
> > > >
> > > >
> > >
> > >
> > > --
> > > - Jiaxun
> >
>
>
> --
> - Jiaxun
