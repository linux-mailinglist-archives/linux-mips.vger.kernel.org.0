Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4341E599A
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 09:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgE1HqW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 03:46:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:42145 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbgE1HqW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 May 2020 03:46:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jeDF0-0000aG-02; Thu, 28 May 2020 09:46:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 173BFC05A4; Thu, 28 May 2020 09:45:39 +0200 (CEST)
Date:   Thu, 28 May 2020 09:45:39 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: Define PCI_IOBASE
Message-ID: <20200528074539.GC10708@alpha.franken.de>
References: <20200527131721.646926-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527131721.646926-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 27, 2020 at 09:17:21PM +0800, Jiaxun Yang wrote:
> PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
> required by generic PCI drivers to make memory mapped I/O range
> work.
> 
> To deal with legacy drivers that have fixed I/O ports range we
> reserved 0x10000 in PCI_IOBASE, should be enough for i8259 i8042
> stuff.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../mips/include/asm/mach-loongson64/spaces.h |  8 ++++
>  arch/mips/loongson64/init.c                   | 42 ++++++++++++++++++-
>  2 files changed, 48 insertions(+), 2 deletions(-)

that looks so much nicer, thank you for doing this. Applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
