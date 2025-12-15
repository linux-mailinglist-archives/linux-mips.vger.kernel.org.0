Return-Path: <linux-mips+bounces-12480-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0571ACC00EC
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 23:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D94E2300FA1F
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 22:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B91D288502;
	Mon, 15 Dec 2025 22:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b="SGZDliGZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A75A21A95D
	for <linux-mips@vger.kernel.org>; Mon, 15 Dec 2025 22:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765836080; cv=none; b=T3VmNlqO5hVfiJ4gHwSlnhbry8EiEUXDXVMShtb5r06729IqozCh3SqFuV/X727RdxqRaWxVPc36BBDJ3Wl2Ptey4Mq4ORNfSIrG8NvaOBbhxCyj7DFLBdLQDHgnX63i6SOn3WpMrCjv56StT+p1LG3BQrNLY3lzHB2U9TKZMQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765836080; c=relaxed/simple;
	bh=WDiDizbz/YGEcMxNqTs2psHyziK+wnahCw0ICZnH9bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhAFHKhoR0VfCb2Mjui4J66XV28nO6ZFpexp6oAXVVEx8OfD24Ajyhsq5Re8M+uGyIrrHlnCkJRRPJ/06x2WA24eNnttmni8c5AU5hnlt09DieCBUEWmcSfX+WO7+uPSwaN0VsDD3fR5zbF2522gfCZjoqHJG7LF7XKx47i5kBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de; spf=pass smtp.mailfrom=hauke-m.de; dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b=SGZDliGZ; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hauke-m.de
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dVYt205bVz9t9S;
	Mon, 15 Dec 2025 23:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
	t=1765836074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oxX1h8e3QZ0tL1qFxdqMnzdjDoOidTpiPiQV1lnQWuU=;
	b=SGZDliGZ6860mctTDaCGJSh/y5jeoIVAJCS+PsVPlgrpwnEGq7dMI72uXJofaw3tVWGllG
	v0AmmfIy/2vMkFXUEn49sTjT+rGecikIbyOnmLk1ODtm3jmr3Nzfg1grMST6RsFqa5lj/k
	OBOv1UTKSas0MhgO7oDPXMJ0Cx8WanLFUhfT1AD2VSlcRDd6GYrQeFbOYa7QnOKhc8D9Vu
	9D0jJujZBE8wX4WG5bm+6/VZim74lByUBW6KqL4qWIdouFCRw9zYSM8t3h2F1YxuSisngd
	UCYRXDGGRdNuiLsbpqhAOWKgQOrNbspyvVBOtTNQOlGexccXkK/3xBBc8dpuoQ==
Message-ID: <06e66320-110b-4b13-abfc-ed86aeafafb5@hauke-m.de>
Date: Mon, 15 Dec 2025 23:01:10 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Realtek rtl838x MIPS boot hangs since 6.6.119
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <b35fe4b3-8f42-49f4-a6bf-9f0e56d4050c@hauke-m.de>
 <alpine.DEB.2.21.2512151706150.31276@angie.orcam.me.uk>
Content-Language: en-US
From: Hauke Mehrtens <hauke@hauke-m.de>
In-Reply-To: <alpine.DEB.2.21.2512151706150.31276@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/25 18:55, Maciej W. Rozycki wrote:
> On Mon, 15 Dec 2025, Hauke Mehrtens wrote:
> 
>> Linux 6.6.119 does not boot on my Zyxel GS1900-8 v1 Switch (rtl838x SoC) any
>> more.
>>
>> When I revert these two patches the system boots up again:
>>
>> MIPS: mm: Prevent a TLB shutdown on initial uniquification
>> commit 9f048fa upstream.
>> https://github.com/gregkh/linux/commit/135713cd0751bf296e515f5fdec234320f73bbd8
>>
>> MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
>> commit 841ecc9 upstream.
>> https://github.com/gregkh/linux/commit/231ac951fabae2aaed8b2c00b4a097107be49c8c
> 
>   Thank you for the report and apologies to cause you trouble.  This area
> seems quite model-specific in a subtle way, as we have both CPU and the
> way firmware has initialised it to take into account.
> 
>   Can you please try the debug patch included below (which I used to verify
> the correct operation of the changes referred above) and report the output
> produced?
> 
>    Maciej

Thanks for the help.
With your patch I am getting this on top of kernel 6.6.119:

```
[    0.000000] Linux version 6.6.119 (hauke@hauke-p14s) 
(mips-openwrt-linux-musl-gcc (OpenWrt GCC 13.3.0 r28784-155eea44e7) 
13.3.0, GNU ld (GNU Binutils) 2.42) #0 Mon Dec 15 01:12:37 2025
[    0.000000] RTL838X model is 83806800
[    0.000000] SoC Type: RTL8380
[    0.000000] printk: bootconsole [early0] enabled
[    0.000000] CPU0 revision is: 00019070 (MIPS 4KEc)
[    0.000000] MIPS: machine is Zyxel GS1900-8 v1 Switch
[    0.000000] earlycon: ns16550a0 at MMIO 0x18002000 (options '115200n8')
[    0.000000] printk: bootconsole [ns16550a0] enabled
[    0.000000] Initrd not found or empty - disabling initrd
[    0.000000] Using appended Device Tree.
[    0.000000] Primary instruction cache 16kB, VIPT, 4-way, linesize 16 
bytes.
[    0.000000] Primary data cache 16kB, 2-way, VIPT, cache aliases, 
linesize 16 bytes
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x0000000007ffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000007ffffff]
[    0.000000] Initmem setup node 0 [mem 
0x0000000000000000-0x0000000007ffffff]
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Kernel command line: earlycon
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 
bytes, linear)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 
bytes, linear)
[    0.000000] r4k_tlb_uniquify: 0
[    0.000000] [00/00]: 000000f4/00000000/00000000
[    0.000000] [01/01]: 000000f4/00000000/00000000
```

In a successful boot, with the two patches reverted it would print these 
lines next:
```
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 32480
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 119336K/131072K available (6743K kernel code, 
619K rwdata, 1576K rodata, 1232K init, 225K bss, 11736K reserved, 0K 
cma-reserved)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
```


cpuinfo looks like this:
```
root@OpenWrt:~# cat /proc/cpuinfo
system type             : RTL8380
machine                 : Zyxel GS1900-8 v1 Switch
processor               : 0
cpu model               : MIPS 4KEc V7.0
BogoMIPS                : 498.89
wait instruction        : yes
microsecond timers      : yes
tlb_entries             : 32
extra interrupt vector  : yes
hardware watchpoint     : yes, count: 2, address/irw mask: [0x0fff, 0x0fff]
isa                     : mips1 mips2 mips32r1 mips32r2
ASEs implemented        : mips16
Options implemented     : tlb 4kex 4k_cache 32fpr prefetch mcheck ejtag 
llsc dc_aliases perf_cntr_intr_bit mm_full
shadow register sets    : 1
kscratch registers      : 0
package                 : 0
core                    : 0
VCED exceptions         : not available
VCEI exceptions         : not available

root@OpenWrt:~#
```

Only reverting "MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow" 
is not sufficient, the kernel still hangs at the same position.

Hauke

