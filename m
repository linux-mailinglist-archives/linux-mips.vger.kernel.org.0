Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D01A2689C3
	for <lists+linux-mips@lfdr.de>; Mon, 14 Sep 2020 13:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgINLNH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Sep 2020 07:13:07 -0400
Received: from elvis.franken.de ([193.175.24.41]:38261 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbgINLMW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Sep 2020 07:12:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kHmOg-0003Bp-00; Mon, 14 Sep 2020 13:11:46 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2D173C0FA5; Mon, 14 Sep 2020 13:08:56 +0200 (CEST)
Date:   Mon, 14 Sep 2020 13:08:56 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Youling Tang <tangyouling@loongson.cn>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Remove unused BOOT_MEM_INIT_RAM
Message-ID: <20200914110856.GA8974@alpha.franken.de>
References: <1599875955-9207-1-git-send-email-tangyouling@loongson.cn>
 <f2349dc3-8086-64ee-e2d7-7a69afac6623@flygoat.com>
 <06109011-21af-ad1d-41cb-18542b9b77f6@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06109011-21af-ad1d-41cb-18542b9b77f6@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 14, 2020 at 06:39:51PM +0800, Youling Tang wrote:
> 
> 
> On 09/14/2020 12:32 PM, Jiaxun Yang wrote:
> >
> >
> >在 2020/9/12 9:59, Youling Tang 写道:
> >>Commit a94e4f24ec83 ("MIPS: init: Drop boot_mem_map") left
> >>the BOOT_MEM_INIT_RAM unused, remove it.
> >>
> >>Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> >>---
> >>  arch/mips/include/asm/bootinfo.h | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >>diff --git a/arch/mips/include/asm/bootinfo.h
> >>b/arch/mips/include/asm/bootinfo.h
> >>index 147c932..39196ae 100644
> >>--- a/arch/mips/include/asm/bootinfo.h
> >>+++ b/arch/mips/include/asm/bootinfo.h
> >>@@ -91,7 +91,6 @@ extern unsigned long mips_machtype;
> >>  #define BOOT_MEM_RAM        1
> >>  #define BOOT_MEM_ROM_DATA    2
> >>  #define BOOT_MEM_RESERVED    3
> >>-#define BOOT_MEM_INIT_RAM    4
> >
> >If you're willing to remove that you'd better turn the memtype struct
> >into a enum.
> >
> Hi  Jiaxun,
> Do you mean to modify it as follows?
> 
> enum boot_memtype {
>                 BOOT_MEM_RAM,
>                 BOOT_MEM_ROM_DATA,
>                 BOOT_MEM_RESERVED,
>                 BOOT_MEM_NOMAP,
> };

that's not worth the effort, we should convert from add_memory_region
to direct memblock_XXX calls and get rid of MIPS boot mem completely.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
