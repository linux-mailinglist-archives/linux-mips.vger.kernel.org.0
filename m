Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3097F1D2938
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 09:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgENH5L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 03:57:11 -0400
Received: from elvis.franken.de ([193.175.24.41]:53042 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbgENH5K (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 03:57:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jZ8js-0005U5-03; Thu, 14 May 2020 09:57:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BD202C0493; Thu, 14 May 2020 09:43:56 +0200 (CEST)
Date:   Thu, 14 May 2020 09:43:56 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Zou Wei <zou_wei@huawei.com>
Cc:     linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] KVM: MIPS/VZ: Remove unneeded semicolon
Message-ID: <20200514074356.GD5880@alpha.franken.de>
References: <1588216490-60282-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588216490-60282-1-git-send-email-zou_wei@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 30, 2020 at 11:14:50AM +0800, Zou Wei wrote:
> Fixes coccicheck warnings:
> 
> arch/mips/kvm/vz.c:1186:4-5: Unneeded semicolon
> arch/mips/kvm/vz.c:1195:3-4: Unneeded semicolon
> arch/mips/kvm/vz.c:1949:3-4: Unneeded semicolon
> arch/mips/kvm/vz.c:1121:2-3: Unneeded semicolon
> arch/mips/kvm/vz.c:2188:3-4: Unneeded semicolon
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  arch/mips/kvm/vz.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
