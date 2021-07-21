Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8B63D0639
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 02:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhGUAFT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jul 2021 20:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhGUAFR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Jul 2021 20:05:17 -0400
Received: from smtp.gentoo.org (mail.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA28FC061574
        for <linux-mips@vger.kernel.org>; Tue, 20 Jul 2021 17:45:54 -0700 (PDT)
To:     Linux/MIPS <linux-mips@vger.kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huang Pei <huangpei@loongson.cn>
From:   Joshua Kinard <kumba@gentoo.org>
Subject: [RFC]: Maybe revert 'MIPS: add PMD table accounting into
 MIPS'pmd_alloc_one' from 5.4 LTS?
Openpgp: preference=signencrypt
Message-ID: <370c2578-5032-08d6-9f48-c2f284a9b62d@gentoo.org>
Date:   Tue, 20 Jul 2021 20:45:45 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

(resend using the correct list address)

Hi all,

I think there may be an issue with upstream commit
ed914d48b6a1040d1039d371b56273d422c0081e (MIPS: add PMD table accounting
into MIPS'pmd_alloc_one), which got backported to 5.4 LTS.

I am running my SGI Octane on the 5.4 LTS kernel series w/ Gentoo's IP30
patches, since basic IP30 support didn't get fully mainlined until ~5.7 and
I am just behind on kernels for the time being.  Generally, the 5.4 series
is stable on this machine, but as of using 5.4.133 yesterday and 5.4.134
today, I have had three kernel panics, all with completely different stack
traces, while building a multilib-enabled glibc-2.33 package.

Since the stack traces are all completely different, I am suspecting an
issue with memory allocation, which picking through the 5.4.133 changelog,
got me to look at commit ed914d48b6a1.  My initial thought is it looks like
this patch should not have been backported to 5.4, because 5.4 is missing
the asm-generic version of pmd_free(), which means the MIPS-specific version
is likely used instead, and that function was not updated alongside
pmd_alloc_one().

Now, I am not a memory person, but some quick reading indicates there may be
some other issues with this patch as well:

- use of 'GFP_KERNEL | __GFP_ACCOUNT' when there is GFP_KERNEL_ACCOUNT
available.

- the return value of pgtable_pmd_page_ctor(pg); is not checked to make sure
it succeeded.  Per Documentation/vm/split_page_table_lock, "NOTE:
pgtable_page_ctor() and pgtable_pmd_page_ctor() can fail -- it must
be handled properly."

- there is no call to pgtable_pmd_page_dtor() in pmd_free() in MIPS'
pgalloc.  The commit message indicates that pmd_free in asm-generic will
handle this, but that function doesn't exist in 5.4, leading to mismatched
implementations.

I think the fix is to either revert ed914d48b6a1 on the 5.4 stable series
(and any earlier series that are missing asm-generic pmd_free), or the MIPS
pmd_free() needs to be updated to call pgtable_pmd_page_dtor() in a similar
manner to x86 and arm64.  I'd opt for reverting.

Currently testing a build of 5.4.134 with this patch reverted running some
compile jobs.  If it survives building multilib glibc, then I think my
suspicions may be valid.

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic

