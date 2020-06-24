Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8460220728D
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 13:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403795AbgFXLwJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 07:52:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:33032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403794AbgFXLwH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 07:52:07 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C0EC220857;
        Wed, 24 Jun 2020 11:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592999526;
        bh=ckU0SB6EAkHjRga7NI2sunQSh/3vEnohN5m6AxLYtB4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=M0tybKRM3p/3jC/ZQNANbwlhQUEDDfPjouRzfIRTZxRWLsVM9CNh3jkxFpGVxgE7g
         jHkjvsftEczEcXcXJHqKLkWHEhmwGFQOBPfTpDCMnvYdBNhRbwytPGfhmvRM+lgYz8
         Tiw/YACOzbVnfwOoecK3gbakMBWm66mPQyuuFZOk=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jo3wj-0062oL-BH; Wed, 24 Jun 2020 12:52:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 24 Jun 2020 12:52:05 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v3 00/14 RESEND] irqchip: Fix potential resource leaks
In-Reply-To: <73b80d45-1300-4dc3-a0d6-2333b79743b2@loongson.cn>
References: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
 <e419a2acea6c1977eaef5d049d607749@kernel.org>
 <a10e0f68-7de8-8540-f27e-17fd52216977@loongson.cn>
 <73b80d45-1300-4dc3-a0d6-2333b79743b2@loongson.cn>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <87817a29a1e2b0ca580108ffb86e1d05@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: yangtiezhu@loongson.cn, tglx@linutronix.de, jason@lakedaemon.net, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, lixuefeng@loongson.cn
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-06-24 12:48, Tiezhu Yang wrote:
> On 06/24/2020 05:02 PM, Tiezhu Yang wrote:
>> On 06/24/2020 04:30 PM, Marc Zyngier wrote:
>>> On 2020-06-24 08:44, Tiezhu Yang wrote:
>>>> [git send-email failed due to too many commands,
>>>>  so only cc the major related email and resend it,
>>>>  sorry for that]
>>> 
>>> This is becoming majorly annoying. Please fix your git setup
>>> *before* dumping 57 emails for just 14 patches. You have done
>>> the same thing yesterday, and I would hope you learned from your
>>> mistakes.
>>> 
>>> Also, do not repost a series more than once per week. You have
>>> already exceeded your quota by quite a margin.
>> 
>> I am very sorry for that.
>> I will wait for some days to resend this patch series.
> 
> Hi Marc,
> 
> Since each patch of this series is independent, in order to avoid
> git send-email failed, I prefer to resend each patch individually
> and cc more related maintainer or supporter to review.

Don't do that. Just fix your GIT setup.

> If you do not mind, I will resend each patch individually next week.
> Sorry for the noisy and inconvenience.

They are perfectly fine as a series. As the person that will ultimately
merge these patches, I don't want to go and fish individual patches,
which is the best way to miss some.

         M.
-- 
Jazz is not dead. It just smells funny...
