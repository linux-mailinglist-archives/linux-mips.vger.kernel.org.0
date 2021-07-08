Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 380183C19FC
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jul 2021 21:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhGHToe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Jul 2021 15:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbhGHToe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Jul 2021 15:44:34 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB9DC061574;
        Thu,  8 Jul 2021 12:41:51 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id v14so18497191lfb.4;
        Thu, 08 Jul 2021 12:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bj7dNjsPUKbHFxGqaGSxYHlxZLa3XC/EGhNU6JYPgJ4=;
        b=kAA3brOxhuB1/yqrpzNZouQy6CJ0zmKFEhxkZAVwFNJu6QQ6Sv0jbZQ2IAwRVVup/E
         vcDvgJ7RZO+gIm7iKSCO1QyFr07bu+DM/n5Ypi96aoMqpsB9H+xTEAhnG2nAeHNFbNat
         OsKgkzTf+Uyz70gPGI5ynMa6lMKDDyV0uny9Yt5MngP6eD46ClZv3u1nA/JaoaMR4tHV
         kYRlWBsX66ZlOsEtevV13yqn6hk5OZB2um+MKofy5uyQHqPWU6JFmn0M42OfOhaXmDE+
         H7FfccxoZHQkIQEPfHhpaD4Rb1xrfiTT7PLp8fxlGhOevIZE0L1Tcf0nY0yAgaPdLBla
         dYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bj7dNjsPUKbHFxGqaGSxYHlxZLa3XC/EGhNU6JYPgJ4=;
        b=AITtfZbsgh6qjGEPENUISecKc7++/L/fp1a5ErAFrnfB+HhmNuNb+nJ+kLEjUeJ+JM
         3kpxJG1MyixsVa1vjsP2DkcotZ+0DqaYG/Le2T8uBD1aR1IyBYJIcJIXgxDI5DWkNjkk
         p46d4o5RNJcNevNGpgIzqjWnhArPZod2EVlnn4taGNIqpzgKoymbKnATw9REU8+UuiXx
         Py5L0oAdjp7l5CNibEK/FH8e5P0yKfoJNoOzi2WuRcWyrkUKDPfnw2lWI6SefBPz8iVw
         Oob8IQSa2ZVhYdqWJCwnNz/9JLIo76Q6XB01LUdjtMHPwTiH74sMkgYicczdFaoLaa2X
         eDng==
X-Gm-Message-State: AOAM530hmPqt1UGlrE7pBVHUous5zDAKTPFQ1L4D/80FITH0alzmNnBx
        3JS0S0g0pu55JBmKTB/2bLA=
X-Google-Smtp-Source: ABdhPJz80r2KRTtdcl7+KtUakdV/3kloB9Ws2dCxEE4o3oVWX+XpNxuTbiUsdk1k+Meha95tbjq2Og==
X-Received: by 2002:a19:6b14:: with SMTP id d20mr21042968lfa.562.1625773310197;
        Thu, 08 Jul 2021 12:41:50 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id u5sm325610ljh.29.2021.07.08.12.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 12:41:49 -0700 (PDT)
Date:   Thu, 8 Jul 2021 22:41:47 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com,
        Guenter Roeck <linux@roeck-us.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] irqchip/mips: Fix RCU violation when using irqdomain
 lookup on interrupt entry
Message-ID: <20210708194147.a236rqwybgsugwe4@mobilestation>
References: <20210706110647.3979002-1-maz@kernel.org>
 <20210708094608.anrgynyzu6h233pr@mobilestation>
 <87eec83glb.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eec83glb.wl-maz@kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 08, 2021 at 05:39:28PM +0100, Marc Zyngier wrote:
> Hi Sergey,
> 
> On Thu, 08 Jul 2021 10:46:08 +0100,
> Serge Semin <fancer.lancer@gmail.com> wrote:
> > 
> > Hi Marc,
> > Thanks for the fix.
> > 
> > On Tue, Jul 06, 2021 at 12:06:47PM +0100, Marc Zyngier wrote:
> > > Since d4a45c68dc81 ("irqdomain: Protect the linear revmap with RCU"),
> > > any irqdomain lookup requires the RCU read lock to be held.
> > > 
> > > This assumes that the architecture code will be structured such as
> > > irq_enter() will be called *before* the interrupt is looked up
> > > in the irq domain. However, this isn't the case for MIPS, and a number
> > > of drivers are structured to do it the other way around when handling
> > > an interrupt in their root irqchip (secondary irqchips are OK by
> > > construction).
> > > 
> > > This results in a RCU splat on a lockdep-enabled kernel when the kernel
> > > takes an interrupt from idle, as reported by Guenter Roeck.
> > 
> > Alas I am still on 5.12-rc4, so can't test it out at the moment. Soon
> > after getting further on the modern kernel version I'll give this
> > patch a try on my hw and send a report.
> 
> It is likely that I'll send a pull request to Thomas with this
> shortly, given that it affects existing systems and that this patch
> does address the issue (see Guenter's report). We can always amend
> things once you've had the time to upgrade your kernel to the latest.

Ok. I'll report the test status once my working branches are rebased on the
latest version. It will be done in a few weeks from now then after I
finished my current activity.

-Sergey

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
