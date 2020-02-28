Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F61F173191
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 08:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgB1HIn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 02:08:43 -0500
Received: from mail.loongson.cn ([114.242.206.163]:50610 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726740AbgB1HIm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 28 Feb 2020 02:08:42 -0500
Received: from [10.130.0.70] (unknown [123.138.236.242])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX2o1vFhelq0UAA--.17S3;
        Fri, 28 Feb 2020 15:07:52 +0800 (CST)
Subject: Re: MIPS Hardware support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
References: <20200227144910.GA25011@alpha.franken.de>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <29d37b4d-e791-4c62-ee6d-314cdb9dfbfc@loongson.cn>
Date:   Fri, 28 Feb 2020 15:07:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200227144910.GA25011@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxX2o1vFhelq0UAA--.17S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW7Gw4fXw4rGF4kCF4kZwb_yoW5uFyUpr
        yrJw47WwsFqryvy3sa9a4q9rWUur90vayqv3yxJr4kCFyDKw17Z3yvqa1aqrsxAa4vk3W7
        ZrWUGr4aka1DKa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
        MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
        026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
        Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
        vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280
        aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
        uYvjxUgHanUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/27/2020 10:49 PM, Thomas Bogendoerfer wrote:
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

Hi Thomas,

Here is my list (MACH_LOONGSON64):

Loongson 3A3000 CPU + AMD RS780E bridge chip
works well with the mainline kernel linux-5.6-rc3.

Loongson 3A3000 CPU + Loongson 7A1000 bridge chip
only works well with the Loongnix kernel [1]
which is an internal version of Loongson company.

Loongson 3A4000 CPU + Loongson 7A1000 bridge chip
only works well with the Loongnix kernel [1]
which is an internal version of Loongson company.

In order to support Loongson 7A1000 bridge chip,
the Loongson kernel team is working hard to refactor
the code to submit patches to the mainline kernel.

Thanks,

Tiezhu Yang

[1] http://cgit.loongnix.org/cgit/linux-3.10/tree/

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

