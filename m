Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5AE32F853
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 06:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbhCFFTs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Mar 2021 00:19:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhCFFTn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Mar 2021 00:19:43 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEABC06175F;
        Fri,  5 Mar 2021 21:19:43 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so259156pjv.1;
        Fri, 05 Mar 2021 21:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ws1tIzR+EqbzsrUI6QtE+RYRtlETTGCi1UFlR29P9Qc=;
        b=Bt+4ATPjYcbxWTswNrSOMfHzoWNFTgHZFVDs8MvMubIpVZkLnLrNjkxN3zdS2CrOGT
         i/PcyhYfL21qgKvgrtZXVWM+9uXV2kLjXE9T9ydYT1NTURfcXkbGLVc5nsNCs8hDAEG9
         wNer1ylORkuysTKlGmLlSoM46d7nse7XUEssie71VVon8F8coqN9+S+XAIXLw41ahN87
         MHY1WQnHsyXUOrSq1xkmxe0OwfpMBDm+4FthrLkhEzVZq6n2sF3JslyjaqrKyx4STbLX
         N7kuo9GYfSz5Og8oHwGUmqRl1d7iY4oa34UTFzIh+Wq9npGXiM/8dwzDn5ury9YvPD8C
         /Fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ws1tIzR+EqbzsrUI6QtE+RYRtlETTGCi1UFlR29P9Qc=;
        b=BpKH7dpmUTtj//oB+Efxjaqq+TojP3i46MLOC2VHHAUUwNPfXAn20cEh/MWHA09FtY
         2m1NbICzMyWF+9IKOydQ0EBuxAwaFB7svKJFtPX1v+Z42mbr2cOt+qzyBhWsGBLTEm7C
         j5hLgpfukeYwIqThPlbv208UY+G+FSmSAOKmfjZIfZ/oyqiGrz8O8autmvTlg+D1oGQC
         XNXbvQoRzJpyNxBxe03z7pBD+3vBT2HwsQfhQLhVMU9N01owSDmp89UO70ObkQXc9Zn3
         CG+5li3QwrvPQBd0cRp0+cT8BsMTL99t6RWdFHYMpA9tG03GzQfCUH8albpnBRKS3oDX
         kmbA==
X-Gm-Message-State: AOAM5322QT4HCKGO3yLt8lr/QNzqKeQSpPfWlh68MjPM1XuVe0XKdswP
        wj4bMrFaNwfZL0JmJmEfZsui/BtJPTo=
X-Google-Smtp-Source: ABdhPJztIMQCQVAq6siKCTc09fIA8DwAGUmFOrWU1iLco7KOIrCw7wLRl+wkBXGJui2bGCWTqoAW7A==
X-Received: by 2002:a17:90a:bd97:: with SMTP id z23mr14433978pjr.189.1615007982779;
        Fri, 05 Mar 2021 21:19:42 -0800 (PST)
Received: from [10.230.70.25] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id x190sm4003168pfx.60.2021.03.05.21.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 21:19:42 -0800 (PST)
Subject: Re: [PATCH] arch: mips: bcm63xx: Spello fix in the file clk.c
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
References: <20210305020535.25006-1-unixbhaskar@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <82de531b-6daf-6175-0733-e3e6fb99e15d@gmail.com>
Date:   Fri, 5 Mar 2021 21:19:39 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305020535.25006-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 3/4/2021 6:05 PM, Bhaskar Chowdhury wrote:
> 
> 
> s/revelant/relevant/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Previous changes to this file/directory usually used MIPS: BCM63XX: as a
subject prefix, maybe Thomas can fix it up while applying for consistency.

Thanks
-- 
Florian
