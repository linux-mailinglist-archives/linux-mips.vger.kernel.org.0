Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABCE1B02EA
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 09:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgDTH1n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 03:27:43 -0400
Received: from elvis.franken.de ([193.175.24.41]:47917 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbgDTH1m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 03:27:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jQQqA-00070o-00; Mon, 20 Apr 2020 09:27:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 20AE4C0170; Mon, 20 Apr 2020 09:02:05 +0200 (CEST)
Date:   Mon, 20 Apr 2020 09:02:05 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     afzal.mohd.ma@gmail.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH] MIPS: Netlogic: remove unneeded semicolon in
 fmn_message_handler()
Message-ID: <20200420070205.GA4627@alpha.franken.de>
References: <20200418081834.41152-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200418081834.41152-1-yanaijie@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Apr 18, 2020 at 04:18:34PM +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> arch/mips/netlogic/xlr/fmn.c:106:2-3: Unneeded semicolon
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  arch/mips/netlogic/xlr/fmn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
