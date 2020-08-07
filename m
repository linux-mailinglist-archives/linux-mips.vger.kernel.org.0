Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC0023E61E
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 05:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgHGDIe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Aug 2020 23:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgHGDId (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Aug 2020 23:08:33 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E182C061574
        for <linux-mips@vger.kernel.org>; Thu,  6 Aug 2020 20:08:33 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a79so242161pfa.8
        for <linux-mips@vger.kernel.org>; Thu, 06 Aug 2020 20:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=ya3jWnOPUK2Tv1Pm23ddcT2HF0DKqGTPXhSqbR5ywk8=;
        b=PAskZOTRNH3n0xjTGizg8COT/YcdXHFQU2tlQvLKv9vso6y5QJC4+ey0sqck/cogsn
         3sAR7fFSfFG0apJGOSfXuCkTdQTw4e66byYjP0EG9w9ZQt02rwqNGHI77mfiqWQWxmXP
         if0kmHjCefre5tvla97Pv5e5b/IUhyLhgP8nuIqS/2XabJShmSvFsMsXDa2Lt56BtoAe
         SVRFcWBZ5LnpWe9kGXoCaYtw0789S/PJDY0yashwMFcfrt13cdXfO68FCPaHLG3YH9vo
         T4D+NvLuYJxcGfmtj9p4DeMcSs4WmkkLKR3w2+YK1+0jwJ5DQqGFNgacYrcxDXVfAsN9
         d8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=ya3jWnOPUK2Tv1Pm23ddcT2HF0DKqGTPXhSqbR5ywk8=;
        b=m6qLL4ZUwRnGemOcuguR7qbvddsr05AVnacMunZVBse2GatFD/WFX0G8mm+cYvsEmq
         +gAsMB0+nj9lm4iQXBVYzeHjCIYb9Z+AzDRlGY97i9aAB+uXTblV76zxKfMH7eVX1R/R
         kHkW/77zFnBDXu9bwThGtyeiHP8rz6onozBNeK0OKkcohSec4lE1sSpmAm3xeWfBpsMj
         UXZ/cRBHZe+fN4h8LZZJao2lZoNvnsd2Tlyhu0ABXD2ipe2fPviBwMj04OyEUdbD0uZa
         om+L10c1UrRK7vvyzwP2lQn1bvw1qbWXQo8wdBaY7whZHXQGzehCSi7zeEhSdH5wQUxb
         FFWA==
X-Gm-Message-State: AOAM5305a/+TIXmkGdGScBROFxBtkv6Jsb7hVwsXLyqWFey0fla7Qf4R
        vowG48P1ytNl1ndSOr2y4VadoIW6HfQ=
X-Google-Smtp-Source: ABdhPJyBuEilg9FooRBa/l34ZP9gBpPaxKxCPpN8NE+Vn30DX0NYVKhWUG37y2Lwmf65QvLpuvHHDw==
X-Received: by 2002:a05:6a00:15d0:: with SMTP id o16mr11310715pfu.230.1596769712595;
        Thu, 06 Aug 2020 20:08:32 -0700 (PDT)
Received: from tkernel.org ([207.204.224.6])
        by smtp.gmail.com with ESMTPSA id y3sm6443901pgh.71.2020.08.06.20.08.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 20:08:32 -0700 (PDT)
Date:   Fri, 7 Aug 2020 11:08:27 +0800
From:   Du Huanpeng <u74147@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     mkl@blackshift.org, zhangj@wch.cn, linux@rempel-privat.de,
        jiaxun.yang@flygoat.com
Subject: loongson ls2k1000: PCIe serial card WCH CH382L not working, maybe
 ioports problem
Message-ID: <20200807030826.GA10693@tkernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

I'm testing a PCIe card to two uarts (WCH CH382L compatible,
         https://item.jd.com/48547850173.html) on a loongson ls2k1000 board.

With the card inserted the kernel detects the two new uarts:

[    2.060884] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    2.066721] pci 0000:00:04.1: EHCI: capability loop?
[    2.066745] pci 0000:00:04.1: quirk_usb_early_handoff+0x0/0xa60 took 358764 usecs
[    2.074542] pcieport 0000:00:09.0: PME: Signaling with IRQ 2
[    2.080651] pcieport 0000:00:0a.0: PME: Signaling with IRQ 3
[    2.086648] pcieport 0000:00:0b.0: PME: Signaling with IRQ 4
[    2.092616] pcieport 0000:00:0c.0: PME: Signaling with IRQ 5
[    2.098579] pcieport 0000:00:0d.0: PME: Signaling with IRQ 6
[    2.104557] pcieport 0000:00:0e.0: PME: Signaling with IRQ 7
[    2.113728] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    2.120891] serial 0000:06:00.0: limiting MRRS to 256
[    2.126314] 0000:06:00.0: ttyS0 at I/O 0xc0 (irq = 7, base_baud = 115200) is a XR16850
[    2.134618] 0000:06:00.0: ttyS1 at I/O 0xc8 (irq = 7, base_baud = 115200) is a XR16850
[    2.143130] 1fe00000.serial: ttyS2 at MMIO 0x1fe00000 (irq = 1, base_baud = 7812500) is a 16550A
[    2.151946] printk: console [ttyS2] enabled
[    2.160255] printk: bootconsole [early0] disabled
[    2.170112] [drm] radeon kernel modesetting enabled.

