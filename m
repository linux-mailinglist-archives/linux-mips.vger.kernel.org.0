Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85AF31B05CF
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 11:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbgDTJiw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 05:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725773AbgDTJiw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 05:38:52 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B0CC061A0C
        for <linux-mips@vger.kernel.org>; Mon, 20 Apr 2020 02:38:52 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x23so7365095lfq.1
        for <linux-mips@vger.kernel.org>; Mon, 20 Apr 2020 02:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fC7yVlTF2dg5BszQAz4tJyESdZOBEbxLy1Uamcwth88=;
        b=OAEQdus/uuBcOAthS3TtEvK7zG9rY3C+I5VwReBIuCwv2zXqb1cD/5zjsXepByhQ3d
         UCcSueB286izGvk8BO7rr9Ggr2ajra4ogReJw0OeO7mmEf53K6IN+l29NJctj5COEcqE
         Yo712wSYLvrq55NXzfSdoszUSYGWltWW6hWzCt7QO9VmVwiOPzXtyaALTMTax3Ux7Kof
         xsui/qk+6y3PSgsPE1KkTyT8kB24U3cIto2jpiK1aLt4hPxa4HXdf0dL80rMMYTVKesS
         biXxkI/wUmKgYpuV9t/yrDaBqiYDYnUyCFM+ehbd9gM9QIiTcspvH+6s7YrVkaGr8cTl
         CvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fC7yVlTF2dg5BszQAz4tJyESdZOBEbxLy1Uamcwth88=;
        b=by+YcuQqDQQ7nazxsbEyxZiev9E1gKeQyg2FpaUI7v9pLRr9eewQvz9wFy4elm7Hma
         c4k5wtZ8Ko603J/XEyhpxBwrGQJQTBbmF0E1e6DlhFz1wPxeb1Hhl4dAhqldy4PrUd8L
         dFKwPrtLXdaW0qCvtiCKvHJilw1f9CbYLID0MtVnQyVe/GwGe/tvBNhlQTSuz35JAUYm
         CTzdNw2C1Yd8myyWz5KPsXwYNcSbpuEIyIWz/zn1vP29u+r20SCk2umQzWUF9wW9qcBF
         vKNZ7AXQ8GE/l6cV5LwkRGN7uzDZZ6w46EBUO+BMTpPxl0/V4DJzPaggu8CUrbQG92Ee
         Tmqw==
X-Gm-Message-State: AGi0PubgbjxERTWIKMiVrKuYLFU3vgvMb6eJlu79WqPzBzvN9tnqunzF
        EKTOpx8CpXLLHMpwN3Y4vT87ae4Fx2BjNg==
X-Google-Smtp-Source: APiQypKznq9XrVI9hd+h/IzXvVE/uV6VvohF+/6F5gk7jvKwnPWCKyu2uLVFoOANvhPhLC1K8XldMg==
X-Received: by 2002:a19:1c3:: with SMTP id 186mr9964767lfb.191.1587375530442;
        Mon, 20 Apr 2020 02:38:50 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:25e:8f26:1014:e519:2b4e:4734? ([2a00:1fa0:25e:8f26:1014:e519:2b4e:4734])
        by smtp.gmail.com with ESMTPSA id w24sm320690lfe.58.2020.04.20.02.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 02:38:49 -0700 (PDT)
Subject: Re: [PATCH v4 1/5] PCI: OF: Don't remap iospace on unsupported
 platform
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Paul Burton <paulburton@kernel.org>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200330114239.1112759-1-jiaxun.yang@flygoat.com>
 <20200420071220.155357-1-jiaxun.yang@flygoat.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d8f444bf-71a5-add6-2a2c-7807a397e8b7@cogentembedded.com>
Date:   Mon, 20 Apr 2020 12:38:43 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420071220.155357-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 20.04.2020 10:12, Jiaxun Yang wrote:

> There are some platforms don't support iospace remapping
                           ^ that         ^^^^^^^ I/O space?

> like MIPS. However, our PCI code will try to remap iospace
> unconditionally and reject io resources on these platforms.
> 
> So we should remove iospace remapping check and use a range

    I/O space, maybe?

> check instead on these platforms.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> --
> v4: Fix a typo in commit message.
[...]

MBR, Sergei
