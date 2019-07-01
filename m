Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 517C95C315
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2019 20:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfGASgx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jul 2019 14:36:53 -0400
Received: from mail-yb1-f181.google.com ([209.85.219.181]:40763 "EHLO
        mail-yb1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbfGASgx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jul 2019 14:36:53 -0400
Received: by mail-yb1-f181.google.com with SMTP id i14so358108ybp.7
        for <linux-mips@vger.kernel.org>; Mon, 01 Jul 2019 11:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mIsklxArBVCFOYdzo86h0VK9omdLGQy08LmgbmkoOfQ=;
        b=LEK2DMGWP6HaIJqB6Zbp8LLV74fFa6Q+8FJCJt04z9kqIeG2xgH6pyKarkQR//wuxY
         vNY+wvOeLLg8jFiYv/rJm+ciE0ezgsMB+FRZujZZvDJaPXDVgkT0sv0ioo5Gv+vwB5pI
         +8g+srHFgayJXTKNancXyoBmOMhqJdcwx1SvCrcPUUZ0pitWKh7qbd+Qyeb4gWD+YoTU
         QZV9ALlS7Cn3BG/o+Z4oD9yUd33ezPn6XymbXol5g5cuFtFgdtdJX+Rk2X9W9+Ms2NLw
         iOT962rC7udEsdjSh8s2Nd9V+IUHsPICHfRFz5SbA4AukUL5xyGuebj7iqVDvovko2Pc
         dlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mIsklxArBVCFOYdzo86h0VK9omdLGQy08LmgbmkoOfQ=;
        b=XbArsomVlB2+6kIkin8eugi1GWJOyjxOPKIFZDEpndDDKMf7SdAwrKc6346LQSjOnU
         YaGT6KjFd5yyUORlEvAuhAlLPny+qj+OGlTv/DZGSGcldzRs6ioh3BrvGGj+MwrbMDSf
         eG+IBqZPaZlWt5G+ERjhVQFb5CePPSTneHYYXA+j1YFwV6S1prJCN/yBvDWRl8vcrphr
         WBxkMjFXFqffshzaoBXp0al3gMGWoG2PuTxm2a4VW3yiwndav82lbEg9jSeN2myImfZy
         ux2dLcdJ9DaFF1mcRpDbpLmK0QMXNBfwVCPMIU5YdDnSsNrweTUSWb5KozcQ7CW7Ye/o
         C4hg==
X-Gm-Message-State: APjAAAWrpjMxtWyoKo610wR4QJ3urGZiqUVFSxLpIjCzS6OmZRIaEtU+
        aue0AofruwSrt0TXt9wwVTzWbIrdwnIGdGXT1nY=
X-Google-Smtp-Source: APXvYqx4nn6ctMClyzlzpYixept5TdJAsYjV6KaFpfCssU190iJjuDr3W+a17AsNhCTpW5UNwqvv7Zucy+/MOq+VRlg=
X-Received: by 2002:a25:bc83:: with SMTP id e3mr15988939ybk.49.1562006212101;
 Mon, 01 Jul 2019 11:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
 <CA+QBN9A3JmvfCZkXZ2-Yd=nkQCQD48OgYEpe+Po4MuZFpmnPrQ@mail.gmail.com>
 <20190624175553.2tpepq5zsamovrra@pburton-laptop> <060345a6-bef2-ec17-e264-eccda29f5c8b@gentoo.org>
 <CAEdQ38F6gG1Ee5h6PXZ-wuxuOxAycaWBD_+hTNRjtfQHNw696g@mail.gmail.com>
 <CA+QBN9DO9sAadwFU6kpAfBxZuTVEx8_9DUYFBs6fTA6==cVDwQ@mail.gmail.com>
 <CA+QBN9B33Crhyahn5SXZJY8Pk7tDnhqgReuJKx5FhgguG=GXWg@mail.gmail.com> <f633861c-900f-02c5-e592-2ea1c3f1f8f2@gentoo.org>
In-Reply-To: <f633861c-900f-02c5-e592-2ea1c3f1f8f2@gentoo.org>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Mon, 1 Jul 2019 20:36:39 +0200
Message-ID: <CA+QBN9Bdnppin1s882OzvkOFCoWmOi_ctWkas2EsxD2mintS7w@mail.gmail.com>
Subject: Re: SGI-IP30
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     Matt Turner <mattst88@gmail.com>,
        Paul Burton <paul.burton@mips.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> The Panics are probably due to some hardcoded logic in Stan's original patches
> I mentioned that always assume the presence of a graphics board

with or without the MGRAS card, I have the same behavior.
Which is the file you are talking about? ip30-xtalk?

> Is the shoehorn adapter you have the very rare Octane model, or an Origin
> version modified with an Octane XIO locking latch?

It's an origina2k modified with the XIO locking latch. With Irix, it
works without any problem.

Anyway, it seems there are problems with the PCI, related to the BAR,
or to how it's configured, or to the memory window ... the kernel
panic complaining a "BUS error"

IOC3 Master Driver loaded for 0000:00:02.0
PCI host bridge to bus 0001:00
pci_bus 0001:00: root bus resource [mem 0x1a200000-0x1a9fffff]
pci_bus 0001:00: root bus resource [io  0x1aa00000-0x1abfffff]
pci_bus 0001:00: root bus resource [bus 01-ff]
pci 0001:00:01.0: BAR 0: assigned [mem 0x1a200000-0x1a200fff]
pci 0001:00:01.1: BAR 0: assigned [mem 0x1a201000-0x1a201fff]
pci 0001:00:01.2: BAR 0: assigned [mem 0x1a202000-0x1a2020ff]
ip30-bridge: 0001:00:01.0 Bar 0 with size 0x00001000 at bus 0x00000000
vma 0x000000b080000000 is Direct 64-bit.
Data bus error, epc == a8000000203c9884, ra == a8000000203c987c
Oops[#1]:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.18.20-Merciless-Moray-ip30 #74
$ 0   : 0000000000000000 ffffffff9404fde0 900000b080000000 000000b080000000
$ 4   : a80000007ead6000 0000000000000000 0000000000000006 0000000000000002
$ 8   : a80000007ead6000 0000000000000000 0000000000000005 0000000000000000
$12   : a80000007fc8bfe0 000000000000fd00 0000000000000000 fffffffffffffffe
$16   : a80000007ead6000 900000b080000000 00000000000c0000 a8000000205f0000
$20   : a80000007ead6000 a8000000205b1898 00000007443a9d5a a800000020a90000
$24   : 0000000000000220 0000000000000000
$28   : a80000007fc88000 a80000007fc8bae0 0000000000000007 a8000000203c987c
Hi    : 0000000000008509
Lo    : 000000000000038b
epc   : a8000000203c9884 0xa8000000203c9884
ra    : a8000000203c987c 0xa8000000203c987c
Status: 9404fde3        KX SX UX KERNEL EXL IE
Cause : 0000001c (ExcCode 07)
PrId  : 00000f24 (R14000)
Modules linked in:
Process swapper/0 (pid: 1, threadinfo=00000000b9e5e6bd,
task=000000005215823f, tls=0000000000000000)
Stack : 0000000000000007 a80000007fc8bae8 a80000007fc8bae8 11a4d0c4ecae9ccd
        a8000000205b1868 a800000020a90000 a8000000205924e0 a8000000205924c8
        a80000007ead6000 a8000000205b1898 00000007443a9d5a a800000020a90000
        0000000000000007 a800000020301550 0000000000000007 a80000007ead6000
        a80000007e59ac28 a80000007e59ac00 a8000000205f0000 a800000020ac0000
        a800000020660000 0000000000000000 a800000020a90000 a8000000202e64ec
        a80000007e59ac00 a80000007ead6000 a80000007e59ac28 a8000000202e65e8
        a80000007e59ac18 a80000007e59ac18 a80000007e59ac00 a8000000203f5df0
        a800000020623a30 a80000007fc8bbe8 a80000007fc8bbe8 11a4d0c4ecae9ccd
        a80000007e366600 a800000020620000 a8000000205f0000 a80000007fd46b80
        ...
Call Trace:
[<a800000020301550>] 0xa800000020301550
[<a8000000202e64ec>] 0xa8000000202e64ec
[<a8000000202e65e8>] 0xa8000000202e65e8
[<a8000000203f5df0>] 0xa8000000203f5df0
[<a8000000203f6094>] 0xa8000000203f6094
[<a800000020657eb0>] 0xa800000020657eb0
[<a80000002034fa50>] 0xa80000002034fa50
[<a80000002034d58c>] 0xa80000002034d58c
[<a80000002063133c>] 0xa80000002063133c
[<a80000002034d798>] 0xa80000002034d798
[<a80000002034d670>] 0xa80000002034d670
[<a80000002034acb0>] 0xa80000002034acb0
[<a80000002063133c>] 0xa80000002063133c
[<a80000002034c5b8>] 0xa80000002034c5b8
[<a800000020657adc>] 0xa800000020657adc
[<a80000002034e1a0>] 0xa80000002034e1a0
[<a8000000206579a0>] 0xa8000000206579a0
[<a800000020004530>] 0xa800000020004530
[<a800000020632454>] 0xa800000020632454
[<a8000000204fc750>] 0xa8000000204fc750
[<a8000000204fc760>] 0xa8000000204fc760
[<a8000000204fc750>] 0xa8000000204fc750
[<a80000002000c168>] 0xa80000002000c168

Code: 02002025  1040ffdd  00408825 <8c550004> 9e12003c  0000000f
32a20100  10400011  00000000

---[ end trace e8faa9089454f71d ]---
