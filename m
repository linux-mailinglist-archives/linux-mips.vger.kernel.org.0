Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1325B314F34
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 13:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhBIMkf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Feb 2021 07:40:35 -0500
Received: from elvis.franken.de ([193.175.24.41]:36517 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230224AbhBIMj7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Feb 2021 07:39:59 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l9SIV-0003IE-02; Tue, 09 Feb 2021 13:39:15 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 628E6C0DBF; Tue,  9 Feb 2021 13:34:55 +0100 (CET)
Date:   Tue, 9 Feb 2021 13:34:55 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] MIPS: relocatable: Use __kaslr_offset in
 show_kernel_relocation
Message-ID: <20210209123455.GB11264@alpha.franken.de>
References: <1612519882-16480-1-git-send-email-hejinyang@loongson.cn>
 <1612519882-16480-2-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612519882-16480-2-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Feb 05, 2021 at 06:11:22PM +0800, Jinyang He wrote:
> The type of the VMLINUX_LOAD_ADDRESS macro is the (unsigned long long)
> in 32bits kernel but (unsigned long) in the 64-bit kernel. Although there
> is no error here, avoid using it to calculate kaslr_offset.
> 
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/kernel/relocate.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
