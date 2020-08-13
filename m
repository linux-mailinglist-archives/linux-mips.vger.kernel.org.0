Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59C6243DC5
	for <lists+linux-mips@lfdr.de>; Thu, 13 Aug 2020 18:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgHMQ5j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 12:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgHMQ5i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 12:57:38 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E38DC061757;
        Thu, 13 Aug 2020 09:57:38 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id h12so3108251pgm.7;
        Thu, 13 Aug 2020 09:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Mr+Xf+EWE7uQgdhH13STal4z0jk/q0v933I8KribYdg=;
        b=jOsePt4MVEjiPDvrsxS4qlvRX4bsqeWr7zI//94oHXPS1eF68M0Uv8AGH7cjbpZ31J
         9TZMOFRGsbjFRCjKR2osM39N1GskJAZZdv9Q/cW49Ia+XRORloqWYbSKyMCPym1R219c
         ixytdULOO96cUyq/DAjzM2o7Ju0Tmz7D4ENTQ2LYS85xzv6FBvtXHNkV2HCxmBD5DXhw
         l+d/z4rpIGTfRnJlWpSzVItzK+8/EkCgrktmAiODcQRfTgAwrJQ1tKfk2ECYFYqJjrFB
         icakd3AWMu4gKylB/mnzRVBqDRgR1A2WFNJfIz3Rq5cx2vVcqilS6b1PTs0IFLcYmWzE
         SGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mr+Xf+EWE7uQgdhH13STal4z0jk/q0v933I8KribYdg=;
        b=as2pI6WMGVZuPgHo+FdEyXCrfoVRzweG4yaSp5hprywwbtI/2PK7hmLzL/pHPTezxS
         X1S5zGgrhjIE7nM8s+VU+HLJKEOSVfK55IU6L+ZqkqKfbL5qq2L64yX+x1KxARrHElFQ
         JFXHv3QbBpTeLueEgcMo/piXKGp3ib3uI6uefLlwtLy1bI+NZUM1twmZcf/xj9J7jvbN
         HUWulh8Vnsmd1rb71IpoIzioekcwZZsKCFVQQx2tllzatp9foOpl0i/voPk0APxS7jig
         gwfqjuHAbbg816qVEpG5/fFxOqhgb48vd7KdiYD4eeeJDO61ZJWEVTAYz/+9HwD2XU90
         I3JQ==
X-Gm-Message-State: AOAM532rOV3DLw+Udv8cCk+zDNvyUaKcbyTC27GgOg0yaWyn5qm8qlFa
        M6WBSnxCL5qV2jO2JcELHur/jEaM
X-Google-Smtp-Source: ABdhPJyBnz1McwZz82ZDm+SancyIlKku8TFd7+B2C0UW0oADyip7xCepkBjGwr/WnAjZ6Dn68JGFoQ==
X-Received: by 2002:a63:1f04:: with SMTP id f4mr4493293pgf.34.1597337856842;
        Thu, 13 Aug 2020 09:57:36 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id y196sm6538053pfc.202.2020.08.13.09.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 09:57:35 -0700 (PDT)
Subject: Re: [PATCH 03/14] mips: bmips: add BCM6318 irq definitions
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        robh+dt@kernel.org, tsbogend@alpha.franken.de,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200812063129.361862-1-noltari@gmail.com>
 <20200812063129.361862-4-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <03bbdcac-55c3-6805-14a9-e41a199e7efe@gmail.com>
Date:   Thu, 13 Aug 2020 09:57:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200812063129.361862-4-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/11/2020 11:31 PM, Álvaro Fernández Rojas wrote:
> Add header with BCM6318 definitions in order to be able to include it from
> device tree files.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
