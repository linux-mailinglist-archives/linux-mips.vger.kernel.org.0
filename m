Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDE012F7E82
	for <lists+linux-mips@lfdr.de>; Fri, 15 Jan 2021 15:48:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730727AbhAOOru (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Jan 2021 09:47:50 -0500
Received: from elvis.franken.de ([193.175.24.41]:53919 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbhAOOru (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Jan 2021 09:47:50 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l0QNY-0006aU-00; Fri, 15 Jan 2021 15:47:08 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B55EBC0329; Fri, 15 Jan 2021 15:37:45 +0100 (CET)
Date:   Fri, 15 Jan 2021 15:37:45 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Lauri Kasanen <cand@gmx.com>, linux-mips@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] fbdev/simplefb: Add the N64's mode
Message-ID: <20210115143745.GA15166@alpha.franken.de>
References: <20210115160102.cf4c85db9f815758716f086f@gmx.com>
 <aeb93d4a-d7c0-5e0d-4de4-4a70f85cb202@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeb93d4a-d7c0-5e0d-4de4-4a70f85cb202@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 15, 2021 at 03:06:13PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 1/15/21 3:01 PM, Lauri Kasanen wrote:
> > Signed-off-by: Lauri Kasanen <cand@gmx.com>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> What is the plan for merging this patch? I've another simplefb patch which
> I need/plan to push to drm-misc-nexy soon, shall I also push this one then?
> 
> Or is there some plan to merge the entire series this used to be part of
> in one go?

this looks independant enough to me, so I'd appreciate, if you take it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
