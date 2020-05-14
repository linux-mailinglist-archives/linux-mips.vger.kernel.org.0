Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839AE1D293B
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 09:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgENH52 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 03:57:28 -0400
Received: from elvis.franken.de ([193.175.24.41]:53057 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgENH5L (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 03:57:11 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jZ8js-0005U5-02; Thu, 14 May 2020 09:57:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 30242C0493; Thu, 14 May 2020 09:43:37 +0200 (CEST)
Date:   Thu, 14 May 2020 09:43:37 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     pbonzini@redhat.com, sean.j.christopherson@intel.com,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: MIPS: use true,false for bool variable
Message-ID: <20200514074337.GC5880@alpha.franken.de>
References: <20200429140935.7993-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429140935.7993-1-yanaijie@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 29, 2020 at 10:09:35PM +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> arch/mips/kvm/mips.c:82:1-28: WARNING: Assignment of 0/1 to bool
> variable
> arch/mips/kvm/mips.c:88:1-28: WARNING: Assignment of 0/1 to bool
> variable
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  arch/mips/kvm/mips.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
