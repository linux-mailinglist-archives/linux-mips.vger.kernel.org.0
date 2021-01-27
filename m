Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5C973065C6
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 22:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233929AbhA0VMF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 16:12:05 -0500
Received: from elvis.franken.de ([193.175.24.41]:60512 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233907AbhA0VLw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Jan 2021 16:11:52 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l4s5l-0003cQ-04; Wed, 27 Jan 2021 22:11:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CA230C0AAF; Wed, 27 Jan 2021 22:07:36 +0100 (CET)
Date:   Wed, 27 Jan 2021 22:07:36 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@gmail.com>, siyanteng01@gmail.com,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 2/2] MIPS: mm:remove function __uncached_access()
Message-ID: <20210127210736.GE21002@alpha.franken.de>
References: <20210127023806.3753812-1-siyanteng@loongson.cn>
 <20210127023806.3753812-2-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127023806.3753812-2-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 27, 2021 at 10:38:06AM +0800, Yanteng Si wrote:
> MIPS can now use the default uncached_access like other archs.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  arch/mips/mm/cache.c | 8 --------
>  drivers/char/mem.c   | 7 -------
>  2 files changed, 15 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
