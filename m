Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECC1233E117
	for <lists+linux-mips@lfdr.de>; Tue, 16 Mar 2021 23:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbhCPWFT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Mar 2021 18:05:19 -0400
Received: from elvis.franken.de ([193.175.24.41]:35191 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230139AbhCPWEv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 16 Mar 2021 18:04:51 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lMHo2-0005CW-00; Tue, 16 Mar 2021 23:04:50 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 46743C093D; Tue, 16 Mar 2021 22:59:19 +0100 (CET)
Date:   Tue, 16 Mar 2021 22:59:19 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH] MIPS: vmlinux.lds.S: Fix appended dtb not properly
 aligned
Message-ID: <20210316215919.GA18538@alpha.franken.de>
References: <20210316154515.171543-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210316154515.171543-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 16, 2021 at 03:45:15PM +0000, Paul Cercueil wrote:
> Commit 6654111c893f ("MIPS: vmlinux.lds.S: align raw appended dtb to 8
> bytes") changed the alignment from STRUCT_ALIGNMENT bytes to 8 bytes.
> 
> The commit's message makes it sound like it was actually done on
> purpose, but this is not the case. The commit was written when raw
> appended dtb were not aligned at all. The STRUCT_ALIGN() was added a few
> days before, in commit 7a05293af39f ("MIPS: boot/compressed: Copy DTB to
> aligned address"). The true purpose of the commit was not to align
> specifically to 8 bytes, but to make sure that the generated vmlinux'
> size was properly padded to the alignment required for DTBs.
> 
> While the switch to 8-byte alignment worked for vmlinux-appended dtb
> blobs, it broke vmlinuz-appended dtb blobs, as the decompress routine
> moves the blob to a STRUCT_ALIGNMENT aligned address.
> 
> Fix this by changing the raw appended dtb blob alignment from 8 bytes
> back to STRUCT_ALIGNMENT bytes in vmlinux.lds.S.
> 
> Fixes: 6654111c893f ("MIPS: vmlinux.lds.S: align raw appended dtb to 8 bytes")
> Cc: Bjørn Mork <bjorn@mork.no>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/kernel/vmlinux.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
