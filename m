Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D22B1E79B3
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 11:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgE2Jrh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 29 May 2020 05:47:37 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:45927 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgE2Jrh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 05:47:37 -0400
Received: by mail-io1-f65.google.com with SMTP id y5so1609967iob.12;
        Fri, 29 May 2020 02:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OfElml7yhf6Z5HsY5EprK27AdaqzJIHqrLNGeQYTUtU=;
        b=RU8558+eITsDuz1ZlX+eBUgZ3DYHmfou4CJKxjPyNzDODnSvHehllPpr7LTz9P93Gt
         kaH/55SHg4nweIlHYt4FRlj/IzWlA0QNEABWlJ8HDTZEhD9WwH6Pgv7ZhGRzhwoW4hHZ
         qqM2a+WJJNQ3lHP0BOi9WmX9slDOQkXqF6x9jqK/APzrPVxnK/zYW19A8vdLd5fVajZ/
         35GJUvr5Wj901gRaYYDE8MfyVGTLaxh5hKoXWCsMf2rrr0aMjyORZaefHc0wY8u5f7yR
         tuYhw2//wKNuXU4zIdRE9teo7NnwNp309u1zYfiMc+pV3CHDdo79aRg+ZOjj4CnYlu6k
         mEsw==
X-Gm-Message-State: AOAM53054ys+shZ1A7EINKUqYTDg6zJxRswi5Si+dulT9cI55nN5Tby0
        5PMFBCgGl88YFZFlA5NCyk9SlP+OJnzv8cIzWZs=
X-Google-Smtp-Source: ABdhPJwSWsT9jQI/F3K1Uk5LK241Sz0Q8lWZsuPi949qyceEuDr2zel6BLbhXVZkIXiiKF1EEU9w+uKgAKo/HHxNjHI=
X-Received: by 2002:a02:958e:: with SMTP id b14mr6500889jai.126.1590745655399;
 Fri, 29 May 2020 02:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200529034338.1137776-1-jiaxun.yang@flygoat.com>
 <CAAhV-H5B+6drcEiz=JCexa0LC3JAPS0K5WZ0zwndvuKv-e9NRQ@mail.gmail.com> <82608FDB-FEF8-45FA-85D7-236B46F906B7@flygoat.com>
In-Reply-To: <82608FDB-FEF8-45FA-85D7-236B46F906B7@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Fri, 29 May 2020 17:47:24 +0800
Message-ID: <CAAhV-H6ib4K4O3KHuv96iqQd+xbrvC4kYoCut634XzxrgTxu=Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] MIPS: Loongson64: Initial LS7A PCH support
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Fri, May 29, 2020 at 12:37 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
>
> 于 2020年5月29日 GMT+08:00 下午12:13:36, Huacai Chen <chenhc@lemote.com> 写到:
> >Hi, Jiaxun,
> >
> >On Fri, May 29, 2020 at 11:45 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >>
> >> With this series, LS7A and Loongson-3A4000 is finally supported
> >> note that this series should depend on irqchip support[1], which
> >> is likely to get merged soon.
> >>
> >> Thanks.
> >>
> >> [1]: https://lkml.org/lkml/2020/5/16/72
> >>
> >> Jiaxun Yang (3):
> >>   dt-bindings: mips: Document two Loongson generic boards
> >>   MIPS: Loongson64: DeviceTree for LS7A PCH
> >>   MIPS: Loongson64:Load LS7A dtbs
> >>
> >>  .../bindings/mips/loongson/devices.yaml       |   8 +
> >>  arch/mips/boot/dts/loongson/Makefile          |   5 +-
> >>  .../dts/loongson/loongson3-r4-package.dtsi    |  74 +++++++
> >>  .../dts/loongson/loongson3_4core_ls7a.dts     |  25 +++
> >>  .../boot/dts/loongson/loongson3_r4_ls7a.dts   |  10 +
> >>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     | 185 ++++++++++++++++++
> >>  .../asm/mach-loongson64/builtin_dtbs.h        |   2 +
> >>  arch/mips/loongson64/env.c                    |  56 +++---
> >>  8 files changed, 342 insertions(+), 23 deletions(-)
> >>  create mode 100644 arch/mips/boot/dts/loongson/loongson3-r4-package.dtsi
> >>  create mode 100644 arch/mips/boot/dts/loongson/loongson3_4core_ls7a.dts
> >>  create mode 100644 arch/mips/boot/dts/loongson/loongson3_r4_ls7a.dts
> >>  create mode 100644 arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> >I think the naming can be like this: Old processor (Loongson 3A R1~R3)
> >use loongson64c_ prefix instead of loongson3, new processor (Loongson
> >3A R4) use loongson64g_ prefix instead of loongson3_r4, and
> >Loongson-2K use loongson64r_ prefix, this makes them consistent with
> >their PRID definitions.
>
>
> DeviceTree bindings have stable ABI. Although they're currently
> only used internally in Kernel. I don't think it's a good idea
> to rename existing bindings.
I think consistency is important, and this renaming doesn't break anything.

>
> Also, Loongson64C/64G/64R never came to a part of Loongson's
> official naming. I doubt if end users will recognize these names.
>
> I'd prefer keep naming as is. It's really not a big deal.
>
> Thanks.
>
>
> >
> >>
> >> --
> >> 2.27.0.rc0
> >>
>
> --
> Jiaxun Yang
