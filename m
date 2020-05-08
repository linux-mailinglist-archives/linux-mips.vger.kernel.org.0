Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E660C1CB07E
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 15:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgEHNbt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 May 2020 09:31:49 -0400
Received: from elvis.franken.de ([193.175.24.41]:44857 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727981AbgEHNbo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 May 2020 09:31:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jX36M-0003ty-00; Fri, 08 May 2020 15:31:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 26EE4C0419; Fri,  8 May 2020 15:01:49 +0200 (CEST)
Date:   Fri, 8 May 2020 15:01:49 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: inst.h: Stop including asm.h to avoid various
 build failures
Message-ID: <20200508130149.GA14297@alpha.franken.de>
References: <1588930212-5255-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588930212-5255-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 08, 2020 at 05:30:12PM +0800, Huacai Chen wrote:
> Commit d339cd02b888eb8 ("MIPS: Move unaligned load/store helpers to
> inst.h") causes a lot of build failures because macros in asm.h conflict
> with various subsystems. Some of these conflictions has been fixed (such
> as LONG, PANIC and PRINT) by adjusting asm.h, but some of them is nearly
> impossible to fix (such as PTR and END). The only reason of including
> asm.h in inst.h is that we need the PTR macro which is used by unaligned
> load/store helpers. So in this patch we define a new PTR_STR macro and
> use it to replace STR(PTR), then we can stop including asm.h to avoid
> various build failures.
> 
> Fixes: d339cd02b888eb8 ("MIPS: Move unaligned load/store helpers to inst.h")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/include/asm/inst.h | 184 ++++++++++++++++++++++---------------------

applied to mips-next. /me hopes this is the last fix... thanks

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
