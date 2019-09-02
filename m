Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 457A4A5A87
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 17:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbfIBP0a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 11:26:30 -0400
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:13498 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfIBP03 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Sep 2019 11:26:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id C7CD93F8B7;
        Mon,  2 Sep 2019 17:26:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id z17VFD6jNXRf; Mon,  2 Sep 2019 17:26:27 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 1AEFB3F8AB;
        Mon,  2 Sep 2019 17:26:26 +0200 (CEST)
Date:   Mon, 2 Sep 2019 17:26:26 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 120/120] MIPS: Fix name of BOOT_MEM_ROM_DATA
Message-ID: <20190902152626.GC2479@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <54a08fcb41b12e715529148a6bc11bcb3e2adb4d.1567326213.git.noring@nocrew.org>
 <d88ab711-b8b6-a04f-6f19-82ecbb758398@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d88ab711-b8b6-a04f-6f19-82ecbb758398@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> ROM_DATA meant memory used by ROM(Bootloader) to store data in some 
> machines, is that name right?

That's the machine reset code, and other things such as the BIOS, drivers,
firmware, splash screen animations, a DVD player, etc.

> Btw, boot_mem_map had been droped recently, see mips-next tree, please 
> rebase.

OK, then I think we can drop this patch since it was meant as a starting
point to mapping all addresses in /proc/iomem. I have patches that make
it look like this:

# cat /proc/iomem 
00000000-01ffffff : System RAM
  00010000-00431c4b : Kernel code
  00431c4c-00584fff : Kernel data
  007c0000-007e695f : Kernel bss
12000000-13ffffff : Graphics Synthesizer
1c000000-1c1fffff : IOP RAM
1e000000-1e0fffff : System ROM
1f801600-1f8016ff : USB OHCI
1fc00000-1fffffff : System ROM

There are many other regions, and it would be useful to have them all
included eventually, but they are not essential for the initial system.

Fredrik
