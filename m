Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47BF5229C16
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jul 2020 17:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733038AbgGVPzg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jul 2020 11:55:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:36830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733022AbgGVPzf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Jul 2020 11:55:35 -0400
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E14722BEF;
        Wed, 22 Jul 2020 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595433334;
        bh=kbnKA7mCq4Ti8FRp3szUEaPvkReboJRHj1Bnap/yDXc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=M7PCNAT9DGUX2L0caH+10UVk/p1rx6cEhyeyfCRf6jASk+SutrbKCUhw/JYEbYB32
         BjD0ohEjSXEDVDq1qz6Q8MfXlggxLHeV1j3pv/wpdz0SRtzmomA0dZBVPY43/EzREm
         Ocy1sPp4IMvGRDmbA0L51GpMPky3zMlh5grWjl2M=
Received: by mail-ot1-f43.google.com with SMTP id t18so2122728otq.5;
        Wed, 22 Jul 2020 08:55:34 -0700 (PDT)
X-Gm-Message-State: AOAM530N5TuAfQ/pLHpqByyI61P8YN2eA3v3d8CJjtoyGidTLgKWC5GX
        Ptrb3Z2DSNb5dzgwhOLIzzfc5i3UmQuiqBFgNg==
X-Google-Smtp-Source: ABdhPJyb6F8z3WA4lftymR6yk0cNa75DCHAW9IbL6thShEbw7ONJr6PozDiOwNdaclBZhAjRHcaGBf8TXqSfAfl9dE4=
X-Received: by 2002:a9d:46c:: with SMTP id 99mr580182otc.192.1595433333529;
 Wed, 22 Jul 2020 08:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200721141742.996350-1-jiaxun.yang@flygoat.com> <20200721141742.996350-2-jiaxun.yang@flygoat.com>
In-Reply-To: <20200721141742.996350-2-jiaxun.yang@flygoat.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 22 Jul 2020 09:55:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLFZc8ChR=Sj3N-G-b0tq_4F0-HSQPt5+WmkcDZrxUznA@mail.gmail.com>
Message-ID: <CAL_JsqLFZc8ChR=Sj3N-G-b0tq_4F0-HSQPt5+WmkcDZrxUznA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] of_address: Add bus type match for pci ranges parser
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 21, 2020 at 8:18 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> So the parser can be used to parse range property of ISA bus.
>
> As they're all using PCI-like method of range property, there is no need
> start a new parser.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> --
> v2: Drop useless check, fix some na for bus_addr
>         add define of of_range_parser_init according to
>         Rob's suggestion.
> ---
>  drivers/of/address.c       | 27 +++++++++++++++------------
>  include/linux/of_address.h |  5 +++++
>  2 files changed, 20 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 8eea3f6e29a4..7406636cea87 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -698,9 +698,10 @@ static int parser_init(struct of_pci_range_parser *parser,
>
>         parser->node = node;
>         parser->pna = of_n_addr_cells(node);
> -       parser->na = of_bus_n_addr_cells(node);
> -       parser->ns = of_bus_n_size_cells(node);
>         parser->dma = !strcmp(name, "dma-ranges");
> +       parser->bus = of_match_bus(node);
> +
> +       parser->bus->count_cells(parser->node, &parser->na, &parser->ns);
>
>         parser->range = of_get_property(node, name, &rlen);
>         if (parser->range == NULL)
> @@ -732,6 +733,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
>         int na = parser->na;
>         int ns = parser->ns;
>         int np = parser->pna + na + ns;
> +       int busflag_na = 0;
>
>         if (!range)
>                 return NULL;
> @@ -739,12 +741,14 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
>         if (!parser->range || parser->range + np > parser->end)
>                 return NULL;
>
> -       if (parser->na == 3)
> -               range->flags = of_bus_pci_get_flags(parser->range);
> -       else
> -               range->flags = 0;
> +       range->flags = parser->bus->get_flags(parser->range);
> +
> +       /* PCI and ISA have a extra cell for resource flags */
> +       if (strcmp(parser->bus->name, "pci") ||
> +           strcmp(parser->bus->name, "isa"))
> +               busflag_na = 1;

This should be abstracted out. Probably the easiest is to add a
'has_flags' boolean to the of_bus struct.

>
> -       range->pci_addr = of_read_number(parser->range, na);
> +       range->bus_addr = of_read_number(parser->range + busflag_na, na - busflag_na);
>
>         if (parser->dma)
>                 range->cpu_addr = of_translate_dma_address(parser->node,
> @@ -759,11 +763,10 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
>         /* Now consume following elements while they are contiguous */
>         while (parser->range + np <= parser->end) {
>                 u32 flags = 0;
> -               u64 pci_addr, cpu_addr, size;
> +               u64 bus_addr, cpu_addr, size;
>
> -               if (parser->na == 3)
> -                       flags = of_bus_pci_get_flags(parser->range);
> -               pci_addr = of_read_number(parser->range, na);
> +               flags = parser->bus->get_flags(parser->range);
> +               bus_addr = of_read_number(parser->range + busflag_na, na - busflag_na);
>                 if (parser->dma)
>                         cpu_addr = of_translate_dma_address(parser->node,
>                                         parser->range + na);
> @@ -774,7 +777,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
>
>                 if (flags != range->flags)
>                         break;
> -               if (pci_addr != range->pci_addr + range->size ||
> +               if (bus_addr != range->bus_addr + range->size ||
>                     cpu_addr != range->cpu_addr + range->size)
>                         break;
>
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index 763022ed3456..3e8d6489cbf1 100644
> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -6,8 +6,11 @@
>  #include <linux/of.h>
>  #include <linux/io.h>
>
> +struct of_bus;
> +
>  struct of_pci_range_parser {
>         struct device_node *node;
> +       struct of_bus *bus;
>         const __be32 *range;
>         const __be32 *end;
>         int na;
> @@ -53,6 +56,7 @@ extern const __be32 *of_get_address(struct device_node *dev, int index,
>
>  extern int of_pci_range_parser_init(struct of_pci_range_parser *parser,
>                         struct device_node *node);
> +#define of_range_parser_init of_pci_range_parser_init
>  extern int of_pci_dma_range_parser_init(struct of_pci_range_parser *parser,
>                         struct device_node *node);
>  extern struct of_pci_range *of_pci_range_parser_one(
> @@ -83,6 +87,7 @@ static inline int of_pci_range_parser_init(struct of_pci_range_parser *parser,
>  {
>         return -ENOSYS;
>  }
> +#define of_range_parser_init of_pci_range_parser_init

No need for 2 defines. Move this outside of the ifdef like the others.
