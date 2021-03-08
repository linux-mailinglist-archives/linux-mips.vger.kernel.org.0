Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B93FA330BD4
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 11:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhCHK4W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 05:56:22 -0500
Received: from elvis.franken.de ([193.175.24.41]:57502 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231126AbhCHK4F (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Mar 2021 05:56:05 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lJDYR-0003M5-00; Mon, 08 Mar 2021 11:56:03 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 48ED7C1278; Mon,  8 Mar 2021 11:53:57 +0100 (CET)
Date:   Mon, 8 Mar 2021 11:53:57 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh@kernel.org>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: boot/compressed: Copy DTB to aligned address
Message-ID: <20210308105357.GA6622@alpha.franken.de>
References: <20210303193305.924384-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303193305.924384-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 03, 2021 at 07:33:05PM +0000, Paul Cercueil wrote:
> Since 5.12-rc1, the Device Tree blob must now be properly aligned.
> 
> Therefore, the decompress routine must be careful to copy the blob at
> the next aligned address after the kernel image.
> 
> This commit fixes the kernel sometimes not booting with a Device Tree
> blob appended to it.
> 
> Fixes: c4d5e638d6e9 ("scripts/dtc: Update to upstream version v1.6.0-51-g183df9e9c2b9")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/compressed/decompress.c | 8 ++++++++
>  arch/mips/kernel/vmlinux.lds.S         | 2 ++
>  2 files changed, 10 insertions(+)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
