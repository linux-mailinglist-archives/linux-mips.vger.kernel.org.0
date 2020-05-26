Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A254A1CCE79
	for <lists+linux-mips@lfdr.de>; Mon, 11 May 2020 00:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbgEJWJJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 May 2020 18:09:09 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:47556 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728763AbgEJWJJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 10 May 2020 18:09:09 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id C57A68030807;
        Sun, 10 May 2020 22:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id go-YLvrD6O9D; Mon, 11 May 2020 01:09:06 +0300 (MSK)
Date:   Mon, 11 May 2020 01:09:05 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Huacai Chen <chenhc@lemote.com>,
        Cedric Hombourger <Cedric_Hombourger@mentor.com>,
        =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
        Ard Biesheuvel <ardb@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 07/20] mips: Add MIPS Warrior P5600 support
Message-ID: <20200510220905.m47swnvbdgx4b65j@mobilestation>
References: <20200306124807.3596F80307C2@mail.baikalelectronics.ru>
 <20200506174238.15385-1-Sergey.Semin@baikalelectronics.ru>
 <20200506174238.15385-8-Sergey.Semin@baikalelectronics.ru>
 <20200507111735.GF11616@alpha.franken.de>
 <20200507211923.kfu2ly3ncqms4c2u@mobilestation>
 <20200508093259.GB9085@alpha.franken.de>
 <20200508122137.GA13177@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200508122137.GA13177@alpha.franken.de>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 08, 2020 at 02:21:37PM +0200, Thomas Bogendoerfer wrote:
> On Fri, May 08, 2020 at 11:32:59AM +0200, Thomas Bogendoerfer wrote:
> > On Fri, May 08, 2020 at 12:19:23AM +0300, Serge Semin wrote:
> > > On Thu, May 07, 2020 at 01:17:35PM +0200, Thomas Bogendoerfer wrote:
> > > > P5600 is CPU_MIPS_R5 so can't you select it here and drop all the || CPU_5600
> > > > above/below ?
> > > 
> > > Alas, We can't do this so easy. CONFIG_CPU_MIPS32_{R2,R5,R6} and any other
> > > CONFIG_CPU_* configs is something that kernel config-file is supposed to select.
> > > Their availability is enabled by the CONFIG_SYS_HAS_CPU_* configs. CONFIG_CPU_*
> > > is supposed to activate CPU-specific features and there is only one
> > > CONFIG_CPU_x can be enabled at a time seeing it's a part of the "CPU type"
> > > choice kconfig menu. In addition the CPU config also tunes a compiler to activate
> > > the arch-specific ISA and optimizations in the arch/mips/Makefile by setting
> > > -march=cpu-name (where cpu-name can be p5600, mips32r5, etc).
> > > 
> > > Yes, P5600 is based on the MIPS32r5, but it also has got some specific features
> > > (see config CPU_P5600 and config MIPS32_R5), which makes it to be different from
> > > the ancestor. So In addition to the difficulties described above IMHO converting
> > > CPU_P5600 to a set of features activated on top of the CPU_MIPS32_R5 config
> > > would contradict the design of the CPU-support configs implemented in the MIPS
> > > arch subsystem.
> > 
> > maybe I wasn't clear enough, my suggestion is
> > 
> > use 
> > 
> > config CPU_P5600
> > 	bool "MIPS Warrior P5600"
> > 	depends on SYS_HAS_CPU_P5600
> > 	select CPU_MIPS32_R5
> > 	select CPU_SUPPORTS_UNCACHED_ACCELERATED
> > 	select CPU_SUPPORTS_CPUFREQ
> > 	select CPU_MIPSR2_IRQ_VI
> > 	select CPU_MIPSR2_IRQ_EI
> > 
> > That way you don't need to any "|| CPU_P5600" where CPU_MIPS32_R5 is
> > already there. Or are there cases, where this would be wrong ?
> 
> nevermind, this would also need a select SYS_HAS_CPU_MIPS32_R5, which
> isn't wanted here. So patch is fine as is.

Ok. Thanks.

-Sergey

> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
