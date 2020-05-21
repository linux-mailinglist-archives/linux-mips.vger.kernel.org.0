Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F251DC774
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 09:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgEUHS3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 03:18:29 -0400
Received: from elvis.franken.de ([193.175.24.41]:32948 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727003AbgEUHS1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 May 2020 03:18:27 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jbfTA-0001b7-01; Thu, 21 May 2020 09:18:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D2311C0155; Thu, 21 May 2020 09:14:57 +0200 (CEST)
Date:   Thu, 21 May 2020 09:14:57 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Paul Burton <paul.burton@imgtec.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/14] mips: Prepare MIPS-arch code for Baikal-T1 SoC
 support
Message-ID: <20200521071457.GC7309@alpha.franken.de>
References: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
 <20200521004217.6gdcpboxaqizreky@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521004217.6gdcpboxaqizreky@mobilestation>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 03:42:17AM +0300, Serge Semin wrote:
> On Thu, May 21, 2020 at 03:34:29AM +0300, Serge Semin wrote:
> >
> > This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
> > base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
> > tag: v5.7-rc4
> 
> Thomas,
> Please note that this patchset is based on the Linux 5.7-rc4 tree (it most likely
> will get cleanly applied on rc6 as well), while mips-next is still at rc1. Due
> to that the patchset fails to be applied on mips-next. I think it would be
> better first to merge the last Linux tree into the mips-next, then try to merge
> this patchset in. Should you have any problem after that, please let me know.
> I'll resend the patchset being rebased on top of the new mips-next tree.

no, that's not how it works. Please rebase your patches on top of
mips-next. Thank you.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
