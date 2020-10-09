Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CE928894D
	for <lists+linux-mips@lfdr.de>; Fri,  9 Oct 2020 14:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387788AbgJIMvw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Oct 2020 08:51:52 -0400
Received: from elvis.franken.de ([193.175.24.41]:53488 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730740AbgJIMvs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Oct 2020 08:51:48 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kQrs7-0002EF-01; Fri, 09 Oct 2020 14:51:43 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 49978C1126; Fri,  9 Oct 2020 14:09:00 +0200 (CEST)
Date:   Fri, 9 Oct 2020 14:09:00 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] MIPS: replace add_memory_region with memblock
Message-ID: <20201009120900.GB10588@alpha.franken.de>
References: <20201008084357.42780-1-tsbogend@alpha.franken.de>
 <20201008152006.4khkbzsxqmmz76rw@mobilestation>
 <631aa35e-2575-3ec0-ec0f-7d45e49b8373@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <631aa35e-2575-3ec0-ec0f-7d45e49b8373@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 09, 2020 at 11:00:36AM +0800, Jiaxun Yang wrote:
> 
> 
> 在 2020/10/8 23:20, Serge Semin 写道:
> 
> [...]
> >
> >>-		add_memory_region(LOONGSON_HIGHMEM_START,
> >>-				  highmemsize << 20, BOOT_MEM_RAM);
> >>-
> >>-	add_memory_region(LOONGSON_PCI_MEM_END + 1, LOONGSON_HIGHMEM_START -
> >>-			  LOONGSON_PCI_MEM_END - 1, BOOT_MEM_RESERVED);
> >>-
> >>+		memblock_add(LOONGSON_HIGHMEM_START, highmemsize << 20);
> >The same question. Is it ok to discard the
> >[LOONGSON_PCI_MEM_END+1:LOONGSON_HIGHMEM_START-LOONGSON_PCI_MEM_END-1] region
> >removal operation?
> Hi all,
> 
> I can confirm this reservation can be removed.

thank you for confirming.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
