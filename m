Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C65F1F4AA1
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 03:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgFJBF6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 21:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgFJBF5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 21:05:57 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83ECC05BD1E;
        Tue,  9 Jun 2020 18:05:56 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id u8so147806pje.4;
        Tue, 09 Jun 2020 18:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=u9JZUQvkfSV+Mf706cX2JkKaNHqAaZVCmZCLg8ytztE=;
        b=OmRCZEDipgpeGPn29kemJjvdhsiPNrkxQQfDio64huzSLzNmc8566mr8ZLvJcU2GLn
         dpvsZM3HdJwfyP844sK0JzeMU58THGT3sXRT+4BzhoLk5i2W19tv/GJB7p01FLAdGw2q
         zogZA1DSlnZdqPSSW+KqZB/++QkQyzZhLP5ii0YLNCo+rCMxFmS4eO0HdydtQTHLWuCr
         5vaB8dL6clg3eftg2OlVOTcRNL4xnQcE6zTB3R1Lo+d1SoJ5QGU8Y1kd7xpK3ERPkMcH
         L1FUja/G8RfMcB6LhEcVMtE4o2sVMdiSL3N0nXDYWv7cxKmePWAapxdhmvq5rEuSosqg
         YQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u9JZUQvkfSV+Mf706cX2JkKaNHqAaZVCmZCLg8ytztE=;
        b=KDk0aT7TLcSjh76W7p3gSc1SlUIBUtaIdAQVgitx/fp269vLEwyzQP6Oy65AjeeVGe
         bVlGZwqdKzFx5xH8tdBVCfGrh2acUPm1bCAIeNLARXAqnFz6OTZDHhF4J5QiGhNTqpi6
         6cZdtC97Isf1H/z3gc2nRC9UlgqY6nuFIZ0+uQCJkF+Gx3yp0LucpvFOM+e76fceviqZ
         TNsReRYpxpFCRFn6pxYIxaAJcAda32v+iRIqejiGe2Aj6hFvQCksPKZJowkih9nHjC49
         wzHJJYip8FTXCuzIvCDvLnVSaXs4Br75YjcyHCWSQjgPXKche7vLKRatCguW7HZAyeIq
         edgw==
X-Gm-Message-State: AOAM532GmpRd/OtW9Qhyn8UriV0Or1WDCeFrpk8lnBpODYreKqcUPK/Z
        jZIFR4cAGZ28DgbDH4PUVls=
X-Google-Smtp-Source: ABdhPJyZUTRQnbJvdPcLLzr56yFMQIIJjbAXJ6quZxNRft+of4qFlDzjSZRK+3W8e0vETF7edJBUvg==
X-Received: by 2002:a17:902:d711:: with SMTP id w17mr946539ply.122.1591751156401;
        Tue, 09 Jun 2020 18:05:56 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id s197sm11243891pfc.188.2020.06.09.18.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 18:05:55 -0700 (PDT)
Subject: Re: [PATCH v2 3/7] drivers: reset: simple: add BCM6345 reset support
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609160244.4139366-1-noltari@gmail.com>
 <20200609160244.4139366-4-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7a86b4df-6c59-244d-c289-ba1612078fe0@gmail.com>
Date:   Tue, 9 Jun 2020 18:05:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609160244.4139366-4-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/9/2020 9:02 AM, Álvaro Fernández Rojas wrote:
> Add support for resetting blocks through the Linux reset controller
> subsystem for BCM63xx SoCs.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

This looks good to me, however in v1 there was a need for sleeping after
the reset assertion, and this does not appear to be taken care of by
default by reset-simple.c, did you determine the delay not to be necessary?
-- 
Florian
