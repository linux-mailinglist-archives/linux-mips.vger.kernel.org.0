Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF70E2501BC
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 18:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgHXQJf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 12:09:35 -0400
Received: from elvis.franken.de ([193.175.24.41]:60794 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726854AbgHXQJd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 12:09:33 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kAF2I-0000tt-00; Mon, 24 Aug 2020 18:09:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 29165C0DBF; Mon, 24 Aug 2020 18:08:58 +0200 (CEST)
Date:   Mon, 24 Aug 2020 18:08:58 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Paravirt: remove remaining pieces of paravirt
Message-ID: <20200824160858.GA7827@alpha.franken.de>
References: <20200822080251.65555-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200822080251.65555-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Aug 22, 2020 at 10:02:51AM +0200, Thomas Bogendoerfer wrote:
> Commit 35546aeede8e ("MIPS: Retire kvm paravirt") removed
> kvm paravirt support, but missed arch/mips/include/mach-paravirt.
> Remove it as well.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  .../asm/mach-paravirt/cpu-feature-overrides.h      | 35 ---------------
>  arch/mips/include/asm/mach-paravirt/irq.h          | 19 --------
>  .../include/asm/mach-paravirt/kernel-entry-init.h  | 52 ----------------------

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
