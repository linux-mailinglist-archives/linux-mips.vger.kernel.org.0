Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C7F27A092
	for <lists+linux-mips@lfdr.de>; Sun, 27 Sep 2020 13:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgI0LLm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Sep 2020 07:11:42 -0400
Received: from elvis.franken.de ([193.175.24.41]:60021 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726252AbgI0LLm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Sep 2020 07:11:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kMUaj-0002VG-00; Sun, 27 Sep 2020 13:11:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 24720C1023; Sun, 27 Sep 2020 13:11:29 +0200 (CEST)
Date:   Sun, 27 Sep 2020 13:11:29 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Pujin Shi <shipujin.t@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] MIPS: idle: Add prototype for function check_wait
Message-ID: <20200927111129.GA6217@alpha.franken.de>
References: <20200927092205.1252-1-shipujin.t@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927092205.1252-1-shipujin.t@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 27, 2020 at 05:22:05PM +0800, Pujin Shi wrote:
> This commit adds a prototype to fix warning at W=1:
> 
>   arch/mips/kernel/idle.c:126:13: error: no previous prototype for 'check_wait' [-Werror=missing-prototypes]
> 
> Signed-off-by: Pujin Shi <shipujin.t@gmail.com>
> ---
>  arch/mips/include/asm/idle.h | 2 ++
>  1 file changed, 2 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
