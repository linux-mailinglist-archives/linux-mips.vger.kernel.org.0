Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11AA224DC56
	for <lists+linux-mips@lfdr.de>; Fri, 21 Aug 2020 18:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbgHUQ7q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Aug 2020 12:59:46 -0400
Received: from elvis.franken.de ([193.175.24.41]:54992 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728146AbgHUQ5m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Aug 2020 12:57:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k9AME-0003dt-01; Fri, 21 Aug 2020 18:57:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C8E5FC0D90; Fri, 21 Aug 2020 18:57:04 +0200 (CEST)
Date:   Fri, 21 Aug 2020 18:57:04 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] Fix cacheinfo
Message-ID: <20200821165704.GB15948@alpha.franken.de>
References: <20200820004253.3418-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820004253.3418-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 20, 2020 at 08:42:48AM +0800, Jiaxun Yang wrote:
> This is causing lscpu segfault. So probably worthy to
> include it as a part of mips-fixes. 
> 
> Jiaxun Yang (2):
>   MIPS: cacheinfo: Add missing VCache
>   MIPS: Loongson64: Set cluster for cores

I've only received one patch and there I can't see why lscpu will
crash since it's just missing information.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
