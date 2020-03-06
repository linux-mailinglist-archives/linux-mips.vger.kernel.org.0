Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA5B17BFDA
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 15:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgCFOF4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 6 Mar 2020 09:05:56 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:40632 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgCFOF4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 09:05:56 -0500
Received: by mail-qv1-f65.google.com with SMTP id u17so951817qvv.7
        for <linux-mips@vger.kernel.org>; Fri, 06 Mar 2020 06:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oqRlMWgdEsVveAh7gJOqWXplXzbgqFBkMqSkT0cieDk=;
        b=a5KEghzHaI9eGqk3YD/oLuywRxr5mkTHhzTK0yZBaH3M6BmaGWf487x8N8W9Q49sL1
         dR5pQVkHO3m7gJ1RbxvNPcSPvYjCDOIWfMnffAObdTuelkfDChFmUr8VO3UGuYGrzgo0
         7pBqwbmVUC/ZfBLtp80oqqvXvSxhDtoLH+kBDkjCul1QRSmkaL4Lc8wusJxZfLIKlTuz
         vi7nmHdEbaK1prqlcevXTwaVq78aVFw4/VhI1qQsyiHVHSa7+T1bOx0mb545O6tV0tHq
         3EmaSWuMcu+6EXaGKQnfKzT+XxbMqz/jqa4wp14jzIGv55RfcbvCn9GXt+W8ubMltqiE
         63yg==
X-Gm-Message-State: ANhLgQ2JmbaIlAqsUVMvHgqJ58jdCgaS6Yu5cPd7IFDrvo6B2bQQ/iOO
        LXRY46U8N82D5DENvhr6WBLS7kVPNqY8rXZwOnfFguJH
X-Google-Smtp-Source: ADFU+vvE7jooon2QKCanu2nRmL0TFdM1v12o9+byygzfNybEsOroGnTtAaUty2XnvT53+bCHcEWNkTyXYcejsGIUL84=
X-Received: by 2002:a0c:b669:: with SMTP id q41mr2964744qvf.20.1583503555221;
 Fri, 06 Mar 2020 06:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20200302022209.82874-1-syq@debian.org> <20200306134858.GA11459@alpha.franken.de>
In-Reply-To: <20200306134858.GA11459@alpha.franken.de>
From:   YunQiang Su <syq@debian.org>
Date:   Fri, 6 Mar 2020 22:05:44 +0800
Message-ID: <CAKcpw6VyPbifM4OXS3OrHCVzCU8i4EjPraZXugKrG7JrQnZ4sA@mail.gmail.com>
Subject: Re: [PATCH v2] Use ELF_BASE_PLATFORM to pass ISA level
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thomas Bogendoerfer <tsbogend@alpha.franken.de> 于2020年3月6日周五 下午9:49写道：
>
> On Mon, Mar 02, 2020 at 10:22:10AM +0800, YunQiang Su wrote:
> > Some userland application/program runtime/dynamic loaded need to
> > know about the current ISA level to use the best runtime.
> > While kernel doesn't provides this info.
> >
> > ELF_PLATFORM only provides some info about the CPU, with very few info,
> > for example, the value is "mips" for both 24Kc and P6600.
> >
> > Currently ELF_BASE_PLATFORM is not used by MIPS (only by powerpc).
> > So we cant set its value as:
> >   mips2, mips3, mips4, mips5,
> >   mips32, mips32r2, mips32r6
> >   mips64, mips64r2, mips64r6
> > Then in userland, we can get it by:
> >   getauxval(AT_BASE_PLATFORM)
> >
> > The only problem is that it seems has different defination than ppc:
> >   on ppc, it is the mircoarchitecture
> > while now we use it as ISA level on MIPS.
>
> while I see how this could be used, it feels incomplete to me. What
> about implemented ASEs ? Can't you just use information already present

ASEs can be get by hwcap thu getauxval in userland.

> in /proc/cpuinfo ?

cpuinfo is not always available, for example in some chroot env.
Lot's of userland projects doesn't like to the way to parse cpuinfo,
they prefer to get the info by a more elegant way.

>
> > diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
> > index f8f44b1a6cbb..5aa29ced6970 100644
> > --- a/arch/mips/include/asm/elf.h
> > +++ b/arch/mips/include/asm/elf.h
> > @@ -2113,6 +2130,7 @@ EXPORT_SYMBOL(__ua_limit);
> >
> >  const char *__cpu_name[NR_CPUS];
> >  const char *__elf_platform;
> > +const char *__elf_base_platform = NULL;
>
> no need to init static data with 0
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
