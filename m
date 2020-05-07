Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEBC31C8894
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 13:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgEGLnR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 07:43:17 -0400
Received: from elvis.franken.de ([193.175.24.41]:43570 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbgEGLnQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 07:43:16 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jWevq-00081e-01; Thu, 07 May 2020 13:43:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9947AC0409; Thu,  7 May 2020 12:59:59 +0200 (CEST)
Date:   Thu, 7 May 2020 12:59:59 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Liangliang Huang <huanglllzu@gmail.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Liangliang Huang <huangll@lemote.com>
Subject: Re: [PATCH] MIPS: Use fallthrough full arch/mips
Message-ID: <20200507105959.GB11616@alpha.franken.de>
References: <1588582289-27236-1-git-send-email-huangll@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588582289-27236-1-git-send-email-huangll@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 04, 2020 at 04:51:29PM +0800, Liangliang Huang wrote:
> Convert the various /* fallthrough */ comments to the pseudo-keyword
> fallthrough;
> 
> Done via script:
> https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe@perches.com/
> 
> Signed-off-by: Liangliang Huang <huangll@lemote.com>
> ---
>  arch/mips/alchemy/devboards/db1550.c         |  2 +-
>  arch/mips/ar7/setup.c                        |  2 +-
>  arch/mips/ath79/setup.c                      |  3 +--
>  arch/mips/bcm63xx/cpu.c                      |  2 +-
>  arch/mips/bcm63xx/dev-flash.c                |  2 +-
>  arch/mips/cavium-octeon/executive/cvmx-pko.c |  2 +-
>  arch/mips/cavium-octeon/octeon-platform.c    |  4 ++--
>  arch/mips/cavium-octeon/octeon-usb.c         |  2 +-
>  arch/mips/dec/tc.c                           |  2 +-
>  arch/mips/include/asm/fpu.h                  |  2 +-
>  arch/mips/include/asm/octeon/cvmx-sli-defs.h |  2 +-
>  arch/mips/include/asm/page.h                 |  2 +-
>  arch/mips/kernel/branch.c                    | 26 +++++++++++++-------------
>  arch/mips/kernel/cpu-probe.c                 | 22 +++++++++++-----------
>  arch/mips/kernel/idle.c                      |  2 +-
>  arch/mips/kernel/mips-r2-to-r6-emul.c        |  2 +-
>  arch/mips/kernel/signal.c                    |  2 +-
>  arch/mips/kernel/traps.c                     |  3 +--
>  arch/mips/kernel/watch.c                     | 26 +++++++++++++-------------
>  arch/mips/kvm/emulate.c                      |  8 ++++----
>  arch/mips/math-emu/cp1emu.c                  | 28 ++++++++++++++--------------
>  arch/mips/math-emu/dp_add.c                  |  3 +--
>  arch/mips/math-emu/dp_div.c                  |  3 +--
>  arch/mips/math-emu/dp_fmax.c                 |  6 ++----
>  arch/mips/math-emu/dp_fmin.c                 |  6 ++----
>  arch/mips/math-emu/dp_maddf.c                |  3 +--
>  arch/mips/math-emu/dp_mul.c                  |  3 +--
>  arch/mips/math-emu/dp_sqrt.c                 |  5 ++---
>  arch/mips/math-emu/dp_sub.c                  |  3 +--
>  arch/mips/math-emu/sp_add.c                  |  3 +--
>  arch/mips/math-emu/sp_div.c                  |  3 +--
>  arch/mips/math-emu/sp_fdp.c                  |  3 +--
>  arch/mips/math-emu/sp_fmax.c                 |  6 ++----
>  arch/mips/math-emu/sp_fmin.c                 |  6 ++----
>  arch/mips/math-emu/sp_maddf.c                |  3 +--
>  arch/mips/math-emu/sp_mul.c                  |  3 +--
>  arch/mips/math-emu/sp_sub.c                  |  3 +--
>  arch/mips/mm/c-r4k.c                         |  6 +++---
>  arch/mips/mm/tlbex.c                         |  2 +-
>  arch/mips/oprofile/op_model_mipsxx.c         | 26 +++++++++++++-------------
>  arch/mips/pci/fixup-sni.c                    |  3 +--
>  arch/mips/pci/ops-bcm63xx.c                  |  2 +-
>  42 files changed, 112 insertions(+), 135 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
