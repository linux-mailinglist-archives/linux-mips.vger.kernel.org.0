Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F02C1B91E2
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 18:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgDZQzB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 12:55:01 -0400
Received: from elvis.franken.de ([193.175.24.41]:56069 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgDZQzA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 12:55:00 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jSkYM-00023Z-00; Sun, 26 Apr 2020 18:54:50 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 41C58C0323; Sun, 26 Apr 2020 18:43:15 +0200 (CEST)
Date:   Sun, 26 Apr 2020 18:43:15 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        Paul Cercueil <paul@crapouillou.net>,
        =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, YunQiang Su <syq@debian.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Kernel: Identify Loongson-2K processors
Message-ID: <20200426164315.GA9832@alpha.franken.de>
References: <20200422144349.1252775-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422144349.1252775-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 22, 2020 at 10:43:44PM +0800, Jiaxun Yang wrote:
> Loongson-2K (Loongson64 Reduced) is a family of SoC shipped with
> gs264e core.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/cpu.h  |  4 ++++
>  arch/mips/kernel/cpu-probe.c | 19 ++++++++++++++++++-
>  arch/mips/kernel/idle.c      |  3 ++-
>  arch/mips/mm/c-r4k.c         | 12 +++++++++---
>  4 files changed, 33 insertions(+), 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
