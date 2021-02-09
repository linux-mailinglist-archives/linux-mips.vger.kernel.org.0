Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D5C314F35
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 13:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbhBIMkg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Feb 2021 07:40:36 -0500
Received: from elvis.franken.de ([193.175.24.41]:36513 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230125AbhBIMj7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Feb 2021 07:39:59 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l9SIV-0003IE-03; Tue, 09 Feb 2021 13:39:15 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 47203C0DBF; Tue,  9 Feb 2021 13:36:23 +0100 (CET)
Date:   Tue, 9 Feb 2021 13:36:23 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Youling Tang <tangyouling@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: crash_dump.c: Simplify copy_oldmem_page()
Message-ID: <20210209123623.GC11264@alpha.franken.de>
References: <1612682649-3389-1-git-send-email-tangyouling@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612682649-3389-1-git-send-email-tangyouling@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Feb 07, 2021 at 03:24:09PM +0800, Youling Tang wrote:
> Replace kmap_atomic_pfn() with kmap_local_pfn() which is preemptible and
> can take page faults.
> 
> Remove the indirection of the dump page and the related cruft which is not
> longer required.
> 
> Remove unused or redundant header files.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
> 
> v2:
>  - Keep the crash_dump.h header file included to avoid the
>    "no previous prototype for function" warning.
> 
>  arch/mips/kernel/crash_dump.c | 41 ++++++-----------------------------------
>  1 file changed, 6 insertions(+), 35 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
