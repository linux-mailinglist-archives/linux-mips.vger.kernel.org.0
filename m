Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC4F1CB465
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 18:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgEHQLQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 May 2020 12:11:16 -0400
Received: from elvis.franken.de ([193.175.24.41]:45011 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbgEHQLP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 May 2020 12:11:15 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jX5aj-0005dM-00; Fri, 08 May 2020 18:11:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 063F6C043A; Fri,  8 May 2020 18:11:03 +0200 (CEST)
Date:   Fri, 8 May 2020 18:11:02 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        john.garry@huawei.com
Subject: Re: [PATCH RESEND v3 2/3] MIPS: Introduce PCI_IO_VMMAP
Message-ID: <20200508161102.GA23094@alpha.franken.de>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508114438.3092215-2-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 08, 2020 at 07:44:37PM +0800, Jiaxun Yang wrote:
> Define PCI_IOBASE for MIPS at the strat of kernel mapping segment.
> That would allow virt address of I/O ports to be dynamicly mapped.
> So we'll be able to combine multiple MMIO ranges into I/O ports
> and thus we can take advantage of logic_pio mechanism.

What is the advantage ?

From my point of view this will be slower because of TLB faults for
PCI IO space accesses.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
