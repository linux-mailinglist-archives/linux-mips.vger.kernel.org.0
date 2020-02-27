Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E01E41721C7
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 16:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730474AbgB0PFN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 10:05:13 -0500
Received: from mout.gmx.net ([212.227.17.20]:51051 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730426AbgB0PFM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 Feb 2020 10:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1582815910;
        bh=GnWOigoFaZA+oI27ftAWryxAqY1b2hsGKpIEczRh0tk=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=gb1ZC3FDyyozTxFS7p2LcN2ZEB8iWaaq8GCfG0+eIdOSx0KJVd6HFuWhkNjUtyjpC
         oxh3qdRNeihgAFZARSgjy0qi9BI/+/ICzuXyNlcJv25dE7Ww0lZzmjabia8oVdLuJX
         Nj56xPw2+YlcbHtQwnwS0E1BYju2Gc356urzHEZM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.44] ([95.90.191.58]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzb8-1ixwnv49xK-00QztV; Thu, 27
 Feb 2020 16:05:10 +0100
Subject: Re: MIPS Hardware support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
References: <20200227144910.GA25011@alpha.franken.de>
From:   Oleksij Rempel <fishor@gmx.net>
Autocrypt: addr=fishor@gmx.net; prefer-encrypt=mutual; keydata=
 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
 Ek4lL7r6S7KK
Message-ID: <09d4530c-77c8-8205-154a-8dca14ee6761@gmx.net>
Date:   Thu, 27 Feb 2020 16:05:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200227144910.GA25011@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QYIdz80t6RB+MHk9+ExPcd0QJrfCpNbVNXqW0Q7yKZ9cLkYN/l3
 qwIQYAmF5UrZZVXG3TcAA1FvGUHXAwjqZ171nvjaciHdj4uZ1a45tHEgUaqaLLQTrn1L8Uk
 yw3NiKF9kjeP/FmraNJ6QWL43A174Zq+dlNUyP1AXW2rZfQyMVuHKBAxUn01Q/G2C0n334x
 4kOqA2+neA8zD1Xl++k2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:w6B/VFMQ/dQ=:Rpa4aGORpaB5YZq2+th00J
 yYf/kt2cBOUQ06VY75EMj5wRwFI74yBLwrYXkHz3RjVzXSqjSvueLLDdGZW8YbtDuwNU1NJna
 PIarzGPDWgaIJkudJPrlP7v9AyPRw//WmSb9zxMQKHN9fnNjKUsiw35Re9OJhbwgGRbA3ckFp
 f7fsIrW9E5r1ILjlUmb93LcJrvAJkm/WsswUTFlgWuD4OnxpwFvKc3JZ8aS4CySUFl/PUULSn
 MIe72rbzGcvpFjv5IjfCN9quAognyeGZQgKUTlUHGfDKRccMAsV5Dy5Y8QmIERS5Rx8IsgR5W
 bsbARjnSUM2jMBE3f+AeGa6f8omZf7eGZXEI0ljnMsYlM0U/Uy4R1sUaCjqQ3qHJz21U7Jltr
 TbrMbbeeu1zfPo2JhOFYzI8JxAyDuXGyevl5YFrN5vN4Uaan/j643zAOoStY1y/Cr5a6mDiTe
 7x/zRNcKBbZwtjAvDX6SsSdwxE9KuvrmXKqYLkMe2/EQ40FY3/Jzb7uh/1RX18lHI3m2a5J63
 FxhU5NxrDNnpD0HIsnxt0k6iNoF5Po/Z4ikUj4lf1VlCIfXedT7qowSxpraNAc0e8OPcbJ08/
 bTLQbvfBij3Bb/uINKwu5jCbYBgp1sdLELyRDcuFeLCTGE9/ES7CVNE3/dboSoFgR19OYjvv1
 Ub/TmqZnHIAKrPS/yei8Kh3BGdRPN76ttXV1uWpqiQr7RFJFD6xx+XggW12ogpvbsYxfVQIay
 gH0O6DHNSi4SduRBcffTA83sJ1sK7ZCFF6uBdn0zj8t1/H3y1yV2Wp2319DG0rkP7N9ZAjXfN
 VKoCq+/fRuTCi+8tUnCEN3GYviyjDyVPYjR9GT5xGbv2DEas9Ue5OKKQnu2Z+9wqTITBR2cM1
 aVTwwcBw1H+1MtDiHEiqeUT8AZPCDPQImm15XZalIMvZ90hM+XvM+8/7rZsONABx4SJDRJN6g
 5W3PGYnd/F1IGNAM1/Vvm1rVyCsHAvxbwK8Jdj4VAEk52ilpLCwIVXmTqsuYMNYAfL/j+WbOq
 GxX2cr7t0lYACItqAqdSrxel8GOxcMRVHqy187bote/+pt5EuaTSgHFKJmEk9fNN3BGSb3Xxt
 YEUJ1AfS63JKpp0m7x3SSPln8MciPxcPfZtrQ5Srr1hk/xK2bgTh/GkNpDsmuvZ+dwhxUYfeb
 J9sk3CKh5SbJKkwnWzDwMJGY7ry57fRX4kYP8VZILqvX+hREXriBrKTV95MAb+qfvTQFxWwKC
 Q86v5uqVJ6zovKqeS
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

Am 27.02.20 um 15:49 schrieb Thomas Bogendoerfer:
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

Here is my list:
Hardware I own and regulary boot current kernels:
- Atheros AR71XX/AR724X/AR913X based boards (ATH79)
  currently only AR9331. I do mainlining for this chip.
- MIPS Malta board (MIPS_MALTA)
  I use it as QEMU test

Both of them was recently added to our BSP:
https://git.pengutronix.de/cgit/DistroKit/commit/?id=3Ddc788e1c1c192132137=
7754e47fc558558456019
https://git.pengutronix.de/cgit/DistroKit/commit/?id=3D521707e129e9d9039b4=
30a201a33d45af143a6d7

Both are supported by barebox:
https://git.pengutronix.de/cgit/barebox/tree/arch/mips

Hardware I own, but not booted for a while:
Atheros AR231x/AR531x SoC support (ATH25)
Microchip PIC32 Family (MACH_PIC32)


> Hardware I own and regulary boot current kernels:
>
> Jazz family of machines (MACH_JAZZ)	/* runs with qemu */
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
> Netlogic XLR/XLS based systems (NLM_XLR_BOARD)
> Netlogic XLP based systems (NLM_XLP_BOARD)
> Para-Virtualized guest system (MIPS_PARAVIRT)
>

