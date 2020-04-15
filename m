Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12491A968C
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 10:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408077AbgDOIbp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 04:31:45 -0400
Received: from elvis.franken.de ([193.175.24.41]:39993 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408073AbgDOIbo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 04:31:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jOdSN-0007IZ-00; Wed, 15 Apr 2020 10:31:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 11724C010E; Wed, 15 Apr 2020 10:31:18 +0200 (CEST)
Date:   Wed, 15 Apr 2020 10:31:18 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2] MIPS: Limit check_bugs32() to affected platform
Message-ID: <20200415083117.GA3125@alpha.franken.de>
References: <1586488859-18715-1-git-send-email-yangtiezhu@loongson.cn>
 <c60f62cb-62e8-be13-f551-c9a13abc7f94@gmail.com>
 <181cf95e-c5f6-3899-e8eb-3f8847ec86d9@loongson.cn>
 <20200414173208.GA22802@alpha.franken.de>
 <5e575f15-4efc-7bf7-e266-d01aca094bbc@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e575f15-4efc-7bf7-e266-d01aca094bbc@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 15, 2020 at 09:48:30AM +0800, Tiezhu Yang wrote:
> On 04/15/2020 01:32 AM, Thomas Bogendoerfer wrote:
> >On Sat, Apr 11, 2020 at 10:32:02AM +0800, Tiezhu Yang wrote:
> >>On 04/11/2020 12:25 AM, Florian Fainelli wrote:
> >>>On 4/9/2020 8:20 PM, Tiezhu Yang wrote:
> >>>>In the current code, check_bugs32() only handles MIPS32 CPU type CPU_34K,
> >>>>it is better to build and call it on the affected platform.
> >>>>
> >>>>Move check_bugs32() to the new added 34k-bugs32.c to indicate the fact that
> >>>>the code is specific to the 34k CPU, and also add CONFIG_CPU_34K_BUGS32 to
> >>>>control whether or not check the bugs.
> >>>>
> >>>>Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> >>>This is not a whole lot of code, so moving this to a separate
> >>>translation unit seems a bit heavy handed, also file renames, albeit
> >>>tracked properly by git are always a challenge when doing back ports.
> >>Hi Florian,
> >>
> >>There exists the following three ways to do it, I'm fine either way,
> >>maybe the first way looks better. Let us wait for the MIPS maintainer
> >>to say what he prefer.
> >>
> >>Hi Thomas,
> >>
> >>What is your opinion?
> >I don't see a reason for doing that at all. The 34K workaround is only
> >compiled in if CONFIG_SYS_HAS_CPU_MIPS32_R2 is defined.
> 
> Hi Thomas,
> 
> Thanks for your reply. My initial thought is to build and call check_bugs32() only for 34K CPU,
> because it is useless for other CPU types.
> 
> Do you mean to use the following modification?

no, IMHO we don't need to change anything here. There is not much to save
here.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
