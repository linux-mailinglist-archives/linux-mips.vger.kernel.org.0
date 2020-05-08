Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13CE41CB536
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 18:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgEHQwx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 May 2020 12:52:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:45060 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727097AbgEHQwx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 May 2020 12:52:53 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jX6Ey-00060q-00; Fri, 08 May 2020 18:52:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F1396C043D; Fri,  8 May 2020 18:52:35 +0200 (CEST)
Date:   Fri, 8 May 2020 18:52:35 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        john.garry@huawei.com
Subject: Re: [PATCH RESEND v3 2/3] MIPS: Introduce PCI_IO_VMMAP
Message-ID: <20200508165235.GA24425@alpha.franken.de>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-2-jiaxun.yang@flygoat.com>
 <20200508161102.GA23094@alpha.franken.de>
 <18B84249-7CA1-411E-B595-6E215D8C9C34@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18B84249-7CA1-411E-B595-6E215D8C9C34@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 09, 2020 at 12:22:25AM +0800, Jiaxun Yang wrote:
> 
> 
> 于 2020年5月9日 GMT+08:00 上午12:11:02, Thomas Bogendoerfer <tsbogend@alpha.franken.de> 写到:
> >On Fri, May 08, 2020 at 07:44:37PM +0800, Jiaxun Yang wrote:
> >> Define PCI_IOBASE for MIPS at the strat of kernel mapping segment.
> >> That would allow virt address of I/O ports to be dynamicly mapped.
> >> So we'll be able to combine multiple MMIO ranges into I/O ports
> >> and thus we can take advantage of logic_pio mechanism.
> >
> >What is the advantage ?
> >
> >From my point of view this will be slower because of TLB faults for
> >PCI IO space accesses.
> 
> Advantage is we can use logic_pio to manage multiple I/O Port ranges.

and what exactly does this buy us ? I looked at lib/logic_pio.c and
there didn't appear anything in my mind other than yet another
interface for doing the same thing...

> That can help us reuse generic PCI I/O design.

please explain this.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
