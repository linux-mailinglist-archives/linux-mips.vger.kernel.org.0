Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93F33182B7B
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2020 09:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgCLIkG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Mar 2020 04:40:06 -0400
Received: from elvis.franken.de ([193.175.24.41]:35914 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725980AbgCLIkG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Mar 2020 04:40:06 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jCJNl-0004cr-00; Thu, 12 Mar 2020 09:39:57 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id AE512C103F; Thu, 12 Mar 2020 09:39:43 +0100 (CET)
Date:   Thu, 12 Mar 2020 09:39:43 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        kbuild-all@lists.01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "sparclinux@vger.kernel.org, David S . Miller" <davem@davemloft.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Ilie Halip <ilie.halip@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] kbuild: link lib-y objects to vmlinux forcibly
 when CONFIG_MODULES=y
Message-ID: <20200312083943.GA7278@alpha.franken.de>
References: <20200311223725.27662-2-masahiroy@kernel.org>
 <202003121230.lys3M8E8%lkp@intel.com>
 <CAK7LNARwR5X2C_VzK_3RZo+30Cu3uPuiw-rFUut1j8azLhbxAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARwR5X2C_VzK_3RZo+30Cu3uPuiw-rFUut1j8azLhbxAA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 12, 2020 at 03:12:28PM +0900, Masahiro Yamada wrote:
> I got the following report from 0-day bot.
> Please advise me how to fix it.
> 
> 
> I am not sure how multi-platform works in MIPS.
> 
> The cavium-octeon platform has its own implementation
> of various functions.
> 
> So, vmlinux links different library routines
> depending on whether CONFIG_CAVIUM_OCTEON_SOC, correct?

for cavium memcpy is directly linked in via octeon-memcpy.o, while for
every other platform it's coming from lib/lib.a(memcpy.o).

What have you changed, that this doesn't work anymore ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
