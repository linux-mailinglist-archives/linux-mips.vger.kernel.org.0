Return-Path: <linux-mips+bounces-12482-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE234CC01D1
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 23:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDB1F30146D1
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 22:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29F32C17B6;
	Mon, 15 Dec 2025 22:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b="RdaK5rJ1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB66E2DBF76
	for <linux-mips@vger.kernel.org>; Mon, 15 Dec 2025 22:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765837132; cv=none; b=GdgY/opNWwYmZJJmJPVfkOpsdUzkbgDCFUVDC0aQSIxnBKS9+y9qam+ILVN8ZgEIsxUxu2e2bbE0vizwzZkNs1tUFLRQgz3MLq21S4c/gOBR94FoIqIjqg2iph6GYFdpaNEkXBi7rw5QRdsU1wHlbtMJKjz+i1SNrF8h7UBW2vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765837132; c=relaxed/simple;
	bh=ZpwQwkS/P8eUJp6RSe+vxi9bJOuCGh/qdvoi0X+/Xmg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EdQhhIDXs5zvAdcOb1OvNNRHWeu47ooDxQArtkSGqbeoE5XwVns7iv4Bjq9/dHTbp7OUonHDfBbPxNG+0MM+zlC0he0je9wLiweSUolNTR+q5dRFq+o7iOqqPUwPIbxnqBEaj5MLSuccj6WVn4Zpv1TlCE0+Wwoe3fYagU6AHeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de; spf=pass smtp.mailfrom=hauke-m.de; dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b=RdaK5rJ1; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hauke-m.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dVZGG4wg1z9t9B;
	Mon, 15 Dec 2025 23:18:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
	t=1765837126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTeFniBUPABY4AHr4pAPr6tBvWQuH9PMtBm3II5kyZE=;
	b=RdaK5rJ1mzSmMnNc40NXhtiO6JTOemzwyaG+m14l0mcJsdaAhEbcG08BXTjT2ir8ToDp5+
	5Lcnep7WdZ3Tndz5pwtnH7mQdl8fhodcZN6vWrg+lzx28HJSfhIoHElLQBF50U6BeeU98P
	SZ2He13t9D/wyENz80sa4vjTD4ety+lB0s8YzLSDGo8ZLuFa9LGlltgRYmn6pRW37C/0Nu
	19uDRPsn0OLcB2IJWPd8IjzobAAJYaLuJm9yHka8h0IA5Dw675qDt8nEWya5EiNjrL1kx+
	zGNPpWAthcKiENtSeXyuP5G7aNdJEgHX76MGHlXZANmtLs0RzcajTGnakRu02w==
Message-ID: <d29f4c9e-1458-47ef-8f5e-1e7a43c729b8@hauke-m.de>
Date: Mon, 15 Dec 2025 23:18:45 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Realtek rtl838x MIPS boot hangs since 6.6.119
From: Hauke Mehrtens <hauke@hauke-m.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <b35fe4b3-8f42-49f4-a6bf-9f0e56d4050c@hauke-m.de>
 <alpine.DEB.2.21.2512151706150.31276@angie.orcam.me.uk>
 <06e66320-110b-4b13-abfc-ed86aeafafb5@hauke-m.de>
