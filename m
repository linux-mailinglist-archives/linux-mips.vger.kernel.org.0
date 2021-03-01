Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73CC8327A16
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 09:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233604AbhCAIyx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Mar 2021 03:54:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233782AbhCAIxv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Mar 2021 03:53:51 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA020C061756;
        Mon,  1 Mar 2021 00:53:10 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id q23so18461925lji.8;
        Mon, 01 Mar 2021 00:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z9Lv4jcdbi26OM1Ui5humilwQXIlpCe/CsQxpgRss4E=;
        b=QC+865VGhYqY1nnmUzvCf/Uf+JOswGXtj8VVmchliFJccyBBoqlHHhmAeJ+TU7PIzO
         pUT6E//Vkmz8lpo2Li/nkdpZSWwny9axmj80kAEpfAu3zfB0Wqvga02OqhvEKrM9dad3
         k7UsUYLba/zlRA3MBFzIhsNXw1HsnR+vNSy+3DVuof6ibSEmRxy675rQrcfg/PoXZs+8
         ujWmvSlODrs2pkZLQwI0ZWbFCJJRm6d/Jo1U04ACXqLuPzh7MClDz4BmEH0CbF2R1cIu
         zKrZQrQ7F2juFCftheYDsmfhKsIGY7wTVdchBsxgQkloMYbf+vwqzYp44Pn1Dtx0YNJr
         OiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=z9Lv4jcdbi26OM1Ui5humilwQXIlpCe/CsQxpgRss4E=;
        b=pepha1odFc8YM1C27k3a/wFCsKUej/RGrjU3L9uOE87QjDvD4M5Er+RPxnmbQkii6A
         pShlrbUaN4MxdwAnbXAjqEnNqBcHGACXxrArIalpMAOWnfXPk7JDo5B6KYIKyR65LvWP
         y5WiUrc/kOgpAQd5GeMJx3cswp57IwaZeRCTaxv0Ti+DF/Hn3zZNftU5wfAzaJW06mFu
         PiB+7dlJjA2aHrXVIxqSd2BD2SGR6D60qWKiVlv+DC0YsmGFOnSFDF/2oGQuvs5YYOmt
         ujrQBmDB4/GIVG+kvIhOz3soGcRVgxMTH55nLi80vSk5hcijsGCiQ6GenIoHnGk/CEju
         6ZKg==
X-Gm-Message-State: AOAM5300CEgLv6iNctwmKfshNFhMMBHbUvtsb3JIpDBcd0oG0QfjLnZA
        owfRMenkewNoOEph9ROS3F9ks1wbp/IQFQ==
X-Google-Smtp-Source: ABdhPJx0eXK0MSbaQC1xYYp0mgHSbB6Rdq3s2XdJWGMyxV/dHaoOcNLjmsdRiBzUER9n8n+0P4DaXA==
X-Received: by 2002:a2e:8159:: with SMTP id t25mr8753996ljg.84.1614588787470;
        Mon, 01 Mar 2021 00:53:07 -0800 (PST)
Received: from [192.168.1.100] ([31.173.83.37])
        by smtp.gmail.com with ESMTPSA id u13sm1328368ljl.107.2021.03.01.00.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 00:53:07 -0800 (PST)
Subject: Re: [PATCH] arch: mips: sibyte: Return -EFAULT if copy_to_user()
 fails
To:     Wang Qing <wangqing@vivo.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1614580437-19660-1-git-send-email-wangqing@vivo.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <3a7d2007-b7d2-e428-406c-a6804bff6df0@gmail.com>
Date:   Mon, 1 Mar 2021 11:53:01 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1614580437-19660-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 01.03.2021 9:33, Wang Qing wrote:

> The copy_to_user() function returns the number of bytes remaining to be
> copied, but we want to return -EFAULT if the copy doesn't complete.

    Then 'err' is hardly a good name for that variable. :-)

> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>   arch/mips/sibyte/common/sb_tbprof.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/sibyte/common/sb_tbprof.c b/arch/mips/sibyte/common/sb_tbprof.c
> index f80d7a7..eac125f
> --- a/arch/mips/sibyte/common/sb_tbprof.c
> +++ b/arch/mips/sibyte/common/sb_tbprof.c
> @@ -465,7 +465,7 @@ static ssize_t sbprof_tb_read(struct file *filp, char *buf,
>   		if (err) {
>   			*offp = cur_off + cur_count - err;
>   			mutex_unlock(&sbp.lock);
> -			return err;
> +			return -EFAULT;
>   		}
>   		pr_debug(DEVNAME ": read from sample %d, %d bytes\n",
>   			 cur_sample, cur_count);

MBR, Sergei
