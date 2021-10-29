Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E20144046E
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 22:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbhJ2U5u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 16:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhJ2U5u (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 16:57:50 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687D4C061714;
        Fri, 29 Oct 2021 13:55:21 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id v193so10285120pfc.4;
        Fri, 29 Oct 2021 13:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QYbseYhKxTr9fJBl8ehiwzBXY+1XMJKsk2yK23bAITo=;
        b=kT8GFGUSps7Ht3FvdqD6pKams0fRSyJvzESw3YVCdmtxHgbvcp4laYRXfbERr9eMV4
         t5W+BJU9EbCIEFD6V1Naj68chXsaiTqcvy5l2o4PyQds9HZito0FHrGvm28fMHVlOrkj
         uTQoz+9S3reFYqeDMTYnWQzmH4vuehmlcFVm4VBvc5FbN59gGMkF5le8G2PT9EzYxJoQ
         3xKtlu/4Y1mri1/yNGVA5vbKU7ehNims+v9YZ91xq0EZp1GNTo1Ay+/2qqKSCITqeTGu
         PMLqLNWTxnsTeJ8QzJLHGvKQIR/W+xfrhtl2Bw3Bs0mXk5LhLrvgNdVMVxiugxLCvUid
         a3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QYbseYhKxTr9fJBl8ehiwzBXY+1XMJKsk2yK23bAITo=;
        b=nUg0cViRMtoXU4VAq0T2Je6G6mU/uCYjyBxT+e1pL74yULwsjkNfJQavGxSeklt75h
         bWURnfFxKJlOy++WYyq4kVQUAqhFzbvE0RwQeF26bj582PO9UbkEHGJeLCjG1CnaqLnP
         YOqApcIe79JxHUyu/2BTzj6O/0oUY7U6uOczARLS0q9527x6L9jbdwSHNcn5zh1q1Uu6
         sn/Txgc5HWWzFXSTEfhl4DV+NzZ37LWq2mk/m+vS7BR3tN2SjqwwX4Gzql8Bzm9opbpg
         vbwIDSzdmJIOB+rUQFSMCeDXRbJWmTRAnwnGv7/EtPfZnvO2yJxuT0/v9ihlrGwuTHzo
         70HA==
X-Gm-Message-State: AOAM532d++1Wva5k0n3LndJkZwoDLjyTxGqlNdKzegKl6O+o8FeHz4Gu
        h9VF5aeqNvbPg16eGCEL2Jc=
X-Google-Smtp-Source: ABdhPJyFMkRhmBw6XmMtK9HWBDlZSrwA9ptmgang4zpouPvZmLiIq4ge47Tw1SE/2Zh0gqvEYbcFjA==
X-Received: by 2002:a63:5fcc:: with SMTP id t195mr426828pgb.332.1635540920901;
        Fri, 29 Oct 2021 13:55:20 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id m4sm1864714pjs.1.2021.10.29.13.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 13:55:20 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: convert Broadcom's WDT to the
 json-schema
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211029202505.7106-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7dae9f8b-b73e-fecf-35dd-1d64db8fde51@gmail.com>
Date:   Fri, 29 Oct 2021 13:55:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029202505.7106-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/29/21 1:25 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
