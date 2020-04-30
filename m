Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D531BFFBF
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 17:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgD3PLh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 11:11:37 -0400
Received: from elvis.franken.de ([193.175.24.41]:33626 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726686AbgD3PLh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 11:11:37 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jUAqa-0005Uk-02; Thu, 30 Apr 2020 17:11:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A571FC0360; Thu, 30 Apr 2020 17:10:04 +0200 (CEST)
Date:   Thu, 30 Apr 2020 17:10:04 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V2] MIPS: perf: Add hardware perf events support for new
 Loongson-3
Message-ID: <20200430151004.GC17822@alpha.franken.de>
References: <1588145170-9451-1-git-send-email-chenhc@lemote.com>
 <20200429182231.GA21158@alpha.franken.de>
 <CAAhV-H6j9ktHZ2C2Psk6X+0jmh-L9GMgOmKM95x0iXHo0d7TqA@mail.gmail.com>
 <20200430081357.GA7626@alpha.franken.de>
 <CAAhV-H75EQ=Zd37qPe=VBwT-Z3Fu=_7W4TSG2v8TLpq03MRCdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H75EQ=Zd37qPe=VBwT-Z3Fu=_7W4TSG2v8TLpq03MRCdg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 30, 2020 at 05:42:43PM +0800, Huacai Chen wrote:
> On Thu, Apr 30, 2020 at 4:16 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> > that is fine. Could you check how much size increase you get for
> > a non loongson64 target with your patch ?
> I have build an IP28 kernel (ip28_defconfig+perf):
> 
> size of vmlinux with this perf patch: 10913440
> size of vmlinux without this perf patch:10913296
> 
> readelf -a vmlinux with this perf patch:
>   Type           Offset             VirtAddr           PhysAddr
>                  FileSiz            MemSiz              Flags  Align
>   LOAD           0x0000000000001000 0xa800000020004000 0xa800000020004000
>                  0x0000000000800c0c 0x0000000000830dc0  RWE    0x1000
>   NOTE           0x000000000070d020 0xa800000020710020 0xa800000020710020
>                  0x000000000000003c 0x000000000000003c  R      0x4
> 
> readelf -a vmlinux without this perf patch:
>   Type           Offset             VirtAddr           PhysAddr
>                  FileSiz            MemSiz              Flags  Align
>   LOAD           0x0000000000001000 0xa800000020004000 0xa800000020004000
>                  0x0000000000800c0c 0x0000000000830dc0  RWE    0x1000
>   NOTE           0x000000000070cff0 0xa80000002070fff0 0xa80000002070fff0
>                  0x000000000000003c 0x000000000000003c  R      0x4

this looks the same, are you sure you used the right images ?

Nevertheless it's not much. I've applied your new patch. Thank you
for checking.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
