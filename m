Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF71E282D81
	for <lists+linux-mips@lfdr.de>; Sun,  4 Oct 2020 22:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgJDUNl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 4 Oct 2020 16:13:41 -0400
Received: from elvis.franken.de ([193.175.24.41]:43926 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726288AbgJDUNl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 4 Oct 2020 16:13:41 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kPAO0-0003iy-00; Sun, 04 Oct 2020 22:13:36 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 773EAC10D8; Sun,  4 Oct 2020 22:12:49 +0200 (CEST)
Date:   Sun, 4 Oct 2020 22:12:49 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        WANG Xuerui <git@xen0n.name>,
        Paul Burton <paulburton@kernel.org>,
        =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: cevt-r4k: Enable intimer for Loongson64 CPUs with
 extimer
Message-ID: <20201004201249.GA8186@alpha.franken.de>
References: <20200923110301.58125-1-jiaxun.yang@flygoat.com>
 <20201002132721.GA12295@alpha.franken.de>
 <CA420A99-C226-4A22-B3A6-4464DD8CFA1D@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA420A99-C226-4A22-B3A6-4464DD8CFA1D@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Oct 03, 2020 at 02:25:42PM +0800, Jiaxun Yang wrote:
> 
> 
> 于 2020年10月2日 GMT+08:00 下午9:27:21, Thomas Bogendoerfer <tsbogend@alpha.franken.de> 写到:
> >On Wed, Sep 23, 2020 at 07:02:54PM +0800, Jiaxun Yang wrote:
> >>  
> >> +#ifdef CONFIG_CPU_LOONGSON64
> >> +static int c0_compare_int_enable(struct clock_event_device *cd)
> >> +{
> >> +	if (cpu_has_extimer)
> >> +		set_c0_config6(LOONGSON_CONF6_INTIMER);
> >
> >why are you not simply do this in loognson64 board setup code and avoid
> >the whole cluttering of #ifdef CONFIG_CPU_LOONGSON64 over common code ?
> 
> Because I'm going to add extimer support later that require dynamic
> switch of cevt-r4k.

another case of misdesigned hardware or why does this need to be
dynamic ?

> This callback is required.

please find a solution without #ifdef CONFIG_CPU_LOONGSON64. I dislike
the pollution of common code with all kinds of #ifdefs and in this case
there are better options.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
