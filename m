Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB59225C62
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jul 2020 12:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgGTKE4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Jul 2020 06:04:56 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:32825 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgGTKE4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Jul 2020 06:04:56 -0400
Received: by mail-io1-f65.google.com with SMTP id d18so16947847ion.0;
        Mon, 20 Jul 2020 03:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CM2+Zrnq9M8noNSG5Xi3kI72CDLisvB2MXVxJ1TJNrE=;
        b=i1tKeAkEz4EIKQo0ed0WsxilberMsZhRRz8FQUbO3drTEDvnt9aE3JxC47+23LkDL3
         FwdczPfqNQ90B8iwV0lr/tyhSxX71T4/nrV8aF5lGKv2SGvQw9pbs/QPMqhaIzRA7Ri6
         BvHx4AKuIyjHh68lW1zfe/U4laTpIQYCsP0Lzc5pZ6hmyHqde8ZL8Hkn4UWWeg4/Ne4B
         srM7L0I8hhi8aEDp4d+TuhdFB00wvSjiCp7SkBDyxR6zdBLCcE+W5Q5wCVxrKleUtzCB
         DvAH8aBQVSauLISzBkqPgPT7KKK2t5f+6YDyVm4w2h+KW+tbQwf1vFkBVtZ7HmuPbUrf
         iDFA==
X-Gm-Message-State: AOAM530371qOjDK8PWzpoTs0btU9/HMF4kso1+5f4NNgJtOSVaUjIIwy
        rk3hAmrPiAiIKru+9RNfbMtC/X2EDOIWaXS0cZw=
X-Google-Smtp-Source: ABdhPJxagtFSFjh/gohNerQfF8vhoW3BuaMsvkdkTMYmVAmJVpu+reiILn4UMsx8vQOZa3f0UcEMP/SyStaIKZ6QTgw=
X-Received: by 2002:a05:6638:1308:: with SMTP id r8mr15956587jad.106.1595239494941;
 Mon, 20 Jul 2020 03:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200720074249.596364-1-jiaxun.yang@flygoat.com> <20200720074249.596364-6-jiaxun.yang@flygoat.com>
In-Reply-To: <20200720074249.596364-6-jiaxun.yang@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 20 Jul 2020 18:04:43 +0800
Message-ID: <CAAhV-H4i52bxu=fnGhZ=OD0HWC9G2MJ-EN-cSzRNA_9GgBmXPg@mail.gmail.com>
Subject: Re: [PATCH 5/5] MIPS: Loongson64: Add ISA node for LS7A PCH
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Mon, Jul 20, 2020 at 3:48 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Although currently we're not enabling any ISA device in devicetree,
> but this node is required to express the ranges of address reserved
> for ISA.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> index 1c286bb8c703..724929ea3f5f 100644
> --- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> +++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> @@ -19,6 +19,13 @@ pic: interrupt-controller@10000000 {
>                         #interrupt-cells = <2>;
>                 };
>
> +               isa {
> +                       compatible = "isa";
> +                       #address-cells = <2>;
> +                       #size-cells = <1>;
> +                       ranges = <1 0 0 0x18000000 0x20000>;
> +               };
> +
Maybe it is better to define isa after pci, which keeps the
consistency as rs780e.

Huacai
>                 pci@1a000000 {
>                         compatible = "loongson,ls7a-pci";
>                         device_type = "pci";
> --
> 2.28.0.rc1
>
