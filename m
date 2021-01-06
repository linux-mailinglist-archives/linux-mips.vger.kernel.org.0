Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81BB2EBE9A
	for <lists+linux-mips@lfdr.de>; Wed,  6 Jan 2021 14:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbhAFN1q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Jan 2021 08:27:46 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:36957 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbhAFN1p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Jan 2021 08:27:45 -0500
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 75C5420000C;
        Wed,  6 Jan 2021 13:27:03 +0000 (UTC)
Date:   Wed, 6 Jan 2021 14:27:03 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: goldfish: Remove GOLDFISH dependency
Message-ID: <20210106132703.GM122615@piout.net>
References: <20201114130921.651882-1-jiaxun.yang@flygoat.com>
 <20201114130921.651882-2-jiaxun.yang@flygoat.com>
 <CAMuHMdXo9o9af-YBt5g53QHRhuLxdSy_C9n4wdEEh7yzDidr-w@mail.gmail.com>
 <20210104144841.GC3313@piout.net>
 <CAMuHMdWGnBcYvXLnydSnkxcmG6GksZLfq1aWADuWg8ibZ3V8Lg@mail.gmail.com>
 <20210104154303.GD3313@piout.net>
 <CAMuHMdW2nDwJGmOtoDgOEMgEDaD9nMMCv=Y4nZaDqCM1UNadvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW2nDwJGmOtoDgOEMgEDaD9nMMCv=Y4nZaDqCM1UNadvQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 04/01/2021 16:51:40+0100, Geert Uytterhoeven wrote:
> > > Is it used on ARM platforms?
> > > qemu:hw/riscv/Kconfig selects GOLDFISH_RTC, but that's it?
> >
> > My understanding is that this was used on the original ARM based goldfish
> > android emulator but I don't think this was ever upstreamed.
> 
> Upstream indeed only has GOLDFISH support in arch/x86/Kconfig.
> Still, that would be handled by the dependency on GOLDFISH.
> 
> Or do you mean upstream QEMU Goldfish support?
> 

Yes, I meant upstream in QEMU. If I refer to the doc from google:

'goldfish' is the name of a family of similar virtual hardware platforms, that
mostly differ in the virtual CPU they support. 'goldfish' started as an
ARM-specific platform, but has now been ported to x86 and MIPS virtual CPUs.

Goldfish was based on QEMU 0.8.2, they then moved to ranchu, this time
on a more upstream QEMU but I don't think this is upstream either.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