Content-Language: en-US
In-Reply-To: <06e66320-110b-4b13-abfc-ed86aeafafb5@hauke-m.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/15/25 23:01, Hauke Mehrtens wrote:
> On 12/15/25 18:55, Maciej W. Rozycki wrote:
>> On Mon, 15 Dec 2025, Hauke Mehrtens wrote:
>>
>>> Linux 6.6.119 does not boot on my Zyxel GS1900-8 v1 Switch (rtl838x 
>>> SoC) any
>>> more.
>>>
>>> When I revert these two patches the system boots up again:
>>>
>>> MIPS: mm: Prevent a TLB shutdown on initial uniquification
>>> commit 9f048fa upstream.
>>> https://github.com/gregkh/linux/ 
>>> commit/135713cd0751bf296e515f5fdec234320f73bbd8
>>>
>>> MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
>>> commit 841ecc9 upstream.
>>> https://github.com/gregkh/linux/ 
>>> commit/231ac951fabae2aaed8b2c00b4a097107be49c8c
>>
>>   Thank you for the report and apologies to cause you trouble.  This area
>> seems quite model-specific in a subtle way, as we have both CPU and the
>> way firmware has initialised it to take into account.
>>
>>   Can you please try the debug patch included below (which I used to 
>> verify
>> the correct operation of the changes referred above) and report the 
>> output
>> produced?
>>
>>    Maciej
> 
> Thanks for the help.
> With your patch I am getting this on top of kernel 6.6.119:
> 
> ```
> [    0.000000] Linux version 6.6.119 (hauke@hauke-p14s) (mips-openwrt- 
> linux-musl-gcc (OpenWrt GCC 13.3.0 r28784-155eea44e7) 13.3.0, GNU ld 
> (GNU Binutils) 2.42) #0 Mon Dec 15 01:12:37 2025
> [    0.000000] RTL838X model is 83806800
> [    0.000000] SoC Type: RTL8380
> [    0.000000] printk: bootconsole [early0] enabled
> [    0.000000] CPU0 revision is: 00019070 (MIPS 4KEc)
> [    0.000000] MIPS: machine is Zyxel GS1900-8 v1 Switch
> [    0.000000] earlycon: ns16550a0 at MMIO 0x18002000 (options '115200n8')
> [    0.000000] printk: bootconsole [ns16550a0] enabled
> [    0.000000] Initrd not found or empty - disabling initrd
> [    0.000000] Using appended Device Tree.
> [    0.000000] Primary instruction cache 16kB, VIPT, 4-way, linesize 16 
> bytes.
> [    0.000000] Primary data cache 16kB, 2-way, VIPT, cache aliases, 
> linesize 16 bytes
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000000000000-0x0000000007ffffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000000000-0x0000000007ffffff]
> [    0.000000] Initmem setup node 0 [mem 
> 0x0000000000000000-0x0000000007ffffff]
> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> [    0.000000] pcpu-alloc: [0] 0
> [    0.000000] Kernel command line: earlycon
> [    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 
> bytes, linear)
> [    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 
> bytes, linear)
> [    0.000000] r4k_tlb_uniquify: 0
> [    0.000000] [00/00]: 000000f4/00000000/00000000
> [    0.000000] [01/01]: 000000f4/00000000/00000000
> ```
> 
> In a successful boot, with the two patches reverted it would print these 
> lines next:
> ```
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 32480
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 119336K/131072K available (6743K kernel code, 
> 619K rwdata, 1576K rodata, 1232K init, 225K bss, 11736K reserved, 0K 
> cma-reserved)
> [    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> ```
> 
> 
> cpuinfo looks like this:
> ```
> root@OpenWrt:~# cat /proc/cpuinfo
> system type             : RTL8380
> machine                 : Zyxel GS1900-8 v1 Switch
> processor               : 0
> cpu model               : MIPS 4KEc V7.0
> BogoMIPS                : 498.89
> wait instruction        : yes
> microsecond timers      : yes
> tlb_entries             : 32
> extra interrupt vector  : yes
> hardware watchpoint     : yes, count: 2, address/irw mask: [0x0fff, 0x0fff]
> isa                     : mips1 mips2 mips32r1 mips32r2
> ASEs implemented        : mips16
> Options implemented     : tlb 4kex 4k_cache 32fpr prefetch mcheck ejtag 
> llsc dc_aliases perf_cntr_intr_bit mm_full
> shadow register sets    : 1
> kscratch registers      : 0
> package                 : 0
> core                    : 0
> VCED exceptions         : not available
> VCEI exceptions         : not available
> 
> root@OpenWrt:~#
> ```
> 
> Only reverting "MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow" 
> is not sufficient, the kernel still hangs at the same position.
> 
> Hauke


Hi,

I added some more printks into the code. The tlb_write_indexed() in 
r4k_tlb_uniquify() is hanging when it is called in the loop with i == 1.

```
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 
bytes, linear)
[    0.000000] r4k_tlb_uniquify: 0
[    0.000000] tlbsize: 32
[    0.000000] next write_c0_index(0)
[    0.000000] next mtc0_tlbr_hazard()
[    0.000000] next tlb_read()
[    0.000000] next tlb_read_hazard()
[    0.000000] next read_c0_entryhi()
[    0.000000] [00/00]: 000000a8/00000000/00000000
[    0.000000] next mtc0_tlbw_hazard()
[    0.000000] next tlb_write_indexed()
[    0.000000] next tlbw_use_hazard()
[    0.000000] next end()
[    0.000000] next write_c0_index(1)
[    0.000000] next mtc0_tlbr_hazard()
[    0.000000] next tlb_read()
[    0.000000] next tlb_read_hazard()
[    0.000000] next read_c0_entryhi()
[    0.000000] [01/01]: 000000a8/00000000/00000000
[    0.000000] next mtc0_tlbw_hazard()
[    0.000000] next tlb_write_indexed()
```

Hauke

