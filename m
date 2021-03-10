Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4447A334153
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 16:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbhCJPTM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 10:19:12 -0500
Received: from elvis.franken.de ([193.175.24.41]:42325 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231150AbhCJPS5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 10:18:57 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lK0bw-00088y-05; Wed, 10 Mar 2021 16:18:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 411B9C1D54; Wed, 10 Mar 2021 16:09:41 +0100 (CET)
Date:   Wed, 10 Mar 2021 16:09:41 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Enable some missed configs in loongson3_defconfig
 to support bpftrace
Message-ID: <20210310150941.GF12960@alpha.franken.de>
References: <1615186098-2643-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615186098-2643-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 08, 2021 at 02:48:18PM +0800, Tiezhu Yang wrote:
> bpftrace is a high-level tracing language for Linux enhanced Berkeley
> Packet Filter (eBPF) available in recent Linux kernels (4.x). bpftrace
> uses LLVM as a backend to compile scripts to BPF-bytecode and makes use
> of BCC for interacting with the Linux BPF system, as well as existing
> Linux tracing capabilities: kernel dynamic tracing (kprobes), user-level
> dynamic tracing (uprobes), and tracepoints.
> 
> According to Linux Kernel Requirements in bpftrace/INSTALL.md [1], the
> kernel needs to be built with the following options:
> 
> CONFIG_BPF=y
> CONFIG_BPF_SYSCALL=y
> CONFIG_BPF_JIT=y
> CONFIG_HAVE_EBPF_JIT=y
> CONFIG_BPF_EVENTS=y
> CONFIG_FTRACE_SYSCALLS=y
> CONFIG_FUNCTION_TRACER=y
> CONFIG_HAVE_DYNAMIC_FTRACE=y
> CONFIG_DYNAMIC_FTRACE=y
> CONFIG_HAVE_KPROBES=y
> CONFIG_KPROBES=y
> CONFIG_KPROBE_EVENTS=y
> CONFIG_ARCH_SUPPORTS_UPROBES=y
> CONFIG_UPROBES=y
> CONFIG_UPROBE_EVENTS=y
> CONFIG_DEBUG_FS=y
> 
> So enable some missed configs in loongson3_defconfig to make sure
> the above configs are set after make loongson3_defconfig.
> 
> [1] https://github.com/iovisor/bpftrace/blob/master/INSTALL.md
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/configs/loongson3_defconfig | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
