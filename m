Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCB1443E1
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2019 18:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387746AbfFMQdT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Jun 2019 12:33:19 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:41404 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730833AbfFMIJU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Jun 2019 04:09:20 -0400
Received: by mail-io1-f67.google.com with SMTP id w25so15252239ioc.8
        for <linux-mips@vger.kernel.org>; Thu, 13 Jun 2019 01:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/oVsNUhSx6j4f3xhWYb6vsAFInZrU/IX7T+23GUUoOU=;
        b=Gcya2V0EL5o+wWl33NshjgnCjth5QHborDOVLwE6sc5iO8/qFys9E70QL3IPe3oNLT
         f0rijHv7HtnxNOK5dGbxWi+D3Rx4TGdIra9oeUEyDpNWDNmSvnRpZnd2u0OuBthyDiXO
         OlEC3hDOYeobljZuLdr06VHi12627b3XP1zE3kv7BtBG0j0RWjTVpEw0Tm9+YYzcDabo
         benk40uXdC5BsyRXr57rMTys4COaTVwybyz+rkZ8bsjqVLH5Aravdkkz04OO4iHg/OmW
         ZDG9PO5tEheqsyQ0BMr7NoK1Q17hGOjnBS7jiOQvHmqlTcmyIuhGGF/M5QaSvQLXdpOD
         BNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/oVsNUhSx6j4f3xhWYb6vsAFInZrU/IX7T+23GUUoOU=;
        b=SS/Lt5ghDuYd5fMYwR5Irgo7roxU1xweK1a8it7axxaTBn+WgbVLiq4KeGMjKethje
         XPt0wXuG3cXjD6uPnAcgvzUCBI6pgfqY0HPQ0AotOokqrIVvWH+OFxeE9f2o/YroxX0U
         3dHWVJMr2O58sNc0TwuY5MvTXUEUQ33CFIcwkG9A6Z/IdvmOS7yhHM8PXR+iR1HC24Kh
         ZeJTjX14HD5EFCUS9kg7+fSJu8kC9HEKU0LptKalmtPHfbZtM9b23ftk2mX/ZmX+eeNf
         WmKkrZvqZALwQ3ZwObVVWUfV+7NyrWCSnkrgjIOTWaGLioab2G9uDuT+5apaaayHMiG9
         T5lw==
X-Gm-Message-State: APjAAAVv56shDSG9Lk3YTcgV7ReXxwRX84vWJQIhyrjfu0SlBMQtLJ/1
        Ymc8+G4BKT7yTBJOqdaSgUTfxsqVs+b4C6z0zh/+0LbPrUE=
X-Google-Smtp-Source: APXvYqwfIRbgywdggAbUHHTmTwRsTJFW8VIs64qd1KwviwoiAqFdwLFRXTtym0La12aYtPNwB8ZCiHyU0X9/b3Qge+s=
X-Received: by 2002:a6b:8dcf:: with SMTP id p198mr10941223iod.46.1560413359593;
 Thu, 13 Jun 2019 01:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190613063057.szrvmvpauzagxf62@pengutronix.de>
