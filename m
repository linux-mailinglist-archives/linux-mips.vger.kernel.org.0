Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 706BC3554CF
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 15:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243639AbhDFNSv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 09:18:51 -0400
Received: from elvis.franken.de ([193.175.24.41]:59095 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243571AbhDFNSr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Apr 2021 09:18:47 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lTlbJ-0006qP-00; Tue, 06 Apr 2021 15:18:37 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D82C5C24CD; Tue,  6 Apr 2021 14:59:45 +0200 (CEST)
Date:   Tue, 6 Apr 2021 14:59:45 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     hch@lst.de
Subject: Re: [PATCH v3 0/4] MIPS: Remove get_fs/set_fs
Message-ID: <20210406125945.GA9505@alpha.franken.de>
References: <20210401125639.42963-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401125639.42963-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 01, 2021 at 02:56:33PM +0200, Thomas Bogendoerfer wrote:
> This series replaces get_fs/set_fs and removes it from MIPS arch code.
> 
> Changes in v3:
> - use get_user/get_kernel_nofault for helper functions
> 
> Changes in v2:
> - added copy_from_kernel_nofault_allowed() for !EVA to restrict
>   access of __get/__put_kernel_nofault
> - replaced __get_data macro by helper functions
> - removed leftover set_fs calls in ftrace.c
> - further cleanup uaccess.h
> 
> Thomas Bogendoerfer (4):
>   MIPS: kernel: Remove not needed set_fs calls
>   MIPS: uaccess: Added __get/__put_kernel_nofault
>   MIPS: uaccess: Remove get_fs/set_fs call sites
>   MIPS: Remove get_fs/set_fs
> 
>  arch/mips/Kconfig                   |   1 -
>  arch/mips/include/asm/processor.h   |   4 -
>  arch/mips/include/asm/thread_info.h |   6 -
>  arch/mips/include/asm/uaccess.h     | 436 +++++++++++-----------------
>  arch/mips/kernel/access-helper.h    |  18 ++
>  arch/mips/kernel/asm-offsets.c      |   1 -
>  arch/mips/kernel/ftrace.c           |   8 -
>  arch/mips/kernel/process.c          |   2 -
>  arch/mips/kernel/scall32-o32.S      |   4 +-
>  arch/mips/kernel/traps.c            | 105 +++----
>  arch/mips/kernel/unaligned.c        | 199 +++++--------
>  arch/mips/lib/memcpy.S              |  28 +-
>  arch/mips/lib/memset.S              |   3 -
>  arch/mips/lib/strncpy_user.S        |  48 +--
>  arch/mips/lib/strnlen_user.S        |  44 +--
>  arch/mips/mm/Makefile               |   4 +
>  arch/mips/mm/maccess.c              |  10 +
>  17 files changed, 357 insertions(+), 564 deletions(-)
>  create mode 100644 arch/mips/kernel/access-helper.h
>  create mode 100644 arch/mips/mm/maccess.c

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
