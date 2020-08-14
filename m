Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A164244FF5
	for <lists+linux-mips@lfdr.de>; Sat, 15 Aug 2020 00:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgHNWva (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Aug 2020 18:51:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:37054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726213AbgHNWva (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 14 Aug 2020 18:51:30 -0400
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 675D12224D;
        Fri, 14 Aug 2020 22:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597445489;
        bh=htFr2L7stDcDCXIGv/hhOio3Jcl0xCNKJ2kseITjPCo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cKqV9OFqvaHWEhTDf2LEI4Dje2q46a3LsQE+XNtXgU9lHhnBfwDHhSydghk3goqp5
         UFhyl34nlPNGAqvnyd6RwtINV8kwA9W9zUoSsGdjPeUzJ59tVQsSNDb2BytyQxhw7W
         shAFGcjtkPU5Lwbn6ItmRCBFTY0wR187iy/U4Tdo=
Received: by mail-oi1-f182.google.com with SMTP id l204so9505925oib.3;
        Fri, 14 Aug 2020 15:51:29 -0700 (PDT)
X-Gm-Message-State: AOAM533FEPxKh+sy30/61JwmPG2SYkY8hZ4upeIVCpcfE97yQfAxvPGE
        jxmaToLSAuDWJ/pwXn37ahlRgDVqyu3fWBIlHg==
X-Google-Smtp-Source: ABdhPJzwlsOE0vIZtVkxtrm2RpjdBQfDqtuIQWPloUyMh68cc38LPi5MX0gALl3aqsFJIm91AkoxqlumFe1fqqnHKFI=
X-Received: by 2002:aca:190c:: with SMTP id l12mr3031294oii.147.1597445488562;
 Fri, 14 Aug 2020 15:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200728153708.1296374-1-jiaxun.yang@flygoat.com>
 <20200728153708.1296374-2-jiaxun.yang@flygoat.com> <889508bae5da3c55690a7adbd101a5cd@kernel.org>
In-Reply-To: <889508bae5da3c55690a7adbd101a5cd@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 14 Aug 2020 16:51:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKVhxu_cdo_umhY_SfuDhCC0G-AdsPAZpGB3eepOVFi-g@mail.gmail.com>
Message-ID: <CAL_JsqKVhxu_cdo_umhY_SfuDhCC0G-AdsPAZpGB3eepOVFi-g@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] of_address: Add bus type match for pci ranges parser
To:     Marc Zyngier <maz@kernel.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 14, 2020 at 12:21 PM Marc Zyngier <maz@kernel.org> wrote:
>
> Hi all,
>
> On 2020-07-28 16:36, Jiaxun Yang wrote:
> > So the parser can be used to parse range property of ISA bus.
> >
> > As they're all using PCI-like method of range property, there is no
> > need
> > start a new parser.
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> This patch, although it looks correct, breaks the RK3399-based
> systems, as they miss the (now required) 'device_type = "pci";'
> property.

Required since 1990 something...

> We can fix the in-tree DT, but that's not really an option
> if someone relies on the DT being provided by the firmware
> (I for one definitely do).

Perhaps time to pay attention to schema errors:

arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml:
pcie@f8000000: 'device_type' is a required property

(I thought dtc would also catch this, but there we look for
device_type and then do PCI checks like node name. I guess we needed
to check for either device_type or the node name...)

> I came up with the following hack, which solves the issue for
> me. Definitely not my finest hour, but I really need this box
> to keep going. I will post a patch fixing the DT separately.
>
> Thanks,
>
>          M.
>
>  From ceef5fd9c4d2005eb577505c68868ebe527c098f Mon Sep 17 00:00:00 2001
>  From: Marc Zyngier <maz@kernel.org>
> Date: Fri, 14 Aug 2020 19:10:12 +0100
> Subject: [PATCH] of: address: Workaround broken DTs missing the
> 'device_type =
>   "pci"' property
>
> Recent changes to the PCI bus parsing made it mandatory for
> device trees nodes describing a PCI controller to have the
> 'device_type = "pci"' property for the node to be matched.
>
> Although this is compliant with the specification, it breaks
> existing device-trees that have been working fine for years
> (the Rockchip rk3399-based systems being a prime example of
> such breakage).
>
> In order to paper over the blunder, let's also match nodes
> that have the "linux,pci-domain" property, as they are
> pretty likely to be PCI nodes. This fixes the issue for
> systems such as the above platforms.
>
> Fixes: 2f96593ecc37 ("of_address: Add bus type match for pci ranges
> parser")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   drivers/of/address.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 590493e04b01..712e03781a2a 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -134,9 +134,12 @@ static int of_bus_pci_match(struct device_node *np)
>          * "pciex" is PCI Express
>          * "vci" is for the /chaos bridge on 1st-gen PCI powermacs
>          * "ht" is hypertransport
> +        * "linux,pci-domain" is a workaround for broken device trees
> +        * lacking the required "device_type" property.

I would suggest looking for 'pci' or 'pcie' node name instead.

You should remove linux,pci-domain from rk3399 as it is pointless when
there's a single PCI host bridge.

The other option is fixup the live tree with of_add_property() in the
Rockchip PCI driver. Less likely to impact anyone else.

>          */
>         return of_node_is_type(np, "pci") || of_node_is_type(np, "pciex") ||
> -               of_node_is_type(np, "vci") || of_node_is_type(np, "ht");
> +               of_node_is_type(np, "vci") || of_node_is_type(np, "ht") ||
> +               of_find_property(np, "linux,pci-domain", NULL);
>   }
>
>   static void of_bus_pci_count_cells(struct device_node *np,
> --
> 2.27.0
>
>
> --
> Jazz is not dead. It just smells funny...
