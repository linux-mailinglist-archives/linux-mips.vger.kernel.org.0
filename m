Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B39A322705
	for <lists+linux-mips@lfdr.de>; Tue, 23 Feb 2021 09:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbhBWIUg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 03:20:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232075AbhBWIUc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 03:20:32 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41896C06174A
        for <linux-mips@vger.kernel.org>; Tue, 23 Feb 2021 00:19:52 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id c8so62014709ljd.12
        for <linux-mips@vger.kernel.org>; Tue, 23 Feb 2021 00:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ziKu9fCgZMMDJu51DNLFllZqOxNQ3wrYaiXyRSckVtY=;
        b=p/MGW4fux+raA1lacKYcNWVbXKqUFMqEe0TZK1tdZDrw65OmouBhYUWRNnbftp0AZ5
         Z2xQeEZrpQ9wiZ7TIx/SaoVrxllrVkk7x3V9ISEnPEpAm92ZYAVQ5CyprTuHT1V3c7QS
         6nx92MGt5IIOY1/tCVUk0z8+x8YwJjnSS72dWlM/2iV+v3TpjAiBrQIctSpFAeZasSjA
         tZXBl3P9/y8i+sLakv+sWS9V2afmWMt9OzmqjE8E3I3etPOFQOiG2SqSYyiIm/aT/BaO
         pdeQRVcay/Kq/i8h4WWePbUdBmnlflnKAWiqGRq6dm7u9B2oWHjhcBmK+wdjBD1mkitI
         o/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ziKu9fCgZMMDJu51DNLFllZqOxNQ3wrYaiXyRSckVtY=;
        b=JoqFhn/13toQfanS6ipslXtD4KWhcUCzVh9vlnZhoPAGuQvpfJ/ZHc5SiSAYWw5bpl
         +3ApuF1H0IG+PdlQGGgVKSncPEofI9VzXJY1v6SmkzJzwEfILwRkUesUuRnAeqfe9ikZ
         Qs+ZyJ2e/ak2Z0h+OMs7WvZae3S8eOsyduBuF301kg/4qGmibWre6dhEUZhtoxQ1VpNJ
         L0Ub+drc1ILPnizogh3R1mLORbs/6H0Igobzm0gfpeWuds2RgqtNupRBgf6rEJiGr/6h
         hpAahcGvS9qO9uk9+A7XC4n+pvok0X31B3LikpXM0PfeUofLqFH0yzxBMymJlKZYF4sr
         Lbiw==
X-Gm-Message-State: AOAM531TseyxFhAg1v2aJtOvAz94eAVLczzpaemiEFZbUm4Gue0tr3UF
        3ypPXnNyebc8LI7HF7lm98R4Vg==
X-Google-Smtp-Source: ABdhPJwJ9JpH7dAZolmZr9u0otMtqyysvc+TS7zWZCkH2j9OhjcmRyz/GZb6SqB2dv7txM9yYrb9JA==
X-Received: by 2002:a2e:b051:: with SMTP id d17mr24922ljl.255.1614068390673;
        Tue, 23 Feb 2021 00:19:50 -0800 (PST)
Received: from jade (h-249-223.A175.priv.bahnhof.se. [98.128.249.223])
        by smtp.gmail.com with ESMTPSA id r16sm2474986lfr.223.2021.02.23.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 00:19:50 -0800 (PST)
Date:   Tue, 23 Feb 2021 09:19:48 +0100
From:   Jens Wiklander <jens.wiklander@linaro.org>
To:     Allen Pais <apais@linux.microsoft.com>
Cc:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        allen.lkml@gmail.com, zajec5@gmail.com,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        op-tee@lists.trustedfirmware.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH 1/2] optee: fix tee out of memory failure seen during
 kexec reboot
Message-ID: <20210223081948.GA1836717@jade>
References: <20210217092714.121297-2-allen.lkml@gmail.com>
 <20210217092714.121297-2-allen.lkml@gmail.com>
 <8d87655f-27c6-6a66-6eb0-9244279fbf2c@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d87655f-27c6-6a66-6eb0-9244279fbf2c@linux.microsoft.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 22, 2021 at 06:15:08PM +0530, Allen Pais wrote:
> 
> > On Wed, 17 Feb 2021 14:57:12 +0530, Allen Pais wrote:
> > > -	/*
> > > -	 * Ask OP-TEE to free all cached shared memory objects to decrease
> > > -	 * reference counters and also avoid wild pointers in secure world
> > > -	 * into the old shared memory range.
> > > -	 */
> > > -	optee_disable_shm_cache(optee);
> > > +	if (shutdown) {
> > > +		optee_disable_shm_cache(optee);
> > > +	} else {
> > > +		/*
> > > +		 * Ask OP-TEE to free all cached shared memory
> > > +		 * objects to decrease reference counters and
> > > +		 * also avoid wild pointers in secure world
> > > +		 * into the old shared memory range.
> > > +		 */
> > > +		optee_disable_shm_cache(optee);
> > Calling optee_disable_shm_cache() in both if and else. It could be
> > put in front of if().
> > 
> 
>   Ideally, I could just use optee_remove for shutdown() too.
> But it would not look good. Hence this approach.

What is the problem with using optee_remove() for shutdown()?

Cheers,
Jens
