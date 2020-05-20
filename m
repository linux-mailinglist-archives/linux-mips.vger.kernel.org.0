Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F871DAAFE
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 08:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgETGsF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 02:48:05 -0400
Received: from elvis.franken.de ([193.175.24.41]:60043 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726450AbgETGsF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 May 2020 02:48:05 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jbIWJ-0007pg-00; Wed, 20 May 2020 08:48:03 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 21EE0C013A; Wed, 20 May 2020 08:45:01 +0200 (CEST)
Date:   Wed, 20 May 2020 08:45:01 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: SGI-IP27: Remove not used includes and comment in
 ip27-timer.c
Message-ID: <20200520064501.GA7630@alpha.franken.de>
References: <1589951557-21800-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589951557-21800-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 20, 2020 at 01:12:37PM +0800, Tiezhu Yang wrote:
> After commit 0ce5ebd24d25 ("mfd: ioc3: Add driver for SGI IOC3 chip"),
> the related includes and comment about ioc3 are not used any more in
> ip27-timer.c, remove them.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/sgi-ip27/ip27-timer.c | 5 -----
>  1 file changed, 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
