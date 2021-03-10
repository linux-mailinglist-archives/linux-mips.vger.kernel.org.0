Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C07334157
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 16:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbhCJPTM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 10:19:12 -0500
Received: from elvis.franken.de ([193.175.24.41]:42343 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232565AbhCJPS5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 10:18:57 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lK0bw-00088y-01; Wed, 10 Mar 2021 16:18:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4B24BC1D54; Wed, 10 Mar 2021 16:07:27 +0100 (CET)
Date:   Wed, 10 Mar 2021 16:07:27 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Lobakin <alobakin@pm.me>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Stefan Asserhall <stefan.asserhall@xilinx.com>
Subject: Re: [PATCH 2/2] mips: syscalls: switch to generic syscallhdr.sh
Message-ID: <20210310150727.GB12960@alpha.franken.de>
References: <20210301144825.357922-1-masahiroy@kernel.org>
 <20210301144825.357922-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301144825.357922-2-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 01, 2021 at 11:48:25PM +0900, Masahiro Yamada wrote:
> Many architectures duplicate similar shell scripts.
> 
> This commit converts mips to use scripts/syscallhdr.sh.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/mips/kernel/syscalls/Makefile      | 10 ++-----
>  arch/mips/kernel/syscalls/syscallhdr.sh | 36 -------------------------
>  2 files changed, 2 insertions(+), 44 deletions(-)
>  delete mode 100644 arch/mips/kernel/syscalls/syscallhdr.sh

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
