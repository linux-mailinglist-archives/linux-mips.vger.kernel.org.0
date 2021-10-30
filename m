Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B22440B8F
	for <lists+linux-mips@lfdr.de>; Sat, 30 Oct 2021 22:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbhJ3UGM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 30 Oct 2021 16:06:12 -0400
Received: from aposti.net ([89.234.176.197]:37756 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229782AbhJ3UGL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 30 Oct 2021 16:06:11 -0400
Date:   Sat, 30 Oct 2021 21:03:30 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] gpu/drm: ingenic: Remove bogus register write
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Christophe Branchereau <cbranchereau@gmail.com>,
        list@opendingux.net, kernel test robot <lkp@intel.com>
Message-Id: <UP3T1R.6J62YIN55WCQ3@crapouillou.net>
In-Reply-To: <YX2T0dbyaYkIbUgs@ravnborg.org>
References: <20211030100032.42066-1-paul@crapouillou.net>
        <YX2T0dbyaYkIbUgs@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le sam., oct. 30 2021 at 20:49:53 +0200, Sam Ravnborg 
<sam@ravnborg.org> a écrit :
> Hi Paul,
> 
> On Sat, Oct 30, 2021 at 11:00:32AM +0100, Paul Cercueil wrote:
>>  Commit 1bdb542da736 ("drm/ingenic: Simplify code by using hwdescs
>>  array") caused the dma_hwdesc_phys_f{0,1} variables to be used while
>>  uninitialized in a mmio register write, which most certainly broke 
>> the
>>  ingenic-drm driver.
>> 
>>  However, the very same patchset also submitted commit 6055466203df
>>  ("drm/ingenic: Upload palette before frame"), which restored a 
>> correct
>>  behaviour by doing the register writes in a different place in the 
>> code.
>> 
>>  What's left of this, is just to remove the bogus register writes in 
>> the
>>  probe function.
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  Reported-by: kernel test robot <lkp@intel.com>
> 
> Thank you lkp...
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Pushed to drm-misc-next.

Thanks!
-Paul


