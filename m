Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C683554CB
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 15:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243614AbhDFNSt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 09:18:49 -0400
Received: from elvis.franken.de ([193.175.24.41]:59097 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243573AbhDFNSr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Apr 2021 09:18:47 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lTlbK-0006qP-00; Tue, 06 Apr 2021 15:18:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D3612C24D9; Tue,  6 Apr 2021 15:01:33 +0200 (CEST)
Date:   Tue, 6 Apr 2021 15:01:33 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] MIPS: Remove get_fs/set_fs
Message-ID: <20210406130133.GB9505@alpha.franken.de>
References: <20210401125639.42963-1-tsbogend@alpha.franken.de>
 <20210406072443.GA7626@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406072443.GA7626@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 06, 2021 at 09:24:43AM +0200, Christoph Hellwig wrote:
> Btw, there is a bunch of cleanups that would fit in nicely on top of
> this:
> 
>  - remove the unused __invoke_copy_from function

I've removed in the last patch before applying to mips-next.

>  - fold __get_user_check into get_user as it is the only caller
>  - fold __get_user_nocheck into __get_user as it is the only caller
>  - fold __put_user_check into put_user as it is the only caller
>  - fold __put_user_nocheck into __put_user as it is the only caller
>  - implement get_user in terms of __get_user to document the difference
>    better and to remove __get_user_common
>  - implement put_user in terms of __put_user to document the difference
>    better and to remove __get_user_common
>  - remove __put_user_unknown/__get_user_unknown and replace them with
>    BUILD_BUG_ON()

I'll prepare a follow-up patch. Thank you for your cleanup hints.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
