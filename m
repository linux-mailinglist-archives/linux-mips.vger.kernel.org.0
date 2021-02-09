Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 967B4314F33
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 13:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhBIMke (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Feb 2021 07:40:34 -0500
Received: from elvis.franken.de ([193.175.24.41]:36514 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230217AbhBIMj7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Feb 2021 07:39:59 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l9SIV-0003IE-04; Tue, 09 Feb 2021 13:39:15 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 02E75C0DBF; Tue,  9 Feb 2021 13:37:46 +0100 (CET)
Date:   Tue, 9 Feb 2021 13:37:46 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: process: Fix no previous prototype warning
Message-ID: <20210209123746.GD11264@alpha.franken.de>
References: <1612687956-28075-1-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612687956-28075-1-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Feb 07, 2021 at 04:52:36PM +0800, Jinyang He wrote:
> unwind_stack_by_address and unwind_stack need <asm/stacktrace.h>.
> arch_align_stack needs <asm/exec.h>
> 
> link: https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/ZPL2RRA6RZKRQZI5IGOVLFXN2GVZBN3L/
> Fixes: ("MIPS: process: Remove unnecessary headers inclusion")

this Fixes is broken, it's missing a git hash. But there is no reason
for a fixes tag, because it "only" removed a warning, but doesn't fix
a bug. So I've removed it while applying the patch.

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/kernel/process.c | 2 ++
>  1 file changed, 2 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
