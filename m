Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A942858DF
	for <lists+linux-mips@lfdr.de>; Wed,  7 Oct 2020 08:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgJGG45 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Oct 2020 02:56:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:49477 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726041AbgJGG45 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 7 Oct 2020 02:56:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kQ3Ng-0007IV-00; Wed, 07 Oct 2020 08:56:56 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E3D9CC10EF; Wed,  7 Oct 2020 08:44:58 +0200 (CEST)
Date:   Wed, 7 Oct 2020 08:44:58 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhuacai@gmail.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: pgtable: Remove used PAGE_USERIO define
Message-ID: <20201007064458.GA4867@alpha.franken.de>
References: <20201005112846.66430-1-tsbogend@alpha.franken.de>
 <20201005112846.66430-2-tsbogend@alpha.franken.de>
 <20201006113131.GC8673@alpha.franken.de>
 <CAAhV-H73w2KgB=kTORzF4RWMz5L_z7JWVG3ZUGs9Et68NhFWJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H73w2KgB=kTORzF4RWMz5L_z7JWVG3ZUGs9Et68NhFWJg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 07, 2020 at 10:11:46AM +0800, Huacai Chen wrote:
> s/used/unused/g, but it is too late, I'm sorry.

d'oh, I should probably wait a day longer before applying. Thank you for
your feedback.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
