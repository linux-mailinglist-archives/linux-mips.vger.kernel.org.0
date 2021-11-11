Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6462044D099
	for <lists+linux-mips@lfdr.de>; Thu, 11 Nov 2021 05:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhKKEJX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Nov 2021 23:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbhKKEJT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Nov 2021 23:09:19 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E2EC061766;
        Wed, 10 Nov 2021 20:06:23 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id j2so4649815qkl.7;
        Wed, 10 Nov 2021 20:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OLcFQVtD+zrg7PXIBfRA8cAQH7T7V2/4cfVGtfrxAq8=;
        b=lS36aFbkIRhJuC6Cd/AAaIIRXR6DpEI+MiQBTh+HAqDGQ7SJt2kOk9H7OefPb7ebNK
         3aaMIjZ2VlWMsGo6UecehmNcDjgJPL0cuqd0Umndtlo7lzpVLJosTFKfQ5jLQmWN+gWR
         Jr5xvZvaie2aDWnjNWXbAbJGgix5rr9ARnzYKIC+eLHLu1eICDbrqm5BMAU1FSKAGoDN
         49GzgVLS1AtMP3yl2OZ0HlByk+DJfaIP8+CSdmBdJiTSYsNiET6sL5V9FzCrGaRLtDUg
         DNpaMHeGFR8f41ArSJvrUf5szRHojZN4RxBZV/DP/lerAQFp9+r2/Xy1TUACK3rmOSMW
         l+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OLcFQVtD+zrg7PXIBfRA8cAQH7T7V2/4cfVGtfrxAq8=;
        b=WqgjKERpBcPonVVBQE9V/P66ZXnnR2iJAKlkitGeay/F2ngxMBtnsaQ5LkZUAipn1K
         z42dIb0plTjDtDPd5ATEvilYT3mE9EY8lS8UHLdQIrDo+civqykkFjI2RP1mtECHMG9H
         8loV0DXxvmEonIfrpUO7h9/twFcZAX4EWcbqs5WhhyJX471ccGTkgw87YWPGymvzI9up
         VcTn51GQuxS0/yuMGTNJPGqsneqNpTKiLTuuFEwvxLmzJpR7apKn80U2jNeAFYF8eez5
         1vxA8i5dSvB+10FwnoZi4AsL/sUhYWq3NpW4cLk51inmj4KcVU1gHdhIkHnXH2u1kdn5
         pjzw==
X-Gm-Message-State: AOAM530Dn7/7g7oanpf5udQSVBKRWSW51PX6GUlJtEI3racWK74UeOR4
        V5e8VGBNniLPHgTgJUeKLz0=
X-Google-Smtp-Source: ABdhPJwy1jkciX4+znRvqnHrGi5juDKLXSdn6bNl6om1ZBoExEpt68bOz9etkvnkVJVIPj1CjWlbwA==
X-Received: by 2002:a37:5804:: with SMTP id m4mr3775483qkb.137.1636603582779;
        Wed, 10 Nov 2021 20:06:22 -0800 (PST)
Received: from [192.168.43.249] (mobile-166-172-188-236.mycingular.net. [166.172.188.236])
        by smtp.gmail.com with ESMTPSA id p5sm1084681qtw.69.2021.11.10.20.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 20:06:22 -0800 (PST)
Subject: Re: [PATCH/RFC] of: Shrink struct of_device_id
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <9e20f1b0-3fc4-920a-dff4-1227f72207cf@gmail.com>
Date:   Wed, 10 Nov 2021 23:06:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Geert,

On 11/10/21 11:23 AM, Geert Uytterhoeven wrote:
> Currently struct of_device_id is 196 (32-bit) or 200 (64-bit) bytes
> large.  It contains fixed-size strings for a name, a type, and a
> compatible value, but the first two are barely used.
> OF device ID tables contain multiple entries, plus an empty sentinel
> entry.
> 
> Statistics for my current kernel source tree:
>   - 4487 tables with 16836 entries (3367200 bytes)
>   - 176 names (average 6.7 max 23 chars)
>   - 66 types (average 5.1 max 21 chars)
>   - 12192 compatible values (average 18.0 max 45 chars)
> Taking into account the minimum needed size to store the strings, only
> 6.9% of the allocated space is used...

I like the idea of using less memory (and thank you for the above data!),
but I do not like the implementation, which reduces the size (of name at
least - I didn't check each field) to less than what the standard allows.

I have an idea of another way to accomplish the same goal, but I need to
dig a bit to make sure I'm not shooting myself in the foot.

-Frank

> 
> Reduce kernel size by reducing the sizes of the fixed strings by one
> half.
> 
> This reduces the size of an ARM multi_v7_defconfig kernel by ca. 400
> KiB.  For a typical kernel supporting a single board, you can expect to
> save 50-100 KiB.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Notes:
>   - While gcc complains if the non-NUL characters in a string do not fit
>     in the available space, it does not complain if there is no space to
>     store the string's NUL-terminator.  However, that should be caught
>     during testing, as the affected entry won't ever match.  The kernel
>     won't crash, as such strings will still be terminated by the
>     sentinel in the table.
> 
>   - We could save even more by converting the strings from fixed-size
>     arrays to pointers, at the expense of making it harder to mark
>     entries __init.  Given most drivers support binding and unbinding
>     and thus cannot use __init for of_device_id tables, perhaps that's
>     the way to go?
> 
> Thanks for your comments!
> ---
>  include/linux/mod_devicetable.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index ae2e75d15b219920..2bb2558d52d30d2b 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -266,9 +266,9 @@ struct sdw_device_id {
>   * Struct used for matching a device
>   */
>  struct of_device_id {
> -	char	name[32];
> -	char	type[32];
> -	char	compatible[128];
> +	char	name[24];
> +	char	type[24];
> +	char	compatible[48];
>  	const void *data;
>  };
>  
> 

