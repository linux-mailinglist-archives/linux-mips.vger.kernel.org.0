Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 533921BFFC1
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 17:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgD3PLh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 11:11:37 -0400
Received: from elvis.franken.de ([193.175.24.41]:33620 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726630AbgD3PLh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 11:11:37 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jUAqa-0005Uk-03; Thu, 30 Apr 2020 17:11:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6C035C0360; Thu, 30 Apr 2020 17:11:20 +0200 (CEST)
Date:   Thu, 30 Apr 2020 17:11:20 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, chenhc@lemote.com
Subject: Re: [PATCH] MIPS: Loongson64: Probe CPU features via CPUCFG
Message-ID: <20200430151120.GD17822@alpha.franken.de>
References: <20200430031346.2591394-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430031346.2591394-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 30, 2020 at 11:13:46AM +0800, Jiaxun Yang wrote:
> CPUCFG is a Loongson self-defined instruction used to mark CPU
> features for Loongson processors started from Loongson-3A4000.
> 
> Slightly adjust cpu_probe_loongson function as well. Remove features
> that already probed via decode_configs in processor's PRID case
> and add a comment about TLBINV.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/kernel/cpu-probe.c | 45 +++++++++++++++++++++++++++++-------
>  1 file changed, 37 insertions(+), 8 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
