Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9339A32BD9E
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 23:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346207AbhCCQRm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 11:17:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1843023AbhCCKYd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 05:24:33 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40E9C0611C2;
        Wed,  3 Mar 2021 00:39:56 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id q14so27575000ljp.4;
        Wed, 03 Mar 2021 00:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UA1aKK/fRs4m/xf5JpwLYyb5RS0D/JsZVdjnQfO+6qg=;
        b=rVf6BQqDdDevA3A9eN6Rdxnlo1WXarKhnXs7egnAc+Xtk2FNgvOpp0rNYSkkmYJnIw
         iLPIZg0XiTkIg5miyxobje+pw7A/7Rqd+VYORMBGrDnQE5AtOruduzeB9BS7yUCqu/jv
         zbaPAZq1qJBBvMRNZ//UYKb0k4j1J6Al3RZq3vNEK+w2+pEetsHTq/fS4KrlLcTjAAT7
         iX8GAKSUI4LqecLu7QGBf76e4kI8BmoZOVD3Z/ZNqXDgsoqQZZ8jb3H74/paojcjT4i/
         dDn8P+9vm6eksihveT4Hz2BQ3ESVAFOObXKos3TFyK410gaVBoep0Ky/e5eaY52UZEbz
         sl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UA1aKK/fRs4m/xf5JpwLYyb5RS0D/JsZVdjnQfO+6qg=;
        b=N1zWKaxhpX/4dPXITl+A6JODjWI/bcWaudj9OTd3CI1gEPWVybtOHfVNtRFTUaHMoh
         CB2yqUxzbCJNximOxAPDrxXx/Nf1uptWBgIUD8UlTJU3HiCDQLzWQwI3VYI/xQWIJNpN
         ucf0B4gWL3iBLT0h4c9BtVZgcjWJEcfK58Fyxai32esmCrDDi/9BfPOJAoXcKXlZqyRT
         SeNNw1LDU4eyH5aCn/l/6OdvuLbqk20EjKPKoKuSI0bqELJ0PUYccdCs4jTrW9q+KVln
         tKfyC1ieotpBxa2z2mohXXMBssuVkYU2DUMonq5b+qPeG9OqdvHoBcF0Rudtv3GvAMAW
         gLTQ==
X-Gm-Message-State: AOAM532M+nBZ0H6LjZ8mGuEgyRgJGp5XaLt6dYOz+tFXxBq/KkVKAveL
        LnLQyXLdGRaH2FKiUWg28ynhRPEY088=
X-Google-Smtp-Source: ABdhPJyR42jNsrIDLz1cVQ4OzYfNr99ht41Jnmd5a4XQLKQzeR6KGgQ+qRuX8msnfCCl6m1GgDTvKg==
X-Received: by 2002:a2e:2f05:: with SMTP id v5mr15093700ljv.114.1614760794909;
        Wed, 03 Mar 2021 00:39:54 -0800 (PST)
Received: from [192.168.1.100] ([178.176.72.224])
        by smtp.gmail.com with ESMTPSA id k18sm2892027lfm.88.2021.03.03.00.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 00:39:54 -0800 (PST)
Subject: Re: Toshiba TC86C001 support
To:     Christoph Hellwig <hch@lst.de>, linux-ide@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20210303072708.GA8575@lst.de>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <af1953de-d1d4-9573-2c3a-08da9ced429e@gmail.com>
Date:   Wed, 3 Mar 2021 11:39:44 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303072708.GA8575@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 03.03.2021 10:27, Christoph Hellwig wrote:

> a lot of te mips defconfig enable CONFIG_BLK_DEV_TC86C001, which is
> a legacy ide driver that has no libata equivalent.  We plan to
> phase out the legacy ide driver this year, so I'm wondering if this
> hardware is still in use by anyone, and if yes how we can get a libata
> driver for it?

    I used to have this piece of hardware while working for MontaVista 
(2004-2013), and I have long lost any access to it...

MBR, Sergei
