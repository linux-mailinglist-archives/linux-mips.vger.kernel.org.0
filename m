Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10DE452D3D
	for <lists+linux-mips@lfdr.de>; Tue, 16 Nov 2021 09:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232600AbhKPI6A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Nov 2021 03:58:00 -0500
Received: from elvis.franken.de ([193.175.24.41]:52950 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232506AbhKPI55 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 16 Nov 2021 03:57:57 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mmuF0-0006gG-03; Tue, 16 Nov 2021 09:54:58 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EB53EC2D9C; Tue, 16 Nov 2021 09:47:12 +0100 (CET)
Date:   Tue, 16 Nov 2021 09:47:12 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Wang Haojun <jiangliuer01@gmail.com>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Li Xuefeng <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: syscalls: Wire up futex_waitv syscall
Message-ID: <20211116084712.GD21168@alpha.franken.de>
References: <20211103025521.3615671-1-wanghaojun@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103025521.3615671-1-wanghaojun@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Nov 03, 2021 at 10:55:21AM +0800, Wang Haojun wrote:
> Wire up the futex_waitv syscall.
> 
> Fix Build warning: #warning syscall futex_waitv not implemented [-Wcpp]
> 
> Signed-off-by: Wang Haojun <wanghaojun@loongson.cn>
> ---
>  arch/mips/kernel/syscalls/syscall_n32.tbl | 1 +
>  arch/mips/kernel/syscalls/syscall_n64.tbl | 1 +
>  arch/mips/kernel/syscalls/syscall_o32.tbl | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
> index 70e32de2bcaa..e497492eb72f 100644
> --- a/arch/mips/kernel/syscalls/syscall_n32.tbl
> +++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
> @@ -387,3 +387,4 @@
>  446	n32	landlock_restrict_self		sys_landlock_restrict_self
>  # 447 reserved for memfd_secret
>  448	n32	process_mrelease		sys_process_mrelease
> +449	n32	futex_waitv			sys_futex_waitv
> diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
> index 1ca7bc337932..e2c481fcede6 100644
> --- a/arch/mips/kernel/syscalls/syscall_n64.tbl
> +++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
> @@ -363,3 +363,4 @@
>  446	n64	landlock_restrict_self		sys_landlock_restrict_self
>  # 447 reserved for memfd_secret
>  448	n64	process_mrelease		sys_process_mrelease
> +449	n64	futex_waitv			sys_futex_waitv
> diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
> index a61c35edaa74..3714c97b2643 100644
> --- a/arch/mips/kernel/syscalls/syscall_o32.tbl
> +++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
> @@ -436,3 +436,4 @@
>  446	o32	landlock_restrict_self		sys_landlock_restrict_self
>  # 447 reserved for memfd_secret
>  448	o32	process_mrelease		sys_process_mrelease
> +449	o32	futex_waitv			sys_futex_waitv
> -- 
> 2.27.0

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
