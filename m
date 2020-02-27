Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D92C17225A
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 16:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbgB0PiV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 10:38:21 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17909 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729089AbgB0PiV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 Feb 2020 10:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582817836;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:From:Message-ID;
        bh=OnRQ9NxWyqFj05IySYZq3Pu/2eEC6LBFz8UWXHJhJIk=;
        b=PrzIrA63Ce6nXM4ayqkimIXuagY0wF2CulQQTaqweeAnvdtarxe3/fgjDfx1sEcL
        Z+HTxe0VSGxvAh3hllAq97xetuOY2rDLBlf/n4iGBO9AjrqEveKZi9xF9BjEpTA/Vjw
        tz/7U1ecRodkP3gX0F0/K93mHKV28f3X7q2wxFdk=
Received: from [10.233.233.252] (115.196.12.109 [115.196.12.109]) by mx.zoho.com.cn
        with SMTPS id 1582817832165501.28613937076807; Thu, 27 Feb 2020 23:37:12 +0800 (CST)
Date:   Thu, 27 Feb 2020 23:37:07 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20200227144910.GA25011@alpha.franken.de>
References: <20200227144910.GA25011@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: MIPS Hardware support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <2FD88A63-1873-469F-9AF9-27FCB803E839@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B42=E6=9C=8827=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
0:49:10, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=
=88=B0:
>Hi,
>
>we have 47 MIPS system types and I'd like to get an overview how alive
>they really are=2E I've already grouped the 47 systems a little bit by
>hardware I already own and regulary test kernels=2E Could you please
>give me some feedback about the "unclassified" systems ? What systems
>are supported by qemu (real test not just repeating qemu docs) ?
>Thank you for your help=2E
>
>Thomas=2E
>
>Hardware I own and regulary boot current kernels:
>
>Jazz family of machines (MACH_JAZZ)	/* runs with qemu */
>SGI IP22 (Indy/Indigo2) (SGI_IP22)
>SGI IP27 (Origin200/2000) (SGI_IP27)
>SGI IP28 (Indigo2 R10k) (SGI_IP28)
>SGI IP30 (Octane/Octane2) (SGI_IP30)=20
>SGI IP32 (O2) (SGI_IP32)
>SNI RM200/300/400 (SNI_RM)
>
>Hardware I own, but not booted for a while:
>
>Texas Instruments AR7 (AR7)
>Cobalt Server (MIPS_COBALT)
>DECstations (MACH_DECSTATION)
>Lantiq based platforms (LANTIQ)
>Ralink based machines (RALINK)
>Sibyte BCM91480B-BigSur (SIBYTE_BIGSUR)
>
>Unclassified:
>
>Generic board-agnostic MIPS kernel (MIPS_GENERIC)
>Alchemy processor based machines (MIPS_ALCHEMY)
>Atheros AR231x/AR531x SoC support (ATH25)
>Atheros AR71XX/AR724X/AR913X based boards (ATH79)
>Broadcom Generic BMIPS kernel (BMIPS_GENERIC)
>Broadcom BCM47XX based boards (BCM47XX)
>Broadcom BCM63XX based boards (BCM63XX)
>Ingenic SoC based machines (MACH_INGENIC)
Ingeic X1000 now boots thanks to Yanjie's effort=2E
I owned a board given by Yanjie, and sometimes test MIPS32 functions on it=
=2E

>LASAT Networks platforms (LASAT)
>Loongson 32-bit family of machines (MACH_LOONGSON32)
I owned a Loongson 1C board, and can confirm 5=2E4 is still bootable=2E

>Loongson-2E/F family of machines (MACH_LOONGSON2EF)
QEMU Fuloong-2E works fine, tested last year=2E
And I owned Fuloong-2F=2E Just tested 5=2E5 recently=2E

>Loongson 64-bit family of machines (MACH_LOONGSON64)
No QEMU available=2E
I owned a Loongson-3B1500 with RS780E PCH system=2E=20
It works well with yesterday's mips-next=2E

I also have Loongson-3A4000 + 7A system,
which should belongs to this type=2E
However, Loongson-7A PCH support is still missing in mainline
and I'm going to work on that=2E

>IMG Pistachio SoC based boards (MACH_PISTACHIO)
>MIPS Malta board (MIPS_MALTA)
I use QEMU Malta for regular tests=2E
It works smoothly=2E

>Microchip PIC32 Family (MACH_PIC32)
>NEC EMMA2RH Mark-eins board (NEC_MARKEINS)
>NEC VR4100 series based machines (MACH_VR41XX)
>NXP STB220 board (NXP_STB220)
>NXP 225 board (NXP_STB225)
>PMC-Sierra MSP chipsets (PMC_MSP)
>Sibyte BCM91120C-CRhine (SIBYTE_CRHINE)
>Sibyte BCM91120x-Carmel (SIBYTE_CARMEL)
>Sibyte BCM91125C-CRhone (SIBYTE_CRHONE)
>Sibyte BCM91125E-Rhone (SIBYTE_RHONE)
>Sibyte BCM91250A-SWARM (SIBYTE_SWARM)
>Sibyte BCM91250C2-LittleSur (SIBYTE_LITTLESUR)
>Sibyte BCM91250E-Sentosa (SIBYTE_SENTOSA)
>Toshiba TX39 series based machines (MACH_TX39XX)
>Toshiba TX49 series based machines (MACH_TX49XX)
>Mikrotik RB532 boards (MIKROTIK_RB532)
>Cavium Networks Octeon SoC based boards (CAVIUM_OCTEON_SOC)
>Netlogic XLR/XLS based systems (NLM_XLR_BOARD)
>Netlogic XLP based systems (NLM_XLP_BOARD)
>Para-Virtualized guest system (MIPS_PARAVIRT)

--=20
Jiaxun Yang
