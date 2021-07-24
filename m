Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3743D4AA2
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jul 2021 01:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhGXWlw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 18:41:52 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:56340 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229573AbhGXWlw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 24 Jul 2021 18:41:52 -0400
Subject: Re: [RFC]: Maybe revert 'MIPS: add PMD table accounting into
 MIPS'pmd_alloc_one' from 5.4 LTS?
To:     Huang Pei <huangpei@loongson.cn>
Cc:     Linux/MIPS <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <370c2578-5032-08d6-9f48-c2f284a9b62d@gentoo.org>
 <20210721021154.dlyrrtljz2hrlqng@ambrosehua-HP-xw6600-Workstation>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <cca35e7b-d62e-68db-fba4-53689e884d2f@gentoo.org>
Date:   Sat, 24 Jul 2021 19:22:20 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20210721021154.dlyrrtljz2hrlqng@ambrosehua-HP-xw6600-Workstation>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/20/2021 22:11, Huang Pei wrote:
> On Tue, Jul 20, 2021 at 08:45:45PM -0400, Joshua Kinard wrote:
> Hi, 

[snip]

>>
>> - there is no call to pgtable_pmd_page_dtor() in pmd_free() in MIPS'
>> pgalloc.  The commit message indicates that pmd_free in asm-generic will
>> handle this, but that function doesn't exist in 5.4, leading to mismatched
>> implementations.
> 
> Yes, my fix is to fix the mismatch. 
> 
> I think all stable branches before 5.10 should *not* apply this my patch

Can you submit a revert of this commit to stable@vger.kernel.org so that
Greg can include it in an upcoming update to the stable kernels <5.10?

Thanks!,

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
