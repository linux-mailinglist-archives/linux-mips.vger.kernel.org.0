Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C93A5C456
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2019 22:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfGAUaA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jul 2019 16:30:00 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:32894 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbfGAUaA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Jul 2019 16:30:00 -0400
Received: from [192.168.1.13] (c-73-132-78-152.hsd1.md.comcast.net [73.132.78.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id D4247346D99;
        Mon,  1 Jul 2019 20:29:57 +0000 (UTC)
Subject: Re: SGI-IP30
To:     Carlo Pisani <carlojpisani@gmail.com>
Cc:     Matt Turner <mattst88@gmail.com>,
        Paul Burton <paul.burton@mips.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        =?UTF-8?Q?Ren=c3=a9_Rebe?= <rene@exactcode.com>
References: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
 <CA+QBN9A3JmvfCZkXZ2-Yd=nkQCQD48OgYEpe+Po4MuZFpmnPrQ@mail.gmail.com>
 <20190624175553.2tpepq5zsamovrra@pburton-laptop>
 <060345a6-bef2-ec17-e264-eccda29f5c8b@gentoo.org>
 <CAEdQ38F6gG1Ee5h6PXZ-wuxuOxAycaWBD_+hTNRjtfQHNw696g@mail.gmail.com>
 <CA+QBN9DO9sAadwFU6kpAfBxZuTVEx8_9DUYFBs6fTA6==cVDwQ@mail.gmail.com>
 <CA+QBN9B33Crhyahn5SXZJY8Pk7tDnhqgReuJKx5FhgguG=GXWg@mail.gmail.com>
 <f633861c-900f-02c5-e592-2ea1c3f1f8f2@gentoo.org>
 <CA+QBN9Bdnppin1s882OzvkOFCoWmOi_ctWkas2EsxD2mintS7w@mail.gmail.com>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <5b019eaa-5e2f-b9ce-9c56-5bb0cfc253ed@gentoo.org>
Date:   Mon, 1 Jul 2019 16:29:55 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA+QBN9Bdnppin1s882OzvkOFCoWmOi_ctWkas2EsxD2mintS7w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/1/2019 14:36, Carlo Pisani wrote:
>> The Panics are probably due to some hardcoded logic in Stan's original patches
>> I mentioned that always assume the presence of a graphics board
> 
> with or without the MGRAS card, I have the same behavior.
> Which is the file you are talking about? ip30-xtalk?

The it's probably some kind of issue with the addressing math in IP30's
headers somewhere.  As I've said before, it's not a configuration I've ever
tried, so I never had a motivation to try and hunt it down to fix.  If I
need to run headless, I just "setenv console=d1" and re-init the system to
run from my serial console server.

If you want to investigate, under the Gentoo-patched kernel, start looking
in arch/mips/include/asm/mach-ip30/*.h for IP30's specific defines.  And for
Xtalk stuff, that is in arch/mips/include/asm/xtalk/*.h.

A lot of the changes I did there were just to add descriptive macros for
addresses that were formerly coded as raw integers/hex.  A lot of the macros
are never actually used anywhere, but essentially serve as documentation.

As far as hardwiring the graphics, Slot A actually reports in as Widget C
during xtalk scan, because we enumerate backwards from Widget F (BaseIO):

Widget | Device
-------|--------
  F    | BaseIO
  E    | Unused
  D    | PCI Shoebox
  C    | XIO Slot A
  B    | XIO Slot B
  A    | XIO Slot C
  9    | XIO Slot D
  8    | HEART
  0    | XBOW
 1-7   | Unused/Reserved

The Widget assignments for XBOW, HEART, and BaseIO are apparently hardwired
on the PCB itself.  I don't know what Widget E is for, or if it's even
exposed anywhere, but I suspect it's simply unused based on a look at IRIX
header files.  Widgets 1-7 are not accessible and, I think, are used
internally by the Crossbar switch for routing stuff on the system board.

I did a cursory skim of the headers, and I personally do not see where I
have any macros locked into specific widgets that actually get used
anywhere.  I do code in that the first graphics slot if Widget C and assign
that to a macro, but the assigned macro isn't used in any actual code, so
more documentation.

I don't have the cycles right now to look over the C code in-depth in either
the xtalk code (ip30-xtalk.c) or the bridge glue code (ip30-bridge.c).
Those two are responsible for setting up the XIO bus and then probing the
BRIDGE chips found in any of the slots.

>> Is the shoehorn adapter you have the very rare Octane model, or an Origin
>> version modified with an Octane XIO locking latch?
> 
> It's an origina2k modified with the XIO locking latch. With Irix, it
> works without any problem.

Generally, modifying an Origin XIO board to work on Octane does not present
problems (I've done it myself before), but you do want to check that the
latch is aligning the compression connector up correctly and that it's
latching properly.  If that connector doesn't seat right, you can
potentially have a whole host of problems, including possible damage to the
surface pads of the connector.  From what I've heard, faulty compression
connectors are absolute devils to debug, because the side-effects are very
random, almost like bad memory in a PC.


> Anyway, it seems there are problems with the PCI, related to the BAR,
> or to how it's configured, or to the memory window ... the kernel
> panic complaining a "BUS error"
> 
> IOC3 Master Driver loaded for 0000:00:02.0
> PCI host bridge to bus 0001:00
> pci_bus 0001:00: root bus resource [mem 0x1a200000-0x1a9fffff]
> pci_bus 0001:00: root bus resource [io  0x1aa00000-0x1abfffff]
> pci_bus 0001:00: root bus resource [bus 01-ff]
> pci 0001:00:01.0: BAR 0: assigned [mem 0x1a200000-0x1a200fff]
> pci 0001:00:01.1: BAR 0: assigned [mem 0x1a201000-0x1a201fff]
> pci 0001:00:01.2: BAR 0: assigned [mem 0x1a202000-0x1a2020ff]
> ip30-bridge: 0001:00:01.0 Bar 0 with size 0x00001000 at bus 0x00000000
> vma 0x000000b080000000 is Direct 64-bit.
> Data bus error, epc == a8000000203c9884, ra == a8000000203c987c
> Oops[#1]:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.18.20-Merciless-Moray-ip30 #74
> $ 0   : 0000000000000000 ffffffff9404fde0 900000b080000000 000000b080000000
> $ 4   : a80000007ead6000 0000000000000000 0000000000000006 0000000000000002
> $ 8   : a80000007ead6000 0000000000000000 0000000000000005 0000000000000000
> $12   : a80000007fc8bfe0 000000000000fd00 0000000000000000 fffffffffffffffe
> $16   : a80000007ead6000 900000b080000000 00000000000c0000 a8000000205f0000
> $20   : a80000007ead6000 a8000000205b1898 00000007443a9d5a a800000020a90000
> $24   : 0000000000000220 0000000000000000
> $28   : a80000007fc88000 a80000007fc8bae0 0000000000000007 a8000000203c987c
> Hi    : 0000000000008509
> Lo    : 000000000000038b
> epc   : a8000000203c9884 0xa8000000203c9884
> ra    : a8000000203c987c 0xa8000000203c987c
> Status: 9404fde3        KX SX UX KERNEL EXL IE
> Cause : 0000001c (ExcCode 07)
> PrId  : 00000f24 (R14000)
> Modules linked in:
> Process swapper/0 (pid: 1, threadinfo=00000000b9e5e6bd,
> task=000000005215823f, tls=0000000000000000)
> Stack : 0000000000000007 a80000007fc8bae8 a80000007fc8bae8 11a4d0c4ecae9ccd
>         a8000000205b1868 a800000020a90000 a8000000205924e0 a8000000205924c8
>         a80000007ead6000 a8000000205b1898 00000007443a9d5a a800000020a90000
>         0000000000000007 a800000020301550 0000000000000007 a80000007ead6000
>         a80000007e59ac28 a80000007e59ac00 a8000000205f0000 a800000020ac0000
>         a800000020660000 0000000000000000 a800000020a90000 a8000000202e64ec
>         a80000007e59ac00 a80000007ead6000 a80000007e59ac28 a8000000202e65e8
>         a80000007e59ac18 a80000007e59ac18 a80000007e59ac00 a8000000203f5df0
>         a800000020623a30 a80000007fc8bbe8 a80000007fc8bbe8 11a4d0c4ecae9ccd
>         a80000007e366600 a800000020620000 a8000000205f0000 a80000007fd46b80
>         ...
> Call Trace:
> [<a800000020301550>] 0xa800000020301550
> [<a8000000202e64ec>] 0xa8000000202e64ec
> [<a8000000202e65e8>] 0xa8000000202e65e8
> [<a8000000203f5df0>] 0xa8000000203f5df0
> [<a8000000203f6094>] 0xa8000000203f6094
> [<a800000020657eb0>] 0xa800000020657eb0
> [<a80000002034fa50>] 0xa80000002034fa50
> [<a80000002034d58c>] 0xa80000002034d58c
> [<a80000002063133c>] 0xa80000002063133c
> [<a80000002034d798>] 0xa80000002034d798
> [<a80000002034d670>] 0xa80000002034d670
> [<a80000002034acb0>] 0xa80000002034acb0
> [<a80000002063133c>] 0xa80000002063133c
> [<a80000002034c5b8>] 0xa80000002034c5b8
> [<a800000020657adc>] 0xa800000020657adc
> [<a80000002034e1a0>] 0xa80000002034e1a0
> [<a8000000206579a0>] 0xa8000000206579a0
> [<a800000020004530>] 0xa800000020004530
> [<a800000020632454>] 0xa800000020632454
> [<a8000000204fc750>] 0xa8000000204fc750
> [<a8000000204fc760>] 0xa8000000204fc760
> [<a8000000204fc750>] 0xa8000000204fc750
> [<a80000002000c168>] 0xa80000002000c168
> 
> Code: 02002025  1040ffdd  00408825 <8c550004> 9e12003c  0000000f
> 32a20100  10400011  00000000
> 
> ---[ end trace e8faa9089454f71d ]---

You really need to enable debugging symbols in your kernel for stack dumps
to have any meaning.  Those address offsets are going to be unique to your
kernel build, so they are of no use to anyone else.

The early widget addresses you show, 0x1axxxxxx, imply the bus error is
happening in Slot C (widget A).  You said Slot C works fine?  Did you mean
Slot D works fine instead?  The snippet of dmesg you put in your other
e-mail definitely shows Slot D (widget 9) being populated by something that
has a BRIDGE chip in it.  Does that address space probe correctly (0x19xxxxxx)?

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
