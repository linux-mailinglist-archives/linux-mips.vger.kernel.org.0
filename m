Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16D7D28B25F
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 12:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387705AbgJLKie (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 06:38:34 -0400
Received: from elvis.franken.de ([193.175.24.41]:58433 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387605AbgJLKiS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 06:38:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kRvDc-0008KW-09; Mon, 12 Oct 2020 12:38:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9D990C1140; Mon, 12 Oct 2020 12:38:05 +0200 (CEST)
Date:   Mon, 12 Oct 2020 12:38:05 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2 3/4 RESEND] MIPS: Loongson64: Add /proc/boardinfo
Message-ID: <20201012103805.GC7953@alpha.franken.de>
References: <1602373674-4579-1-git-send-email-yangtiezhu@loongson.cn>
 <1602373674-4579-4-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602373674-4579-4-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Oct 11, 2020 at 07:47:53AM +0800, Tiezhu Yang wrote:
> Add /proc/boardinfo to get mainboard and BIOS info easily on the Loongson
> platform, this is useful to point out the current used mainboard type and
> BIOS version when there exists problems related with hardware or firmware.
> 
> E.g. with this patch:
> 
> [loongson@linux ~]$ cat /proc/boardinfo
> Board Info
> Manufacturer            : LEMOTE
> Board Name              : LEMOTE-LS3A4000-7A1000-1w-V01-pc
> Family                  : LOONGSON3
> 
> BIOS Info
> Vendor                  : Kunlun
> Version                 : Kunlun-A1901-V4.1.3-20200414093938
> ROM Size                : 4 KB
> Release Date            : 2020-04-14

Why does Loongson64 need this extra file no other architecture or MIPS
platform need ? Do others provide this information via a different method ?
If yes, why can't Loongson64 do the same ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