However a write to the serial fails:
/ # echo "hello" >/dev/ttyS0
[ 9369.631915] serial 0000:06:00.0: LSR safety check engaged!
sh: write error: Input/output error

read from the serial, too:
/ # cat /dev/ttyS0
[ 9531.127623] serial 0000:06:00.0: LSR safety check engaged!
cat: read error: Input/output error

A dump_stack() in front of the "LSR safety check engaged!" shows the following backtrace:
[   40.891789] [<ffffffff8020e7d4>] show_stack+0x9c/0x130
[   40.896949] [<ffffffff80685944>] dump_stack+0xb4/0xf0
[   40.902021] [<ffffffff80743d30>] serial8250_do_startup+0x480/0x888
[   40.908216] [<ffffffff8073e07c>] uart_startup.part.19+0x12c/0x2c0
[   40.914321] [<ffffffff8073e27c>] uart_port_activate+0x6c/0xa8
[   40.920085] [<ffffffff807221b8>] tty_port_open+0xa0/0x128
[   40.925493] [<ffffffff8073a2ec>] uart_open+0x1c/0x30
[   40.930467] [<ffffffff80719220>] tty_open+0x118/0x500
[   40.935530] [<ffffffff80391e0c>] chrdev_open+0xc4/0x1e0
[   40.940767] [<ffffffff803865e8>] do_dentry_open+0x210/0x480
[   40.946353] [<ffffffff8039e7e8>] path_openat+0xb38/0xe50
[   40.951675] [<ffffffff8039fe00>] do_filp_open+0xe8/0x130
[   40.956996] [<ffffffff80386d8c>] do_sys_openat2+0x1fc/0x338
[   40.962579] [<ffffffff803884ac>] do_sys_open+0x5c/0x88
[   40.967728] [<ffffffff80214470>] syscall_common+0x34/0x58

/ # cat /proc/ioports
000000c0-000000c7 : serial
000000c8-000000cf : serial

/ # lspci
00:03.1 Class 0200: 0014:7a03
00:08.0 Class 0106: 0014:7a08
00:0d.0 Class 0604: 0014:7a19
00:10.0 Class 0480: 0014:7a16
00:04.2 Class 0c03: 0014:7a24
00:04.0 Class 0c03: 0014:7a04
00:07.0 Class 0403: 0014:7a07
00:0c.0 Class 0604: 0014:7a09
00:0f.0 Class 0880: 0014:7a0f
06:00.0 Class 0700: 1c00:3253 <-- WCH CH382L
00:03.0 Class 0200: 0014:7a03
00:06.0 Class 0300: 0014:7a06
00:0b.0 Class 0604: 0014:7a09
00:04.1 Class 0c03: 0014:7a14
00:09.0 Class 0604: 0014:7a19
00:0e.0 Class 0604: 0014:7a09
00:11.0 Class 0480: 0014:7a26
00:02.0 Class 0880: 0014:7a02
00:05.0 Class 0302: 0014:7a05
00:0a.0 Class 0604: 0014:7a09

I'm using Yang Jiaxun's kernel and pmon:

kernel:
  https://github.com/FlyGoat/linux
  branch: loogson/next-testing-2k
bootloader:
  https://github.com/FlyGoat/pmon-ls2k
  branch: master
and a simple rootfs:
  https://sourceforge.net/projects/loongsonpi2/files/source-extra/miniroot.tar.xz

For reference, the card work on a standard PC:
    [    0.701127] 0000:01:00.0: ttyS4 at I/O 0xe0c0 (irq = 16, base_baud = 115200) is a XR16850
    [    0.701295] 0000:01:00.0: ttyS5 at I/O 0xe0c8 (irq = 16, base_baud = 115200) is a XR16850

The relevant part of /proc/ioports:
0d00-ffff : PCI Bus 0000:00
  e000-efff : PCI Bus 0000:01
    e000-e0ff : 0000:01:00.0
      e0c0-e0c7 : serial
      e0c8-e0cf : serial


Regards,
Du Huanpeng

