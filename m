Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 973E231883E
	for <lists+linux-mips@lfdr.de>; Thu, 11 Feb 2021 11:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhBKKeN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Feb 2021 05:34:13 -0500
Received: from elvis.franken.de ([193.175.24.41]:44682 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230177AbhBKKbm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 11 Feb 2021 05:31:42 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lA9FS-0005LQ-04; Thu, 11 Feb 2021 11:30:58 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 13471C0E70; Thu, 11 Feb 2021 11:29:05 +0100 (CET)
Date:   Thu, 11 Feb 2021 11:29:05 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Oleg Nesterov <oleg@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        kernel test robot <lkp@intel.com>,
        Xingxing Su <suxingxing@loongson.cn>
Subject: Re: [PATCH v2] MIPS: Add basic support for ptrace single step
Message-ID: <20210211102905.GE7985@alpha.franken.de>
References: <1612939961-8827-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612939961-8827-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 10, 2021 at 02:52:41PM +0800, Tiezhu Yang wrote:
> In the current code, arch_has_single_step() is not defined on MIPS,
> that means MIPS does not support instruction single-step for user mode.
> 
> Delve is a debugger for the Go programming language, the ptrace syscall
> PtraceSingleStep() failed [1] on MIPS and then the single step function
> can not work well, we can see that PtraceSingleStep() definition returns
> ptrace(PTRACE_SINGLESTEP) [2].
> 
> So it is necessary to support ptrace single step on MIPS.

one way to see it. The other way is, that the Go debugger needs to learn
single stepping without ptrace single step support. IMHO gdb is already
able to do that.

IMHO ptrace single step is for CPUs supporting single stepping and not
for emulating it in the kernel.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
