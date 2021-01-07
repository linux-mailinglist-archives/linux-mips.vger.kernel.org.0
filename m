Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C398B2ED45D
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jan 2021 17:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbhAGQaC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Jan 2021 11:30:02 -0500
Received: from elvis.franken.de ([193.175.24.41]:34750 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728131AbhAGQ3q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 Jan 2021 11:29:46 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kxY9o-0000Mi-00; Thu, 07 Jan 2021 17:29:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BDD96C080C; Thu,  7 Jan 2021 17:25:49 +0100 (CET)
Date:   Thu, 7 Jan 2021 17:25:49 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH mips-next] MIPS: UAPI: unexport unistd_nr_{n32,n64,o32}.h
Message-ID: <20210107162549.GA11882@alpha.franken.de>
References: <20210104154115.213029-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104154115.213029-1-alobakin@pm.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 04, 2021 at 03:41:48PM +0000, Alexander Lobakin wrote:
> unistd_nr_{n32,n64,o32}.h are needed only by include/asm/unistd.h,
> which is a kernel-side header file, and their contents is generally
> not for userland use.
> Move their target destination from include/generated/uapi/asm/ to
> include/generated/asm/ to disable exporting them as UAPI headers.
> 
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>
> ---
>  arch/mips/include/asm/Kbuild       |  4 ++++
>  arch/mips/include/uapi/asm/Kbuild  |  3 ---
>  arch/mips/kernel/syscalls/Makefile | 16 ++++++++--------
>  3 files changed, 12 insertions(+), 11 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
