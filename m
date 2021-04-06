Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072D0354DCB
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 09:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232735AbhDFHYy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 03:24:54 -0400
Received: from verein.lst.de ([213.95.11.211]:53241 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhDFHYx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Apr 2021 03:24:53 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 1C9C568B02; Tue,  6 Apr 2021 09:24:43 +0200 (CEST)
Date:   Tue, 6 Apr 2021 09:24:43 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] MIPS: Remove get_fs/set_fs
Message-ID: <20210406072443.GA7626@lst.de>
References: <20210401125639.42963-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401125639.42963-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Btw, there is a bunch of cleanups that would fit in nicely on top of
this:

 - remove the unused __invoke_copy_from function
 - fold __get_user_check into get_user as it is the only caller
 - fold __get_user_nocheck into __get_user as it is the only caller
 - fold __put_user_check into put_user as it is the only caller
 - fold __put_user_nocheck into __put_user as it is the only caller
 - implement get_user in terms of __get_user to document the difference
   better and to remove __get_user_common
 - implement put_user in terms of __put_user to document the difference
   better and to remove __get_user_common
 - remove __put_user_unknown/__get_user_unknown and replace them with
   BUILD_BUG_ON()


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
> 
> -- 
> 2.29.2
---end quoted text---
