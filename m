Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEFD51E7468
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 06:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbgE2ENu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 00:13:50 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45690 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgE2ENt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 00:13:49 -0400
Received: by mail-io1-f68.google.com with SMTP id y5so883032iob.12;
        Thu, 28 May 2020 21:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ABZvl1lYM8QmTi5wYB82oie/IHyifCzA4I+u8FVXCCk=;
        b=M+F0feJLse2P2zSVkvT0MZzYb8c16WgZysW4VuP39Qugg1+4LbukY6YrkKiGLcyNMA
         vgW/clZBODJTAf2IXIOW+wiVyTrAtRtUbRDYWHl/penhd/7gzAXgwrsUo5xKivw+AEyg
         uWCMx0Fd6v0+4CVFV8KYFfr81Yn9KVmE3kJWLYmi4a16rwLSmK/FXZnlalA30xFsYjDc
         Ui+yFb2UmTzuaOO605Ui5KAlTmDtmivbGpNNuM5wD8d3PUMzPIgYneoc/Z7URRUdhiI7
         wXmRrRXtC8Gcd9Z+sziDa8JxKJtP2h8XofqFBVz1tEyzcElnfoHYIYyW3N4Td3J2rcUK
         qseQ==
X-Gm-Message-State: AOAM53243GMdpL2TL5COLHPYy7nzBjTaGrckPtL3hEDwXTn5sTSAdaU7
        ySjVIsb8BiZe6vaK+ygc/vj0gMNk47RGkTQOxmk=
X-Google-Smtp-Source: ABdhPJybBRL6g2+y9ues5WQUZezbWfYKjLjV6r21ZAwE6BCNViK/CnxVBl3JYWz06stSzVCdBYSnlGcrd9zuIMbZ7qI=
X-Received: by 2002:a5d:9cc2:: with SMTP id w2mr5176349iow.42.1590725627953;
 Thu, 28 May 2020 21:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200529034338.1137776-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20200529034338.1137776-1-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Fri, 29 May 2020 12:13:36 +0800
Message-ID: <CAAhV-H5B+6drcEiz=JCexa0LC3JAPS0K5WZ0zwndvuKv-e9NRQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] MIPS: Loongson64: Initial LS7A PCH support
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Fri, May 29, 2020 at 11:45 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> With this series, LS7A and Loongson-3A4000 is finally supported
> note that this series should depend on irqchip support[1], which
> is likely to get merged soon.
>
> Thanks.
>
> [1]: https://lkml.org/lkml/2020/5/16/72
>
> Jiaxun Yang (3):
>   dt-bindings: mips: Document two Loongson generic boards
>   MIPS: Loongson64: DeviceTree for LS7A PCH
>   MIPS: Loongson64:Load LS7A dtbs
>
>  .../bindings/mips/loongson/devices.yaml       |   8 +
>  arch/mips/boot/dts/loongson/Makefile          |   5 +-
>  .../dts/loongson/loongson3-r4-package.dtsi    |  74 +++++++
>  .../dts/loongson/loongson3_4core_ls7a.dts     |  25 +++
>  .../boot/dts/loongson/loongson3_r4_ls7a.dts   |  10 +
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     | 185 ++++++++++++++++++
>  .../asm/mach-loongson64/builtin_dtbs.h        |   2 +
>  arch/mips/loongson64/env.c                    |  56 +++---
>  8 files changed, 342 insertions(+), 23 deletions(-)
>  create mode 100644 arch/mips/boot/dts/loongson/loongson3-r4-package.dtsi
>  create mode 100644 arch/mips/boot/dts/loongson/loongson3_4core_ls7a.dts
>  create mode 100644 arch/mips/boot/dts/loongson/loongson3_r4_ls7a.dts
>  create mode 100644 arch/mips/boot/dts/loongson/ls7a-pch.dtsi
I think the naming can be like this: Old processor (Loongson 3A R1~R3)
use loongson64c_ prefix instead of loongson3, new processor (Loongson
3A R4) use loongson64g_ prefix instead of loongson3_r4, and
Loongson-2K use loongson64r_ prefix, this makes them consistent with
their PRID definitions.

>
> --
> 2.27.0.rc0
>
