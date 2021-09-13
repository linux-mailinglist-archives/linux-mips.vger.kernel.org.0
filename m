Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF15408A7D
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 13:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238934AbhIMLvE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Sep 2021 07:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbhIMLvE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Sep 2021 07:51:04 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F2AC061574
        for <linux-mips@vger.kernel.org>; Mon, 13 Sep 2021 04:49:48 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id q3so11608721iot.3
        for <linux-mips@vger.kernel.org>; Mon, 13 Sep 2021 04:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GYZ20Cle2sML2ihjz99RJ8HFtNYnChuT4C/DpYpSn7o=;
        b=Cf94QK5IFI3zoTxAbyzGBeCCOHJQNjjP5ykguUyMkNrDyaMX97FT2afx631tesiKmh
         RqNabMKYqhjCLw6D6nRcQdp+VZ7S/y8Cbq7N3ZsHkvOQcJbr51WkkzgB55iYtgEqdAFf
         Mbrz0hDlt3pADZbS9Q/MvXRXUt0NrBH24c4pp2wmAs+yVM33WCkF5p6/nhqVxxUz43BY
         AGGts2BakIt9mmdm/2rfccjZag5VMmcQdrU1kRiVL6N9qi8DNWAyK/MM6BB/oQjSWgw9
         eBkFeG+n8Cp38ACACnI+A42BCr1fNAHs0q5hM5c4y3gTDPrmEo/H0ftuR4qMy5bH3i+p
         qhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GYZ20Cle2sML2ihjz99RJ8HFtNYnChuT4C/DpYpSn7o=;
        b=GeVRQ6BAFAgWkRG0pD4zXQv08tjananihSX/74QocvCEdmhHBwngnVeMhWYD6AmfRk
         x5Dd7kIuf8BUkyIQAe7PyR0mHwGhjTOK/VNT43TD5jVRDUwA/NGU6EokWs68QxmC6kQT
         YUWcdTm31KCKgZsqHmKuoLhMyTQNDLy2YGzXqZUnIM64TOvtNu1BUf19iyqcvRVMG5Ji
         Gx8hMgx0VWmqbyezcADL6ZQA3747jKue3/btrhrwphK0IqG3sNs6jghDk5eWK4v4DHeU
         ZOf4bl7SNJonAI+h6z7UiUXTVOeldRun2Nz+/Vh5kOkN+dMiVeLtXJOAZrTwwoRCaK69
         0fcw==
X-Gm-Message-State: AOAM533siaFtWIBHCpGqQ53QW1wWInhEbJ4/gUTqic93QNTTfXKTWO3X
        VlgrCLElA5dcHVMx/K9pmXEh5Qbs7fZCnIdwCAXJ+1wLQLs8I6Oy1qU=
X-Google-Smtp-Source: ABdhPJzyhlWYr7fqKal9GMYhRCxHGISIQZ9oFx+hCiMKBdUpBREgqcfJpTJGVPAK0egM7bA7sHF2AqUZrevwHoykSNA=
X-Received: by 2002:a6b:fd1a:: with SMTP id c26mr8334227ioi.57.1631533787942;
 Mon, 13 Sep 2021 04:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210913092856.3204631-1-wanghaojun@loongson.cn> <6984ca2f-658f-cdf0-86a7-ccc57ace2622@flygoat.com>
In-Reply-To: <6984ca2f-658f-cdf0-86a7-ccc57ace2622@flygoat.com>
From:   =?UTF-8?B?5rGf5rWB5YS/?= <jiangliuer01@gmail.com>
Date:   Mon, 13 Sep 2021 19:49:37 +0800
Message-ID: <CAPhSAwu63LQttvqfXHB3EpyHSVM6KZ1ecAHzy2c9icYfKppdNw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: loongson64: configs: Update loongson3_defconfig
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Li Xuefeng <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Sorry, this was supposed to be v2, I updated this commit message but
because of my sloppiness, I forgot to add the v2 tag.

Jiaxun Yang <jiaxun.yang@flygoat.com> =E4=BA=8E2021=E5=B9=B49=E6=9C=8813=E6=
=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=887:29=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> =E5=9C=A8 2021/9/13 10:28, Wang Haojun =E5=86=99=E9=81=93:
> > The Framebuffer CONFIG_FB needs to be explicitly selected or we
> > don't get any framebuffer anymore. DRM has stopped to select FB
> > after commit f611b1e7624ccdbd495c19e98056 ("drm: Avoid circular
> > dependencies for CONFIG_FB") because of circular dependency. So
> > we should enable it in the default config file, otherwise there
> > is no display before Xorg.
> >
> > Signed-off-by: Wang Haojun <wanghaojun@loongson.cn>
> > reviewed-by: Huacai Chen <chenhuacai@kernel.org>
> > reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> Any readons for resending this patch?
>
> Thanks.
>
> - Jiaxun
>
> > ---
> >   arch/mips/configs/loongson3_defconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/=
loongson3_defconfig
> > index f02101ff04b3..25ecd15bc952 100644
> > --- a/arch/mips/configs/loongson3_defconfig
> > +++ b/arch/mips/configs/loongson3_defconfig
> > @@ -282,6 +282,7 @@ CONFIG_DRM=3Dy
> >   CONFIG_DRM_RADEON=3Dm
> >   CONFIG_DRM_QXL=3Dy
> >   CONFIG_DRM_VIRTIO_GPU=3Dy
> > +CONFIG_FB=3Dy
> >   CONFIG_FB_RADEON=3Dy
> >   CONFIG_LCD_CLASS_DEVICE=3Dy
> >   CONFIG_LCD_PLATFORM=3Dm
>
