Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB1946D76E0
	for <lists+linux-mips@lfdr.de>; Wed,  5 Apr 2023 10:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237205AbjDEI3J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Apr 2023 04:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237165AbjDEI3H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Apr 2023 04:29:07 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E9EBF2699
        for <linux-mips@vger.kernel.org>; Wed,  5 Apr 2023 01:29:02 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pjyVe-0007pG-00; Wed, 05 Apr 2023 10:28:50 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E320EC2116; Wed,  5 Apr 2023 10:26:03 +0200 (CEST)
Date:   Wed, 5 Apr 2023 10:26:03 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com
Subject: Re: [PATCH v3 00/12] MIPS Virt board support
Message-ID: <20230405082603.GA5556@alpha.franken.de>
References: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 04, 2023 at 10:33:39AM +0100, Jiaxun Yang wrote:
> Hi all,
> 
> This patchset adds support for the MIPS Virt board, which is based
> on my QEMU patch [1].
> 
> It can work with all CPUs from MIPS Technologies, and also Loongson-2E,
> Loongson-2F, Cavium Octeon, R4000.
> 
> Thanks to generic platform, there is nothing much to do for the platform
> support, mostly decoupling CPU features with platform features, except for
> last two patches.
> 
> Note that due to QEMU limitation, SMP support is currently broken for all
> processors other than MIPS I6400/I6500. This is because QEMU is now treatiing
> secundary CPUs as a VPE (MIPS Release 6 VP). I'm going to fix that after getting
> virt board support merged in QEMU.
> 
> Thanks.
> 
> - Jiaxun
> [1]: https://lore.kernel.org/qemu-devel/20230308000745.56394-1-philmd@linaro.org/
> 
> Jiaxun Yang (12):
>   MIPS: Move declaration of bcache ops to cache.c
>   MIPS: smp-cps: Disable coherence setup for unsupported ISA
>   MIPS: mips-cm: Check availability of config registers
>   MIPS: Octeon: Opt-out 4k_cache feature
>   MIPS: cpu-features: Enable octeon_cache by cpu_type
>   MIPS: c-octeon: Provide alternative SMP cache flush function
>   MIPS: Octeon: Allow CVMSEG to be disabled
>   MIPS: Loongson: Move arch cflags to MIPS top level Makefile
>   MIPS: Loongson: Don't select platform features with CPU
>   MIPS: Octeon: Disable CVMSEG by default on other platforms
>   MIPS: Add board config for virt board
>   MIPS: generic: Enable all CPUs supported by virt board in Kconfig
> 
>  arch/mips/Kconfig                           |  6 ++--
>  arch/mips/Makefile                          | 38 +++++++++++++++++++++
>  arch/mips/cavium-octeon/Kconfig             |  3 +-
>  arch/mips/configs/generic/board-virt.config | 38 +++++++++++++++++++++
>  arch/mips/include/asm/cache.h               |  2 ++
>  arch/mips/include/asm/cpu-features.h        | 21 ++++++++++--
>  arch/mips/include/asm/processor.h           |  7 +++-
>  arch/mips/kernel/asm-offsets.c              |  3 ++
>  arch/mips/kernel/cps-vec.S                  |  5 +++
>  arch/mips/kernel/cpu-probe.c                |  2 ++
>  arch/mips/kernel/mips-cm.c                  |  9 +++--
>  arch/mips/kernel/smp-cps.c                  |  5 +++
>  arch/mips/loongson2ef/Kconfig               |  3 ++
>  arch/mips/loongson2ef/Platform              | 35 -------------------
>  arch/mips/loongson64/Platform               | 16 ---------
>  arch/mips/mm/c-octeon.c                     |  5 +++
>  arch/mips/mm/c-r4k.c                        | 14 --------
>  arch/mips/mm/cache.c                        | 19 +++++++++++
>  18 files changed, 158 insertions(+), 73 deletions(-)
>  create mode 100644 arch/mips/configs/generic/board-virt.config
> 
> -- 
> 2.39.2 (Apple Git-143)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
