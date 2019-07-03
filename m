Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A31F85E561
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2019 15:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfGCNZQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Jul 2019 09:25:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:40016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726621AbfGCNZQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Jul 2019 09:25:16 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D033218AD;
        Wed,  3 Jul 2019 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562160315;
        bh=hPIgAF/RwH+87CC48ngdy/pc35EBUqps7G9X6Sfz/Rk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iOYguXOSn1KvEZ75OL682DZzYwsj4Dd/lxMdTTt7oxy3O57i3wga0yD86dARW7o8v
         lW4fZBAD94lrViCzfj97n+Ubn24osyQPzRt+6h7Qlxb/I+mgmWkfwo28hj12GU4yCk
         tnWhbHnM+Vwhnhe3gb4cuoQ5+qrsDzzfNeI1Az24=
Received: by mail-qt1-f178.google.com with SMTP id d17so1627475qtj.8;
        Wed, 03 Jul 2019 06:25:15 -0700 (PDT)
X-Gm-Message-State: APjAAAU4ejyYhb05AiV7wl9Y8bxHh3rFPLJN+EYY3g1oLAGTj7itFknq
        gs9J6VuIU0aWl2VOPIXCygXji7W6Yuk+vvK3UQ==
X-Google-Smtp-Source: APXvYqwbNqCNdpfVoj1XUWDZZwcDTVqfdN/j8JGsFHn6EWRXSqXFi1G31JDKwzRzYDQZC4Iohj8zuTfFHRWyCC03KMg=
X-Received: by 2002:a0c:b627:: with SMTP id f39mr32762815qve.72.1562160314468;
 Wed, 03 Jul 2019 06:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190702203523.2412-1-martin.blumenstingl@googlemail.com>
 <20190702203523.2412-2-martin.blumenstingl@googlemail.com>
 <CAL_Jsq+3H-cbrUna27RJ1o0w5MxaubkA9hcZjpWsaEYnx6bWQg@mail.gmail.com> <CAFBinCCaK5USb062tywd54y=6B0jTFsx1-k7NMfqvjmS7+5LgA@mail.gmail.com>
In-Reply-To: <CAFBinCCaK5USb062tywd54y=6B0jTFsx1-k7NMfqvjmS7+5LgA@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 3 Jul 2019 07:25:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJwd63-BJq2Bw5xnSN7XRGj=KmhHXcxRbsaKMX8jYdAjg@mail.gmail.com>
Message-ID: <CAL_JsqJwd63-BJq2Bw5xnSN7XRGj=KmhHXcxRbsaKMX8jYdAjg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: add binding for the Lantiq VRX200
 and ARX300 PCIe PHYs
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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

On Tue, Jul 2, 2019 at 5:37 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Rob,
>
> On Wed, Jul 3, 2019 at 1:34 AM Rob Herring <robh+dt@kernel.org> wrote:
> [...]
> > > +  lantiq,rcu:
> > > +    maxItems: 1
> > > +    description: phandle to the RCU syscon
> >
> > You need to define the type (and drop maxItems):
> >
> > $ref: /schemas/types.yaml#/definitions/phandle
> thank you for this hint - the examples I used didn't have it
>
> > > +
> > > +  lantiq,rcu-endian-offset:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: the offset of the endian registers for this PHY instance in the RCU syscon
> > > +
> > > +  lantiq,rcu-big-endian-mask:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: the mask to set the PDI (PHY) registers for this PHY instance to big endian
> > > +
> > > +required:
> > > +  - "#phy-cells"
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - resets
> > > +  - reset-names
> > > +  - lantiq,rcu
> > > +  - lantiq,rcu-endian-offset
> > > +  - lantiq,rcu-big-endian-mask
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    pcie0_phy: phy@106800 {
> > > +        compatible = "lantiq,vrx200-pcie-phy";
> > > +        reg = <0x106800 0x100>;
> > > +        lantiq,rcu = <&rcu0>;
> > > +        lantiq,rcu-endian-offset = <0x4c>;
> > > +        lantiq,rcu-big-endian-mask = <0x80>; /* bit 7 */
> > > +        big-endian;
> >
> > The example will fail to validate because big-endian is not listed as
> > a property and you have 'additionalProperties: false'. So you have to
> > either list big-endian or drop additionalProperties.
> good catch, thank you.
> I'll add big-endian and little-endian as allowed (but optional) properties
>
> > Note that the examples are validated against the schema in linux-next now.
> I tested this with yesterday's linux-next tree and it didn't fail for me
> do you have any hint how I can run this validation myself?

It's not a default target:

make dt_binding_check

Rob
