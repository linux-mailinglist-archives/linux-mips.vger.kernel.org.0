Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2EC1DE104
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 09:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728921AbgEVHbY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 03:31:24 -0400
Received: from elvis.franken.de ([193.175.24.41]:34188 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728369AbgEVHbL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 03:31:11 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jc28x-0003HE-01; Fri, 22 May 2020 09:30:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B7A8EC015D; Fri, 22 May 2020 09:28:03 +0200 (CEST)
Date:   Fri, 22 May 2020 09:28:03 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Fangrui Song <maskray@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Cedric Hombourger <Cedric_Hombourger@mentor.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/13] mips: Add MIPS Warrior P5600 support
Message-ID: <20200522072803.GB7331@alpha.franken.de>
References: <20200521140725.29571-1-Sergey.Semin@baikalelectronics.ru>
 <20200521140725.29571-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521140725.29571-5-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 05:07:15PM +0300, Serge Semin wrote:
> This is a MIPS32 Release 5 based IP core with XPA, EVA, dual/quad issue
> exec pipes, MMU with two-levels TLB, UCA, MSA, MDU core level features
> and system level features like up to six P5600 calculation cores, CM2
> with L2 cache, IOCU/IOMMU (though might be unused depending on the
> system-specific IP core configuration), GIC, CPC, virtualisation module,
> eJTAG and PDtrace.
> 
> As being MIPS32 Release 5 based core it provides all the features
> available by the CPU_MIPS32_R5 config, while adding a few more like
> UCA attribute support, availability of CPU-freq (by means of L2/CM
> clock ratio setting), EI/VI GIC modes detection at runtime.
> 
> In addition to this if P5600 architecture is enabled modern GNU GCC
> provides a specific tuning for P5600 processors with respect to the
> classic MIPS32 Release 5. First of all branch-likely avoidance is
> activated only when the code is compiled with the speed optimization
> (avoidance is always enabled for the pure MIPS32 Release 5
> architecture). Secondly the madd/msub avoidance is enabled since
> madd/msub utilization isn't profitable due to overhead of getting the
> result out of the HI/LO registers. Multiply-accumulate instructions are
> activated and utilized together with the necessary code reorder when
> multiply-add/multiply-subtract statements are met. Finally load/store
> bonding is activated by default. All of these optimizations may make
> the code relatively faster than if just MIP32 release 5 architecture
> was requested.
> 
> Co-developed-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  arch/mips/Kconfig              | 37 +++++++++++++++++++++++++++++-----
>  arch/mips/Makefile             |  1 +
>  arch/mips/include/asm/module.h |  2 ++
>  3 files changed, 35 insertions(+), 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
