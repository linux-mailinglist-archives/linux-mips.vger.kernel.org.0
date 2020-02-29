Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFBC8174475
	for <lists+linux-mips@lfdr.de>; Sat, 29 Feb 2020 03:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgB2C34 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 21:29:56 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17874 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726046AbgB2C34 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 28 Feb 2020 21:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582943316;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=iecl8JhJduIiTixkFRLrp1oFke2BVulnGsfwpgDGKUo=;
        b=LcIWwjusJMt4IKkDl086Yz6WC49FNw4OLyIDKEdZNBVWxgtaEV+Beydr77OdLxPq
        Cf4du4zLi0vDPGr9HXNQTm9Cbc++tbm62fgUmpwCH45gaEfiDCO0q8sgBjv+DkISFMR
        opXE1RXcosfDVuDsrh9GIXLqroXHg92padIo+cJI=
Received: from mail.baihui.com by mx.zoho.com.cn
        with SMTP id 1582943311796918.7284458271681; Sat, 29 Feb 2020 10:28:31 +0800 (CST)
Date:   Sat, 29 Feb 2020 10:28:31 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     "Rob Herring" <robh@kernel.org>
Cc:     "linux-mips" <linux-mips@vger.kernel.org>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Jason Cooper" <jason@lakedaemon.net>,
        "Marc Zyngier" <maz@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Ralf Baechle" <ralf@linux-mips.org>,
        "Paul Burton" <paulburton@kernel.org>,
        "Huacai Chen" <chenhc@lemote.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Allison Randal" <allison@lohutok.net>,
        "linux-kernel" <linux-kernel@vger.kernel.org>,
        "devicetree" <devicetree@vger.kernel.org>
Message-ID: <1708ec617b1.116fbb3c620013.4511572987202965377@flygoat.com>
In-Reply-To: <20200226165211.GA20809@bogus>
References: <20200221050942.507775-1-jiaxun.yang@flygoat.com>
 <20200221050942.507775-8-jiaxun.yang@flygoat.com> <20200226165211.GA20809@bogus>
Subject: Re: [PATCH v4 07/10] dt-bindings: mips: Add loongson boards
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Priority: Medium
User-Agent: ZohoCN Mail
X-Mailer: ZohoCN Mail
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


 ---- =E5=9C=A8 =E6=98=9F=E6=9C=9F=E5=9B=9B, 2020-02-27 00:52:11 Rob Herrin=
g <robh@kernel.org> =E6=92=B0=E5=86=99 ----
 > On Fri, Feb 21, 2020 at 01:09:22PM +0800, Jiaxun Yang wrote:
 > > Prepare for later dts.
 > >=20
 > > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
 > > ---
 > >  .../bindings/mips/loongson/devices.yaml       | 29 ++++++++++++++++++=
+
 > >  1 file changed, 29 insertions(+)
 > >  create mode 100644 Documentation/devicetree/bindings/mips/loongson/de=
vices.yaml
 > >=20
 > > diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.y=
aml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
 > > new file mode 100644
 > > index 000000000000..32bec784da87
 > > --- /dev/null
 > > +++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
 > > @@ -0,0 +1,29 @@
 > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 > > +%YAML 1.2
 > > +---
 > > +$id: http://devicetree.org/schemas/mips/loongson/devices.yaml#
 > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
 > > +
 > > +title: Loongson based Platforms Device Tree Bindings
 > > +
 > > +maintainers:
 > > +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
 > > +description: |
 > > +  Devices with a Loongson CPU shall have the following properties.
 >=20
 > Perhaps some details about the platform.
 >=20
 > > +  Note that generic device is used for built-in dtbs and will be
 > > +  patched during boot on firmware without OF support.
 >=20
 > That's a kernel detail that doesn't belong here. (BTW, built-in dtb=20
 > support is intended as a transition step for bootloaders without dtb=20
 > knowledge. It's not the recommended way and shouldn't be used on new=20
 > platforms).

Yes, it's used to deal with legacy platforms.
Will drop this line in next version.

Thanks.

 >=20
 > > +
 > > +properties:
 > > +  $nodename:
 > > +    const: '/'
 > > +  compatible:
 > > +    oneOf:
 > > +
 > > +      - description: Generic Loongson3 4Core + RS780E
 > > +        items:
 > > +          - const: loongson,loongson3-4core-rs780e
 > > +
 > > +      - description: Generic Loongson3 8Core + RS780E
 > > +        items:
 > > +          - const: loongson,loongson3-8core-rs780e
 > > +...
 > > --=20
 > > 2.25.0
 > >=20
 > >=20
 >
