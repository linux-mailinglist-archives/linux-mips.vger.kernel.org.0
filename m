Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8601DCB02
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 12:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgEUKZq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 06:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbgEUKZi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 06:25:38 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B66AC061A0E
        for <linux-mips@vger.kernel.org>; Thu, 21 May 2020 03:25:38 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id c12so4141891lfc.10
        for <linux-mips@vger.kernel.org>; Thu, 21 May 2020 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w+ByA/OU5zd2HMXcW33Jii/680uEnjVLKLXSM+qMuT0=;
        b=1jUzGc+YDrJFcyLWByQXrO3ofl3UrpgyKZhhQxlXT+meY1I/UarNoNTc89o/tNMBwY
         jUa01vrHcm0mY2fVTltFtMtx7PkXE4Jr1joD2n0lEo47DbSUegwOoUo8nZdbd9+ueovb
         IbL556guwW3C51r6g0+pNvoLDytfto4LKFK+GgVwpSLEnfspEr0Rpzf3mR837pjBF7yi
         mOgdcvvHofBpHizmBRMYxa7UT4bXM9SJfW0NvlcDqbQg+dUlbIYEEYulOtafXHs9rQrE
         +PgbljBTD5yikV97HjcGOaQ6G2YtaCerXWRXWwQSDv0FQzXVqCGG307OYR+TTRNRDm+x
         8V+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w+ByA/OU5zd2HMXcW33Jii/680uEnjVLKLXSM+qMuT0=;
        b=plruBe3vwscUPrKhVY4A2FVDtmn1zEYowgqQbEbZjBewAxU1Yfd0sxiC9LiINq0l90
         uRdSKscJ9eeDMnFysgErSKyAL6I8ZxEbKUOxk7oBqYLMkCHPs0T5mpki3sD+NCZLJPD/
         9IdxfLKONIzjmHrCr3TaBTzYs8M4sRHewO5LBj+NFNSUnolmjJI5ot1fSt3m5HSzMZmI
         zaV8UnCsutltA0dvJbVaQcK+9byINnT4ftS0etshauZwVdFbEkAKK+dGeVo34ENTxgwl
         GNRg18km95/MZBAvo96+uypsLXicDSkQuSrckBJZGW2dBauI1rm4varL6RQtmARYouWe
         I/BQ==
X-Gm-Message-State: AOAM5321TYO2aaJTdnUyf4PRFPUH4DjfHrc7RPPhAVoWOND9jPl48zFw
        GCXVJ0n3QSN8KUDeqV+x790S1w==
X-Google-Smtp-Source: ABdhPJw/oUYhrJ3sVEgOUQmz+s8MlpdJbN3BdtwCOCxaIzqwQAuJWpVMJjEsrbgCWpgWVlimG3X4Pw==
X-Received: by 2002:ac2:4295:: with SMTP id m21mr4687225lfh.164.1590056735286;
        Thu, 21 May 2020 03:25:35 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:2e7:f767:fc67:94af:6414:5968? ([2a00:1fa0:2e7:f767:fc67:94af:6414:5968])
        by smtp.gmail.com with ESMTPSA id i4sm1637149ljn.8.2020.05.21.03.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 03:25:34 -0700 (PDT)
Subject: Re: [PATCH v3 11/14] bus: cdmm: Add MIPS R5 arch support
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        David Lechner <david@lechnology.com>,
        John Garry <john.garry@huawei.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org
References: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
 <20200521003443.11385-12-Sergey.Semin@baikalelectronics.ru>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9ad8383b-8199-1006-cf91-d760bace705e@cogentembedded.com>
Date:   Thu, 21 May 2020 13:25:21 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521003443.11385-12-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 21.05.2020 3:34, Serge Semin wrote:

> CDMM may be available not only MIPS R2 architectures, but also in
                                 ^ on              -re, it's singular

> newer MIPS R5 chips. For instance our P5600 chip has one. Lets mark
> the CDMM bus being supported for that MIPS arch too.
> 
> Co-developed-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org
[...]

MBR, Sergei
