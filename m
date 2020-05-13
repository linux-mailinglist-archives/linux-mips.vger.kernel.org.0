Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0434D1D1126
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 13:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732829AbgEMLVW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 07:21:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:51998 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732496AbgEMLVV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 May 2020 07:21:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jYpRu-000588-02; Wed, 13 May 2020 13:21:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 396C1C0482; Wed, 13 May 2020 13:21:01 +0200 (CEST)
Date:   Wed, 13 May 2020 13:21:01 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/2] MIPS: Fix typos in arch/mips/Kbuild.platforms
Message-ID: <20200513112101.GC7151@alpha.franken.de>
References: <1589359121-1572-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589359121-1572-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 13, 2020 at 04:38:40PM +0800, Huacai Chen wrote:
> Commit 26bff9eb49201aeb ("MIPS: Only include the platform file needed")
> misspelled "txx9" to "tx99", so fix it.
> 
> Fixes: 26bff9eb49201aeb ("MIPS: Only include the platform file needed")
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/Kbuild.platforms | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied both patches to mips-next. Thank you for fixing.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
