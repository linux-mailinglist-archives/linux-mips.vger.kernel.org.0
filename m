Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07CEF361A7F
	for <lists+linux-mips@lfdr.de>; Fri, 16 Apr 2021 09:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238871AbhDPHXc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Apr 2021 03:23:32 -0400
Received: from elvis.franken.de ([193.175.24.41]:53270 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238981AbhDPHXc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Apr 2021 03:23:32 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lXIol-0007qW-03; Fri, 16 Apr 2021 09:23:07 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6D99EC04CD; Fri, 16 Apr 2021 09:22:57 +0200 (CEST)
Date:   Fri, 16 Apr 2021 09:22:57 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix strnlen_user access check
Message-ID: <20210416072257.GC5371@alpha.franken.de>
References: <20210415212640.14346-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415212640.14346-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 15, 2021 at 11:26:40PM +0200, Thomas Bogendoerfer wrote:
> Commit 04324f44cb69 ("MIPS: Remove get_fs/set_fs") changed the access_ok
> for strnlen_user to check the whole range, which broke some callers
> of strndup_user(). Restore the old behaviour and just check the first byte.
> 
> Fixes: 04324f44cb69 ("MIPS: Remove get_fs/set_fs")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/uaccess.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
