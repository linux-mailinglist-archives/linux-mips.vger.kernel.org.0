Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86C2A2F7DBC
	for <lists+linux-mips@lfdr.de>; Fri, 15 Jan 2021 15:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732663AbhAOOHp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Jan 2021 09:07:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45400 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732461AbhAOOHp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Jan 2021 09:07:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610719578;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Yw+QcYUMu4KJ1/7zwWdqw3dTnkoFgsP+zeQ61z9wk6c=;
        b=SswQ9Ol+7/8KYmDrvEgHAQV0Y2cKn21sek48hY20oRpMOPLZ6SArtDTExKgthW6PFONK1w
        VBEpnsSC9abvyeUx6t0ryHCLRb43GUfXtNX3ZjVH+8T5X9dgfEZzyRexKYS35Oxmr4XhAf
        sTao9AMmgP2eMDJxZk3rtHvQhiFXsVI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-h2fUsfYEPHm-pP4fX5JFxw-1; Fri, 15 Jan 2021 09:06:17 -0500
X-MC-Unique: h2fUsfYEPHm-pP4fX5JFxw-1
Received: by mail-ed1-f71.google.com with SMTP id u18so3880717edy.5
        for <linux-mips@vger.kernel.org>; Fri, 15 Jan 2021 06:06:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yw+QcYUMu4KJ1/7zwWdqw3dTnkoFgsP+zeQ61z9wk6c=;
        b=dKxa3mrl+g9R0VKjwbWT4jZtIy1Vssy4/8jn4+wPGoyzPNL+MV5wQgSy+3Pd/jjq/z
         CZKz3Z7lKVyX30TMaVCV4IDVXzvU1Nhu6Rxa+U9gkkuGtmzfa7tteqpUPc7CK21DyDVj
         RAW5MT89c0NkpPc+U0UYjfBCSc44Fueg3zxFqW/d4RKdWrBhOj3aRsTs+NEP2w1CKb9c
         3HSAox49Z3jHt69ZaYNPjDR5BYZ1Dni+matMSm75TuM/gRGv/eGFJwMNB4lXLqqCRrCE
         6SXXeM53NequE4qFgmwJqtlvf9X4xC40KZM7PSa5vsoAcdvk/KcwIXZQdOv5RyrwuBGw
         ypqQ==
X-Gm-Message-State: AOAM531BoGpIY+lX1FSFRopU7lTx8aHLU60eXuli/3YOxMCyda43AThJ
        3SHoc434sOAXzYZaDczb2HTiX8beaaSY4q1/w+D9bCJqVdpxMNJrNIzxMh6KoqcrdQ362l9sXGt
        GntAGZPTo5WPtL3zq2PjrwA==
X-Received: by 2002:aa7:d7d8:: with SMTP id e24mr9462713eds.135.1610719575645;
        Fri, 15 Jan 2021 06:06:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz32dru5stz5DIotYEvOGg6GRi08jTzmU8VjdNUUgRfAXNJduvGPE+lvbHLWh0QUEN2Xd/58Q==
X-Received: by 2002:aa7:d7d8:: with SMTP id e24mr9462701eds.135.1610719575527;
        Fri, 15 Jan 2021 06:06:15 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id u2sm631163edp.12.2021.01.15.06.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 06:06:14 -0800 (PST)
Subject: Re: [PATCH] fbdev/simplefb: Add the N64's mode
To:     Lauri Kasanen <cand@gmx.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, linux-fbdev@vger.kernel.org
References: <20210115160102.cf4c85db9f815758716f086f@gmx.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <aeb93d4a-d7c0-5e0d-4de4-4a70f85cb202@redhat.com>
Date:   Fri, 15 Jan 2021 15:06:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210115160102.cf4c85db9f815758716f086f@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 1/15/21 3:01 PM, Lauri Kasanen wrote:
> Signed-off-by: Lauri Kasanen <cand@gmx.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

What is the plan for merging this patch? I've another simplefb patch which
I need/plan to push to drm-misc-nexy soon, shall I also push this one then?

Or is there some plan to merge the entire series this used to be part of
in one go?

Regards,

Hans

> ---
>  include/linux/platform_data/simplefb.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/platform_data/simplefb.h b/include/linux/platform_data/simplefb.h
> index ca83376..27ea99a 100644
> --- a/include/linux/platform_data/simplefb.h
> +++ b/include/linux/platform_data/simplefb.h
> @@ -16,6 +16,7 @@
>  #define SIMPLEFB_FORMATS \
>  { \
>  	{ "r5g6b5", 16, {11, 5}, {5, 6}, {0, 5}, {0, 0}, DRM_FORMAT_RGB565 }, \
> +	{ "r5g5b5a1", 16, {11, 5}, {6, 5}, {1, 5}, {0, 1}, DRM_FORMAT_RGBA5551 }, \
>  	{ "x1r5g5b5", 16, {10, 5}, {5, 5}, {0, 5}, {0, 0}, DRM_FORMAT_XRGB1555 }, \
>  	{ "a1r5g5b5", 16, {10, 5}, {5, 5}, {0, 5}, {15, 1}, DRM_FORMAT_ARGB1555 }, \
>  	{ "r8g8b8", 24, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_RGB888 }, \
> --
> 2.6.2
> 

