Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A32323617
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 04:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbhBXDke (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 22:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233162AbhBXDkd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 22:40:33 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4539EC06174A;
        Tue, 23 Feb 2021 19:39:53 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id a4so575870pgc.11;
        Tue, 23 Feb 2021 19:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=PYaEBye2P8SGVensbfyzsnoJqdviQLphCqoY4HQesVQ=;
        b=oN2waWTz53Bs0EYaLExoPOZFLhA9aN7de1/g/j9/aKlDeGtOfowbDQjXwU1b9yMGof
         U0gpB0nlxhBnbel4e/QjoJGcVb30MgHJ6fzYyE2jdvWAk5HRjL5nn+2HNfqWFDktXTFt
         QT5KBknHzAXG7DBLcXRu5Yoeki0N0AvOU1/Nk61N4UbOWXPpX801B/bjOQQwLo7cn5sL
         qZbtPfE6pylIor07Rq9u00nSe+OgfZKJ9crfRsd4c/tTrFOUQj1p23CWE2xzrK1HCp/F
         4bI6NUtrOyeFyR79sTntQc++bmvCjc7oI6w5HBl+feEt+wRr6U7SjGdg0I9MBy4AZfYe
         6LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PYaEBye2P8SGVensbfyzsnoJqdviQLphCqoY4HQesVQ=;
        b=L+q1bSHXbDNCWB6TEhgHX6021wRkobfI6Nk4zUBfIOYqr5NhXZOl8RfYS/AsTvH4tF
         OQe0kQcGIKWGUsDCXXmtFz4HxUfIrthyeYtiWMezohJuqMx1ggklursBIPPwo8wLqhPC
         461aYe6imGMUobU4Vgrz7XuCo79g13SqXVpLzyaqD0mzzHk6qalIUzcGKwdwZrUgJgBD
         hvc6ECJg9mJB33GlUXyhxnvAYVCWvrmDoJe3/C7CuKBwU5DZ5HHU077vuE2Le9CQHLB8
         Olg2o4lEG7/uEvgiLEMriQ6VD/IerannQpCUfYR+B8LFxRzrzNdTi4w6JD9h5xCoE6AQ
         AE6Q==
X-Gm-Message-State: AOAM530mlx79s0V6bRTj11GJizKWmiJndeT/lQfgOCAg2o8dOkxBQ4yM
        87wlI7Lmzk4GGE8NvZhuPwZhe52jPUY=
X-Google-Smtp-Source: ABdhPJwaCntbxGFr6e4p07LzXHbYs/XFMVw9Knib/yFBtBpyrvplLtOyyfO4MT/ahNwaxKphxcgNfg==
X-Received: by 2002:aa7:808b:0:b029:1ce:8a32:f5e8 with SMTP id v11-20020aa7808b0000b02901ce8a32f5e8mr5256443pff.34.1614137992357;
        Tue, 23 Feb 2021 19:39:52 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id t7sm419585pgr.53.2021.02.23.19.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 19:39:51 -0800 (PST)
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: document
 BCM6345 external interrupt controller
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
References: <20210223180840.28771-1-noltari@gmail.com>
 <20210223204340.312-1-noltari@gmail.com>
 <20210223204340.312-2-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6ed9228b-4d9f-89ee-0dd1-58dc4dda82d6@gmail.com>
Date:   Tue, 23 Feb 2021 19:39:49 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210223204340.312-2-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2/23/2021 12:43 PM, Álvaro Fernández Rojas wrote:
> Document the binding for the BCM6345 external interrupt controller.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
