Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96A625BD3B
	for <lists+linux-mips@lfdr.de>; Thu,  3 Sep 2020 10:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728298AbgICI1X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Sep 2020 04:27:23 -0400
Received: from elvis.franken.de ([193.175.24.41]:50522 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727857AbgICI1M (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Sep 2020 04:27:12 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kDkaL-0000I1-07; Thu, 03 Sep 2020 10:27:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4DDD5C0E86; Thu,  3 Sep 2020 10:24:40 +0200 (CEST)
Date:   Thu, 3 Sep 2020 10:24:40 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Davidlohr Bueso <dave@stgolabs.net>
Cc:     oleg@redhat.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Davidlohr Bueso <dbueso@suse.de>
Subject: Re: [PATCH] MIPS: Use rcu to lookup a task in
 mipsmt_sys_sched_setaffinity()
Message-ID: <20200903082440.GH6220@alpha.franken.de>
References: <20200831201402.2837-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831201402.2837-1-dave@stgolabs.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 31, 2020 at 01:14:02PM -0700, Davidlohr Bueso wrote:
> The call simply looks up the corresponding task (without iterating
> the tasklist), which is safe under rcu instead of the tasklist_lock.
> In addition, the setaffinity counter part already does this.
> 
> Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
> ---
>  arch/mips/kernel/mips-mt-fpaff.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