In-Reply-To: <20190613063057.szrvmvpauzagxf62@pengutronix.de>
From:   Yafang Shao <laoar.shao@gmail.com>
Date:   Thu, 13 Jun 2019 16:08:43 +0800
Message-ID: <CALOAHbBd2nv=qAy4b4rP_vxtsTAc-eLrozfzzyVhXVQXrpMvtg@mail.gmail.com>
Subject: Re: MIPS: ath79: regression after patch: sched/fair: do not expose
 some tracepoints to user if CONFIG_SCHEDSTATS is not set
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     linux-mips@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 13, 2019 at 2:30 PM Oleksij Rempel <o.rempel@pengutronix.de> wrote:
>
> Hi,
>
> After patch:
> -----------------------------------------------------
> commit 2a09b5de235a6b5f76193a2ed46546a2944f98bf
> Author: Yafang Shao <laoar.shao@gmail.com>
> Date:   Tue Mar 26 20:13:10 2019 +0800
>     sched/fair: do not expose some tracepoints to user if CONFIG_SCHEDSTATS is not set
>
>     The tracepoints trace_sched_stat_{iowait, blocked, wait, sleep} should
>     be not exposed to user if CONFIG_SCHEDSTATS is not set.
>
>     Link: http://lkml.kernel.org/r/1553602391-11926-3-git-send-email-laoar.shao@gmail.com
>
>     Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>     Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
>     Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> -----------------------------------------------------
>
> i can't boot kernel on MIPS based system Atheros ar9331. The boot
> process ends with following oops:
> -----------------------------------------------------
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 16256                                                                                                [0/1518]
> [    0.000000] Kernel command line:   ip=dhcp root=/dev/nfs nfsroot=192.168.23.4:/home/ore/nfsroot/dpt-module,v3,tcp
> [    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
> [    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
> [    0.000000] Writing ErrCtl register=00000000
> [    0.000000] Readback ErrCtl register=00000000
> [    0.000000] Memory: 56376K/65536K available (5376K kernel code, 437K rwdata, 1068K rodata, 1432K init, 214K bss, 9160K reserved, 0K cma-reserved)
> [    0.000000] random: get_random_u32 called from cache_random_seq_create+0x9c/0x170 with crng_init=0
> [    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> [    0.000000] ftrace: allocating 18167 entries in 36 pages
> [    0.000000] CPU 0 Unable to handle kernel paging request at virtual address 00000000, epc == 00000000, ra == 00000000
> [    0.000000] Oops[#1]:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.2.0-rc4+ #308
> [    0.000000] $ 0   : 00000000 8007e5fc 00000003 00000002
> [    0.000000] $ 4   : 00000001 00000000 00000000 83c22470
> [    0.000000] $ 8   : 00000000 00000000 00000000 00000000
> [    0.000000] $12   : 806afe04 00000000 00000001 00000000
> [    0.000000] $16   : 800adc0c 800adc00 00000000 00000000
> [    0.000000] $20   : 00000000 0000048e 00000000 806c0000
> [    0.000000] $24   : 00000003 800619e4
> [    0.000000] $28   : 806ae000 806afe10 808b0000 00000000
> [    0.000000] Hi    : 00000000
> [    0.000000] Lo    : 00000000
> [    0.000000] epc   : 00000000 0x0
> [    0.000000] ra    : 00000000 0x0
> [    0.000000] Status: 10000002 KERNEL EXL
> [    0.000000] Cause : 10800008 (ExcCode 02)
> [    0.000000] BadVA : 00000000
> [    0.000000] PrId  : 00019374 (MIPS 24Kc)
> [    0.000000] Modules linked in:
> [    0.000000] Process swapper (pid: 0, threadinfo=(ptrval), task=(ptrval), tls=00000000)
> [    0.000000] Stack : 00000002 8007e784 806ca284 00000000 800adc0c 00000000 80070eb0 8007108c
> [    0.000000]         83c03c00 801ab7d8 83c03b80 00000000 00000000 83c03b80 00000000 801109cc
> [    0.000000]         00000001 80880000 80880000 800c1318 00000000 ffffffff 806b0000 806b0000
> [    0.000000]         83c22470 0000048e 8075eb00 807706dc 806b0000 80753158 806b0000 80755209
> [    0.000000]         00000001 80880000 80880000 80726cc8 ffffffff 000046f7 00000024 00000003
> [    0.000000]         ...
> [    0.000000] Call Trace:
> [    0.000000]
> [    0.000000] [<8007e784>] r4k_flush_icache_range+0x10/0x18
> [    0.000000] [<800adc0c>] preempt_count_sub+0x10/0xe4
> [    0.000000] [<80070eb0>] ftrace_caller+0x0/0x54
> [    0.000000] [<8007108c>] ftrace_make_nop+0x8c/0x94
> [    0.000000] [<801ab7d8>] __get_free_pages+0x2c/0x60
> [    0.000000] [<801109cc>] ftrace_process_locs+0x364/0x3ec
> [    0.000000] [<800c1318>] vprintk_default+0x34/0x40
> [    0.000000] [<80726cc8>] ftrace_init+0xb8/0x138
> [    0.000000] [<8071ac98>] start_kernel+0x290/0x584
> [    0.000000] [<8071a368>] unknown_bootoption+0x0/0x270
> [    0.000000]
> [    0.000000] Code: (Bad address in epc)
> [    0.000000]
> [    0.000000] ---[ end trace 64e6fa591c4a277c ]---
> [    0.000000] Kernel panic - not syncing: Fatal exception
> [    0.000000] Rebooting in
> -----------------------------------------------------
>
> After reverting this patch I can normally boot the kernel.
> The kernel is build with CONFIG_SCHEDSTATS not set.
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

Hi Oleksij,

This really makes me confused.
If CONFIG_SCHEDSTATS is not set,  trace_sched_stat_{iowait, blocked,
wait, sleep} will be optimized out by
the compiler. That should not effect other codes.

Would you pls. try bellow command on your build server?
$ objdump -dr kernel/sched/fair.o | awk '/>:$/ { F=$2 } /sched_stat/ {
print F " " $0 }'

Thanks
Yafang
