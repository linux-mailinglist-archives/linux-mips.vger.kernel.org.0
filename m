Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68670480895
	for <lists+linux-mips@lfdr.de>; Tue, 28 Dec 2021 11:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232906AbhL1K6O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Dec 2021 05:58:14 -0500
Received: from www.linux-watchdog.org ([185.87.125.42]:43990 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236349AbhL1K6N (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Dec 2021 05:58:13 -0500
X-Greylist: delayed 538 seconds by postgrey-1.27 at vger.kernel.org; Tue, 28 Dec 2021 05:58:12 EST
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id ACFC4409CD; Tue, 28 Dec 2021 10:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org ACFC4409CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1640683300;
        bh=w8aJnqJpyuqC/xW+n2cbZi4xCrodj+BMPfpwrAepq8g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E6A+Zft6yL02VjO/ZAA2eLOd46aBp6wp8jxGolGB+5zu6ZcrhRd4Xe3HZrnPvyxSt
         I5vkXxHxn1NLzFoHWWt3nD8cUl0m2IkjVf2sfRPEJViD6vUYm8MlCPq4MNutT6BroT
         YZwZlHFqYY3P/37WfLY+MTJSM15Gv8BC9L4ujEFs=
Date:   Tue, 28 Dec 2021 10:21:40 +0100
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
Message-ID: <20211228092140.GA26632@www.linux-watchdog.org>
References: <f5745952-9e3c-ed7a-cced-ce42d3da2276@gmail.com>
 <Ya5ctkIU+jNzDfBc@google.com>
 <f4af4971-7047-80c9-69ae-e6587979ecd5@roeck-us.net>
 <e1fa1683-a0a6-8ee0-9da5-8e97dd9c820a@gmail.com>
 <432664af-5660-aaad-bf75-81e4d61cb078@roeck-us.net>
 <46a88b40-6d92-727c-7adc-5723921d08e3@gmail.com>
 <20211206195115.GC3759192@roeck-us.net>
 <Ya8xhUR5GbTxVE8w@google.com>
 <a86d5998-8d84-7afe-e34e-a632aa890683@roeck-us.net>
 <Ya+BX1X7/YqmfCU8@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ya+BX1X7/YqmfCU8@google.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Lee,

> On Tue, 07 Dec 2021, Guenter Roeck wrote:
> 
> > On 12/7/21 2:03 AM, Lee Jones wrote:
> > [ ... ]
> > > > It sounded to me like Lee wanted an immutable branch for that
> > > 
> > > Not exactly, I said:
> > > 
> > >    "> Suppose we should take patch #2 via [Watchdog] as well.
> > > 
> > >     If that happens, I would like a PR to an immutable branch."
> > > 
> > > The alternative is that I take the patch and provide an immutable
> > > branch to you, which I am in a position to do.
> > > 
> > 
> > I understand, only I am not in a position to take it since my tree
> > isn't the official watchdog-next tree, and it doesn't show up in -next.
> > If Wim takes it into the official watchdog-next tree or not would be
> > completely up to him.
> > 
> > I personally don't care if the bindings check is clean in my inofficial
> > tree, so maybe this is a non-issue.
> 
> That doesn't help, sadly.
> 
> I think the best course of action is for Wim to let me know when this
> patch makes it into his tree.  I'll take the MFD one at the same time
> and the two shall meet in -next.
> 
> Honestly, this is all such a faff.
> 
> Just to keep a script happy that 3 people care about.

It's going in today.

Kind regards,
Wim.

