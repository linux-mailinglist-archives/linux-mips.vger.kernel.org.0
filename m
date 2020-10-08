Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1FC2878A1
	for <lists+linux-mips@lfdr.de>; Thu,  8 Oct 2020 17:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730639AbgJHPzV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 11:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730186AbgJHPzE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Oct 2020 11:55:04 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1991C0613D2;
        Thu,  8 Oct 2020 08:55:03 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id w11so7087244lfn.2;
        Thu, 08 Oct 2020 08:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ePirmulELbemRTmvtrt1ch9UcEfGnhKa3Vhqxn9QmJ0=;
        b=HuALeKMkxI4SLsKQjgqOGmNSIDeVYltC73/Yj4UI87bXqfJq74J8/hw8zWvy9Zkb+i
         szje/tJUYMYKTudq1R+jE5Vs8Pt6AK3wPbJ3CYjrzMLqGYAnAXx2NO40mSzFchT3HyET
         zzUvN1prB9QFDj3axzAYtW7AffFM+9ow9CXgdTk5Y+O0s0L+5c+gTGP2Q7omKwQHc+EG
         usL0jvBxnYoM5meYbDUL8FNaAp8YhimfHVcbKUEoAD6Y/00etCr25Ex3p/Br2/XSkBQN
         GK94GAXQlBiPW9TO7tJAo6j8akBBLS1L1WlWXwbBkSbu/ufntrn9mBJtyZ4urDHwIN04
         SoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ePirmulELbemRTmvtrt1ch9UcEfGnhKa3Vhqxn9QmJ0=;
        b=HmyJtNLvKPuvoHo7K6ZJNW0ConF/5U8ZciU121keh2441zX0TP/coxCYaHCrsX+CbA
         gmITmovs2WBDx0NM/0LXf6P1/8fnExDg7nBXj+fsdlQz3YDo0FOrTlomTq/MkHHKY7k0
         6SpSU2c5N9tALSjOuAdLQqMMxVyz5yIc+HmLCRVUyc3daUbE0vKeWJ2Nvuw4C0Jtn1IN
         fneu4YGL1OcyzG+GVRoEsx4xvrqvMlw40AAy8BQ1tAkmjbAQLpmy+fQkWdIyIroJ0wG+
         pJae7zP7FjsUW8IioEHm8eYZdRXIPvkLeEoKzwJ7e4PZriglWnF1lbil9grfy4MXvgH9
         7OZQ==
X-Gm-Message-State: AOAM531QNWydUj7GNAVTmV0QwPzwn1sEZrmvtlAE04T+0L47cJB3SLof
        7TTtX1sFxGClrWYr8WFvtv4=
X-Google-Smtp-Source: ABdhPJzNNaKa9cL9Ahg57qPnO8bieFDsZh3HOQjO+aYYfAjiTNAuWtUsY1Wrob3YJf5clnYGp1cwpA==
X-Received: by 2002:ac2:4c12:: with SMTP id t18mr2627311lfq.285.1602172502127;
        Thu, 08 Oct 2020 08:55:02 -0700 (PDT)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id 137sm60079lfi.246.2020.10.08.08.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 08:55:01 -0700 (PDT)
Date:   Thu, 8 Oct 2020 18:54:54 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] MIPS: replace add_memory_region with memblock
Message-ID: <20201008155454.kaal2bchjq7wusqr@mobilestation>
References: <20201008084357.42780-1-tsbogend@alpha.franken.de>
 <20201008152006.4khkbzsxqmmz76rw@mobilestation>
 <alpine.LFD.2.21.2010081628100.866917@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2010081628100.866917@eddie.linux-mips.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 08, 2020 at 04:30:35PM +0100, Maciej W. Rozycki wrote:
> On Thu, 8 Oct 2020, Serge Semin wrote:
> 
> > At least I don't see a decent reason to preserve them. The memory registration
> > method does nearly the same sanity checks. The memory reservation function
> > defers a bit in adding the being reserved memory first. That seems redundant,
> > since the reserved memory won't be available for the system anyway. Do I miss
> > something?
> 

>  At the very least it serves informational purposes as it shows up in 
> /proc/iomem.

I thought about that, but /proc/iomem prints the System RAM up. Adding the reserved
memory regions to be just memory region first still seem redundant, since
reserving a non-reflected in memory region most likely indicates an erroneous
dts. I failed to find that, but do the kernel or DTC make sure that the reserved
memory regions has actual memory behind? (At least in the framework of the
memblock.memory vs memblock.reserved arrays or in the DT source file)

I also don't see the other platforms doing that, since the MIPS arch only
redefines these methods. So if a problem of adding a reserved memory with
possible no real memory behind exist, it should be fixed in the cross-platform
basis, don't you think?

-Sergey

> 
>   Maciej
