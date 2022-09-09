Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9F0D5B2D33
	for <lists+linux-mips@lfdr.de>; Fri,  9 Sep 2022 06:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiIIEBT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Sep 2022 00:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiIIEBS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Sep 2022 00:01:18 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241DDC6964
        for <linux-mips@vger.kernel.org>; Thu,  8 Sep 2022 21:01:17 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-127ba06d03fso964290fac.3
        for <linux-mips@vger.kernel.org>; Thu, 08 Sep 2022 21:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=ukB7vHK9X64DJTH5F7EfNWnUrvhQZlsGau9L/06E5/w=;
        b=DgjYeO9WlruNpNlhAX+BveK2qQygCs5qRk4ARvLWFJ7N+rfhI8FPMnxxhbgHGjqyBA
         BgaG1SjplAXZFMR8sRy2jjTN7/q47w0vJhl8WmOAilEdnvHab7vbvThSvvEYeTqTN7re
         w3R7wmiuJTHklhtmQnuEYKqA90NZHxOvAH/jkyDFTkFZVW6T2lRirMt4SjZ4gPhLoKKZ
         jclMlwqAGAySXxjXv5b6tO7IJJDFmxW+u1t5sNR4xe5Xb6mggRkbciYp1ngZFG57c/l9
         VH2zdA9ojHn1qPK6gPd/Xo6WG5iQLmDnsqAkarqq3eGhHlq/ZKeXE5UawUFXxdXrWZAF
         ZfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ukB7vHK9X64DJTH5F7EfNWnUrvhQZlsGau9L/06E5/w=;
        b=lxtsMdVKS290+rExU5+P5RTHoi72Stzd34yCAaIM73OETZaqa1HEE0W8el9d5/bj/N
         iF1kZkUkxoiuOwb0I5qgOWBY3sG32EqeuBQ9uNLFuOlCoFeAwG3ek7h9R2PNc9JhuoU8
         9EIK6RMELAFGqYIFT02XTS9WCi9NPOfmRupjtYoEP0kzRaC2dzR99ELOB81JfRmZ7Rg0
         ha3nko/ympxUz65oUqU0YHcFZQ1/Zs6sFzo8BaajepFQWkfFd1PvbCY2I2+k9VTp2q4Z
         EV5eChit9ZpA03Jav4sx3NulFXbrRftQ5+xZ0V7VRBogNLT7Ak3FgyGA9fItUbMW5+hC
         H8SQ==
X-Gm-Message-State: ACgBeo0MqxID3raB296wsv8mTNmoSI3/kJwHU+J825B9TKHAm8JaXRW4
        AZDG8YBDSdk/bPEl3UDmuMT/gRbFdHOIDJaPotBM0m7zWY+mcA==
X-Google-Smtp-Source: AA6agR5Xn0WpehxNF8YuebDn+psy8tH5cyy0uj1uWnII285PjXmZxXFm8Mchs9KcrRX1Al7WXxjrDWDdqR3GyKVwPEg=
X-Received: by 2002:a54:4093:0:b0:342:dfd2:39bc with SMTP id
 i19-20020a544093000000b00342dfd239bcmr2826523oii.144.1662696075823; Thu, 08
 Sep 2022 21:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220908060804.1531428-1-sergio.paracuellos@gmail.com> <055843d1-ec76-2db4-8860-4bf1e81110d3@arinc9.com>
In-Reply-To: <055843d1-ec76-2db4-8860-4bf1e81110d3@arinc9.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 9 Sep 2022 06:01:04 +0200
Message-ID: <CAMhs-H9HdmaN4XyHTWiX-SZHuFQorpO4zaSjHp+DLJFc5JcyUA@mail.gmail.com>
Subject: Re: [PATCH] mips: ralink: mt7621: add device tree into the kernel
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Arinc,

On Thu, Sep 8, 2022 at 8:34 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9=
.com> wrote:
>
> On 8.09.2022 09:08, Sergio Paracuellos wrote:
> > Device tree blobs for ralink mt7621 SoCs depends on configuration
> > CONFIG_SOC_MT7621 kernel option. This blobs needs to be properly
> > builtin into the kernel in order to be able to properly boot the
> > Gnubee boards. Hence, select CONFIG_BUILTIN_DTB for mt7621 Socs.
> > This option was a miss when this related device tree files were
> > moved from staging into the real 'arch/mips/boot/dts/ralink'
> > folder in kernel.
> >
> > Fixes: 7a6ee0bbab25 ("mips: dts: ralink: add MT7621 SoC")
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>
> I just tested this on a GB-PC2. If I understand correctly, this option
> adds all compiled DT on top of the compiled linux image, vmlinux,
> vmlinuz, etc..
>
> DTB for GB-PC1 must come first since the bootloader on my GB-PC2 thinks
> the device is GB-PC1.
>
> [    0.000000] Linux version 6.0.0-rc3+ (arinc9@arinc9-PC)
> (mipsel-linux-gnu-gcc (Ubuntu 10.3.0-1ubuntu1) 10.3.0, GNU ld (GNU
> Binutils for Ubuntu) 2.38) #8 SMP Thu Sep 8 21:16:57 +03 2022
> [    0.000000] SoC Type: MediaTek MT7621 ver:1 eco:3
> [    0.000000] printk: bootconsole [early0] enabled
> [    0.000000] CPU0 revision is: 0001992f (MIPS 1004Kc)
> [    0.000000] MIPS: machine is GB-PC1
>
> I think we should not make SOC_MT7621 select this option now that we
> compile devicetrees for all devices which use the MT7621 SoC but rather
> leave it to the OS builder, OpenWrt SDK, etc. to decide and add the DTB
> on top of the compiled linux image.

I see. If this is the case I think we need to add DTB options to know
which dtb must be included in the kernel like other ralink platforms
do in 'arch/mips/ralink/Kconfig' and make each one dependant on
MT7621_SOC and select BUILTIN_DTB in each of them:

config DTB_GNUBEE1
     bool "GnuBee1 2.5inch NAS"
     depends on SOC_MT7621
     select BUILTIN_DTB

config DTB_GNUBEE2
     bool "GnuBee2 3.5inch NAS"
     depends on SOC_MT7621
     select BUILTIN_DTB

And then in 'arch/mips/boot/dts/ralink/Makefile' do:

dtb-$(CONFIG_DTB_GNUBEE1) +=3D mt7621-gnubee-gb-pc1.dtb
dtb-$(CONFIG_DTB_GNUBEE2) +=3D mt7621-gnubee-gb-pc2.dtb

I am not a Kconfig expert so I don't know if there is a better option.

>
> I think this is already the case for all arm devicetrees?

AFAIK, arm device trees are not normally embedded in the image but
loaded in memory in the boot process and from there a pointer is
passed to the kernel so I think just making all of them available for
a SoC makes sense.

Best regards,
    Sergio Paracuellos
>
> Ar=C4=B1n=C3=A7
>
> > ---
> >   arch/mips/ralink/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
> > index f9fe15630abb..f3b14bfc8066 100644
> > --- a/arch/mips/ralink/Kconfig
> > +++ b/arch/mips/ralink/Kconfig
> > @@ -54,6 +54,7 @@ choice
> >               select HAVE_PCI
> >               select PCI_DRIVERS_GENERIC
> >               select SOC_BUS
> > +             select BUILTIN_DTB
> >
> >               help
> >                 The MT7621 system-on-a-chip includes an 880 MHz MIPS100=
4Kc dual-core CPU,
