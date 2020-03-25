Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEFA192F5E
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 18:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgCYRef (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 13:34:35 -0400
Received: from elvis.franken.de ([193.175.24.41]:34618 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727826AbgCYRef (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 13:34:35 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jH9v6-0008NM-03; Wed, 25 Mar 2020 18:34:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 41FCFC0D49; Wed, 25 Mar 2020 18:33:28 +0100 (CET)
Date:   Wed, 25 Mar 2020 18:33:28 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Huacai Chen <chenhc@lemote.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 00/11] Modernize Loongson64 Machine v8
Message-ID: <20200325173328.GD17524@alpha.franken.de>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20200325035537.156911-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325035537.156911-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 25, 2020 at 11:54:53AM +0800, Jiaxun Yang wrote:
> Loongson have a long history of contributing their code to mainline kernel.
> However, it seems like recent years, they are focusing on maintain a kernel by themselves
> rather than contribute there code to the community.
> 
> Kernel is progress rapidly too. Their code slept in mainline for a long peroid without proper
> maintainance and became outdated.
> 
> This patchset brings modern DeviceTree and irqchip support to the Loongson64 machine, and leaves
> Loongson 2e/f alone since they are too legacy to touch.
> 
> PCI and some legacy I/O device will be converted later, together with LS7A PCH support.

applied series minus patch 6 to mips-next.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
