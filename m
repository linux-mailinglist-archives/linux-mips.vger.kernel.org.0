Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5427F232127
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 17:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgG2PEN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 11:04:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:38802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgG2PEN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Jul 2020 11:04:13 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 999F8207E8;
        Wed, 29 Jul 2020 15:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596035052;
        bh=HXbkvV4RCfAL2LTwfNBgI3o/mlDFtdZqhOUncw/qWFQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=0KkLsZf4TD7z+yFyJGNWLfNRwoRkqsrTW5Bd3k6F0LHoPKbEcNT5Kn0hIt1I/Kswb
         iD4zyOjKOlHg3pBiheqpk9wwi565ZLfDD4j1/CInSp5mNFjnK6Azbg8sIz7q54Fi+r
         FapuRMfahpBcmPsHFAg715aue0pjDaQLsnED3dDg=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1k0nco-00FyOW-VO; Wed, 29 Jul 2020 16:04:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 29 Jul 2020 16:04:10 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>
Subject: Re: [PATCH 3/5] irqchip: loongson-liointc: Fix misuse of
 gc->mask_cache
In-Reply-To: <ccd646fd-9df6-517f-0cee-4672e8a052f8@flygoat.com>
References: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
 <1596000130-8689-3-git-send-email-chenhc@lemote.com>
 <ccd646fd-9df6-517f-0cee-4672e8a052f8@flygoat.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <2c8f7e82a5a878c774379f386462e802@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jiaxun.yang@flygoat.com, chenhc@lemote.com, tsbogend@alpha.franken.de, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, linux-mips@vger.kernel.org, zhangfx@lemote.com, chenhuacai@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Huacai,

On 2020-07-29 06:26, Jiaxun Yang wrote:
> 在 2020/7/29 13:22, Huacai Chen 写道:
>> In gc->mask_cache bits, 1 means enabled and 0 means disabled, but in 
>> the
>> loongson-liointc driver mask_cache is misused by reverting its 
>> meaning.
>> This patch fix the bug and update the comments as well.
> 
> Suprisingly it even works with the wrong usage of mask_cache.
> Thanks for catching that!
> 
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Does any of this series need to be backported to a previous revision
of the kernel? If so, please provide Fixes: tags for the relevant
patches, and potentially a Cc: stable if required.

Also, please add a cover letter when posting such a series,
as it makes it easier to track.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
