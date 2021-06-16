Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10983A9CC8
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jun 2021 15:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbhFPN7N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Jun 2021 09:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233462AbhFPN7B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Jun 2021 09:59:01 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E2EC06175F
        for <linux-mips@vger.kernel.org>; Wed, 16 Jun 2021 06:56:52 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so1752640wmq.5
        for <linux-mips@vger.kernel.org>; Wed, 16 Jun 2021 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6jq8C/Rzb7RK2Hf0fwCmGzYirCOKsKSvSsnVLF/bjjI=;
        b=ogT6xyY7Xr60NqygOvaMwXVkI5gxw+rnYPyDF2xJ5ui1FtYNkXdNpRtxtE408dylPq
         ZW1eJ7XZY6VpoZCdF8r+JHYjcoegt6YceNI2r0cCExQrhr8qvkRkGJfgM2KUpfSEUBNe
         EyYPW+nSMI1TwZ+e7ohumnZCi/WAaIQwoYUdcZcMYLzmxrrDeSgReiRz2WkMiHgfTS63
         cPFbRjrzw9mPaIcRtn6MSAhym67zmeAjj1sBpmqVaMiiQl5OPzKPeKNVOKRa3PCXQc5r
         ZUgFszZXHZrj7fN9BbUTnPHkeraUBgNwp3Puy7hThkSjRqhI+rmhLrgCl2K0lX+HOSh/
         PznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6jq8C/Rzb7RK2Hf0fwCmGzYirCOKsKSvSsnVLF/bjjI=;
        b=UbQPHvEXHKPVIoklnWr13qyxSrYvEdey+fmT/uBK3pnp/6V5WvmWtZAy4gnlhow/vF
         ExuzCywvQnsmv92dKRVxPxA0cvo7/POFTeuKAV7Udu36lrbSa56q+F8EObOR0HBE40Ed
         KRbyU/V7kLOonk1i04HiB5hvIG4ko9uknqry93lgm1xotXCoOy7oMXzq5AaG87DOVf46
         u9sjWkIx84TsD0/KcsudD0G58lAWGMRnKnm2rMBPK4KAQ33YEvVVYmm5+WqFHdsZ+uX+
         bk3YTs9Z1QSF6zAaEcmlvqPP5ZOmW5zV27RF0W+4UlEWqHu9qS9wBgI6sBtK2SOgdYri
         tasA==
X-Gm-Message-State: AOAM533sSDltq9eBPXqKF9PdiasJZMnkZGjQ4y6zcMO85k00EEenWjLv
        alwLWz1sdJCq7Vq/gjdXYDFy4g==
X-Google-Smtp-Source: ABdhPJylV+0o2tUV9eg47KPQVPT7xd2Gd0qftElPiOFmH803O7vy0jRLa491ScW/tQ2uBGYDx1b6Mw==
X-Received: by 2002:a05:600c:20d:: with SMTP id 13mr40730wmi.174.1623851810981;
        Wed, 16 Jun 2021 06:56:50 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:60a0:f51c:af6:2dab? ([2a01:e34:ed2f:f020:60a0:f51c:af6:2dab])
        by smtp.googlemail.com with ESMTPSA id u16sm2465865wru.56.2021.06.16.06.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 06:56:50 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] clocksource: Ingenic: Rename unreasonable array
 names.
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, tglx@linutronix.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        paul@crapouillou.net
References: <1622824306-30987-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1622824306-30987-2-git-send-email-zhouyanjie@wanyeetech.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <f9f63e49-41f4-4598-3554-ac53ba4dcd55@linaro.org>
Date:   Wed, 16 Jun 2021 15:56:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622824306-30987-2-git-send-email-zhouyanjie@wanyeetech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 04/06/2021 18:31, 周琰杰 (Zhou Yanjie) wrote:
> 1.Rename the "ingenic_ost_clk_info[]" to "x1000_ost_clk_info[]"
>   to facilitate the addition of OST support for X2000 SoC in a
>   later commit.
> 2.When the OST support for X2000 SoC is added, there will be two
>   compatible strings, so renaming "ingenic_ost_of_match[]" to
>   "ingenic_ost_of_matches[]" is more reasonable.
> 3.Remove the unnecessary comma in "ingenic_ost_of_matches[]" to
>   reduce code size as much as possible.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---

I have applied this patch but not the 2/2.

Thanks
  -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
