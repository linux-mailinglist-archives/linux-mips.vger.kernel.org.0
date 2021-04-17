Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD99436329A
	for <lists+linux-mips@lfdr.de>; Sun, 18 Apr 2021 01:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhDQXCk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Apr 2021 19:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhDQXCj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 17 Apr 2021 19:02:39 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC3DCC06174A;
        Sat, 17 Apr 2021 16:02:12 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 65so34332902ybc.4;
        Sat, 17 Apr 2021 16:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=v+fGXEgbrGdx6+TuWWCXqx2OMPgyqor4usSIuoCSShg=;
        b=M45uwCOeLF0d6j5kXIG+MhQqV21BKFs+kyQ4xbO/8ZSCu7dNgReLnkamB+6Nl6sxg0
         Jz/PmcOWFAHW1o+gFjblHHFKtpkrI844GlzV4XPHupYokB4rdWMdYp420iXbRJdXG6cl
         R2ecldc1qDqgmQ1WPqemqIfab1u+jBe+XPseDSdKB1x+CPNRppCf+gE/EFqy7iZl+YHu
         fegrjX2h3UmjhCMaBGQwzYfzmYlwFuDAK0t1L+9ZfNPJKkp2mAExOlNN/ZRHxU+PoqYV
         yDFNvrwaISKJRBki6QkMPjlWBvgNnH7Xga9s3dp12q9njT1gPGoNnonLm69vG5RRdK9X
         Phog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=v+fGXEgbrGdx6+TuWWCXqx2OMPgyqor4usSIuoCSShg=;
        b=DtuQihbfAf1mcYETDs2PylFpxcwo5kxCHRK7nh4Xjh1XwE5t3o1hmO8c5cfW0Lopf1
         82l7YCPyUpDHZliL5UeXRAumpS610viamIXYH+cNP9E5FAaDcXW26KzplnPbbQElE4sM
         w5GE5FNfLKiRyHn9mA/LpdlwfTKXuLncFOCamVuYgYsCNR7tU1abBTSIQ/eNkZ3MBBof
         ioUtIes04iiiFw+fE+vpgjYT1XgWAZJ5HpnRweT5DA1vq/VXOMLxzqx/X99zCWMesPLP
         xVIoH9oRzIyaZbAsFcF85t6f14ZPicafF6Ae5dYHVCo8X0FIryKWc7wHxZP5Uli8IXFx
         0yjA==
X-Gm-Message-State: AOAM531bPB0AXYyGwNbMGffMxgTr7ZTpDm9OQrh6vn91jvycEoVtFldg
        AGOoNbj1BLv2Q0ZxqOEzDgprI7C5fiKnJVfW7JQLisVMHLw=
X-Google-Smtp-Source: ABdhPJzPzQ2oj8Xxg/k3WiOoJwOG30R67LsSPAR0IuQvYCF220ed2cTehc/D0ffmvbBqumj+e7OEZJxgaWoml6sz/kw=
X-Received: by 2002:a25:244e:: with SMTP id k75mr8141951ybk.342.1618700532214;
 Sat, 17 Apr 2021 16:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <YG35ULOblq/gUZmh@debian> <CAKcpw6VrbA2+mq42=0FjE7Y9e6OM-Q9WxvYPWtAF4t0hRWKB1A@mail.gmail.com>
 <20210409121637.GA13010@alpha.franken.de>
In-Reply-To: <20210409121637.GA13010@alpha.franken.de>
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date:   Sun, 18 Apr 2021 00:01:36 +0100
Message-ID: <CADVatmPcL0YF0h6cnUbyo-4xp1re1DTARGKpq9_DYp+hTsueVw@mail.gmail.com>
Subject: Re: build failure of malta_qemu_32r6_defconfig
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     YunQiang Su <wzssyqa@gmail.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Fri, Apr 9, 2021 at 1:17 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, Apr 08, 2021 at 09:42:11AM +0800, YunQiang Su wrote:
> > Sudip Mukherjee <sudipm.mukherjee@gmail.com> =E4=BA=8E2021=E5=B9=B44=E6=
=9C=888=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:26=E5=86=99=E9=81=93=
=EF=BC=9A
> > >
> > > Hi Thomas,
> > >
> > > I was building v5.10.28 with malta_qemu_32r6_defconfig and noticed th=
at
> > > it fails to build, so tried next-20210407 to see if it has been fixed=
.
> > > But linux-next also has the issue with gcc-10.
> > >
> > > The error is:
> > >
> > > ./arch/mips/include/asm/vdso/gettimeofday.h: In function '__vdso_cloc=
k_gettime':
> > > ./arch/mips/include/asm/vdso/gettimeofday.h:103:2: error: the registe=
r 'lo' cannot be clobbered in 'asm' for the current target
> > >   103 |  asm volatile(
> > >       |  ^~~
> >
> > this operation try to save lo and hi register, while they are not
> > exisiting on r6.
> > We are working on figure out a patch for it.
>
> looks like there is already a patch in patchwork, which just needs
> a workup:
>
> https://patchwork.kernel.org/project/linux-mips/patch/20200801154401.4177=
009-1-romain.naour@gmail.com/

Looks like there has been no response to it since last 8 months. Do
you want me to respin it and send a proper patch?


--
Regards
Sudip
