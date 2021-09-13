Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE24408290
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 03:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233133AbhIMBd3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Sep 2021 21:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236850AbhIMBd1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 12 Sep 2021 21:33:27 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5865C061764
        for <linux-mips@vger.kernel.org>; Sun, 12 Sep 2021 18:32:12 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id b7so10014745iob.4
        for <linux-mips@vger.kernel.org>; Sun, 12 Sep 2021 18:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1X6N0prVB5OSdKcTzGOmhuFd14vDRHI0BUdVD+NwtDY=;
        b=NeK1r0D8IH0RO7FC0R7Gw4ZES+F6YJqMnlJhIAyIJ5DzB+YpcqHBpVnBxAAl7voRod
         OtMLeGJ71FEPUaVRijcTRHvCfqqFuHFK26dWDK73uJxLnpAqaYNguG/yReLOmHELBLQG
         slt531kpy4cP1rD1nPMyRz6bFFHJRwZ6RSGIxcDrn34HegTf/PPGF54KZes80bolnQOS
         oWg3/mHYGv1hxRILmtTbCGkWFy1DKWRNkjBznSAUYuhrWqrV/cnGvHujAFqFwOzjMboO
         TrN/14NA76xbSmJprBcXn1ckJzsREZnapa/ttXR/IryJCgp4kxy1bi10V7yjkNbHIeqw
         jJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1X6N0prVB5OSdKcTzGOmhuFd14vDRHI0BUdVD+NwtDY=;
        b=Tf5clLBjDthBpmZyGmwQmzklBHEakFiaTrSkMq3EgQHDKsmnriUOoV+nmuYinuaqjH
         goebqbQSDP63b330DIkdjsr5qlOD6kduAUj6kVzone28fg/pm7O9hxEeyPFQMC/xQ4mh
         IgHCFM5YHvIQJdLaBbheeovUTNP3jTg8/3KD7lDWDHrON2CkUpf6TApJkN7zrxRvgrEt
         i/vTPL+HLjBcPYUzoC0uCd+6CBeZqxMXL0uTkYMBEEpln+RdBXuDY+K9JNKKkAHJVTtR
         UWLU861IgOWuE2EgeWdirzn8A+GfOwLPIBNhZOVtkxaZMpsvg5YKLJvdDilwBlKCXrjj
         EZyA==
X-Gm-Message-State: AOAM533nnBoOxtHVVw74CACJTRxIHu7/RVY9bKWLrzKzjPgGm5v4mhAq
        4LqZV4XypjN74iL0XetrrAhvgKEcPjXhD6kPNes=
X-Google-Smtp-Source: ABdhPJzDyFos2QdEhfspsBA0fWje/jKf3TGyPBvQKvwyRPHQc5Cn7gDUfzM/0+m12IJxUf0FLUK4KKmp3NhrkHRoc/I=
X-Received: by 2002:a05:6638:4195:: with SMTP id az21mr7517479jab.40.1631496732372;
 Sun, 12 Sep 2021 18:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210912061356.1723912-1-wanghaojun@loongson.cn> <eea34c97-bb3c-4b36-9f85-18a07fd004a8@www.fastmail.com>
In-Reply-To: <eea34c97-bb3c-4b36-9f85-18a07fd004a8@www.fastmail.com>
From:   =?UTF-8?B?5rGf5rWB5YS/?= <jiangliuer01@gmail.com>
Date:   Mon, 13 Sep 2021 09:32:01 +0800
Message-ID: <CAPhSAwvJmfCD5yF21r79qgG+MkAYD-0L32hHU58m_4Hocuwhug@mail.gmail.com>
Subject: Re: [PATCH] MIPS: loongson64: Fix no screen display during boot-up
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

CONFIG_FRAMEBUFFER_CONSOLE  is enabled in this config file, but
CONFIG_FRAMEBUFFER_CONSOLE depends on CONFIG_FB and CONFIG_FB is not
selected in this file. This which causes CONFIG_FRAMEBUFFER_CONSOLE to
be unchecked, So it causes these problems.so I selcted CONFIG_FB in
this config file.

Jiaxun Yang <jiaxun.yang@flygoat.com> =E4=BA=8E2021=E5=B9=B49=E6=9C=8812=E6=
=97=A5=E5=91=A8=E6=97=A5 =E4=B8=8B=E5=8D=883:57=E5=86=99=E9=81=93=EF=BC=9A
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
