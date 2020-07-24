Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBF4C22C482
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jul 2020 13:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbgGXLsP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jul 2020 07:48:15 -0400
Received: from elvis.franken.de ([193.175.24.41]:47135 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726280AbgGXLsO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Jul 2020 07:48:14 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jywBI-0003GQ-00; Fri, 24 Jul 2020 13:48:04 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 243D2C0931; Fri, 24 Jul 2020 13:09:13 +0200 (CEST)
Date:   Fri, 24 Jul 2020 13:09:13 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     paul@crapouillou.net, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, Sergey.Semin@baikalelectronics.ru,
        chenhc@lemote.com, Alexey.Malahov@baikalelectronics.ru,
        huanglllzu@gmail.com, prasannatsmkumar@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: Re: [PATCH 1/1] MIPS: X2000: Add X2000 system type.
Message-ID: <20200724110913.GA17183@alpha.franken.de>
References: <20200722052119.60129-1-zhouyanjie@wanyeetech.com>
 <20200722052119.60129-2-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200722052119.60129-2-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 22, 2020 at 01:21:19PM +0800, 周琰杰 (Zhou Yanjie) wrote:
> 1.Add "PRID_COMP_INGENIC_13" and "PRID_IMP_XBURST2" for X2000.
> 2.Add X2000 system type for cat /proc/cpuinfo to give out X2000.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
>  arch/mips/include/asm/bootinfo.h |  1 +
>  arch/mips/include/asm/cpu.h      |  6 ++++--
>  arch/mips/jz4740/setup.c         |  4 ++++
>  arch/mips/kernel/cpu-probe.c     | 11 +++++++++++
>  4 files changed, 20 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
