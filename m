Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 881A1192BAD
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 16:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727544AbgCYPCH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 11:02:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:53030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727439AbgCYPCH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 11:02:07 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB3EF20714;
        Wed, 25 Mar 2020 15:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585148526;
        bh=fF2rB54wTZiOsnEHo8QWt/isK5kp8gXGqoDOYM1FIdk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nnZ+wUAJV5/U3z/5HD13lRbXV/I4c5wu6z7Un5NNvcWBKTGfH7Jb4d6zRIAhYFT4t
         9hVEpLNoEoZrF4f77uWM0uwiJYoZ1PfqIu6kDLIF7NTeXzd7B/u8gTL27xjUoom4PK
         GE9sFJ3e7s4ncrfSPZrjI+iblUnny6FIhroMdNaU=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jH7Xg-00FbN6-6K; Wed, 25 Mar 2020 15:02:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 25 Mar 2020 15:02:04 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 06/11] irqchip: mips-cpu: Convert to simple domain
In-Reply-To: <39CF835E-D1D9-4B52-ABDC-BDB17B650936@flygoat.com>
References: <20200325035537.156911-1-jiaxun.yang@flygoat.com>
 <20200325035537.156911-7-jiaxun.yang@flygoat.com>
 <20200325123742.GA9911@alpha.franken.de>
 <a69f727d37daac6e20ac08de022245b1@kernel.org>
 <C4892878-8463-448D-897B-5F2C56F5A340@flygoat.com>
 <5eb9ce9ea665ee32da40779f00fc9b37@kernel.org>
 <4BB367D3-B8AD-47B6-ACC2-30752137BC1B@flygoat.com>
 <c4520c4b0b0eaaba5fdbaebfce7b4460@kernel.org>
 <39CF835E-D1D9-4B52-ABDC-BDB17B650936@flygoat.com>
Message-ID: <0dcdeef75048c7dfdc72554c41714673@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jiaxun.yang@flygoat.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, chenhc@lemote.com, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, mchehab+samsung@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, andriy.shevchenko@linux.intel.com, allison@lohutok.net, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-03-25 14:31, Jiaxun Yang wrote:
> 于 2020年3月25日 GMT+08:00 下午10:15:16, Marc Zyngier <maz@kernel.org> 写到:
>> On 2020-03-25 13:59, Jiaxun Yang wrote:
>> 
>> [...]
>> 
>>>>> So probably we can use legacy domain when  MIPS IRQ BASE is in the
>>>>> range of legacy IRQ
>>>>> and switch to simple domain when it's not in that range?
>>>> 
>>>> No, see below.
>>>> 
>>>>> Here in Loongson systems IRQ 0-15 is occupied by I8259 so I did
>> this
>>>>> hack.
>>>> 
>>>> Well, if you have to consider which Linux IRQ gets assigned,
>>>> then your platform is definitely not ready for non-legacy
>>>> irqdomains. Just stick to legacy for now until you have removed
>>>> all the code that knows the hwirq mapping.
>>> 
>>> Thanks.
>>> 
>>> So I have to allocate irq_desc here in driver manually?
>> 
>> No, you are probably better off just dropping this patch, as MIPS
>> doesn't seem to be ready for a wholesale switch to virtual interrupts.
> 
> It can't work without this patch.
> 
> Legacy domain require IRQ number within 0-15
> however it's already occupied by i8259 or "HTPIC" driver.
> 
> Previously Loongson even didn't enable IRQ domain so it's not a 
> problem.

Then your platform is breaking some fundamental assumption that the rest
of the MIPS architecture seem to rely on. You could test for the base
IRQ being 0 and create a legacy domain in this case, but that's really
a horrible hack.

I'm pretty worried about having to address this just 4 days away from
the merge window TBH, as this code hasn't been in -next at all.

That's really Thomas' call, but I'm not very enthusiastic.

         M.
-- 
Jazz is not dead. It just smells funny...
