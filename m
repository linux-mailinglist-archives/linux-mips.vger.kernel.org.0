Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4151F595F
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 18:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgFJQtV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 12:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbgFJQtT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 12:49:19 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76074C03E96B;
        Wed, 10 Jun 2020 09:49:18 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id m2so1120558pjv.2;
        Wed, 10 Jun 2020 09:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=0L6mRul+d0ij/T0+YwUu11OLWJeSvBQq7osEoU9o22g=;
        b=Gyrl29mgzU0gGGWPNAXIufDCgZz/WcJTwme/dXo6nnRhBBKoe3YbyCm92QiFtUCZIr
         ljpilXI7nAD3ogAwUS0CFK1HNNISgp/Feg9D2XMFU50TOa9Yk/Z/q71WjPtfdwpWWRr5
         Zz9M+VHN4z1zeVxAU6zeowOmTnPNZw/PoJr44shxIdtIFhvChGKegEnoBHgfiRKnv5+M
         EV1ppIKtFzYdRwpVUxvyUy56RryWsBs5tBVVgE3OFovsAmgLxSk5F0gSKaPUmVxiPezW
         e2GUEQZd+fT42IK28EiMDhZNwXey5TMQ8c16Gjw/htxO3/+klYhR6G3iCUYxCVSekZgE
         QBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0L6mRul+d0ij/T0+YwUu11OLWJeSvBQq7osEoU9o22g=;
        b=AAusyxbunpSlNZ7H/5xK9qdnPdYou4TE9uu1t8eDVpqN5XtQqDgvVJq7cD8AYp4JRQ
         8RJHbYWCJSjuCpgOF4a9sYdT1Ldc0hNOZ+Vi5ZBNdiaiUGLhdps5dfNlU1fjndzAQ390
         24YKy5efm6mnZbiDG2owoVQqXul7PsSkgFpVmG0APojWjpcKP2KVl/6HBCICf74FBIVy
         J/F8A0U4LIE/pbI00XPCz6BrbGimZRZhMA2SycIR+wjpp+xCCHQo8BtujAwqODKaglef
         d4iS3uykPG2XDnw7YKHGwaJED/UGTmKC29IOKyB/YJA8V5bxfETIN1WTfuWNNRbhJ56j
         recQ==
X-Gm-Message-State: AOAM530Mlbd5bhpic28SxMG5IpEwP3oeKExCPOzIrs155Hxhk0x527Xy
        pz5K/JQ5ZQDAhDmbFEpmhC0=
X-Google-Smtp-Source: ABdhPJyBYL9WX0FUwlh7Mm7FPNGeHAef0xvzd3jHqzul0sk1FCzs4b8Ta/4q3CQZuFG1jOY72HRTZQ==
X-Received: by 2002:a17:902:c111:: with SMTP id 17mr3419167pli.319.1591807757697;
        Wed, 10 Jun 2020 09:49:17 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id s11sm382597pfh.204.2020.06.10.09.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 09:49:16 -0700 (PDT)
Subject: Re: [PATCH v2 2/6] soc: bcm: add BCM63xx power domain driver
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200609105244.4014823-1-noltari@gmail.com>
 <20200610163301.461160-1-noltari@gmail.com>
 <20200610163301.461160-3-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <098e7389-f41e-0493-302b-213477268b81@gmail.com>
Date:   Wed, 10 Jun 2020 09:49:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200610163301.461160-3-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/10/2020 9:32 AM, Álvaro Fernández Rojas wrote:
> BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
> to enable/disable certain components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Thanks for addressing the previous comments, this looks good to me,
there is just a single request below:

[snip]

> +static const struct bcm63xx_power_data bcm6318_power_domains[] = {
> +	{
> +		.name = "pcie",
> +		.bit = 0,

All of these bits definition should use the constants that you add in
patches 3 through 6, this means you would have to re-order the patches
to maintain bisectability obviously.

Thanks!
-- 
Florian
