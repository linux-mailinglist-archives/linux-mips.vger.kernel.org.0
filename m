Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38DF230450A
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 18:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729435AbhAZRVp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Jan 2021 12:21:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390620AbhAZIyl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Jan 2021 03:54:41 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC9BC061573;
        Tue, 26 Jan 2021 00:54:01 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id i187so11449373lfd.4;
        Tue, 26 Jan 2021 00:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sb/6toZ1LycHVLxZfHlszRFpvafXWffrLwLHIch7P58=;
        b=MEClQLDAcozrJgdfIdWWmjK9kiQ5t2+ZV7bfGHZMo7IGBB3WwBixH2DCKVGJgHWuuL
         fYTv7tv09gzoA7uiLzCm1kzGsUkxZST+tm80Bf1LaV5n9zEHJg/CaT6Z7Nu/zPjMcHZw
         CW4ujC3OKvJ/ml1S7bQ/SFdgQZEDnC8zWQjEGWz4lSyCngMYc4p675/rFE5FKJrvhTS3
         K6JIt8EyhpAzDrY8ZR5UzBIBZR4nYZLfO/yI44VJqztcgbULO/3EtN56uCL5lCAdR78e
         xPmc5+lrTedpwqgn4W7z5wt4CdI1I/fdlb7iTw2vk/HmDMlESuQC3/v9k2/yNJbh2O8q
         ir/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Sb/6toZ1LycHVLxZfHlszRFpvafXWffrLwLHIch7P58=;
        b=V1icFHZD1AJgkzYCpTmADU6p0/z3MQMWRDdcVFtGUDlNUkhzbxOvtjDayDL9BzsswU
         BXhboq7PUIBpK7gspUUi7hpzuEFWnySRPGvNAczjvM/3RoWWHy+4Qy/7XJ2A61TY0/65
         pv8lUI2kJAa/gtYlnBiZ6zjZmcMagStXNMb/8IncJmYo8m+Ydsw14+GHNGXElam0jGmS
         9kW19meZOnq+GghlJ4XH2V+yV2sW3OTAia3+BCwqJ9wud1Dgmwq3UP0MP1kkTvxK7XOy
         vViuC048gN+KPpYZpapze/DhfbE63vnF/gyviPoJvlO8sUxMT0IhejfSwzN9FfmtrvDq
         yytA==
X-Gm-Message-State: AOAM530yJYTXw+kYRepLOYd+HFfedlfG6dTx/wsRR5Azh+Y6GonDZKCe
        VD3lma5eEDDGf2uvTmwi+Bk=
X-Google-Smtp-Source: ABdhPJx/fgoA7NcvxleaAnbF1rvre3L9SR2PeGlhWa0xHE+O5IygoOIrj2QtpKKzQ5CNoocSRbVg1A==
X-Received: by 2002:a19:8705:: with SMTP id j5mr818331lfd.148.1611651240125;
        Tue, 26 Jan 2021 00:54:00 -0800 (PST)
Received: from [192.168.1.100] ([178.176.75.50])
        by smtp.gmail.com with ESMTPSA id g4sm2431428lfu.283.2021.01.26.00.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 00:53:59 -0800 (PST)
Subject: Re: [PATCH 7/9] n64: cosmetics changes
To:     Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, cand@gmx.com
References: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
 <20210125233243.5982-8-chaitanya.kulkarni@wdc.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <01128ba0-35bf-7873-a953-bf9402d05c4c@gmail.com>
Date:   Tue, 26 Jan 2021 11:53:48 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210125233243.5982-8-chaitanya.kulkarni@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 26.01.2021 2:32, Chaitanya Kulkarni wrote:

> Make the variable declaration ascending order and initialize the

    Usually the vars are declared in descending order, no?

> variables at the time of declaration when possible.
> 
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> Reviewed-by: Lauri Kasanen <cand@gmx.com>
[...]

MBR, Sergei
