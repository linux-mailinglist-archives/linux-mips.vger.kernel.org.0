Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C381131BB52
	for <lists+linux-mips@lfdr.de>; Mon, 15 Feb 2021 15:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhBOOmO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Feb 2021 09:42:14 -0500
Received: from elvis.franken.de ([193.175.24.41]:56950 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229779AbhBOOmM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Feb 2021 09:42:12 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lBf42-0000J2-00; Mon, 15 Feb 2021 15:41:26 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0A40BC0344; Mon, 15 Feb 2021 14:19:06 +0100 (CET)
Date:   Mon, 15 Feb 2021 14:19:05 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kernel: Drop kgdb_call_nmi_hook
Message-ID: <20210215131905.GA3307@alpha.franken.de>
References: <20210213140231.23985-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210213140231.23985-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Feb 13, 2021 at 03:02:31PM +0100, Thomas Bogendoerfer wrote:
> With the removal of set_fs() calls kgdb_call_nmi_hook() is now the same as
> the default implementation, so we can remove it.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/kernel/kgdb.c | 5 -----
>  1 file changed, 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
