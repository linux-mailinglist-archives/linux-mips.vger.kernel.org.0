Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7071BBC79
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 13:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgD1LeJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 07:34:09 -0400
Received: from elvis.franken.de ([193.175.24.41]:58663 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbgD1LeJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 07:34:09 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jTOV6-0004MF-00; Tue, 28 Apr 2020 13:34:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 56D94C0334; Tue, 28 Apr 2020 13:16:38 +0200 (CEST)
Date:   Tue, 28 Apr 2020 13:16:38 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     rric@kernel.org, oprofile-list@lists.sf.net,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: oprofile: remove unneeded semicolon in common.c
Message-ID: <20200428111638.GA11443@alpha.franken.de>
References: <20200428063254.33337-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428063254.33337-1-yanaijie@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 28, 2020 at 02:32:54PM +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> arch/mips/oprofile/common.c:113:2-3: Unneeded semicolon
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  arch/mips/oprofile/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
