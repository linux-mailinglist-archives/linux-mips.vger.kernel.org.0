Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125C736953C
	for <lists+linux-mips@lfdr.de>; Fri, 23 Apr 2021 16:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhDWO5z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Apr 2021 10:57:55 -0400
Received: from elvis.franken.de ([193.175.24.41]:38697 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229454AbhDWO5z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 23 Apr 2021 10:57:55 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lZxF0-0003RE-00; Fri, 23 Apr 2021 16:57:10 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 31E1CC0B3B; Fri, 23 Apr 2021 16:51:31 +0200 (CEST)
Date:   Fri, 23 Apr 2021 16:51:31 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     Huang Pei <huangpei@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        paul.burton@mips.com, paul@crapouillou.net, siyanteng@loongson.cn,
        ira.weiny@intel.com, yangtiezhu@loongson.cn, jun.jiang@ingenic.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        sihui.liu@ingenic.com
Subject: Re: [PATCH] Revert "MIPS: make userspace mapping young by default".
Message-ID: <20210423145131.GA11112@alpha.franken.de>
References: <1618562868-91115-1-git-send-email-zhouyanjie@wanyeetech.com>
 <20210416092003.5754967.19768.9603@loongson.cn>
 <ae06522f-eda8-96d1-6f58-072905afa65c@wanyeetech.com>
 <20210419045610.frhzxskec47s5rmq@ambrosehua-HP-xw6600-Workstation>
 <13e37741-c1b4-2aae-471e-0790adc8db59@wanyeetech.com>
 <20210420024818.r6jf243oglb2ywbr@ambrosehua-HP-xw6600-Workstation>
 <fd1e02ff-0165-7e7e-8bc6-55fb278fc50f@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd1e02ff-0165-7e7e-8bc6-55fb278fc50f@wanyeetech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 20, 2021 at 10:03:01PM +0800, Zhou Yanjie wrote:
> Sorry for my carelessness, the log in the previous email was wrong, please
> check the log in this email.
> 
> [   53.684067] --- pte 1 = 07698685

any chance to print the virtual address to this pte ?

> [   53.687376] --- pte 3 = 07698685
> [   53.737175] --- pte 1 = 07699685
> [   53.740412] --- pte 3 = 07699685
> [   53.744064] --- pte 1 = 076c3685
> [..]

could you print PTE, which faults ? And what is mapped there ?


so far I haven't seen any ill-effects of the (bisected ?) patch.
The problem I have with reverting is that IMHO we re-introduce the bug,
which this patch fixed.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
