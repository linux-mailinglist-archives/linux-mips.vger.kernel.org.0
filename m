Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E3E323872
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 09:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233749AbhBXIQ7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 03:16:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234411AbhBXIQi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 03:16:38 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5192EC061574
        for <linux-mips@vger.kernel.org>; Wed, 24 Feb 2021 00:15:57 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id j19so1671709lfr.12
        for <linux-mips@vger.kernel.org>; Wed, 24 Feb 2021 00:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zgACkb1Gl2wYqG0IX7Bk5ltVRdUXsQvJfegYjpg1tZE=;
        b=u2YysyXZkhrGm+nkbp3dNTPKlj2GGxT9cW+rv/Buicw/cO1h6RLXqSOfZQdk8ReIy/
         i0v9BFCu5O8v/MQvq6V0DKaLPa3lt7rWT3yBlnpvXUw797B3oiK7yt88SrG8fRSkIHXj
         9SqHGaFl3reLD3jznmhj86LLdkmGpZxmVoVuJIuJiRi9KHVrSQaC/NWckup0MiQ7jriK
         G0KYBU1xHnczdcN0rJ6t2RJf3OAiCohpVp49ZWdzOEhZ05A5JesIKPPi0CBHokQscnCo
         W19xIYp4DIWx6eLTctD3RsfPU4bYgU/7yIfCaYyEeD/Apj+Ul3Oxtj6NEGuC29wmVDfl
         QrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zgACkb1Gl2wYqG0IX7Bk5ltVRdUXsQvJfegYjpg1tZE=;
        b=sSqb/Z+qHUzVtgFVFQ8c7zZfhqvuKFNR9tcsnXBvbETKq6mEXVT4RbSfWCr/8M4byH
         5MKKWuroQtNIbT+HDiduzFQQbEqIOZUBr0gACqbHWsIvzqmNwuS1PwNb0GU0NAOiSNz/
         HbTVKMhYtnLNnOb7lDuCuqt0lY85X+fsr6a9UKFshAk4HAZtkbJEVAD4a/E0ZeSmpVG5
         wmNWBPtV3Mk+YBc+F614m/tqfCCwTK44sf7OXOvGQ+FYJvroZcz3jtCwQYLWvIa4MIgC
         k8xGCswO0EOygEmOKWQ+ESWVRZC7JJE6VtXq09zudSn5VginHnWWCAKRTgOISqX2jYLW
         ggcw==
X-Gm-Message-State: AOAM531AOwB9/8+oAKz6e2q07t4mCzy6cNIzk0nOFcgnTlk8Nl1OOqqJ
        VQ5WkeUxPx+zkuRfAL5GfiblXA==
X-Google-Smtp-Source: ABdhPJy5IykOHiQfPHqwX4rQuxdhmVigyjK7qplhy3RE7lzn+5/voNL1wvbcmQezshUAMlH2iYqAQg==
X-Received: by 2002:a05:6512:96e:: with SMTP id v14mr18111051lft.513.1614154555890;
        Wed, 24 Feb 2021 00:15:55 -0800 (PST)
Received: from jade (h-249-223.A175.priv.bahnhof.se. [98.128.249.223])
        by smtp.gmail.com with ESMTPSA id a4sm290291ljk.50.2021.02.24.00.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 00:15:55 -0800 (PST)
Date:   Wed, 24 Feb 2021 09:15:53 +0100
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
Message-ID: <20210224081553.GB2653493@jade>
References: <20210217092714.121297-2-allen.lkml@gmail.com>
 <20210217092714.121297-2-allen.lkml@gmail.com>
 <8d87655f-27c6-6a66-6eb0-9244279fbf2c@linux.microsoft.com>
 <20210223081948.GA1836717@jade>
 <cbc963d5-6c4b-7e69-4a9b-3d66b95affab@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cbc963d5-6c4b-7e69-4a9b-3d66b95affab@linux.microsoft.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Feb 23, 2021 at 09:56:13PM +0530, Allen Pais wrote:
> 
> 
> > > > > -	/*
> > > > > -	 * Ask OP-TEE to free all cached shared memory objects to decrease
> > > > > -	 * reference counters and also avoid wild pointers in secure world
> > > > > -	 * into the old shared memory range.
> > > > > -	 */
> > > > > -	optee_disable_shm_cache(optee);
> > > > > +	if (shutdown) {
> > > > > +		optee_disable_shm_cache(optee);
> > > > > +	} else {
> > > > > +		/*
> > > > > +		 * Ask OP-TEE to free all cached shared memory
> > > > > +		 * objects to decrease reference counters and
> > > > > +		 * also avoid wild pointers in secure world
> > > > > +		 * into the old shared memory range.
> > > > > +		 */
> > > > > +		optee_disable_shm_cache(optee);
> > > > Calling optee_disable_shm_cache() in both if and else. It could be
> > > > put in front of if().
> > > > 
> > > 
> > >    Ideally, I could just use optee_remove for shutdown() too.
> > > But it would not look good. Hence this approach.
> > 
> > What is the problem with using optee_remove() for shutdown()?
> > 
> 
>  There is no problem, I just thought it would be more cleaner/readable
> with this approach. If you'd like to keep it simple by just calling
> optee_remove() for shutdown() too, I could quickly send out V2.

In the patch you posted it looks like you'd like to call
only optee_disable_shm_cache() in the case of shutdown. Like:

static void optee_shutdown(struct platform_device *pdev)
{
        optee_disable_shm_cache(platform_get_drvdata(pdev));
}

and optee_remove() kept as it was before this patch.

Cheers,
Jens
