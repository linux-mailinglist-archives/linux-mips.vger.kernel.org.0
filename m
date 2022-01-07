Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2348B487A45
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jan 2022 17:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348200AbiAGQ0r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Jan 2022 11:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233469AbiAGQ0q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Jan 2022 11:26:46 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB80C061401
        for <linux-mips@vger.kernel.org>; Fri,  7 Jan 2022 08:26:45 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id g11so17430246lfu.2
        for <linux-mips@vger.kernel.org>; Fri, 07 Jan 2022 08:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Wx8vb4BLG+DDO7rJPIEbH27WUURa/Qd6ietWG6WiTA=;
        b=kip4fAu6AOvdI/hgmyaP2ZkUZLdRk1u5qdrt+qzHKZO1vBFbyBqKMWs0S5MxRVOOEr
         WHlSHuVuY3wnX7GgX+gPrFRAfOhoPkdE6rSOMKPUmsmuNuN1JQl1+zl4eEUuJwT24h5e
         BFYmWBhOCRLzIQVbWiZ5ccSAVwu1VfzINav9YzegtskifHvW70kEFNs4l5uEb2UVtUjW
         9w/yxNXShxWS2E06MP5HLMbO0MgBQFM+k/7sLMZgQMhs7hM4PHq9IdBraWeFDjnRuax+
         WQlG51ziBaQEbUCwLtiwf7QqjmBItEKzQ9D8ZvrtjPrP0Lz9c9g8RlDw/bFrOtGzGKgj
         DXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Wx8vb4BLG+DDO7rJPIEbH27WUURa/Qd6ietWG6WiTA=;
        b=LhQq44r2OMkg0h3lG1huQDchOAHWpkY2QNLWVGJhFGuDFNPxxs8UG+o2BC8teQ1MDz
         7InOKqSZhOay13DxrlI8sOpvhBOQyOroMhIYC68gQR0P2sX+ksfvChB1EVF5FchSCIfM
         XszuduTxl1CosTGjWTE9hOzhCNhnhqXHcRSf3CwEiLHcV57+U1WYthFy03ejMh+6XysU
         C7Nw4tUzF1YnM4SWD+Im9cgtFy4UXmJNF9HpN6V22nU38h6JMFVIgnn1WwOzPJ7uT1/P
         pe5cCHm+e9brmMEEVg0lx5Z9OLqQCzt5dJ1ReuqNjgdFok7poMrd5rL4JcEl8aXXcyCk
         xqYQ==
X-Gm-Message-State: AOAM531eAn4j+6a2mfXjFGN87IA1hGm7YmCnj3UchwdHKeTmN8cFkwG4
        IgJrnqgDNnclTet6Fusa4ix2+vF+P79Jbsw/pB2EDA==
X-Google-Smtp-Source: ABdhPJxoyZIKjIKAy0vsM+Q9YLUcHyiT1i/rcFqzeHrV03xqmKlXiwgDQU8UZOFEvDKB4fVVjM97MAq7llbdE9aZfKg=
X-Received: by 2002:a05:6512:3d9e:: with SMTP id k30mr56148357lfv.184.1641572803993;
 Fri, 07 Jan 2022 08:26:43 -0800 (PST)
MIME-Version: 1.0
References: <20220105182939.106885-1-paul@crapouillou.net> <20220105182939.106885-2-paul@crapouillou.net>
In-Reply-To: <20220105182939.106885-2-paul@crapouillou.net>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 7 Jan 2022 17:26:07 +0100
Message-ID: <CAPDyKFqiVTcsr03SqCzZsTraivrnM4YxKxPQ7dMmt14dT1uiCQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] PM: core: Remove DEFINE_UNIVERSAL_DEV_PM_OPS() macro
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Len Brown <len.brown@intel.com>,
        Pavel Machek <pavel@ucw.cz>, list@opendingux.net,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jonathan Cameron <jonathan.cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 5 Jan 2022 at 19:29, Paul Cercueil <paul@crapouillou.net> wrote:
>
> The deprecated UNIVERSAL_DEV_PM_OPS() macro uses the provided callbacks
> for both runtime PM and system sleep, which is very likely to be a
> mistake, as a system sleep can be triggered while a given device is
> already PM-suspended, which would cause the suspend callback to be
> called twice.
>
> The amount of users of UNIVERSAL_DEV_PM_OPS() is also tiny (16
> occurences) compared to the number of places where
> SET_SYSTEM_SLEEP_PM_OPS() is used with pm_runtime_force_suspend() and
> pm_runtime_force_resume(), which makes me think that none of these cases
> are actually valid.
>
> As this macro is currently unused, remove it before someone starts to
> use it in yet another invalid case.

I assume you refer to DEFINE_UNIVERSAL_DEV_PM_OPS here. Can you
perhaps make that more clear?

>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>
> Notes:
>     v2: No change
>
>  include/linux/pm.h | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index e1e9402180b9..31bbaafb06d2 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -366,6 +366,12 @@ static const struct dev_pm_ops name = { \
>         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
>  }
>
> +/* Deprecated. Use DEFINE_SIMPLE_DEV_PM_OPS() instead. */
> +#define SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn) \
> +const struct dev_pm_ops __maybe_unused name = { \
> +       SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
> +}
> +
>  /*
>   * Use this for defining a set of PM operations to be used in all situations
>   * (system suspend, hibernation or runtime PM).
> @@ -379,19 +385,6 @@ static const struct dev_pm_ops name = { \
>   * .resume_early(), to the same routines as .runtime_suspend() and
>   * .runtime_resume(), respectively (and analogously for hibernation).
>   */
> -#define DEFINE_UNIVERSAL_DEV_PM_OPS(name, suspend_fn, resume_fn, idle_fn) \
> -static const struct dev_pm_ops name = { \
> -       SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
> -       RUNTIME_PM_OPS(suspend_fn, resume_fn, idle_fn) \
> -}
> -
> -/* Deprecated. Use DEFINE_SIMPLE_DEV_PM_OPS() instead. */
> -#define SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn) \
> -const struct dev_pm_ops __maybe_unused name = { \
> -       SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
> -}
> -
> -/* Deprecated. Use DEFINE_UNIVERSAL_DEV_PM_OPS() instead. */

Shouldn't this macro be deprecated any more?

>  #define UNIVERSAL_DEV_PM_OPS(name, suspend_fn, resume_fn, idle_fn) \
>  const struct dev_pm_ops __maybe_unused name = { \
>         SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
> --
> 2.34.1
>

Kind regards
Uffe
