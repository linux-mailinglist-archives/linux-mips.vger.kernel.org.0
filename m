Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E529A1B81B6
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 23:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgDXVqT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Apr 2020 17:46:19 -0400
Received: from elvis.franken.de ([193.175.24.41]:53508 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbgDXVqR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Apr 2020 17:46:17 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jS69H-0007ly-01; Fri, 24 Apr 2020 23:46:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 64750C02FB; Fri, 24 Apr 2020 23:37:07 +0200 (CEST)
Date:   Fri, 24 Apr 2020 23:37:07 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V3 1/3] MIPS: Fix the declaration conflict of
 mm_isBranchInstr()
Message-ID: <20200424213707.GB23556@alpha.franken.de>
References: <1587725806-4529-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587725806-4529-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 24, 2020 at 06:56:44PM +0800, Huacai Chen wrote:
> mm_isBranchInstr() is declared both in branch.h and in fpu_emulator.h
> but the two declarations are conflict. If both of them are included by
> a same file, they will cause a build error:
> 
> ./arch/mips/include/asm/branch.h:33:19: error: static declaration of 'mm_isBranchInstr' follows non-static declaration
>  static inline int mm_isBranchInstr(struct pt_regs *regs,
>                    ^
> ./arch/mips/include/asm/fpu_emulator.h:177:5: note: previous declaration of 'mm_isBranchInstr' was here
>  int mm_isBranchInstr(struct pt_regs *regs, struct mm_decoded_insn dec_insn,
> 
> Fix this error by removing both isBranchInstr() and mm_isBranchInstr()
> in fpu_emulator.h, and declaring both of them in branch.h.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/branch.h       | 3 +++
>  arch/mips/include/asm/fpu_emulator.h | 4 ----
>  2 files changed, 3 insertions(+), 4 deletions(-)

Patch 1-3 applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
