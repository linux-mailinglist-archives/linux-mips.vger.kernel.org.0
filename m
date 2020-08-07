Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B776323E892
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 10:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgHGIIp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 04:08:45 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:39432 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbgHGIIo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 04:08:44 -0400
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 3F37B2008F
        for <linux-mips@vger.kernel.org>; Fri,  7 Aug 2020 08:08:40 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id BA6CA3F202;
        Fri,  7 Aug 2020 04:08:38 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 9212E2A0FA;
        Fri,  7 Aug 2020 04:08:38 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596787718;
        bh=6b1qGUX6Mi2l4WhzVVVVmPGGeUdzeM2NdSzdyrK98vQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XR2AcfqWqOKCxwUx0DF2f4AnZCTTq3E50Hr7b8urHigYtoEjhjyYRnhy87PqNdThT
         EiIQL6D+IHfkh8i210jmQCSuFjQsZH07iQ8aCiYTPoMVwyWXSivhYX+ml/VAGhk/D+
         F/vueKmMvproQGEZxs7T7/8DWjq0do69hu3UL0Bg=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id IQeZnSI-kn2o; Fri,  7 Aug 2020 04:08:36 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Fri,  7 Aug 2020 04:08:36 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id EA604410AB;
        Fri,  7 Aug 2020 08:08:34 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="VRw3jm5s";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [203.86.239.91])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id E7F604259A;
        Fri,  7 Aug 2020 08:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596787309;
        bh=6b1qGUX6Mi2l4WhzVVVVmPGGeUdzeM2NdSzdyrK98vQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=VRw3jm5srRQlscsps6tmjpA4cYHOefevwHBVVvZuPt4ATa1zsX2OQFaW0VDhaSLVB
         6JcZbwRtVK3na9X+5zDfA330D3srjcU7E3p0ONxQt24mJ43DN6v/7/8Z32t1nsDFUm
         7VPIG9RMbZGFjnoEw4YYdGY5XPtJ23838s04TnMI=
Subject: Re: loongson ls2k1000: PCIe serial card WCH CH382L not working, maybe
 ioports problem
To:     Du Huanpeng <u74147@gmail.com>, linux-mips@vger.kernel.org
Cc:     mkl@blackshift.org, zhangj@wch.cn, linux@rempel-privat.de
References: <20200807030826.GA10693@tkernel.org>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <88921f60-1458-ab04-2ed9-bce57ce7101d@flygoat.com>
Date:   Fri, 7 Aug 2020 16:01:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200807030826.GA10693@tkernel.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: EA604410AB
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/8/7 ÉÏÎç11:08, Du Huanpeng Ð´µÀ:
> Hi all,
>
> I'm testing a PCIe card to two uarts (WCH CH382L compatible,
>           https://item.jd.com/48547850173.html) on a loongson ls2k1000 board.
>
> With the card inserted the kernel detects the two new uarts:
>
> [    2.060884] pci 0000:00:04.1: EHCI: unrecognized capability ff
> [    2.066721] pci 0000:00:04.1: EHCI: capability loop?
> [    2.066745] pci 0000:00:04.1: quirk_usb_early_handoff+0x0/0xa60 took 358764 usecs
> [    2.074542] pcieport 0000:00:09.0: PME: Signaling with IRQ 2
> [    2.080651] pcieport 0000:00:0a.0: PME: Signaling with IRQ 3
> [    2.086648] pcieport 0000:00:0b.0: PME: Signaling with IRQ 4
> [    2.092616] pcieport 0000:00:0c.0: PME: Signaling with IRQ 5
> [    2.098579] pcieport 0000:00:0d.0: PME: Signaling with IRQ 6
> [    2.104557] pcieport 0000:00:0e.0: PME: Signaling with IRQ 7
> [    2.113728] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    2.120891] serial 0000:06:00.0: limiting MRRS to 256
> [    2.126314] 0000:06:00.0: ttyS0 at I/O 0xc0 (irq = 7, base_baud = 115200) is a XR16850
> [    2.134618] 0000:06:00.0: ttyS1 at I/O 0xc8 (irq = 7, base_baud = 115200) is a XR16850
> [    2.143130] 1fe00000.serial: ttyS2 at MMIO 0x1fe00000 (irq = 1, base_baud = 7812500) is a 16550A
> [    2.151946] printk: console [ttyS2] enabled
> [    2.160255] printk: bootconsole [early0] disabled
> [    2.170112] [drm] radeon kernel modesetting enabled.
>
> However a write to the serial fails:
> / # echo "hello" >/dev/ttyS0
> [ 9369.631915] serial 0000:06:00.0: LSR safety check engaged!
> sh: write error: Input/output error

