Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C527A243DCF
	for <lists+linux-mips@lfdr.de>; Thu, 13 Aug 2020 18:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgHMQ7m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 12:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMQ7l (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 12:59:41 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F23C061757;
        Thu, 13 Aug 2020 09:59:41 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id r4so2895580pls.2;
        Thu, 13 Aug 2020 09:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=olkCz3qauGZtAoAm2mefdOOlM1vSB0djGLpawNROqyk=;
        b=FoHHzpq7AyA5n73tg4iHx86kE1NhsoN8wmioqDwELp8j0bQGiWyRALlgxyq9xdtc0f
         sizg4xtD8j+X+5BuhuoYTp1uSTQFSYKyS5QZH21pSXn7wC0t+tx8e6cPh4nfIRkjGPr9
         AZ2agJea0q1NNHF13Tz13JU5+GeKGwlflcNE4Okf0mDbHCEcF3hGp/Z7Ff+tJEunqtSu
         azTnh1VRKYdKhrnh53iR9xgeahARkhpvggO6UE+WREEGvdwIMvTrwwVc2V9E3EO2c8g9
         2TvZHz0EiXUV1+XoNvPeb70nsPjzl6J2+tzTpDpyX0HMTrA1z85eCRCwjaCIdBHrbgdv
         rHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=olkCz3qauGZtAoAm2mefdOOlM1vSB0djGLpawNROqyk=;
        b=tjzAT0mWWljHChswF0BzSMF5tTXrtcU8fObPdSs5Bp5tqS5nbqs2kw+R8O0yjz1FHx
         UyNNjwHBhmRnAqe9xXHs/ffhIIHVUbvPyOFeSPCirbHe+cIU36143lQsRlESr6Pm5tPO
         p4SkXXgH5cDxP14lWiDopMSJDOTwEK6WK+JmL/CYKd7dCGPGzqpFvhsMY5hRqmx74U+w
         RXTL0MWTekoFSC7fMjVdTTquzCM0SksUHL9wSe3v5+XgcMKwAjFN1vnQLTkJ8Rx9IcQz
         wf5IqNeKmSsLqUlB8C6d60dApQ8xNdvH8RIZj1jumXo1YOjz5PwfZc/uXCF622TkDTqX
         PrnQ==
X-Gm-Message-State: AOAM532At9HEX8sd1yMbWnwX7C4TFANwkOpdnin52xbbxTZAWmsIUFue
        P58dyEaKH2177F8yd5F0X8IVRdk+
X-Google-Smtp-Source: ABdhPJybGmGEDWt0oBb2YtmBQTtclcvxl8AI97SPq+0YJbWxsRjhj3sVw6TPhzU+RL0kahjQ1PAH9w==
X-Received: by 2002:a17:902:b602:: with SMTP id b2mr4788131pls.280.1597337980877;
        Thu, 13 Aug 2020 09:59:40 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a6sm5968456pje.8.2020.08.13.09.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 09:59:40 -0700 (PDT)
Subject: Re: [PATCH 11/14] mips: bmips: bcm6358: include and use dt-bindings
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        robh+dt@kernel.org, tsbogend@alpha.franken.de,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200812063129.361862-1-noltari@gmail.com>
 <20200812063129.361862-12-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <1fa54db9-4824-582b-96ae-c79bb46790ef@gmail.com>
Date:   Thu, 13 Aug 2020 09:59:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200812063129.361862-12-noltari@gmail.com>
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
