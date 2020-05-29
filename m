Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D26E1E7B44
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 13:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgE2LJe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 07:09:34 -0400
Received: from elvis.franken.de ([193.175.24.41]:43317 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgE2LJe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 07:09:34 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jectH-0002Kz-00; Fri, 29 May 2020 13:09:31 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 457A6C05C3; Fri, 29 May 2020 13:09:13 +0200 (CEST)
Date:   Fri, 29 May 2020 13:09:13 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     YunQiang Su <syq@debian.org>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH] mips: add o32_fp64 boot param to disable FP64 support
Message-ID: <20200529110913.GA11310@alpha.franken.de>
References: <20200528231628.120171-1-syq@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528231628.120171-1-syq@debian.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 29, 2020 at 07:16:28AM +0800, YunQiang Su wrote:
> When build with CONFIG_O32_FP64_SUPPORTS, even all of the userland
> is FPXX, we cannot run any FP32 binary.

I don't understand what this means. Can you explain what the problem
is ? 

> Then we need to disable FP64 support temporarily with a boot param:
>    o32_fp64=no/disable

A boot parameter should IMHO be last resort. But I need to understand
the problem first to think about different ways to solve this.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