I assume you're using my out-of-tree fork to support LS2K.
I messed with Logic PIO in that fork.
I'll fix it in mainline, sorry for the issue...


>
> read from the serial, too:
> / # cat /dev/ttyS0
> [ 9531.127623] serial 0000:06:00.0: LSR safety check engaged!
> cat: read error: Input/output error
>
> A dump_stack() in front of the "LSR safety check engaged!" shows the following backtrace:
> [   40.891789] [<ffffffff8020e7d4>] show_stack+0x9c/0x130
> [   40.896949] [<ffffffff80685944>] dump_stack+0xb4/0xf0
> [   40.902021] [<ffffffff80743d30>] serial8250_do_startup+0x480/0x888
> [   40.908216] [<ffffffff8073e07c>] uart_startup.part.19+0x12c/0x2c0
> [   40.914321] [<ffffffff8073e27c>] uart_port_activate+0x6c/0xa8
> [   40.920085] [<ffffffff807221b8>] tty_port_open+0xa0/0x128
> [   40.925493] [<ffffffff8073a2ec>] uart_open+0x1c/0x30
> [   40.930467] [<ffffffff80719220>] tty_open+0x118/0x500
> [   40.935530] [<ffffffff80391e0c>] chrdev_open+0xc4/0x1e0
> [   40.940767] [<ffffffff803865e8>] do_dentry_open+0x210/0x480
> [   40.946353] [<ffffffff8039e7e8>] path_openat+0xb38/0xe50
> [   40.951675] [<ffffffff8039fe00>] do_filp_open+0xe8/0x130
> [   40.956996] [<ffffffff80386d8c>] do_sys_openat2+0x1fc/0x338
> [   40.962579] [<ffffffff803884ac>] do_sys_open+0x5c/0x88
> [   40.967728] [<ffffffff80214470>] syscall_common+0x34/0x58
>
> / # cat /proc/ioports
> 000000c0-000000c7 : serial
> 000000c8-000000cf : serial
>
> / # lspci
> 00:03.1 Class 0200: 0014:7a03
> 00:08.0 Class 0106: 0014:7a08
> 00:0d.0 Class 0604: 0014:7a19
> 00:10.0 Class 0480: 0014:7a16
> 00:04.2 Class 0c03: 0014:7a24
> 00:04.0 Class 0c03: 0014:7a04
> 00:07.0 Class 0403: 0014:7a07
> 00:0c.0 Class 0604: 0014:7a09
> 00:0f.0 Class 0880: 0014:7a0f
> 06:00.0 Class 0700: 1c00:3253 <-- WCH CH382L
> 00:03.0 Class 0200: 0014:7a03
> 00:06.0 Class 0300: 0014:7a06
> 00:0b.0 Class 0604: 0014:7a09
> 00:04.1 Class 0c03: 0014:7a14
> 00:09.0 Class 0604: 0014:7a19
> 00:0e.0 Class 0604: 0014:7a09
> 00:11.0 Class 0480: 0014:7a26
> 00:02.0 Class 0880: 0014:7a02
> 00:05.0 Class 0302: 0014:7a05
> 00:0a.0 Class 0604: 0014:7a09
>
> I'm using Yang Jiaxun's kernel and pmon:
>
> kernel:
>    https://github.com/FlyGoat/linux
>    branch: loogson/next-testing-2k
> bootloader:
>    https://github.com/FlyGoat/pmon-ls2k
>    branch: master

Ya, that's my out of tree fork.....


Thanks.

- Jiaxun

> and a simple rootfs:
>    https://sourceforge.net/projects/loongsonpi2/files/source-extra/miniroot.tar.xz
>
> For reference, the card work on a standard PC:
>      [    0.701127] 0000:01:00.0: ttyS4 at I/O 0xe0c0 (irq = 16, base_baud = 115200) is a XR16850
>      [    0.701295] 0000:01:00.0: ttyS5 at I/O 0xe0c8 (irq = 16, base_baud = 115200) is a XR16850
>
> The relevant part of /proc/ioports:
> 0d00-ffff : PCI Bus 0000:00
>    e000-efff : PCI Bus 0000:01
>      e000-e0ff : 0000:01:00.0
>        e0c0-e0c7 : serial
>        e0c8-e0cf : serial
>
>
> Regards,
> Du Huanpeng
