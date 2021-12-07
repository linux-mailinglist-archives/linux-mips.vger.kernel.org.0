Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E4C46C0B7
	for <lists+linux-mips@lfdr.de>; Tue,  7 Dec 2021 17:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbhLGQdD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Dec 2021 11:33:03 -0500
Received: from elvis.franken.de ([193.175.24.41]:35239 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229795AbhLGQdD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 Dec 2021 11:33:03 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mudLO-0003YB-00
        for linux-mips@vger.kernel.org; Tue, 07 Dec 2021 17:29:30 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 754B5C4DFA; Tue,  7 Dec 2021 17:26:18 +0100 (CET)
Date:   Tue, 7 Dec 2021 17:26:18 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org
Subject: Loongson64 and huge pages
Message-ID: <20211207162618.GA19327@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

[   11.647401] CPU 3 Unable to handle kernel paging request at virtual address 0000000558005801, epc == ffffffff80232838, ra == ffffffff802327ac
[   11.660049] Oops[#1]:
[   11.662303] CPU: 3 PID: 348 Comm: libvirtd Not tainted 5.16.0-rc3+ #140
[   11.668877] Hardware name: Lemote LEMOTE-LS3A4000-7A1000-1w-V0.1-pc/LEMOTE-LS3A4000-7A1000-1w-V01-pc, BIOS Kunlun-A1901-V4.1.4 04/20/2020
[   11.681153] $ 0   : 0000000000000000 000000007400cce0 000000000000033f 0000000558001811
[   11.689119] $ 4   : 0000000000800000 0000000558005801 0000000000000000 980000013507c000
[   11.697081] $ 8   : 0000000000000078 0000000000800000 ffffffffffffffff 9800000004714210
[   11.705043] $12   : 9800000134fe7cb8 ffffffffffffff7f 9800000004714200 0000000000000040
[   11.713005] $16   : 980000014ebbcfc0 000000007400cce1 000000ffabffc000 ffffffff81258700
[   11.720966] $20   : 980000012137f464 980000012137f400 980000013507fea8 980000047cc60000
[   11.728928] $24   : 0000000000000003 000000ffa3c08fa0                                  
[   11.736890] $28   : 9800000134fe4000 9800000134fe7c90 980000012137f468 ffffffff802327ac
[   11.744853] Hi    : 00000000000001c8
[   11.748399] Lo    : ffffffffc6da0e44
[   11.751947] epc   : ffffffff80232838 __update_tlb+0xf0/0x258
[   11.757578] ra    : ffffffff802327ac __update_tlb+0x64/0x258
[   11.763202] Status: 7400cce2	KX SX UX KERNEL EXL 
[   11.767883] Cause : 10000008 (ExcCode 02)
[   11.771862] BadVA : 0000000558005801
[   11.775408] PrId  : 0014c001 (ICT Loongson-3)
[   11.779733] Modules linked in:
[   11.782764] Process libvirtd (pid: 348, threadinfo=00000000a73c3d49, task=00000000728cbb42, tls=000000fff0ced7d0)
[   11.792968] Stack : 980000047cbed700 980000014ebbcfc0 000000ffaa000000 9800000134fe7d40
[   11.800933]         0000000558001811 ffffffff804a26f8 0000000000000000 584fe00ab628d7e1
[   11.808894]         0000000000000207 980000013507fea8 ffffffff814f4000 980000014ebbcfc0
[   11.816856]         ffffffff81260000 0000000000000254 000000007400cce1 0000000000000001
[   11.824818]         ffffffff813f6860 ffffffff8044e260 000000aaadae8000 980000012137f400
[   11.832779]         000000000000000b 0000000000100077 980000014ebbcfc0 0000000000000cc0
[   11.840742]         0000000003feafff 000000ffabffc000 0000000000000254 980000013507fea8
[   11.848704]         98000001350f0078 0000000000000000 0000000000000000 0000000000000000
[   11.856667]         0000000000000000 980000012137f464 0000000000000000 584fe00ab628d7e1
[   11.864629]         9800000134fe7e08 980000014ebbcfc0 0000000000000254 000000ffabffc030
[   11.872590]         ...
[   11.875017] Call Trace:
[   11.877440] [<ffffffff80232838>] __update_tlb+0xf0/0x258
[   11.882722] [<ffffffff804a26f8>] do_huge_pmd_anonymous_page+0x3c8/0x808
[   11.889300] [<ffffffff8044e260>] __handle_mm_fault+0xbc0/0xf38
[   11.895099] [<ffffffff8044e7ec>] handle_mm_fault+0x214/0x2c8
[   11.900722] [<ffffffff80f24638>] do_page_fault+0x218/0x6a0
[   11.906176] [<ffffffff8022ae64>] tlb_do_page_fault_0+0x114/0x11c
[   11.912149] 
[   11.913622] Code: 0067182d  dc630000  00a3282d <dca30000> 10800006  00033a3a  2408ffff  00031e3c  000847bc 
[   11.923325] 
[   11.924837] ---[ end trace bc99cfb1af49f825 ]---
[   11.929428] note: libvirtd[348] exited with preempt_count 1

is this a known issue ? If I disabled TRANSPARENT_HUGE_PAGE system
works.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
