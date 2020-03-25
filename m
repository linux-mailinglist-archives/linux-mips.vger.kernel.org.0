Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9783D192E3F
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 17:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbgCYQc2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 12:32:28 -0400
Received: from elvis.franken.de ([193.175.24.41]:34474 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727901AbgCYQc2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 12:32:28 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jH8x4-0005Qf-00; Wed, 25 Mar 2020 17:32:22 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 15EC5C0D3B; Wed, 25 Mar 2020 17:31:53 +0100 (CET)
Date:   Wed, 25 Mar 2020 17:31:53 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 06/11] irqchip: mips-cpu: Convert to simple domain
Message-ID: <20200325163153.GA16381@alpha.franken.de>
References: <a69f727d37daac6e20ac08de022245b1@kernel.org>
 <C4892878-8463-448D-897B-5F2C56F5A340@flygoat.com>
 <5eb9ce9ea665ee32da40779f00fc9b37@kernel.org>
 <4BB367D3-B8AD-47B6-ACC2-30752137BC1B@flygoat.com>
 <c4520c4b0b0eaaba5fdbaebfce7b4460@kernel.org>
 <39CF835E-D1D9-4B52-ABDC-BDB17B650936@flygoat.com>
 <20200325150437.GA14217@alpha.franken.de>
 <777D8DAA-F462-4E8D-9012-C114DE6D56DE@flygoat.com>
 <20200325154600.GA14923@alpha.franken.de>
 <8F2B64C3-A887-4D4B-ABEA-4BE3D30F4632@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8F2B64C3-A887-4D4B-ABEA-4BE3D30F4632@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 26, 2020 at 12:02:28AM +0800, Jiaxun Yang wrote:
> >maybe I'm too fast by judging the irq code, but without
> >CONFIG_SPARSE_IRQ
> >the whole irq_desc is pre-allocated.
> 
> Sorry. You're right.
> I found the problem is CONFIG_SPARSE_IRQ is accidentally enabled in my config due to another out-of-tree patch

ok, that explains it.

> during my initial test and I always consider it as a problem.
> 
> So we can drop this patch safely for now.

already dropped in my test branch. If nothing shows up, I'll push
it to mips-next.

> But just need to consider how to deal with it when we want to enable SPARSE_IRQ.

setting NR_IRQS_LEGACY so a sensible value should do the trick then.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
