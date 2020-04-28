Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12011BBC7B
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 13:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgD1LeM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 07:34:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:58671 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726450AbgD1LeL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 07:34:11 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jTOV6-0004MF-02; Tue, 28 Apr 2020 13:34:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CC6C9C0344; Tue, 28 Apr 2020 13:29:17 +0200 (CEST)
Date:   Tue, 28 Apr 2020 13:29:17 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v4 0/3] Add basic support for LS7A bridge chip
Message-ID: <20200428112917.GC11443@alpha.franken.de>
References: <1585906191-26037-1-git-send-email-yangtiezhu@loongson.cn>
 <8afa3df1-9c9f-aa90-e630-2b77f24fe41f@loongson.cn>
 <20200427125732.3212ced3@flygoat-x1e>
 <a6df2442-bb44-5002-09ab-56ad6e7dd528@loongson.cn>
 <20200427144203.114d4e2d@flygoat-x1e>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427144203.114d4e2d@flygoat-x1e>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 27, 2020 at 02:42:03PM +0800, Jiaxun Yang wrote:
> On Mon, 27 Apr 2020 13:42:06 +0800
> Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> > Thanks for your suggestion, let me rethink how to properly support
> > DMA.
> > 
> > Do you think the following patch could be applied first?
> > 
> > [v4,1/3] MIPS: Loongson: Get host bridge information
> > https://lore.kernel.org/patchwork/patch/1220009/
> 
> Looks reasonable.
> 
> Thanks.

I've just applied the first patch of this series to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
