Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99D31E1F27
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 11:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728750AbgEZJxS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 05:53:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:40898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728746AbgEZJxR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 05:53:17 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 25B0D2073B;
        Tue, 26 May 2020 09:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590486797;
        bh=+nbXCDci9c5Fz3kvlyGeacA/q0QA+E4niOgPuLj7CM4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=zeXlre+g6yaA77szQ0hvBkF7z6OsT8VwbAuS1QToye0TIqurfgSCSdDnhEPa9b9uG
         fvmCTu4aq2KMiiO+XbrjB67fD8bFYolR5+XfaBSI46cJtxMRCNqjuQisWzpRthLVsH
         4G1Tyed8n9fqS73Jtzz9lFCd+X2Sq04ea173yB4I=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jdWGp-00FLr4-Hr; Tue, 26 May 2020 10:53:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 26 May 2020 10:53:15 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: interrupt-controller: Add Loongson
 HTVEC
In-Reply-To: <20200526172653.0a19f375@halation.net.flygoat.com>
References: <20200427060551.1372591-1-jiaxun.yang@flygoat.com>
 <20200516082912.3673033-1-jiaxun.yang@flygoat.com>
 <20200516082912.3673033-2-jiaxun.yang@flygoat.com>
 <87v9kkz5kl.wl-maz@kernel.org>
 <20200526172653.0a19f375@halation.net.flygoat.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <98643a72747e4896b78cd4d583d2d3f9@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jiaxun.yang@flygoat.com, robh+dt@kernel.org, tglx@linutronix.de, jason@lakedaemon.net, chenhc@lemote.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-05-26 10:26, Jiaxun Yang wrote:
> On Mon, 25 May 2020 11:12:26 +0100
> Marc Zyngier <maz@kernel.org> wrote:
> 
>> On Sat, 16 May 2020 09:29:02 +0100,
>> Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>> >
>> > Add binding for Loongson-3 HyperTransport Interrupt Vector
>> > Controller.
>> >
>> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> > --
>> > v4: Drop ref, '|', add additionalProperties, fix example
>> 
>> Rob, do you have any input on this?
> 
> Oops, looks like I was in-reply into wrong patch topic for this patch,
> should I resend this series into correct thread?

No, this series is fine as it is. TBH, your practice of sending
a series in reply to the previous version is not that useful
(I personally find it very annoying).

It would also be a big improvement if you sent a cover letter
with your patches (using --cover-letter when generating the patches).

I'll wait for Rob to comment on this patch as well as patch #4.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
