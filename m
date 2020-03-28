Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC35196407
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2020 07:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgC1Gth (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 Mar 2020 02:49:37 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42914 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgC1Gth (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 28 Mar 2020 02:49:37 -0400
Received: by mail-ot1-f66.google.com with SMTP id z5so11983641oth.9
        for <linux-mips@vger.kernel.org>; Fri, 27 Mar 2020 23:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vh3pvC0YrL65XzwRtnNjwLEeZNpHdRyyFSHt1NSoOg8=;
        b=sVydZLGs6HRIgoyNL3bn/Of4n4y6h7K+xely4yAe35HpcxMfVEI7OWafCrTj2EMwkH
         bfvL3d10wlky1FclfHZEAnejivPqfMC4yvUyauy0+t2ABZEugXJwVm8JDrnkMK3Sn85V
         eS0aXMjjoxzgylRSlRr7dUvuSWEXHlA9M+8uWdM6SGB2uzNtNwmvEBMuv9GGW7sPHxRo
         RGr2tRdiNNOOKXPiOIb678W+3RKe573fP0oDNl0LcQFaWMm5D3Jxd+mvHTNap2YC3M0w
         2qdnbcYHoS+FVxoaOGGNC4jraEf/RnMIaPs6VzCWv8cwgMUD3Rg/48ZCfQa9IgQk5MbD
         6aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vh3pvC0YrL65XzwRtnNjwLEeZNpHdRyyFSHt1NSoOg8=;
        b=cedv8Cxs4xzDS//zlEZzWf+9FoBQnttljbckEbJVouPWcDN0qyOXapxifF5xqZRaHU
         CMt+hcCXSUE87Reayww71CLvR0tft5FcLqmG4ODY1vB1vXW1hDG9i2310HqtSjjHXhWF
         1wGYNQukJTh/tn65++EhyFRjd9Kx/6M04j2cTNCxE2VjgjgNWzaDi+GATLHBgMWiT2CU
         WISXSMhA+9LxFYKdQXUSCk7bKGGkPHgtXAbpvsrxZtLEumeSTukRWfcY7kQI2ZuNgWIl
         ZJAp9NinjOP3pfYMehjZr/G1zCRtvVrW/ddZUckwkPt17J80SJFg7j4RTk5BvrbBTtFQ
         plcQ==
X-Gm-Message-State: ANhLgQ3oEKNyInKeA9zr0HXzrHPhal+Bhk4E2Ab52bUbNUzqQWIBZOJJ
        Dj1imYM/JMQSJC6BkAkbsYDSH/LoLC06WelsDTg25mgI
X-Google-Smtp-Source: ADFU+vsg/41q/lYfSqsqVX1L/ha84M3+dBSKT7DTI/g/+7f7mu16jHwi5nRI0jY0KKKisDNTBo88z6KtP9rDnlws+Hg=
X-Received: by 2002:a4a:3e90:: with SMTP id t138mr2426554oot.24.1585378176639;
 Fri, 27 Mar 2020 23:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200327152624.Horde.4Z2ZjKkOtsKUryuWp4S7pe-@www.vdorst.com>
In-Reply-To: <20200327152624.Horde.4Z2ZjKkOtsKUryuWp4S7pe-@www.vdorst.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 28 Mar 2020 07:49:25 +0100
Message-ID: <CAMhs-H9BPx=v=BfnCaCOWtQ9-isGerY=vVNwA-OcBRxo3ie6gg@mail.gmail.com>
Subject: Re: MIPS: ralink: mt7621: introduce 'soc_device' initialization,
 compile issue
To:     =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Ren=C3=A9,

On Fri, Mar 27, 2020 at 4:26 PM Ren=C3=A9 van Dorst <opensource@vdorst.com>=
 wrote:
>
> Hi Sergio,
>
> I am hitting this issue with the lastest linux-next:
>
> /home/rene/dev/openwrt/staging_dir/toolchain-mipsel_24kc_gcc-8.3.0_musl/b=
in/mipsel-openwrt-linux-ld: arch/mips/ralink/mt7621.o: in function
> `soc_dev_init':
> /home/rene/dev/net-next/arch/mips/ralink/mt7621.c:185: undefined
> reference to `soc_device_register'
> make: *** [Makefile:1086: vmlinux] Error 1
>
> Are you also experiencing this issue?
>

No it compiles clean for me with the last linux-next. The function
'soc_device_register' is implemented in drivers/base/soc.c which is
included for compilation with
CONFIG_SOC_BUS. Looks like kernel is not compiling soc.c for any reason.

> I don't see any other compiler issue.
>
> Greats,
>
> Ren=C3=A9

Best regards,
    Sergio Paracuellos
>
>
>
