Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08E57172271
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 16:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbgB0PoF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 10:44:05 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:42354 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727592AbgB0PoF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 10:44:05 -0500
Received: by mail-qk1-f196.google.com with SMTP id o28so3526130qkj.9
        for <linux-mips@vger.kernel.org>; Thu, 27 Feb 2020 07:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wn7yl2Jq2Fl2viHR/z3oycBlaCFeKLGqA/GdW8BUipY=;
        b=pRwZc/IBC1UN7pBp5P6PVA2NTAFM5oS+T0rbCG13+mHAMIjtgKxdkjsgOabejAi/uI
         0BwcR7HVAxjsXnolNYqxUyMmDILICIHnks8YtMKpS6KunQFr+kvJ97y+PFZUr8D3/gQM
         oaxWU9xsSBci++MQw6cO35wlMZbT2KvBCCpafkrb0MvCcFDHftZ65q3i4BW2Y0yuS0w1
         6OexoDsTryL5QC+cfNHWL23AgYgHzpnctg2GVM5PvTM18+ZVDz+AFhC//FAubfjf4S+o
         9eAvSv2yhhYmXuNCoMkixywbw5XSHDd00BDRCf/mriLabyGhiTYc//GjbxYGgOTx5v4o
         PsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wn7yl2Jq2Fl2viHR/z3oycBlaCFeKLGqA/GdW8BUipY=;
        b=q4yg+2ccB2CqHvvvBJJMJso/3LnXlRF7ztDO8chtS+K7LICmB2KHSCnx8gzrorZVY0
         iXIm7twvO0IpADvKd30npIfQIeV97u0mfmmhNimH7S49jRSQt9u37JISEz1dNc7LJOgp
         +HRElqxzzVgIEA8nlT46sLt18eBo+obgm+9YkyGeK99dI0ZhQnu7LwFzBKqGTd15LSzK
         JABserkrv3eRpC8L8M9mEreFQugmjj717hHw0MFpwPK6VSxhpC3PQnoThapissWOkvQX
         EUXqHKK6/By+Htqmn/5SfClFoCbttQM0iusKH6duld+T9q+cNw4AfxUqW/o6P/0p0Z32
         TIwA==
X-Gm-Message-State: APjAAAXJ8Y52nY59nCpWNl2T5juvIcYHWxsr2cuHGyy5QB1BqiHCcOG1
        Vz4S+XYkkTatC1Nv99sFqqiNJh8O7490AVGZq1pcPYAnOGlMYw==
X-Google-Smtp-Source: APXvYqxpyafFsFsvCDsYp8nP8iI/0tXCZ+wxP4DWz7dKkeh7Pwc6VKy3mMkLfuRKTgPUtwyfb6Vd2uVgaowDwce41i4=
X-Received: by 2002:a05:620a:13b5:: with SMTP id m21mr5811381qki.469.1582818244582;
 Thu, 27 Feb 2020 07:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20200227144910.GA25011@alpha.franken.de>
In-Reply-To: <20200227144910.GA25011@alpha.franken.de>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Thu, 27 Feb 2020 23:43:53 +0800
Message-ID: <CAKcpw6Vt2dDm2D8kv_zyShNH=tSoaOiCabR-gZZmGGavg+19mQ@mail.gmail.com>
Subject: Re: MIPS Hardware support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thomas Bogendoerfer <tsbogend@alpha.franken.de> =E4=BA=8E2020=E5=B9=B42=E6=
=9C=8827=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=8810:49=E5=86=99=E9=81=
=93=EF=BC=9A
>
> Hi,
>
> we have 47 MIPS system types and I'd like to get an overview how alive
> they really are. I've already grouped the 47 systems a little bit by
> hardware I already own and regulary test kernels. Could you please
> give me some feedback about the "unclassified" systems ? What systems
> are supported by qemu (real test not just repeating qemu docs) ?
> Thank you for your help.
>
> Thomas.
>
> Hardware I own and regulary boot current kernels:
>
> Jazz family of machines (MACH_JAZZ)     /* runs with qemu */
> SGI IP22 (Indy/Indigo2) (SGI_IP22)
> SGI IP27 (Origin200/2000) (SGI_IP27)
> SGI IP28 (Indigo2 R10k) (SGI_IP28)
> SGI IP30 (Octane/Octane2) (SGI_IP30)
> SGI IP32 (O2) (SGI_IP32)
> SNI RM200/300/400 (SNI_RM)
>
> Hardware I own, but not booted for a while:
>
> Texas Instruments AR7 (AR7)
> Cobalt Server (MIPS_COBALT)
> DECstations (MACH_DECSTATION)
> Lantiq based platforms (LANTIQ)
> Ralink based machines (RALINK)
> Sibyte BCM91480B-BigSur (SIBYTE_BIGSUR)
>
> Unclassified:
>
> Generic board-agnostic MIPS kernel (MIPS_GENERIC)
> Alchemy processor based machines (MIPS_ALCHEMY)
> Atheros AR231x/AR531x SoC support (ATH25)
> Atheros AR71XX/AR724X/AR913X based boards (ATH79)
> Broadcom Generic BMIPS kernel (BMIPS_GENERIC)
> Broadcom BCM47XX based boards (BCM47XX)
> Broadcom BCM63XX based boards (BCM63XX)
> Ingenic SoC based machines (MACH_INGENIC)
> LASAT Networks platforms (LASAT)
> Loongson 32-bit family of machines (MACH_LOONGSON32)
> Loongson-2E/F family of machines (MACH_LOONGSON2EF)
> Loongson 64-bit family of machines (MACH_LOONGSON64)
> IMG Pistachio SoC based boards (MACH_PISTACHIO)
> MIPS Malta board (MIPS_MALTA)

I am using it with MIPS I6500/I6400(r6) and MIPS64R2-generic CPU
to test Debian.

> Microchip PIC32 Family (MACH_PIC32)
> NEC EMMA2RH Mark-eins board (NEC_MARKEINS)
> NEC VR4100 series based machines (MACH_VR41XX)
> NXP STB220 board (NXP_STB220)
> NXP 225 board (NXP_STB225)
> PMC-Sierra MSP chipsets (PMC_MSP)
> Sibyte BCM91120C-CRhine (SIBYTE_CRHINE)
> Sibyte BCM91120x-Carmel (SIBYTE_CARMEL)
> Sibyte BCM91125C-CRhone (SIBYTE_CRHONE)
> Sibyte BCM91125E-Rhone (SIBYTE_RHONE)
> Sibyte BCM91250A-SWARM (SIBYTE_SWARM)
> Sibyte BCM91250C2-LittleSur (SIBYTE_LITTLESUR)
> Sibyte BCM91250E-Sentosa (SIBYTE_SENTOSA)
> Toshiba TX39 series based machines (MACH_TX39XX)
> Toshiba TX49 series based machines (MACH_TX49XX)
> Mikrotik RB532 boards (MIKROTIK_RB532)
> Cavium Networks Octeon SoC based boards (CAVIUM_OCTEON_SOC)

Debian has some to work as build farm and porterbox.
https://db.debian.org/machines.cgi
Search mips there.

> Netlogic XLR/XLS based systems (NLM_XLR_BOARD)
> Netlogic XLP based systems (NLM_XLP_BOARD)
> Para-Virtualized guest system (MIPS_PARAVIRT)
>

A Russian company have a MIPS P5600. It is not supported by upstream kernel=
.
https://www.mips.com/products/warrior/p-class-p5600-multiprocessor-core/
https://en.wikichip.org/wiki/baikal/baikal-t1

> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]



--=20
YunQiang Su
