Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28EB243DD9
	for <lists+linux-mips@lfdr.de>; Thu, 13 Aug 2020 19:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgHMRAe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 13:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMRAd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 13:00:33 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49EBC061757;
        Thu, 13 Aug 2020 10:00:33 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id e4so3069068pjd.0;
        Thu, 13 Aug 2020 10:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=olkCz3qauGZtAoAm2mefdOOlM1vSB0djGLpawNROqyk=;
        b=ea4VDAgoxNELViLWzcsGprhUZC51JwmWgxSHMf4eTXn1hYw40hwZgOCplv5xnqxxK/
         V8KMh0PGY659+WJdMoxL+ca7j2357WBFbldHFehShmuNwJmaBoh2NGYWhRrQl1A5tGTb
         qZrtQ5w8r0xVV/JDQSPEzJNYonpXWdFwGZX/lQoaHTo0QlizccbriZ0Eh5TBrlTNfQ3e
         AHYWU0NsakeVudDQtNNkjnyXDF7ujvfxc4ssCsN2xGkXEvd3uvFSjBF02kAQUnMoj8FN
         8AqOYaAKcQDsv3u8Gch6lTA5TccpST9057ONrKohDtUr2aBzQMnRu8V3hsKheNvWZAVh
         KKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=olkCz3qauGZtAoAm2mefdOOlM1vSB0djGLpawNROqyk=;
        b=RCj4ppAC7QZX/gEckhVlwOxKMDoX5Ae+K3YFPQFnUOfEc7iBAiA/ZYygYe1yHiVOx/
         UkUCBZMWz2hoetacJZsPjDIK6xq+ScwD258kzla5P2TN+i/kSi0q8kNqLxnNmbvP4tj4
         R04y6+yp1LOCNdLdIXEBtzn3OpHm2VF3lRFKJTlYQw0suzbF6oe55rhl84/9IkD0J2+F
         bMxAUzD9tLweEq293zqdjI29q8om699qTn2RceiM9BIOrH5RnuXZnvfGTI7ZX1LXRygf
         M87EF3yC9NkOYSEMPk8oEuKuyzxqGP6eebePfiU3p+DGS9iADTx3y8ePflx79/LCNTqD
         QBEw==
X-Gm-Message-State: AOAM530PFVqGZw1W8uUV1ALUTHpAC8SOxHMbWdaXG8x1DZOyz8tKswoV
        EIvHBJ9nUv54h/Hs702NSMOus61N
X-Google-Smtp-Source: ABdhPJyVXQcXEdzxUSGj45MGNvFVUaHhRcLcRCa4nHuNJDjYS26PA7zmm+ZHmTPjadHEbSQvdsOk6Q==
X-Received: by 2002:a17:90a:ce0f:: with SMTP id f15mr5927559pju.96.1597338031644;
        Thu, 13 Aug 2020 10:00:31 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id s22sm6481449pfh.16.2020.08.13.10.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 10:00:30 -0700 (PDT)
Subject: Re: [PATCH 14/14] mips: bmips: bcm63268: include and use dt-bindings
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        robh+dt@kernel.org, tsbogend@alpha.franken.de,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200812063129.361862-1-noltari@gmail.com>
 <20200812063129.361862-15-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a1edb583-0cb2-eb95-4979-09ed357cda36@gmail.com>
Date:   Thu, 13 Aug 2020 10:00:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200812063129.361862-15-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/11/2020 11:31 PM, Álvaro Fernández Rojas wrote:
> Now that there are proper device tree bindings we can start using them.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
