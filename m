Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AFB51D4710
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 09:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgEOHaF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 03:30:05 -0400
Received: from elvis.franken.de ([193.175.24.41]:54055 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbgEOHaE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 03:30:04 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jZUnC-0007EJ-02; Fri, 15 May 2020 09:30:02 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CF295C04A0; Fri, 15 May 2020 09:22:31 +0200 (CEST)
Date:   Fri, 15 May 2020 09:22:31 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix builds for VR41xx platforms
Message-ID: <20200515072231.GC6722@alpha.franken.de>
References: <20200514111235.58459-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514111235.58459-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 14, 2020 at 01:12:34PM +0200, Thomas Bogendoerfer wrote:
> Changing inclusion of Platform files, broke VR41xx platforms. Add Makefile
> to vr41xx directory and traverse subdirs from it.
> 
> Fixes: 26bff9eb49201aeb ("MIPS: Only include the platformfile needed")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/vr41xx/Makefile | 5 +++++
>  arch/mips/vr41xx/Platform | 3 ---
>  2 files changed, 5 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
