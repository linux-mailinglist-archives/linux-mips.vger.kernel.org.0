Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83EC05D957
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2019 02:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbfGCAlN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Jul 2019 20:41:13 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35817 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbfGCAlN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Jul 2019 20:41:13 -0400
Received: by mail-ot1-f67.google.com with SMTP id j19so510177otq.2;
        Tue, 02 Jul 2019 17:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bSOqYii7ZBXl1VimAzOsNXyArtOqUO8Ub/4ZYTA1j8c=;
        b=q99GRcsXbET72JhVUP+W09DtQ82pAEbhghUwbJjJUv1NS9OSrA+MEhNfDcpH+tiBXp
         TWM8sf7tC+y68iDzSrV8xAphAUbgEiXEbjxqmQerxymKzbfMd6mtcqWLXOIzK2JBLbPY
         H2d/98y/oTDU6E9MlkrvWQH7fJGN1h1mIQSYvw+yBtsZEJi/cdOYWvcP3guzN8MOawfO
         lnHMNcGRonLGQO2LvHfcsG2x8fevU3l6viLz4gb8JZUHjw9NtQb9O4TVOCIXHIgk1z5K
         B6Ga3y+dBjjB0K2+cFK4Nm2+qdFszmUnMo6t5zefToiJMhrFq5WwfBwpzDPxDvk1S/HM
         mpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bSOqYii7ZBXl1VimAzOsNXyArtOqUO8Ub/4ZYTA1j8c=;
        b=P+kifVX8X3EnAmrAQUuo7dg859nWf4L4yRTu2dkHHV1kIobfMJKzyIL5plltujhzG2
         nvlaU2AFWavNW7lDse3Od3OG9ZhKjL+ZCRhBfRRWfciG+44Kj5CMpCDk0ET8MpjXfqjo
         Bo6sWPwB6yyEUlWbVCAiSt/y1aYUFsWQLeviqBipogI2ElxiPb037GYA+hxQvPQUtQdH
         7/ADC5Hx4TdzWzY3EVuqCr0q6ivKC65yKLX8QWqPz7+avwZAZpjYrSJF1Ihn4tHoaEcV
         eExIcdoP01ICGRws1whv6I19yG7K3Ddt8WsydmwUY96ZWByNJX6RrnaLi4yDVqjcwYoT
         Vy2w==
X-Gm-Message-State: APjAAAXK6aLgqT6jx/OW+WOOu1sXfMINGDchSfkvMAyHekhW6y+2biyb
        vpIKZBQVCnWahkmWQv71OgQLfVyddjx2bWtemRZd9MXX
X-Google-Smtp-Source: APXvYqy50mvLsxYgtKfRVlbA3GW5kWzUW612jiymv5fzhnObYnbprETeytMvN2i8gL1V0pTGXBI3bFIWucwvT2K1t5Y=
X-Received: by 2002:a9d:39a6:: with SMTP id y35mr27422788otb.81.1562110657449;
 Tue, 02 Jul 2019 16:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190702203523.2412-1-martin.blumenstingl@googlemail.com>
 <20190702203523.2412-2-martin.blumenstingl@googlemail.com> <CAL_Jsq+3H-cbrUna27RJ1o0w5MxaubkA9hcZjpWsaEYnx6bWQg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+3H-cbrUna27RJ1o0w5MxaubkA9hcZjpWsaEYnx6bWQg@mail.gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 3 Jul 2019 01:37:26 +0200
Message-ID: <CAFBinCCaK5USb062tywd54y=6B0jTFsx1-k7NMfqvjmS7+5LgA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: add binding for the Lantiq VRX200
 and ARX300 PCIe PHYs
To:     Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        John Crispin <john@phrozen.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Martin Schiller <ms@dev.tdt.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On Wed, Jul 3, 2019 at 1:34 AM Rob Herring <robh+dt@kernel.org> wrote:
[...]
> > +  lantiq,rcu:
> > +    maxItems: 1
> > +    description: phandle to the RCU syscon
>
> You need to define the type (and drop maxItems):
>
> $ref: /schemas/types.yaml#/definitions/phandle
thank you for this hint - the examples I used didn't have it

> > +
> > +  lantiq,rcu-endian-offset:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: the offset of the endian registers for this PHY instance in the RCU syscon
> > +
> > +  lantiq,rcu-big-endian-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: the mask to set the PDI (PHY) registers for this PHY instance to big endian
> > +
> > +required:
> > +  - "#phy-cells"
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
> > +  - lantiq,rcu
> > +  - lantiq,rcu-endian-offset
> > +  - lantiq,rcu-big-endian-mask
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pcie0_phy: phy@106800 {
> > +        compatible = "lantiq,vrx200-pcie-phy";
> > +        reg = <0x106800 0x100>;
> > +        lantiq,rcu = <&rcu0>;
> > +        lantiq,rcu-endian-offset = <0x4c>;
> > +        lantiq,rcu-big-endian-mask = <0x80>; /* bit 7 */
> > +        big-endian;
>
> The example will fail to validate because big-endian is not listed as
> a property and you have 'additionalProperties: false'. So you have to
> either list big-endian or drop additionalProperties.
good catch, thank you.
I'll add big-endian and little-endian as allowed (but optional) properties

> Note that the examples are validated against the schema in linux-next now.
I tested this with yesterday's linux-next tree and it didn't fail for me
do you have any hint how I can run this validation myself?


Martin
