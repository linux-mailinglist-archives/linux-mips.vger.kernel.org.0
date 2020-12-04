Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920CA2CEDC6
	for <lists+linux-mips@lfdr.de>; Fri,  4 Dec 2020 13:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbgLDMLJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Dec 2020 07:11:09 -0500
Received: from elvis.franken.de ([193.175.24.41]:48093 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728110AbgLDMKy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Dec 2020 07:10:54 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kl9ud-0005Nb-02; Fri, 04 Dec 2020 13:10:11 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0226DC02E5; Fri,  4 Dec 2020 13:08:16 +0100 (CET)
Date:   Fri, 4 Dec 2020 13:08:16 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH 2/2] MIPS: Select ARCH_KEEP_MEMBLOCK to enable sysfs
 memblock debug
Message-ID: <20201204120816.GC10011@alpha.franken.de>
References: <1606965544-22611-1-git-send-email-yangtiezhu@loongson.cn>
 <1606965544-22611-3-git-send-email-yangtiezhu@loongson.cn>
 <9c9af0de-387b-f113-b0a2-c5767c31c16d@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c9af0de-387b-f113-b0a2-c5767c31c16d@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 03, 2020 at 11:58:51AM +0800, Jiaxun Yang wrote:
> 
> 
> 在 2020/12/3 上午11:19, Tiezhu Yang 写道:
> > In the current code, CONFIG_ARCH_KEEP_MEMBLOCK is not set for MIPS arch,
> > memblock_discard() will discard memory and reserved arrays if they were
> > allocated, select ARCH_KEEP_MEMBLOCK to give a chance to track "memory"
> > and "reserved" memblocks after early boot, with this patch, we can see
> > the following two sysfs interfaces under DEBUG_FS.
> > 
> > /sys/kernel/debug/memblock/memory
> > /sys/kernel/debug/memblock/reserved
> 
> Is this really necessary?
> memblock data is not really necessary after boot for non-debug purpose.
> 
> Given that MIPS is widely used in embedded systems which doesn't have much
> memory, keeping unused data after boot is kinda unconvincing.

about how much memory are talking here ?

> 
> If you intend to debug that please do it locally.

maybe we can add a

if DEBUG_KERNEL 

since enabling DEBUG_KERNEL will cost already some memory...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
