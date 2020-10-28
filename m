Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87D229E053
	for <lists+linux-mips@lfdr.de>; Thu, 29 Oct 2020 02:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732791AbgJ2BVS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Oct 2020 21:21:18 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:60164 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729782AbgJ1WFE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 28 Oct 2020 18:05:04 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id C6BA43ADAB9
        for <linux-mips@vger.kernel.org>; Wed, 28 Oct 2020 10:35:12 +0000 (UTC)
X-Originating-IP: 86.202.110.83
Received: from localhost (lfbn-lyo-1-15-83.w86-202.abo.wanadoo.fr [86.202.110.83])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 48EA2FF808;
        Wed, 28 Oct 2020 10:34:51 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     linux-mips@vger.kernel.org
Subject: [BUG] Crash during futex initialization with gcc 10
CC:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Date:   Wed, 28 Oct 2020 11:34:50 +0100
Message-ID: <878sbqd4fp.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

I saw a regression when building a MIPS kernel with gcc 10:

futex hash table entries: 256 (order: 3, 32768 bytes, linear)
CPU 0 Unable to handle kernel paging request at virtual address 00000000, epc == 801be4f0, ra == 80993778
Oops[#1]:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc8-00006-g6185221cb805 #3
$ 0   : 00000000 00000001 00000000 00000000
$ 4   : 87831e28 00000000 00000000 00000000
$ 8   : 8782c000 87888000 00000100 00000051
$12   : 09dcd4c5 87831c69 00000000 00000010
$16   : 80960000 00000001 80960000 8095bc90
$20   : 809d0000 809b3fc4 80987094 00000002
$24   : 00000000 00000000
$28   : 87830000 87831df8 809b3fe4 80993778
Hi    : 00000010
Lo    : 8a3d70e6
epc   : 801be4f0 cmpxchg_futex_value_locked+0x2c/0x78
ra    : 80993778 futex_init+0xb4/0x124
Status: 11008403 KERNEL EXL IE
Cause : 00800008 (ExcCode 02)
BadVA : 00000000
PrId  : 02019654 (MIPS 24KEc)
Modules linked in:
Process swapper/0 (pid: 1, threadinfo=(ptrval), task=(ptrval), tls=00000000)
Stack : ffe4d6e0 001b291f 80963e60 80964fe0 00000000 87831e24 00000000 00000100
        00000100 80a00000 00000000 00000008 809b3fe4 0a27934f 87878880 809936c4
        87878880 80960000 00000000 80100120 00000000 00000000 00000000 87831e54
        87831e54 87878895 8094cecc 80900000 00000000 00000001 80960000 00000001
        809629c4 80908380 808ff7ec 80900000 0000007f 87878895 00000000 0a27934f
        ...
Call Trace:
[<801be4f0>] cmpxchg_futex_value_locked+0x2c/0x78
Code: 1440000f  00000000  0000000f <c0a30000> 14660005  00000000  00e00825  e0a10000  1020fff9

---[ end trace e34236d22d7ecc0e ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---


If I use gcc 9.3 or if I disable the futex in the kernel configuration
there is no crash anymore.

The crash occurs after that the pagefault was disabled and yet we see a
page fault. The exact part where it occurs is here:
https://elixir.bootlin.com/linux/latest/source/arch/mips/include/asm/futex.h#L167

But it is too much MIPS assembly for me !

Does someone has an idea to fix it ?

It is alos possible that the issue was in gcc itself, but we need to
figure out what in order to report it to the gcc guys.

Gregory

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
