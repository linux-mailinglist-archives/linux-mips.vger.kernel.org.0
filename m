Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2D11F4AA8
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 03:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgFJBIK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 21:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgFJBII (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 21:08:08 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC171C05BD1E;
        Tue,  9 Jun 2020 18:08:06 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r18so202771pgk.11;
        Tue, 09 Jun 2020 18:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=UmNa5QZXTcifMb5t+sEkwGynN0XSrtWdcarPS3DkzfM=;
        b=iqnJFRkg2te+YESKxo2ZMUYBeKwbtBR1eF55xnbxHIFvOyY7rT0c1Cg+B9W3c1PFNO
         zVT0M4AkC8Onf29mHrJOte8g+jXbUrCJTID7w/WUSrW/JRxxV+R3cgqfS/3Ge7Rhn81b
         urMNyNFw/bEeK9zhet50JRTYSPdIbN0wkZvlPEXkdlmdTAC/bzGL6c8l4eHz/Zrvn0me
         uGmgt/mKppBwGYmMYAhH+Fc2WYsbx4hwCwhDU7pgRQrBd84cPOkU6ERjfMJj4VeibiSj
         8pXOZrnJaT7zMjN0HZTclF9GSZ1GkHfkY9jNxJpivBQZ/j6GzONHsl+k7wZkGm7d5RfF
         Bcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UmNa5QZXTcifMb5t+sEkwGynN0XSrtWdcarPS3DkzfM=;
        b=n9fIHT50C8XM8QKI1N3B7K30y/mJd5quNui18Iqrn0TEKFTbaQoIX5LiqbX7SE4kQa
         sFiEaZm9KJgChoyipnprEVs9QTyDdGjjc0wjo+lQtrWWBZcnc+8N9dx2vpqQDPwdMnma
         H+BjeE7wAuuv0zxXRdpaNWNlZ52Hsdug2UUs2nwnoTblSIg9VMyd3c4oZmid3QCMTuH3
         uXJbcfoEq3zmdKV+MV2XvwV5ZTmrWZ1lE1on5nmo+/PbZg/DfSwDe+iu99rHhIokGMrM
         X1zklMg9PEduE3YT0gUXTkriXtFWDE30QmLOY+Wa4IIqKL0cJ5tC9OgOMshJo9x+32Jh
         zMng==
X-Gm-Message-State: AOAM5314ouEh11I+IZ3PCWh0qAJdPKoDhL09HDjM03j7+HxORScNM9kH
        ftY17YtDug6OCxH6ELlSNOM=
X-Google-Smtp-Source: ABdhPJyPnOLs8b4BbVR1sZVbbD7hTQb+uB1NhHbXovmx7InQxZ8QLWWZyTdoaqP8jpXpIqJL862v1Q==
X-Received: by 2002:a63:fc1b:: with SMTP id j27mr614744pgi.251.1591751286328;
        Tue, 09 Jun 2020 18:08:06 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id i197sm11111912pfe.30.2020.06.09.18.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 18:08:05 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] mips: bmips: dts: add BCM6328 reset controller
 support
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609160244.4139366-1-noltari@gmail.com>
 <20200609160244.4139366-5-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <47a8def4-a32a-04d3-e4ab-bb358f1455f5@gmail.com>
Date:   Tue, 9 Jun 2020 18:08:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609160244.4139366-5-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/9/2020 9:02 AM, Álvaro Fernández Rojas wrote:
> BCM6328 SoCs have a reset controller for certain components.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

You should probably create include files under include/dt-bindings/
which designate the various reset control bits that are valid for a
given SoC.
-- 
Florian
