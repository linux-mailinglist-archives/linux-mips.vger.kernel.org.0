Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D4127736E
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 16:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgIXN75 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 09:59:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:55133 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728148AbgIXN7Y (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 24 Sep 2020 09:59:24 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kLRmK-0005vQ-01; Thu, 24 Sep 2020 15:59:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D22E6C101A; Thu, 24 Sep 2020 15:53:53 +0200 (CEST)
Date:   Thu, 24 Sep 2020 15:53:53 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>
Subject: Re: [PATCH V7 2/3] MIPS: Loongson-3: Enable COP2 usage in kernel
Message-ID: <20200924135353.GB13973@alpha.franken.de>
References: <1600679548-29154-1-git-send-email-chenhc@lemote.com>
 <1600679548-29154-2-git-send-email-chenhc@lemote.com>
 <20200921121554.GA8642@alpha.franken.de>
 <177ADF0C-1633-449F-B589-712EA4857E79@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177ADF0C-1633-449F-B589-712EA4857E79@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 23, 2020 at 05:44:02PM +0800, Jiaxun Yang wrote:
> 于 2020年9月21日 GMT+08:00 下午8:15:54, Thomas Bogendoerfer <tsbogend@alpha.franken.de> 写到:
> >thanks for doing this, I'm going to apply this later.
> >
> >This remind of another question, what about loongson2ef ? I'm getting
> >kbuild failure because of enabled loongson-mmi mails. Are we are missing
> >something like cflags-y += $(call cc-option,-mno-loongson-mmi) in Platform
> >file ? Who is taking care of loongson2ef ?
> 
> I'll send a patch later. Sorry for the inconvenience.

excellent, thank you.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
