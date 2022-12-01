Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BECB963F1B3
	for <lists+linux-mips@lfdr.de>; Thu,  1 Dec 2022 14:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbiLANeM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Dec 2022 08:34:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbiLANeJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Dec 2022 08:34:09 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 901F5AC1B0;
        Thu,  1 Dec 2022 05:34:08 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1p0jhW-000077-02; Thu, 01 Dec 2022 14:34:06 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D4996C1FB9; Thu,  1 Dec 2022 14:33:44 +0100 (CET)
Date:   Thu, 1 Dec 2022 14:33:44 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     John Thomson <git@johnthomson.fastmail.com.au>
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        John Crispin <john@phrozen.org>,
        =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mips: ralink: mt7621: do not use kzalloc too early
Message-ID: <20221201133344.GC10560@alpha.franken.de>
References: <20221114015658.2873120-1-git@johnthomson.fastmail.com.au>
 <20221114015658.2873120-4-git@johnthomson.fastmail.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114015658.2873120-4-git@johnthomson.fastmail.com.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 14, 2022 at 11:56:58AM +1000, John Thomson wrote:
> With CONFIG_SLUB=y, following commit 6edf2576a6cc ("mm/slub: enable
> debugging memory wasting of kmalloc") mt7621 failed to boot very early,
> without showing any console messages.
> This exposed the pre-existing bug of mt7621.c using kzalloc before normal
> memory management was available.
> Prior to this slub change, there existed the unintended protection against
> "kmem_cache *s" being NULL as slab_pre_alloc_hook() happened to
> return NULL and bailed out of slab_alloc_node().
> This allowed mt7621 prom_soc_init to fail in the soc_dev_init kzalloc,
> but continue booting without the SOC_BUS driver device registered.
> 
> Console output from a DEBUG_ZBOOT vmlinuz kernel loading,
> with mm/slub modified to warn on kmem_cache zero or null:
> 
> zimage at:     80B842A0 810B4BC0
> Uncompressing Linux at load address 80001000
> Copy device tree to address  80B80EE0
> Now, booting the kernel...
> 
> [    0.000000] Linux version 6.1.0-rc3+ (john@john)
> (mipsel-buildroot-linux-gnu-gcc.br_real (Buildroot
> 2021.11-4428-g6b6741b) 12.2.0, GNU ld (GNU Binutils) 2.39) #73 SMP Wed
>      Nov  2 05:10:01 AEST 2022
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at mm/slub.c:3416
> kmem_cache_alloc+0x5a4/0x5e8
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.1.0-rc3+ #73
> [    0.000000] Stack : 810fff78 80084d98 00000000 00000004 00000000
> 00000000 80889d04 80c90000
> [    0.000000]         80920000 807bd328 8089d368 80923bd3 00000000
> 00000001 80889cb0 00000000
> [    0.000000]         00000000 00000000 807bd328 8084bcb1 00000002
> 00000002 00000001 6d6f4320
> [    0.000000]         00000000 80c97d3d 80c97d68 fffffffc 807bd328
> 00000000 00000000 00000000
> [    0.000000]         00000000 a0000000 80910000 8110a0b4 00000000
> 00000020 80010000 80010000
> [    0.000000]         ...
> [    0.000000] Call Trace:
> [    0.000000] [<80008260>] show_stack+0x28/0xf0
> [    0.000000] [<8070c958>] dump_stack_lvl+0x60/0x80
> [    0.000000] [<8002e184>] __warn+0xc4/0xf8
> [    0.000000] [<8002e210>] warn_slowpath_fmt+0x58/0xa4
> [    0.000000] [<801c0fac>] kmem_cache_alloc+0x5a4/0x5e8
> [    0.000000] [<8092856c>] prom_soc_init+0x1fc/0x2b4
> [    0.000000] [<80928060>] prom_init+0x44/0xf0
> [    0.000000] [<80929214>] setup_arch+0x4c/0x6a8
> [    0.000000] [<809257e0>] start_kernel+0x88/0x7c0
> [    0.000000]
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] SoC Type: MediaTek MT7621 ver:1 eco:3
> [    0.000000] printk: bootconsole [early0] enabled
> 
> Allowing soc_device_register to work exposed oops in the mt7621 phy pci,
> and pci controller drivers from soc_device_match_attr, due to missing
> sentinels in the quirks tables. These were fixed with:
> commit 819b885cd886 ("phy: ralink: mt7621-pci: add sentinel to quirks
> table")
> not yet applied ("PCI: mt7621: add sentinel to quirks table")
> 
> Link: https://lore.kernel.org/linux-mm/becf2ac3-2a90-4f3a-96d9-a70f67c66e4a@app.fastmail.com/
> Fixes: 71b9b5e0130d ("MIPS: ralink: mt7621: introduce 'soc_device' initialization")
> Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>
> ---
>  arch/mips/ralink/mt7621.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
