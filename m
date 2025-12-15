Return-Path: <linux-mips+bounces-12455-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C8ACBC2B2
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 02:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57A903007601
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 01:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A192E06EF;
	Mon, 15 Dec 2025 01:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b="1LL1eALr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08D3287516
	for <linux-mips@vger.kernel.org>; Mon, 15 Dec 2025 01:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765761113; cv=none; b=uYS6zdAgzTq2PVuilxJlOCJGIyifF8eRv1AOPj+cRBT7EWak83z86yX3KLwK44IKsI/iT3LbzphaOMc1QmCf2MkAVhJspltRjpFA8gg/zcmXvi5Fdz9C4teCZ/fIalYK3GjVGz3GuJJnNQJxbijHAIAuL5j84VSzPF0ofzM5JRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765761113; c=relaxed/simple;
	bh=evAFBSAxBiMwARAMmPxNV3IaDjVgtfrTlaLgt6Hoj08=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=nyTp/0dwaIqjfP15x2xSGkuCgAWoyk8coKA0pcnwRi7m7wdh7RczAKnQwWITYqWyn2NuGcM969nDO2a0yospWJpJmVdV6NxtmKIKjeLKKKSUBCmoRY42NL3BjwasEc4IP1mZNnChTZseNMJv0tspiheGBEp0INZq2xJc/NfabEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de; spf=pass smtp.mailfrom=hauke-m.de; dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b=1LL1eALr; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hauke-m.de
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dV28D65sRz9tWn;
	Mon, 15 Dec 2025 02:11:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
	t=1765761100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SuRilBiHaO8h+FVd4fyOG+krAwJG09xv9fqTvn1sxVM=;
	b=1LL1eALrVe39m1vLjk16hPcLx6itJPLk/xi98qeA7WWSngQ9VMRErMvJUeFRnk8T8RRBc6
	E8i7PGjVq7GTAzWjNnX3tfEjX+w9ka0magSzyWYIzb8YN5caoOZNMHSuFwtuPJnPvNXGxG
	GLW0La04Dl1VQTkCZQfbyrDAhdJjRWl7kIRO8Uz2Mq+vTpsOe+KjZa42j/C4sDCfHOycJ8
	k0FE2KBfMxFQLIJFSXr/lmzeo0qjpV2tcqRPgPKg9zsj6q1e2X7KlfP7cbtD2vZi942M6N
	t1TuUgI0pHQcVqF9QFI1VQ7lruyfPMMsZf3UHior4urEdOe/XAoWI9DAOsg2mQ==
Message-ID: <b35fe4b3-8f42-49f4-a6bf-9f0e56d4050c@hauke-m.de>
Date: Mon, 15 Dec 2025 02:11:39 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, macro@orcam.me.uk
From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Realtek rtl838x MIPS boot hangs since 6.6.119
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Linux 6.6.119 does not boot on my Zyxel GS1900-8 v1 Switch (rtl838x SoC) 
any more.

When I revert these two patches the system boots up again:

MIPS: mm: Prevent a TLB shutdown on initial uniquification
commit 9f048fa upstream.
https://github.com/gregkh/linux/commit/135713cd0751bf296e515f5fdec234320f73bbd8

MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
commit 841ecc9 upstream.
https://github.com/gregkh/linux/commit/231ac951fabae2aaed8b2c00b4a097107be49c8c

Someone reported the same for kernel 6.12.61, see:
https://github.com/openwrt/openwrt/pull/21065#issuecomment-3622531763

This was seen in OpenWrt, we have some additional patches on top of the 
Linux kernel.

The bootup hangs here:
```
U-Boot Version: 2.0.0.59413 (Jul 08 2015 - 09:57:29)

CPU:   500MHz
DRAM:  128 MB
FLASH: 16 MB
Model: ZyXEL_GS1900_8
SN:    S203C15000307
MAC:   98:0D:67:06:9A:40 - 98:0D:67:06:9A:48

Press SPACE to abort boot script:  0
## Booting image from partition ... 0
    Version:   MIPS OpenWrt Linux-6.6.119
    Created:   2025-12-14  21:51:17 UTC
    Size:      3788916 Bytes = 3.6 MB
    Verifying Checksum ... OK
    Uncompressing Image ... OK

Starting ...

[    0.000000] Linux version 6.6.119 (hauke@hauke-p14s) 
(mips-openwrt-linux-musl-gcc (OpenWrt GCC 13.3.0 r28784-155eea44e7) 
13.3.0, GNU ld (GNU Binutils) 2.42) #0 Sun Dec 14 21:51:17 2025
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

```

Hauke

