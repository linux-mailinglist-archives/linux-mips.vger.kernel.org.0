Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B646194373
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 16:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgCZPqj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 11:46:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:53026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727835AbgCZPqj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 11:46:39 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E630A20737;
        Thu, 26 Mar 2020 15:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585237599;
        bh=NO2J3j8LSFqbndQOJNWzjQOGXWSDqd3mS+tKyOX/KWg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dpb6ZHMnaKP932SEGca49jpCUdvCbMfBAdMX+Xd+4YWSlyngN5wB7y+gKIhb5GAz/
         87tIIm2WVDoNLLb9+NF6xO69F63wsGegUJNb1QAKSGOo/qjGIn/vLOM/T5RaTFjpRP
         6JszulSKuG/7iFWudw8B6FwCPhQVLRtnxguoA7Jg=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jHUiL-00Fv7I-9c; Thu, 26 Mar 2020 15:46:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 26 Mar 2020 15:46:37 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        chenhc@lemote.com
Subject: Re: [RFC PATCH 0/6] MIPS: Handle CPU IRQ in domain's way
In-Reply-To: <20200326153849.GA14951@alpha.franken.de>
References: <20200326061704.387483-1-jiaxun.yang@flygoat.com>
 <20200326153849.GA14951@alpha.franken.de>
Message-ID: <7c179c74ec54a5a00c8cc9227f094868@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: tsbogend@alpha.franken.de, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, chenhc@lemote.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-03-26 15:38, Thomas Bogendoerfer wrote:
> On Thu, Mar 26, 2020 at 02:16:56PM +0800, Jiaxun Yang wrote:
>> In [1], we discussed about why MIPS CPU IRQ doesn't fit simple IRQ 
>> domain.
>> I felt it's time to remove this barrier and "modernize" the whole 
>> flow.
>> 
>> This set is simply a proof of concept of removing the whole 
>> MIPS_CPU_IRQ_BASE
>> and use the irq_domain's way.
>> 
>> Currently only Loongson64 and ip22 are adapted for testing purpose,
>> if everybody is happy with it, then I'll take a look at more 
>> platforms.
>> 
>> Btw: Thomas, are you still willing to drop some platforms in 5.8?
> 
> yes, I didn't receive feedback to not drop them. So after merge
> window is over I'm going to post a patch to remove LASAT, NEC_MARKEINS
> and PMC_MSP.
> 
>>  arch/mips/include/asm/irq_cpu.h      | 19 +++++++++++++++++-
>>  arch/mips/include/asm/sgi/ip22.h     | 30 
>> ++++++++++++++--------------
>>  arch/mips/kernel/cevt-r4k.c          |  2 +-
>>  arch/mips/kernel/perf_event_mipsxx.c |  3 ++-
>>  arch/mips/kernel/rtlx-mt.c           |  7 +++++--
>>  arch/mips/loongson64/smp.c           |  6 ++++--
>>  arch/mips/sgi-ip22/ip22-int.c        | 14 ++++++++-----
>>  drivers/irqchip/irq-mips-cpu.c       | 22 ++++++++++++++------
>>  8 files changed, 70 insertions(+), 33 deletions(-)
> 
> Adding more code for doing the same thing doesn't sound like the
> best approach. Is there a big need for that change (like someone
> getting rid of irq_domain_add_legacy) ?

I have no plan to remove the API overnight, but if you guys start
modernizing MIPS, I could be tempted...

         M.
-- 
Jazz is not dead. It just smells funny...
