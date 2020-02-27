Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29199172175
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 15:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732211AbgB0OtT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 09:49:19 -0500
Received: from elvis.franken.de ([193.175.24.41]:40389 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730163AbgB0OtS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 Feb 2020 09:49:18 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1j7KTU-0005c6-00
        for linux-mips@vger.kernel.org; Thu, 27 Feb 2020 15:49:16 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A0078C0EB3; Thu, 27 Feb 2020 15:49:10 +0100 (CET)
Date:   Thu, 27 Feb 2020 15:49:10 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org
Subject: MIPS Hardware support
Message-ID: <20200227144910.GA25011@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

we have 47 MIPS system types and I'd like to get an overview how alive
they really are. I've already grouped the 47 systems a little bit by
hardware I already own and regulary test kernels. Could you please
give me some feedback about the "unclassified" systems ? What systems
are supported by qemu (real test not just repeating qemu docs) ?
Thank you for your help.

Thomas.

Hardware I own and regulary boot current kernels:

Jazz family of machines (MACH_JAZZ)	/* runs with qemu */
SGI IP22 (Indy/Indigo2) (SGI_IP22)
SGI IP27 (Origin200/2000) (SGI_IP27)
SGI IP28 (Indigo2 R10k) (SGI_IP28)
SGI IP30 (Octane/Octane2) (SGI_IP30) 
SGI IP32 (O2) (SGI_IP32)
SNI RM200/300/400 (SNI_RM)

Hardware I own, but not booted for a while:

Texas Instruments AR7 (AR7)
Cobalt Server (MIPS_COBALT)
DECstations (MACH_DECSTATION)
Lantiq based platforms (LANTIQ)
Ralink based machines (RALINK)
Sibyte BCM91480B-BigSur (SIBYTE_BIGSUR)

Unclassified:

Generic board-agnostic MIPS kernel (MIPS_GENERIC)
Alchemy processor based machines (MIPS_ALCHEMY)
Atheros AR231x/AR531x SoC support (ATH25)
Atheros AR71XX/AR724X/AR913X based boards (ATH79)
Broadcom Generic BMIPS kernel (BMIPS_GENERIC)
Broadcom BCM47XX based boards (BCM47XX)
Broadcom BCM63XX based boards (BCM63XX)
Ingenic SoC based machines (MACH_INGENIC)
LASAT Networks platforms (LASAT)
Loongson 32-bit family of machines (MACH_LOONGSON32)
Loongson-2E/F family of machines (MACH_LOONGSON2EF)
Loongson 64-bit family of machines (MACH_LOONGSON64)
IMG Pistachio SoC based boards (MACH_PISTACHIO)
MIPS Malta board (MIPS_MALTA)
Microchip PIC32 Family (MACH_PIC32)
NEC EMMA2RH Mark-eins board (NEC_MARKEINS)
NEC VR4100 series based machines (MACH_VR41XX)
NXP STB220 board (NXP_STB220)
NXP 225 board (NXP_STB225)
PMC-Sierra MSP chipsets (PMC_MSP)
Sibyte BCM91120C-CRhine (SIBYTE_CRHINE)
Sibyte BCM91120x-Carmel (SIBYTE_CARMEL)
Sibyte BCM91125C-CRhone (SIBYTE_CRHONE)
Sibyte BCM91125E-Rhone (SIBYTE_RHONE)
Sibyte BCM91250A-SWARM (SIBYTE_SWARM)
Sibyte BCM91250C2-LittleSur (SIBYTE_LITTLESUR)
Sibyte BCM91250E-Sentosa (SIBYTE_SENTOSA)
Toshiba TX39 series based machines (MACH_TX39XX)
Toshiba TX49 series based machines (MACH_TX49XX)
Mikrotik RB532 boards (MIKROTIK_RB532)
Cavium Networks Octeon SoC based boards (CAVIUM_OCTEON_SOC)
Netlogic XLR/XLS based systems (NLM_XLR_BOARD)
Netlogic XLP based systems (NLM_XLP_BOARD)
Para-Virtualized guest system (MIPS_PARAVIRT)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
