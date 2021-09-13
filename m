Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035F64082D1
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 04:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236922AbhIMC1S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Sep 2021 22:27:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:54494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235364AbhIMC1S (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Sep 2021 22:27:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D3E26109D
        for <linux-mips@vger.kernel.org>; Mon, 13 Sep 2021 02:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631499963;
        bh=crNbgU+t8e64PprCm4H6EbvuJsbVPtYHjYjeL8ddm/k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Zm+cbW1RD4b2aoWJg7xo0RrIs4s4u5/lEob1LUJwms6T+ii17n0aNmQq9yW3447Pb
         stAqhw6QcsjZN1wvmyH9/ISFpV0izlhu58Jm7qU5pVZtuVW/vCScSpPZgASaYHystU
         utcNWHnKy2rxdgv00v9T4Hsr67432YGDlFetD16JFFwVgt1c72yxN4Jnu9CVCa7GyF
         25YhP9mNpQasoAVZLkfZqi6vVXhiDpRCKF3hfe/nJiR5Yu4amBMadwkqIMmCITuuyV
         Lnc9Uy/wAQkp63OiZZFNUclF338NLnao9HmjjrBHEiO5UIsLLc8udmcFc6Wy9ZTT0u
         XqCDebs5vquHg==
Received: by mail-vk1-f179.google.com with SMTP id s125so1485178vkd.4
        for <linux-mips@vger.kernel.org>; Sun, 12 Sep 2021 19:26:03 -0700 (PDT)
X-Gm-Message-State: AOAM531spjoz3UNswbs54BwFVEfCmGzYk5r5XTMWVR3hdf0vbUkXUn1T
        oyDNumNjAowbRWNZ6IW2FJPwYn/set5eOWWkRaE=
X-Google-Smtp-Source: ABdhPJyl/v23v7H+5UDnyNW1LBy1gRXNIKtZNQ3dh6QeS3gRJ0eIRlYJoCLa3eNmMRMRoRfdkuEckniFB3I3EJOTLG8=
X-Received: by 2002:a1f:9781:: with SMTP id z123mr3261669vkd.25.1631499962682;
 Sun, 12 Sep 2021 19:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210912061356.1723912-1-wanghaojun@loongson.cn> <eea34c97-bb3c-4b36-9f85-18a07fd004a8@www.fastmail.com>
In-Reply-To: <eea34c97-bb3c-4b36-9f85-18a07fd004a8@www.fastmail.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Mon, 13 Sep 2021 10:25:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H79b6jwbrL2MjXxLBUcEku_6C8sB4_BWZhjhUNPqCSv5g@mail.gmail.com>
Message-ID: <CAAhV-H79b6jwbrL2MjXxLBUcEku_6C8sB4_BWZhjhUNPqCSv5g@mail.gmail.com>
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

Hi, Jiaxun,

On Sun, Sep 12, 2021 at 3:57 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote=
:
>
>
>
> =E5=9C=A82021=E5=B9=B49=E6=9C=8812=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8A=
=E5=8D=887:13=EF=BC=8CWang Haojun=E5=86=99=E9=81=93=EF=BC=9A
> > This is no display on the screen during boot-up when using latest
> > loongson3_defconfig, because CONFIG_FRAMEBUFFER_CONSOLE=3Dy depends
> > on CONFIG_FB=3Dy in this file.
>
> Hi Haojun,
>
> It won't work unless you get LS7A dc driver upstreamed or amdgpu firmware=
 resolved.
>
> Thanks.
This patch has nothing to do with LS7A DC or amdgpu firmware. The
problem is before commit f611b1e7624c ("drm: Avoid circular
dependencies for CONFIG_FB"), FB and FRAMEBUFFER_CONSOLE are selected
by default. But after that it is unselected so we should enable it in
the default config file, otherwise there is no display before Xorg
(even after the GPU driver is loaded, because we have no FB console).

Huacai
>
> >
> > Signed-off-by: Wang Haojun <wanghaojun@loongson.cn>
> > ---
> >  arch/mips/configs/loongson3_defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/mips/configs/loongson3_defconfig
> > b/arch/mips/configs/loongson3_defconfig
> > index f02101ff04b3..25ecd15bc952 100644
> > --- a/arch/mips/configs/loongson3_defconfig
> > +++ b/arch/mips/configs/loongson3_defconfig
> > @@ -282,6 +282,7 @@ CONFIG_DRM=3Dy
> >  CONFIG_DRM_RADEON=3Dm
> >  CONFIG_DRM_QXL=3Dy
> >  CONFIG_DRM_VIRTIO_GPU=3Dy
> > +CONFIG_FB=3Dy
> >  CONFIG_FB_RADEON=3Dy
> >  CONFIG_LCD_CLASS_DEVICE=3Dy
> >  CONFIG_LCD_PLATFORM=3Dm
> > --
> > 2.27.0
> >
> >
>
>
> --
> - Jiaxun
