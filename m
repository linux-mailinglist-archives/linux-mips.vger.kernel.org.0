Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5E21D9CBA
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 18:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729118AbgESQb4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 12:31:56 -0400
Received: from elvis.franken.de ([193.175.24.41]:59326 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbgESQb4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 19 May 2020 12:31:56 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jb59m-0001aq-00; Tue, 19 May 2020 18:31:54 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C7726C0136; Tue, 19 May 2020 18:03:34 +0200 (CEST)
Date:   Tue, 19 May 2020 18:03:34 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: SGI-IP27: Remove duplicated include in ip27-timer.c
Message-ID: <20200519160334.GA16307@alpha.franken.de>
References: <1589891291-7030-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589891291-7030-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 19, 2020 at 08:28:11PM +0800, Tiezhu Yang wrote:
> After commit 9d0aaf98dc24 ("MIPS: SGI-IP27: Move all shared IP27
> declarations to ip27-common.h"), ip27-common.h is included more
> than once in ip27-timer.c, remove it.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

applied to mips-next. I only removed the second #include. If you
want to clean this up further the includes and comment about
ioc3_init() could be removed as well.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
