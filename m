Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85987D10F6
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 16:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729644AbfJIONQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 10:13:16 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:38418 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbfJIONM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Oct 2019 10:13:12 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23993660AbfJIONJq54nj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Oct 2019 16:13:09 +0200
Date:   Wed, 9 Oct 2019 15:13:09 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Paul Burton <paul.burton@mips.com>
cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: Re: [PATCH 1/4] MIPS: cmdline: Remove
 CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND
In-Reply-To: <alpine.LFD.2.21.1910091440050.25653@eddie.linux-mips.org>
Message-ID: <alpine.LFD.2.21.1910091501580.25653@eddie.linux-mips.org>
References: <20191007221951.1889661-1-paul.burton@mips.com> <alpine.LFD.2.21.1910091440050.25653@eddie.linux-mips.org>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 9 Oct 2019, Maciej W. Rozycki wrote:

> > CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND is not selected by any of our
> > defconfigs, so remove it to simplify the messy command line logic in
> > arch_mem_init() a little.
> 
>  That sounds like a poor argument for a functional regression to me.  I 
> have the option enabled in several configs I have been using just to be 
> able to temporarily override any built-in parameters with ones typed from 
> the console monitor's prompt.  Is it my mistake that I haven't put it in a 
> defconfig?

 Elaborating, there's IMO little sense to set MIPS_CMDLINE_BUILTIN_EXTEND 
in a defconfig, because there's usually no default command line to set 
there in the first place, as this will be installation-specific.  Ergo I 
highly doubt the absence of the setting across the board is due to nobody 
(except for myself) using it.

 Therefore:

Nacked-by: Maciej W. Rozycki <macro@linux-mips.org>

 NB DECstation systems use a DS1287 or a similar RTC/NVRAM chip to hold 
configuration and space is limited there.  Up to 37 of kernel command line 
characters can be permanently stored, fewer on some systems, and used for 
automatic boot.  Conversely when typed at the console monitor prompt there 
is no (known to me) limitation as to the length of the kernel command line 
requested.

 Therefore a kernel configured for those systems will normally have 
several parameters embedded within itself while letting the non-volatile 
storage or user input extend and/or selectively override them, e.g. for a 
different root device or whatever.  However, as I noted above, there's no 
reasonable universal default command line to use with a defconfig, just 
as you could not come up with one for say an x86 PC.

 I hope this clarifies the matter.

  Maciej
