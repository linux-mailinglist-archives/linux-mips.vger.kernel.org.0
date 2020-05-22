Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE44F1DE0F1
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 09:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbgEVHbH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 03:31:07 -0400
Received: from elvis.franken.de ([193.175.24.41]:34164 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728493AbgEVHbG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 03:31:06 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jc28x-0003HE-04; Fri, 22 May 2020 09:30:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7E62FC015D; Fri, 22 May 2020 09:28:55 +0200 (CEST)
Date:   Fri, 22 May 2020 09:28:55 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        WANG Xuerui <git@xen0n.name>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/13] mips: Add CONFIG/CONFIG6/Cause reg fields macro
Message-ID: <20200522072855.GE7331@alpha.franken.de>
References: <20200521140725.29571-1-Sergey.Semin@baikalelectronics.ru>
 <20200521140725.29571-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521140725.29571-8-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 05:07:18PM +0300, Serge Semin wrote:
> There are bit fields which persist in the MIPS CONFIG and CONFIG6
> registers, but haven't been described in the generic mipsregs.h
> header so far. In particular, the generic CONFIG bitfields are
> BE - endian mode, BM - burst mode, SB - SimpleBE, OCP interface mode
> indicator, UDI - user-defined "CorExtend" instructions, DSP - data
> scratch pad RAM present, ISP - instruction scratch pad RAM present,
> etc. The core-specific CONFIG6 bitfields are JRCD - jump register
> cache prediction disable, R6 - MIPSr6 extensions enable, IFUPerfCtl -
> IFU performance control, SPCD - sleep state performance counter, DLSB -
> disable load/store bonding. A new exception code reported in the
> ExcCode field of the Cause register: 30 - Parity/ECC error exception
> happened on either fetch, load or cache refill. Lets add them to the
> mipsregs.h header to be used in future platform code, which have them
> utilized.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  arch/mips/include/asm/mipsregs.h | 19 +++++++++++++++++++
>  arch/mips/kernel/spram.c         |  4 ++--
>  2 files changed, 21 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
