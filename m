Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A64930AA8E
	for <lists+linux-mips@lfdr.de>; Mon,  1 Feb 2021 16:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbhBAPJM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Feb 2021 10:09:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:37360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229564AbhBAPGd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Feb 2021 10:06:33 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68A6764DAD;
        Mon,  1 Feb 2021 14:56:14 +0000 (UTC)
Date:   Mon, 1 Feb 2021 09:56:12 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ingo Molnar <mingo@redhat.com>,
        Wu Zhangjin <wuzhangjin@gmail.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH 3/3] MIPS: ftrace: Add DYNAMIC_FTRACE_WITH_REGS support
Message-ID: <20210201095612.62e62544@gandalf.local.home>
In-Reply-To: <1612080878-5426-3-git-send-email-hejinyang@loongson.cn>
References: <1612080878-5426-1-git-send-email-hejinyang@loongson.cn>
        <1612080878-5426-3-git-send-email-hejinyang@loongson.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 31 Jan 2021 16:14:38 +0800
Jinyang He <hejinyang@loongson.cn> wrote:

> In the past, we have always used the address of _mcount as the address of
> ftrace_caller. It reduces one ftrace_modify_code operation when do ftrace
> on modules on 64Bit platform in this way. In order to provide
> DYNAMIC_FTRACE_WITH_REGS, we have to take _mcount out of ftrace_caller and
> add a new definition of _mcount. It is necessary to modify 2 instructions.
> Also add the definition of ftrace_regs_caller. ftrace_regs_caller will
> store and restore more registers. Of course, some functions in ftrace.c
> also need to consider ftrace_regs_caller. Modify these functions and add
> the related code of ftrace_regs_caller.

Note, while you are making these changes, you may want to look at the new
feature of ftrace that has HAVE_DYNAMIC_FTRACE_WITH_ARGS.

I noticed that with x86 (and probably all other archs), you need to save
the arguments before calling the ftrace callbacks in the ftrace trampoline.
If done properly, this means that the callbacks should be able to access
the function arguments. What happens then, it structures the arguments in a
way that if the function was called with "WITH_REGS" set, its the full
pt_regs structure. Otherwise, it's a partial structure called "ftrace_regs".


See arch/x86/include/asm/ftrace.h for ftrace_regs.

Then the ftrace_regs is passed to the callback instead of pt_regs (for all
callbacks!).

If a callback has the REGS flag set (ftrace_caller_regs), then to get the
pt_regs, it needs to call:

	struct pt_regs *regs = arch_ftrace_get_regs(ftrace_regs);

Where arch_ftrace_get_regs() returns the full pt_regs if the callback was
called from a ftrace_caller_regs trampoline, otherwise it must return NULL.

The reason to return NULL is that we don't want callbacks using pt_regs,
thinking it's fully populated when it is not.

But if HAVE_DYNAMIC_FTRACE_ARGS is set, then all ftrace callbacks
(regardless of REGS flag being set) has access to the arguments from the
ftrace_regs.

-- Steve
