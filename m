Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074F53281B9
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 16:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236877AbhCAPEF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Mar 2021 10:04:05 -0500
Received: from elvis.franken.de ([193.175.24.41]:33719 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236874AbhCAPEA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Mar 2021 10:04:00 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lGk4r-00041h-01; Mon, 01 Mar 2021 16:03:17 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 889A9C03C2; Mon,  1 Mar 2021 15:48:16 +0100 (CET)
Date:   Mon, 1 Mar 2021 15:48:16 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Adrian Schmutzler <freifunk@adrianschmutzler.de>
Cc:     linux-mips@vger.kernel.org, Roman Kuzmitskii <damex.pp@icloud.com>
Subject: Re: [PATCH] mips: octeon: Add Ubiquiti E300 board
Message-ID: <20210301144816.GB11261@alpha.franken.de>
References: <20210225160713.41828-1-freifunk@adrianschmutzler.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225160713.41828-1-freifunk@adrianschmutzler.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Feb 25, 2021 at 05:07:13PM +0100, Adrian Schmutzler wrote:
> This board is used in Ubiquiti EdgeRouter 4.
> 
> Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>
> ---
>  arch/mips/include/asm/octeon/cvmx-bootinfo.h | 2 ++
>  1 file changed, 2 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
